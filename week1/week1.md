# 정규화
- 목적 : 데이터 중복 없애기, 무결성 유지, 이상(Anomaly) 방지

제 1 정규화 : 반복되는 그룹 제거

1NF 위반 테이블

| Student_ID | Name | Subjects |
| --- | --- | --- |
| 1 | Alice | Math, Science |
| 2 | Bob | English, History |

1NF 적용 후 (원자값 유지)

| Student_ID | Name | Subject |
| --- | --- | --- |
| 1 | Alice | Math |
| 1 | Alice | Science |
| 2 | Bob | English |
| 2 | Bob | History |

제 2 정규화 : 1NF를 만족하면서 부분적 종속(Partial Dependency) 제거

→ 기본키가 복합키일 때, 기본키의 일부에만 종속되는 컬럼 분리

2NF 위반 테이블

| Student_ID | Course_ID | Student_Name | Course_Name |
| --- | --- | --- | --- |
| 1 | 101 | Alice | Math |
| 2 | 102 | Bob | Science |

2NF 적용 후

**학생 테이블:**

| Student_ID | Student_Name |
| --- | --- |
| 1 | Alice |
| 2 | Bob |

**과목 테이블:**

| Course_ID | Course_Name |
| --- | --- |
| 101 | Math |
| 102 | Science |

제 3 정규화 : 2NF를 만족하면서 이형적 함수 종속(Transitive Dependency) 제거

→ 기본키 → b → c일 때, c 분리

3NF 위반 테이블 - Student_ID → Dept_ID → Dept_Name의 이행적 종속 관계 존재

| Student_ID | Student_Name | Dept_ID | Dept_Name |
| --- | --- | --- | --- |
| 1 | Alice | 10 | Computer Science |
| 2 | Bob | 20 | Mathematics |

3NF 적용 후 (부서 정보를 별도 테이블로 분리하여 이행적 종속 제거)

학생 테이블:

| Student_ID | Student_Name | Dept_ID |
| --- | --- | --- |
| 1 | Alice | 10 |
| 2 | Bob | 20 |

부서 테이블:

| Dept_ID | Dept_Name |
| --- | --- |
| 10 | Computer Science |
| 20 | Mathematics |

보이스 코드 정규화 (BCNF, Boyce-Codd Normal Form) : 3NF를 만족하면서, 결정자가 후보 키가 아닌 경우를 제거 (즉, 모든 결정자가 후보 키여야 함.)

BCNF 위반 테이블 - {Student_ID, Course_ID}가 기본 키지만, 교수는 과목에 의해 결정

| Student_ID | Course_ID | Professor |
| --- | --- | --- |
| 1 | 101 | Dr. Smith |
| 2 | 102 | Dr. Brown |

BCNF 적용 후 (교수 정보를 별도 테이블로 분리하여 후보 키가 아닌 결정자 제거)

학생-과목 테이블:

| Student_ID | Course_ID |
| --- | --- |
| 1 | 101 |
| 2 | 102 |

과목-교수 테이블:

| Course_ID | Professor |
| --- | --- |
| 101 | Dr. Smith |
| 102 | Dr. Brown |

→ 보통은 정규화를 많이 진행해도 보이스 코드 정규화까지 진행하고, 이후 필요에 따라 반 정규화를 진행한다.

# 반정규화
- 정의 : 정규화를 거친 데이터베이스 구조에서 성능 향상 및 관리 편의를 위해 일부러 정규화된 구조를 깨는 과정
- 목적 : (읽기 최적화) 정규화를 진행하면서 JOIN이 많아지면 성능 저하 가능, 자주 조회하거나 읽기 위주인 경우, 쓰기 작업이 적은 경우 데이터 조회 속도를 높이기 위해 사용, 복잡한 쿼리 단순화

→ 반대로 데이터 무결성이 중요하거나, 쓰기 연산이 많거나, 데이터 변경이 자주 발생하는 경우에는 반정규화를 진행하지 않는 것이 좋다.

방법

1. 테이블 병합 (Merge Tables) : 정규화된 두 개 이상의 테이블을 하나로 합쳐 JOIN을 최소화
2. 컬럼 추가 (Add Redundant Columns) : 자주 JOIN되는 테이블의 데이터를 컬럼으로 추가
3. 중복 데이터 허용 (Store Derived Data) : 계산 비용이 큰 데이터를 미리 계산하여 저장 (SUM, COUNT, AVG 등의 집계 데이터)

# 기본키
- 정의 : 테이블의 유일한 식별자
- 목적 : 개체 무결성 보장
- 특징 : 유일성, 최소성

# 외래키
- 정의 : 다른 테이블의 기본키를 참조하는 속성으로, 테이블간의 관계를 정의하는 키
- 목적 : 참조 무결성 보장
- 특징 : 중복 가능, null값을 가질 수 있다.

# 연관관계
- 정의 : 개체들간의 관계

연관관계의 유형

1. 일대일 관계 ex) 사용자 - 사용자 프로필
2. 일대다 관계 ex) 회원 - 주문
3. 다대다 관계 ex) 학생 - 강의, 해시태그

연관관계의 방향성

- 단방향 (Unidirectional) : 한 객체에서만 관계를 참조 가능
- 양방향 (Bidirectional) : 양쪽 개체에서 서로를 참조 가능

# 복합 키
- 정의 : 두 개 이상의 컬럼(속성)으로 구성된 기본 키
- 목적 : 유일성 보장
- 특징 : 유일성, 최소성은 가질 수도 있음
- 활용 : 단일 컬럼으로 유일성을 보장할 수 없는 경우, 다대다 관계에서 중간 테이블

 

단일 키와 복합키의 비교

| **구분** | **단일 키 (Single Primary Key)** | **복합 키 (Composite Primary Key)** |
| --- | --- | --- |
| **구성 요소** | 하나의 컬럼 | 두 개 이상의 컬럼 |
| **유일성 보장** | 단일 속성으로 고유 식별 | 여러 속성 조합으로 유일성 유지 |
| **사용 예시** | 회원 ID, 주문 번호 | 중간 테이블(M:N 관계 해결) |
| **외래 키(FK) 설정** | 단일 FK로 연결 가능 | 여러 FK를 포함하는 조인 테이블 |
| **JOIN 성능** | 간단한 PK-FK 조인 가능 | 여러 FK가 조인될 경우 성능 고려 필요 |

복합 키의 단점

- Join이 많아질 경우 성능 저하
- 인덱스 설정이 복잡할 수 있음
- ORM 사용시 추가적인 설정 필요

→ 따라서, 테이블 규모가 커지면 복합 키 대신 별도의 ID를 생성하는 방법도 고려