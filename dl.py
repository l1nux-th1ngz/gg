import tkinter as tk
from tkinter import messagebox
import os

class Application(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.create_widgets()

    def create_widgets(self):
        self.entries = [tk.Entry(self) for _ in range(10)]
        for entry in self.entries:
            entry.pack(side="top")

        self.clone_button = tk.Button(self)
        self.clone_button["text"] = "Clone"
        self.clone_button["command"] = self.clone_repos
        self.clone_button.pack(side="top")

    def clone_repos(self):
        for entry in self.entries:
            repo_url = entry.get()
            if repo_url:
                os.system(f"git clone {repo_url}")
                messagebox.showinfo("Info", f"Repository {repo_url} cloned successfully.")

root = tk.Tk()
app = Application(master=root)
app.mainloop()
