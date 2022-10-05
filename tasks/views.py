from http.client import HTTPResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from django.http import HttpResponseRedirect
from .forms import NewTaskForm
from django.contrib import messages


def index(request):
    if "tasks" not in request.session:
        request.session["tasks"] = []
    return render(request, "tasks/index.html", {"tasks": request.session["tasks"]})


def error(request):
    return render(request, 'tasks/error.html')


def add(request):
    if request.method == "POST":
        form = NewTaskForm(request.POST)
        if form.is_valid():
            new_task = form.cleaned_data["task"]
            priority = form.cleaned_data["priority"]
            new_task = f'{new_task}@{priority}'
            if new_task not in request.session["tasks"]:
                request.session["tasks"] += [new_task]
                messages.success(request, f'A new task was added!')
                return redirect("tasks:index")
            else:
                em = f'Task {new_task} already exists; must be unique'
                messages.error(request, em)
                messages.warning(request, 'Be more careful! Do you have a typo?')
                return redirect('tasks:error')
        else:
            return render(request, "tasks/add.html", {"form": form})
    else:
        return render(request, "tasks/add.html", {"form": NewTaskForm()})
