# GitHub Pages 部署指南

## 步骤一：创建 GitHub 仓库

1. **访问 GitHub.com** 并登录您的账户
2. **点击右上角的 "+" 号**，选择 "New repository"
3. **填写仓库信息**：
   - Repository name: `your-project-name.github.io` (例如：`my-website.github.io`)
   - Description: 您的项目描述
   - 选择 "Public" (GitHub Pages 需要公开仓库)
   - 不要勾选 "Add a README file"
4. **点击 "Create repository"**

## 步骤二：上传代码到 GitHub

### 方法一：使用 GitHub Desktop (推荐)

1. **下载并安装 GitHub Desktop**
2. **克隆仓库**：
   - 打开 GitHub Desktop
   - 点击 "Clone a repository from the Internet"
   - 选择您刚创建的仓库
   - 选择本地保存路径
3. **复制文件**：
   - 将您的网站文件复制到克隆的文件夹中
   - 确保包含 `index.html` 和所有静态文件
4. **提交并推送**：
   - 在 GitHub Desktop 中查看更改
   - 添加提交信息
   - 点击 "Commit to main"
   - 点击 "Push origin"

### 方法二：使用命令行

```bash
# 1. 初始化 Git 仓库
git init

# 2. 添加远程仓库
git remote add origin https://github.com/您的用户名/您的仓库名.github.io.git

# 3. 添加所有文件
git add .

# 4. 提交更改
git commit -m "Initial commit"

# 5. 推送到 GitHub
git push -u origin main
```

## 步骤三：启用 GitHub Pages

1. **进入仓库设置**：
   - 在您的 GitHub 仓库页面
   - 点击 "Settings" 标签

2. **找到 Pages 设置**：
   - 在左侧菜单中找到 "Pages"
   - 点击进入

3. **配置部署源**：
   - Source: 选择 "Deploy from a branch"
   - Branch: 选择 "main" (或 "master")
   - Folder: 选择 "/ (root)"
   - 点击 "Save"

4. **等待部署**：
   - GitHub 会自动构建和部署您的网站
   - 通常需要几分钟时间

## 步骤四：访问您的网站

部署完成后，您可以通过以下地址访问：
```
https://您的用户名.github.io/您的仓库名/
```

例如：`https://johndoe.github.io/my-website/`

## 步骤五：自定义域名 (可选)

如果您有自己的域名：

1. **在域名提供商处设置 DNS**：
   - 添加 CNAME 记录
   - 指向：`您的用户名.github.io`

2. **在 GitHub Pages 设置中添加域名**：
   - 在 Pages 设置页面
   - 在 "Custom domain" 字段中输入您的域名
   - 点击 "Save"

3. **启用 HTTPS**：
   - 勾选 "Enforce HTTPS"

## 常见问题解决

### 1. 网站无法访问
- 检查仓库是否为公开仓库
- 确认 GitHub Pages 已启用
- 等待几分钟让部署完成

### 2. 图片或资源无法加载
- 检查文件路径是否正确
- 确保所有文件都已上传到 GitHub

### 3. 样式显示异常
- 检查 CSS 文件路径
- 确认所有依赖文件都已上传

### 4. 更新网站内容
```bash
# 修改文件后，重新提交
git add .
git commit -m "Update website content"
git push
```

## 文件结构检查

确保您的仓库包含以下文件：
```
your-repository/
├── index.html              # 主页面
├── static/                 # 静态资源
│   ├── css/
│   ├── js/
│   ├── images/
│   └── videos/
└── README.md              # 项目说明
```

## 部署检查清单

- [ ] 创建了 GitHub 仓库
- [ ] 上传了所有网站文件
- [ ] 启用了 GitHub Pages
- [ ] 网站可以正常访问
- [ ] 所有资源都能正常加载
- [ ] 测试了所有功能

## 高级配置

### 使用 GitHub Actions 自动部署

创建 `.github/workflows/deploy.yml` 文件：

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    
    - name: Deploy
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./
```

这样设置后，每次推送到 main 分支时，GitHub Actions 会自动部署您的网站。 