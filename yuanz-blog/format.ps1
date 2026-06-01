# Markdown 文件目录
$mdFolder = "C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog\source\_posts"

$files = Get-ChildItem -Path $mdFolder -Filter *.md
$total = $files.Count
$i = 1

foreach ($file in $files) {

    Write-Host "[$i/$total] 清理文件: $($file.Name)"

    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $oldContent = $content

    # 1️⃣ 删除 <font ...>
    $content = $content -replace '<font[^>]*>', ''
    $content = $content -replace '</font>', ''

    # ✔ 关键：只有发生变化才写入
    if ($content -ne $oldContent) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "  已修改并保存"
    } else {
        Write-Host "  无需修改"
    }

    $i++
}

Write-Host "所有 Markdown 清理完成！"