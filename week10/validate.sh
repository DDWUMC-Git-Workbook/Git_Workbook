current_branch=$(git branch --show-current)
week1_committed=false
ignore_committed=false

threeway_file="threeway-merge.md"
threeway_content=$(cat <<EOF
3-way merge는 서로 다른 두 브랜치에서 두 브랜치 모두 다른 변경사항이 생기는 경우 사용되는 merge 방식입니다.
서로 다른 두 변경사항이 합쳐지는 경우에는 반드시 두 변경사항을 병합하는 새로운 변경점을 생성하게 됩니다.
이 방식은 충돌이 발생할 가능성이 있고 충돌이 발생하면 수동으로 해결해야 해요.

Git의 merge는 base 커밋, HEAD, merge 하는 대상 브랜치의 변경 내용을 기반으로 동작합니다.
EOF
)

pull_file="pull-practice.md"
pull_content=$(cat <<EOF
물론 fetch를 이용해 원격 레포지토리의 변경사항을 가져오고 merge하는 방식은 안전하다는 장점이 있지만 사실 좀 귀찮다는 단점이 있습니다.
원격 브랜치의 내용을 받아와서 자동으로 현재 브랜치에 반영하고자 할 때 위와 같이 `pull` 명령어를 사용합니다.
다만 pull의 경우 자동으로 fetch와 merge 를 동시에 수행하기 때문에 충돌이 발생할 수도 있습니다. 이 경우 당황하지 마시고 위에서 배웠던 것처럼 침착하게 충돌을 해결하신 후 커밋하신 뒤 한번 더 pull 명령어를 입력해주시면 됩니다.
git pull은 fetch와 merge를 결합한 명령어입니다.
원격 브랜치의 내용을 받아와서 자동으로 현재 브랜치에 반영하고자 할 때 위와 같이 `pull` 명령어를 사용합니다.
작업하고 있는 브랜치에 최신 변경사항을 반영하고자 할 때 유용하게 쓰일 수 있어요.
EOF
)

if [[ "$current_branch" == week1-* ]]; then
    echo "   ✅ 브랜치 이름이 올바릅니다: $current_branch"
else
    echo -e "   ❌ 브랜치 이름이 잘못되었습니다.\n   현재 브랜치 이름은 $current_branch 이며, week10-닉네임 형식이어야 해요!"
    exit 1
fi

if [ "$(git reflog | grep -c "merge task-ff: Fast-forward")" -eq 0 ]; then
    echo "   ✅ fast-forward merge가 확인되었습니다."
else
    echo -e "   ❌ fast-forward merge가 확인되지 않았습니다."
    exit 1
fi

if [ ! -f "$threeway_file" ]; then
    echo "❌ $threeway_file 파일이 존재하지 않습니다."
    exit 1
fi

FILE_CONTENT=$(<"$threeway_file")

if [ "$FILE_CONTENT" == "$threeway_content" ]; then
    echo "✅ $FILE_NAME의 내용이 올바릅니다."
else
    echo "❌ $FILE_NAME의 내용이 일치하지 않습니다."
    echo "threeway-merge 브랜치의 내용만 남도록 충돌을 해결해야 합니다."
fi

if [ ! -f "$pull_file" ]; then
    echo "❌ $pull_file 파일이 존재하지 않습니다."
    exit 1
fi

FILE_CONTENT=$(<"$pull_file")

if [ "$FILE_CONTENT" == "$pull_content" ]; then
    echo "✅ $FILE_NAME의 내용이 올바릅니다."
else
    echo "❌ $FILE_NAME의 내용이 일치하지 않습니다."
    echo "두 브랜치의 내용이 모두 남도록 충돌을 해결해야 합니다."
fi

echo "=================================================================="
echo "✅ 모든 과제가 확인되었습니다!"
