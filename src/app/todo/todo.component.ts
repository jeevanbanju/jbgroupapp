import { Component } from '@angular/core';
import { Todo } from '../todo';

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html',
  styleUrls: ['./todo.component.css']
})
export class TodoComponent {
  newTask = '';
  tasks: Todo[] = [];

  addTask() {
    if (this.newTask.trim() !== '') {
      const task: Todo = {
        id: this.tasks.length + 1,
        text: this.newTask,
        completed: false
      };
      this.tasks.push(task);
      this.newTask = '';
    }
  }

  toggleCompletion(task: Todo) {
    task.completed = !task.completed;
  }

  deleteTask(task: Todo) {
    this.tasks = this.tasks.filter(t => t !== task);
  }
}
