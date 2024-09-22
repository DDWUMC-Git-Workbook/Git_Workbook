nickname=$1
expected_branch="week1-${nickname}"

current_branch=$(git branch --show-current)

if [ "$current_branch" == "$expected_branch" ]; then
    echo "   ✅ 브랜치 이름이 올바릅니다: $current_branch"
else
    echo "   ❌ 브랜치 이름이 잘못되었습니다.\n   현재 브랜치 이름은 $current_branch 이며, 브랜치 이름은 $expected_branch 로 표기되어야 해요!"
    exit 1
fi

if [ -f "week1.md" ]; then
    echo "   ✅ week1.md 파일이 존재합니다."

    # 파일이 비어있는지 확인
    if [ -s "week1.md" ]; then
        echo "   ✅ week1.md 파일에 내용이 작성되었습니다."
    else
        echo "   ❌ week1.md 파일이 비어 있습니다."
        exit 1
    fi
else
    echo "   ❌ week1.md 파일이 존재하지 않습니다."
    exit 1
fi

if [ -f "ignore.md" ]; then
    echo "   ✅ ignore.md 파일이 존재합니다."
else
    echo "   ❌ ignore.md 파일이 존재하지 않습니다."
    exit 1
fi

if [ -f ".gitignore" ]; then
    echo "   ✅ .gitignore 파일이 존재합니다."

    if grep -q "ignore.md" .gitignore; then
        echo "   ✅ .gitignore 파일에 ignore.md 파일이 제대로 설정되었습니다."
    else
        echo "   ❌ .gitignore 파일에 ignore.md 파일이 설정되지 않았습니다."
        exit 1
    fi
else
    echo "   ❌ .gitignore 파일이 존재하지 않습니다."
    exit 1
fi

last_commit_files=$(git show --pretty="" --name-only HEAD)

if [[ "$last_commit_files" == "week1.md" ]]; then
    echo "   ✅ week1.md 파일만 커밋되었습니다."
else
    echo "   ❌ 커밋이 잘못되었습니다.\n   week1.md 파일만 커밋해주세요."
    exit 1
fi       

echo "=================================================================="
echo "✅ 모든 과제가 확인되었습니다!"
