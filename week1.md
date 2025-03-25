### Git 이란?

> 분산 버전 관리 시스템이며, 파일의 변경 사항을 추적하고 여러 사용자 간 작업 내용을 조율해준다!

- **repository** 라는 저장소 이용
- 추적 해제를 하고 싶다면 **.gitignore** 에 해당 파일 경로 작성!
- **commit** 하고 싶은 파일은 **git add** 명령어를 통해 **staged** 상태로 바꾼 후, **commit** 하면 된다!
- 이렇게 **staging area**에 올라간 파일들은 **push** 명령어를 통해 **Local Repository**에 반영하자!
<hr/>

### Branch 란?

> 내가 작업하는 독립적인 영역<br>
> 한 시점에서 서로에게 영향을 주지 않는 작업을 진행하기 위해 브랜치를 생성<br>

- **git branch (브랜치 이름)** : 브랜치 생성
- **git checkout (브랜치 이름)** : 브랜치 이동
- **git switch (브랜치 이름)** : 브랜치 이동
<hr/>

### Git Flow 방식의 흐름

> 기능 별로 브랜치를 나누고 관리하자!

- **Issue** 생성 -> **Branch** 생성 -> 코드 작성 -> **push** -> **PR** 작성 -> 팀원이 **Review 및 Approve** -> _main_ 브랜치 (혹은 _develop_ 브랜치)에 **Merge**
