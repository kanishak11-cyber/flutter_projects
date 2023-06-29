package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type Tasks struct {
	ID     string `json:"id"`
	TaskName string `json:"task_name"`
	TaskDetail string `json:"task_detail"`
	Date string `json:"date"`
}

var tasks []Tasks

func allTasks(){
	task1 :=Tasks{
		ID: "1",
		TaskName: "hey Projects",
		TaskDetail: "Create new projects for the company hey",
		Date: "2021-01-01",
	}
	tasks = append(tasks, task1)
	task2 :=Tasks{
		ID: "2",
		TaskName: "hii Projects 2",
		TaskDetail: "Create new projects for the company hii",
		Date: "2021-01-02",
	}
	tasks = append(tasks, task2)

	task3 :=Tasks{
		ID: "3",
		TaskName: "hello Projects 3",
		TaskDetail: "Create new projects for the company hello",
		Date: "2021-01-02",
	}
	tasks = append(tasks, task3)

	task4 :=Tasks{
		ID: "4",
		TaskName: "heya Projects 4",
		TaskDetail: "Create new projects for the company heya",
		Date: "2021-01-02",
	}
	tasks = append(tasks, task4)

	fmt.Println("Your all tasks",tasks)
}

func homePage( w http.ResponseWriter, r *http.Request) {
	fmt.Println( "Welcome to the Homepage!")
}

func getTasks( w http.ResponseWriter, r *http.Request) {
	fmt.Println("Get all tasks")
	json.NewEncoder(w).Encode(tasks)
	
}

func getTask( w http.ResponseWriter, r *http.Request) {
	taskId := mux.Vars(r)
	flag := false
	for i:=0; i<len(tasks); i++ {
		
		if tasks[i].ID == taskId["id"] {
			json.NewEncoder(w).Encode(tasks[i])
			flag = true
			break
		}
	}
	if flag == false {
		json.NewEncoder(w).Encode(map[string]string{"message": "No task found"})
	}
}

func addTask( w http.ResponseWriter, r *http.Request) {
	fmt.Println("Add Task")
	r.Method = "POST"
	var task Tasks
	_ = json.NewDecoder(r.Body).Decode(&task)
	tasks = append(tasks, task)
	json.NewEncoder(w).Encode(tasks)

}

func updateTask( w http.ResponseWriter, r *http.Request) {
	fmt.Println("Update Task")
	r.Method = "PUT"
	var task Tasks
	_ = json.NewDecoder(r.Body).Decode(&task)
	flag := false
	for i:=0; i<len(tasks); i++ {
		
		if tasks[i].ID == task.ID {
			tasks[i] = task
			flag = true
			break
		}
	}
	if flag == false {
		json.NewEncoder(w).Encode(map[string]string{"message": "No task found"})
	}
	json.NewEncoder(w).Encode(tasks)
}

func deleteTask( w http.ResponseWriter, r *http.Request) {
	fmt.Println("Delete Task")
	r.Method = "DELETE"
	var task Tasks
	_ = json.NewDecoder(r.Body).Decode(&task)
	flag := false
	for i:=0; i<len(tasks); i++ {
		
		if tasks[i].ID == task.ID {
			tasks = append(tasks[:i], tasks[i+1:]...)
			flag = true
			break
		}
	}
	if flag == false {
		json.NewEncoder(w).Encode(map[string]string{"message": "No task found"})
	}
	json.NewEncoder(w).Encode(tasks)
}

func handleRequests() {
	myRouter := mux.NewRouter().StrictSlash(true)
	myRouter.HandleFunc("/", homePage)
	myRouter.HandleFunc("/tasks", getTasks).Methods("GET")
	myRouter.HandleFunc("/task/{id}", getTask).Methods("GET")
	myRouter.HandleFunc("/task", addTask).Methods("POST")
	myRouter.HandleFunc("/task/{id}", updateTask).Methods("PUT")
	myRouter.HandleFunc("/task/{id}", deleteTask).Methods("DELETE")
	log.Fatal(http.ListenAndServe(":8080", myRouter))
}

func main() {
	allTasks()
	fmt.Println("Hello World!")
	handleRequests()
}