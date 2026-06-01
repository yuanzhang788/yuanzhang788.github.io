# Markdown 文件目录
$mdFolder = "C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog\source\_posts"

$files = Get-ChildItem -Path $mdFolder -Filter *.md
$total = $files.Count
$i = 1

foreach ($file in $files) {

    Write-Host "[$i/$total] 清理文件: $($file.Name)"

    $content = Get-Content $file.FullName -Raw -Encoding UTF8

    # 1️⃣ 删除 <font ...> 标签（包括 style）
    $content = $content -replace '<font[^>]*>', ''
    $content = $content -replace '</font>', ''

#    # 2️⃣ 删除多余 HTML style 属性（保险）
#    $content = $content -replace 'style="[^"]*"', ''
#
#    # 3️⃣ 清理多余空格（可选优化）
#    $content = $content -replace '\s{2,}', ' '

    # 保存
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8

    $i++
}

Write-Host "所有 Markdown 清理完成！"