"use strict";
document.addEventListener("DOMContentLoaded", () => {
    const taskInput = document.getElementById("taskInput");
    const addTaskButton = document.getElementById("addTask");
    const todoList = document.getElementById("todoList");
    const completedList = document.getElementById("completedList");
    let todos = [];
    let doneTasks = [];
    const renderTasks = () => {
        todoList.innerHTML = "";
        completedList.innerHTML = "";
        todos.forEach((todo) => {
            const li = createTodoElement(todo, false);
            todoList.appendChild(li);
        });
        doneTasks.forEach((todo) => {
            const li = createTodoElement(todo, true);
            completedList.appendChild(li);
        });
    };
    const getTodoText = () => {
        return taskInput.value.trim();
    };
    const addTodo = (text) => {
        todos.push({ id: Date.now(), text });
        taskInput.value = "";
        renderTasks();
    };
    const completeTodo = (todo) => {
        todos = todos.filter((t) => t.id !== todo.id);
        doneTasks.push(todo);
        renderTasks();
    };
    const deleteTodo = (todo) => {
        doneTasks = doneTasks.filter((t) => t.id !== todo.id);
        renderTasks();
    };
    const createTodoElement = (todo, isDone) => {
        const li = document.createElement("li");
        li.textContent = todo.text;
        li.classList.add("render-container__item");
        if (!isDone) {
            const completeButton = document.createElement("button");
            completeButton.textContent = "완료";
            completeButton.classList.add("complete-btn");
            completeButton.addEventListener("click", () => completeTodo(todo));
            li.appendChild(completeButton);
        }
        else {
            const deleteButton = document.createElement("button");
            deleteButton.textContent = "삭제";
            deleteButton.classList.add("delete-btn");
            deleteButton.addEventListener("click", () => deleteTodo(todo));
            li.appendChild(deleteButton);
        }
        return li;
    };
    addTaskButton.addEventListener("click", () => {
        const text = getTodoText();
        if (text) {
            addTodo(text);
        }
    });
    taskInput.addEventListener("keypress", (event) => {
        if (event.key === "Enter") {
            const text = getTodoText();
            if (text) {
                addTodo(text);
            }
        }
    });
    renderTasks();
});
