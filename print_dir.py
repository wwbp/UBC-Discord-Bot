import os


def print_directory_structure(root_dir, indent=""):
    items = os.listdir(root_dir)
    items.sort()  # Sort the items to keep the output consistent
    for idx, item in enumerate(items):
        if item == ".git":  # Skip the .git directory
            continue
        path = os.path.join(root_dir, item)
        is_last = idx == len(items) - 1
        branch = "└── " if is_last else "├── "
        print(f"{indent}{branch}{item}")
        if os.path.isdir(path):
            new_indent = indent + ("    " if is_last else "│   ")
            print_directory_structure(path, new_indent)


# Replace 'root_directory' with the path to the directory you want to print
root_directory = "."
print_directory_structure(root_directory)
