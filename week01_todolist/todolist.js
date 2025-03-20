"use strict";
document.addEventListener("DOMContentLoaded", () => {
    const taskInput = document.getElementById("taskInput");
    const addTaskButton = document.getElementById("addTask");
    const todoList = document.getElementById("todoList");
    const completedList = document.getElementById("completedList");
    addTaskButton.addEventListener("click", () => {
        const taskText = taskInput.value.trim();
        if (taskText === "")
            return;
        const listItem = document.createElement("li");
        listItem.textContent = taskText;
        const completeButton = document.createElement("button");
        completeButton.textContent = "완료";
        completeButton.classList.add("complete-btn");
        completeButton.addEventListener("click", () => {
            todoList.removeChild(listItem);
            listItem.removeChild(completeButton);
            listItem.appendChild(deleteButton);
            completedList.appendChild(listItem);
        });
        const deleteButton = document.createElement("button");
        deleteButton.textContent = "삭제";
        deleteButton.classList.add("delete-btn");
        deleteButton.addEventListener("click", () => {
            completedList.removeChild(listItem);
        });
        listItem.appendChild(completeButton);
        todoList.appendChild(listItem);
        taskInput.value = "";
    });
});
