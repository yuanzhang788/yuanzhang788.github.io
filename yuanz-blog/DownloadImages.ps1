# 配置路径
$mdFolder = "C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog\source\_posts"
$assetsFolder = "C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog\source\assets"

# 获取所有 md 文件
$mdFiles = Get-ChildItem -Path $mdFolder -Filter *.md
$totalFiles = $mdFiles.Count
$fileIndex = 1

foreach ($md in $mdFiles) {
    $mdFile = $md.FullName
    $mdName = [System.IO.Path]::GetFileNameWithoutExtension($mdFile)

    # 读取文件内容（UTF8）
    $content = Get-Content $mdFile -Raw -Encoding UTF8

    # 匹配 ![](URL)
    $pattern = '!\[\]\((https?:\/\/[^\)]+)\)'
    $matches = [regex]::Matches($content, $pattern)
    $totalImgs = $matches.Count

    # 没有图片直接跳过
    if ($totalImgs -eq 0) {
        Write-Host "[$fileIndex/$totalFiles] 跳过(无图片): $($md.Name)"
        $fileIndex++
        continue
    }

    # 图片存放路径
    $imgFolder = Join-Path $assetsFolder $mdName
    if (-not (Test-Path $imgFolder)) {
        New-Item -Path $imgFolder -ItemType Directory | Out-Null
    }

    Write-Host "[$fileIndex/$totalFiles] 处理文件: $($md.Name) 发现 $totalImgs 张图片"

    $imgIndex = 1
    foreach ($match in $matches) {
        $url = $match.Groups[1].Value
        $fileName = [System.IO.Path]::GetFileName($url)
        $localPath = Join-Path $imgFolder $fileName

        if (Test-Path $localPath) {
            Write-Host "  [$imgIndex/$totalImgs] 已存在，跳过: $fileName"
        } else {
            try {
                Invoke-WebRequest -Uri $url -OutFile $localPath -UseBasicParsing
                Write-Host "  [$imgIndex/$totalImgs] 下载完成: $fileName"
            } catch {
                Write-Warning "  [$imgIndex/$totalImgs] 下载失败: $url"
            }
        }

        # 替换 Markdown 中 URL 为 Hexo 可用路径
        $relativePath = "/assets/$mdName/$fileName"
        $content = $content -replace [regex]::Escape($url), $relativePath

        $imgIndex++
    }

    # 保存修改后的 md 文件
    Set-Content -Path $mdFile -Value $content -Encoding UTF8
    Write-Host "  文件更新完成: $($md.Name)"

    $fileIndex++
}

Write-Host "所有文件处理完成！"