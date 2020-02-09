package greet

import (
	"testing"
)

type TestCase struct {
	Name     string
	Language string
}

func TestGreet(t *testing.T) {
	cases := []struct {
		in       TestCase
		expected string
	}{
		{TestCase{Name: "World", Language: "en"}, "Hello, World."},
		{TestCase{Name: "Kazumasa", Language: "ja"}, "こんにちは, Kazumasa."},
	}
	for _, c := range cases {
		actual := Greet(c.in.Name, c.in.Language)
		if actual != c.expected {
			t.Errorf("Greet(%q, %q) == %q, expect %q",
				c.in.Name, c.in.Language, actual, c.expected)
		}
	}
}
