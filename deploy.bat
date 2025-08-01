@echo off
echo ========================================
echo GitHub Pages 快速部署工具
echo ========================================
echo.

echo 请确保您已经：
echo 1. 创建了 GitHub 仓库
echo 2. 仓库名称为：您的用户名.github.io
echo 3. 仓库设置为公开
echo.

set /p choice=是否继续部署？(y/n): 

if /i "%choice%"=="y" (
    echo.
    echo 开始部署流程...
    echo.
    
    echo 1. 初始化 Git 仓库...
    git init
    
    echo 2. 添加所有文件...
    git add .
    
    echo 3. 提交更改...
    git commit -m "Initial website deployment"
    
    echo 4. 请手动执行以下命令：
    echo    ggit remote add origin git@github.com:youjiaSHTU/dreamprinting.github.io.git
    echo    git push -u origin main
    echo.
    echo 5. 然后在 GitHub 仓库设置中启用 Pages
    echo.
    echo 部署完成！
) else (
    echo 部署已取消
)

pause 