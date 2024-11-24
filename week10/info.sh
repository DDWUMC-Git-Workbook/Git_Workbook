# fast-forward-merge 브랜치 생성 및 설정
git branch -D ff-merge 2> /dev/null # 기존 브랜치 삭제 (있을 경우)
if git switch -c ff-merge; then
    echo "✅ ff-merge 브랜치가 생성되었습니다."
else
    echo "❌ ff-merge 브랜치 생성에 실패했습니다."
    exit 1
fi

echo "Updated content for fast-forward merge" > ff-file.txt
git add ff-file.txt
git commit -m "Add ff-file.txt for fast-forward merge"


# threeway-merge 브랜치 생성 및 설정
git branch -D threeway-merge 2> /dev/null # 기존 브랜치 삭제 (있을 경우)
if git switch -c threeway-merge; then
    echo "✅ threeway-merge 브랜치가 생성되었습니다."
else
    echo "❌ threeway-merge 브랜치 생성에 실패했습니다."
    exit 1
fi

echo "Some content for threeway merge" > threeway-file.txt
git add threeway-file.txt
git commit -m "Add threeway-file.txt for three-way merge"


# pull-test 브랜치 생성 및 설정
git branch -D pull-test 2> /dev/null # 기존 브랜치 삭제 (있을 경우)
if git switch -c pull-test; then
    echo "✅ pull-test 브랜치가 생성되었습니다."
else
    echo "❌ pull-test 브랜치 생성에 실패했습니다."
    exit 1
fi

echo "Some content for pull test" > pull-file.txt
git add pull-file.txt
git commit -m "Add pull-file.txt for pull test"


echo "✅ 모든 브랜치가 설정되었습니다."

echo "===============================10주차 과제==============================="
echo "0. 먼저 'week10-(본인 닉네임)' 브랜치를 생성하고 해당 브랜치로 이동해주세요! (예: week10-zimging)"
echo "1. 현재 브랜치에서 fast-forward-merge 브랜치 내용을 fast-forward로 병합해주세요."
echo "2. 'week10-(본인 닉네임)' 브랜치로 이동 후, 해당 브랜치에서 파일을 생성하거나 수정해 커밋을 해주세요."
echo "3. 현재 브랜치에서 threeway-merge 브랜치를 3-way 머지해보세요. 충돌을 해결해주세요."
echo "4. pull-test 브랜치를 원격 저장소에서 pull 해보세요. 충돌을 해결한 후 커밋해주세요."
echo "5. 모든 실습 과정을 캡쳐한 후, 해당 내용을 week10 브랜치에 push한 뒤 Pull Request를 만들어주세요!"
echo "======================================================================="

