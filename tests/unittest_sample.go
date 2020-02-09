package greet

import (
	"fmt"
)

func Greet(name string, lang string) string {
	switch lang {
	case "en":
		return fmt.Sprintf("Hello, %s.", name)
	case "ja":
		return fmt.Sprintf("こんにちは, %s.", name)
	}
	return "..."
}
