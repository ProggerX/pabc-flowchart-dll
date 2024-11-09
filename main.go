package main

import (
	"C"

	"github.com/ProggerX/pabc-flowchart/pkg/parser"
)

func main() {

}

//export ParseFile
func ParseFile(lines []string) []string {
	return parser.ParseFile(lines)
}
