document.addEventListener("DOMContentLoaded", () => {
    const taskInput = document.getElementById("taskInput") as HTMLInputElement;
    const addTaskButton = document.getElementById("addTask") as HTMLButtonElement;
    const todoList = document.getElementById("todoList") as HTMLUListElement;
    const completedList = document.getElementById("completedList") as HTMLUListElement;

    // 🟢 할 일 객체 타입 정의
    type Todo = {
        id: number;
        text: string;
    };

    let todos: Todo[] = [];
    let doneTasks: Todo[] = [];

    // 🟢 할 일 목록을 다시 렌더링하는 함수
    const renderTasks = (): void => {
        todoList.innerHTML = "";
        completedList.innerHTML = "";

        // 할 일 목록 표시
        todos.forEach((todo) => {
            const li = createTodoElement(todo, false);
            todoList.appendChild(li);
        });

        // 완료된 목록 표시
        doneTasks.forEach((todo) => {
            const li = createTodoElement(todo, true);
            completedList.appendChild(li);
        });
    };

    // 🟢 입력된 할 일 텍스트 가져오기
    const getTodoText = (): string => {
        return taskInput.value.trim();
    };

    // 🟢 새로운 할 일 추가
    const addTodo = (text: string): void => {
        todos.push({ id: Date.now(), text });
        taskInput.value = "";
        renderTasks();
    };

    // 🟢 할 일 완료 처리
    const completeTodo = (todo: Todo): void => {
        todos = todos.filter((t) => t.id !== todo.id);
        doneTasks.push(todo);
        renderTasks();
    };

    // 🟢 할 일 삭제 기능
    const deleteTodo = (todo: Todo): void => {
        doneTasks = doneTasks.filter((t) => t.id !== todo.id);
        renderTasks();
    };

    // 🟢 할 일 목록 요소 생성
    const createTodoElement = (todo: Todo, isDone: boolean): HTMLLIElement => {
        const li = document.createElement("li");
        li.textContent = todo.text;
        li.classList.add("render-container__item");

        if (!isDone) {
            // 완료 버튼 추가
            const completeButton = document.createElement("button");
            completeButton.textContent = "완료";
            completeButton.classList.add("complete-btn");
            completeButton.addEventListener("click", () => completeTodo(todo));
            li.appendChild(completeButton);
        } else {
            // 삭제 버튼 추가
            const deleteButton = document.createElement("button");
            deleteButton.textContent = "삭제";
            deleteButton.classList.add("delete-btn");
            deleteButton.addEventListener("click", () => deleteTodo(todo));
            li.appendChild(deleteButton);
        }

        return li;
    };

    // 🟢 "할 일 추가" 버튼 클릭 시 이벤트
    addTaskButton.addEventListener("click", () => {
        const text = getTodoText();
        if (text) {
            addTodo(text);
        }
    });

    // 🟢 "Enter" 키 입력 시 할 일 추가
    taskInput.addEventListener("keypress", (event) => {
        if (event.key === "Enter") {
            const text = getTodoText();
            if (text) {
                addTodo(text);
            }
        }
    });

    // 초기 렌더링
    renderTasks();
});
