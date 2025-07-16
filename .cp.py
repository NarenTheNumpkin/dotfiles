import argparse
import os

content = '''#include <iostream>
#include "bits-stdc++.h"

typedef long long ll;

void solve()
{

}

int main()
{
    int n, value;
    std::cin >> n;
    while(n--)
    {
        std::cin >> value;
    }
    solve();
    return 0;
}'''

def main():
    parser = argparse.ArgumentParser(description="boilerplate for cp.")
    parser.add_argument("filename", type=str)
    args = parser.parse_args()

    path = os.path.expanduser(f"~/Desktop/cp/{args.filename}.cpp")

    with open(path, "w") as file:
        file.write(content)

    print(f"Successfully created file {args.filename}.cpp")

if __name__ == "__main__":
    main()
