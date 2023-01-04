---
title: Guide
aside: false
---

# {{ $frontmatter.title }}

Civet on the left, compiled TypeScript output on the right.

[[toc]]

### Humanize syntax

::: code-group

```coffee
a is b
a or b
a and b
```

```typescript
a === b;
a || b;
a && b;
```

:::

### Variables

::: code-group

```coffee
a := 10
b ::= 10
c .= 10
```

```typescript
const a = 10;
let b = 10;
let c = 10;
```

:::

### Objects

::: code-group

```coffee
civet := name: 'Henry', age: 4

civet :=
  a: 1
  b: 2
  c:
    x: 'pretty'
    y: 'cool'
```

```typescript
const civet = { name: 'Henry', age: 4 };

const civet = {
  a: 1,
  b: 2,
  c: {
    x: 'pretty',
    y: 'cool',
  },
};
```

:::

### Functions

::: code-group

```coffee
(a: number, b: number) => a + b

```

```typescript
(a: number, b: number) => a + b;
```

:::

::: code-group

```coffee
(a: number, b: number) -> a + b
```

```typescript
function(a: number, b: number) {
  return a + b
}
```

:::

#### Block shorthands

::: code-group

```coffee
x.map &.name
x.map &.profile?.name[0...3]
x.map &.callback a, b
x.map +&
```

```typescript
x.map((item) => item.name);
x.map((item) => item.profile?.name.slice(0, 3));
x.map((item) => item.callback(a, b));
x.map((item) => +item);
```

:::

## Conditions

### If, Else

::: code-group

```coffee
if coffee or relaxed
  code()
else
  sleep()
```

```typescript
if (coffee || relaxed) {
  code();
} else {
  sleep();
}
```

:::

### Unless

::: code-group

```coffee
unless tired
  code()
```

```typescript
if (!tired) {
  code();
}
```

:::

### Conditional Assignment

::: code-group

```coffee
civet.speed = 15 if civet.rested
```

```typescript
if (civet.rested) {
  civet.speed = 15;
}
```

:::

## Loops

### Infinite loop

::: code-group

```coffee
i .= 0
loop
  i++
  break if i > 5
```

```typescript
let i = 0;
while (true) {
  i++;
  if (i > 5) {
    break;
  }
}
```

:::

### Until loop

::: code-group

```coffee
i .= 0
until i > 5
  i++
```

```typescript
let i = 0;
while (!(i > 5)) {
  i++;
}
```

:::

## Classes

### Prototype

::: code-group

```coffee
X::
X::a
```

```typescript
X.prototype;
X.prototype.a;
```

:::

### This

::: code-group

```coffee
@
id := @id
obj := { @id }
```

```typescript
this;
const id = this.id;
const obj = { id: this.id };
```

:::

### Static fields

::: code-group

```coffee
class A
  @a = 'civet'
```

```typescript
class A {
  static a = 'civet';
}
```

:::

### Readonly fields

::: code-group

```coffee
class B
 b := 'civet'

```

```typescript
class B {
  readonly b = 'civet';
}
```

:::

### Class constructor

::: code-group

```coffee
class Rectangle
  @(@height: number, @width: number) =>
```

```typescript
class Rectangle {
  constructor(height: number, width: number) {
    this.height = height;
    this.width = width;
  }
}
```

:::

### Class static block

::: code-group

```coffee
class Circle
  @
    this.PI = 3
```

```typescript
class Circle {
  static {
    this.PI = 3;
  }
}
```

:::

### Class extending

::: code-group

```coffee
class Civet < Animal
```

```typescript
class Civet extends Animal {}
```

:::

## Misc

### Chained comparisons

::: code-group

```coffee
a < b < c
```

```typescript
a < b && b < c;
```

:::

### Import ESM

::: code-group

```coffee
x from './x'
```

```typescript
import x from './x';
```

:::

### Flagging

::: code-group

```coffee
config := { +debug, -live }
```

```typescript
const config = { debug: true, live: false };
```

:::

### Optional chaining

::: code-group

```coffee
obj?[key]
fun?(arg)
```

```typescript
obj?.[key];
fun?.(arg);
```

:::

### Operators

::: code-group

```coffee
a and= b
a or= b
a ?= b

obj.key ?= 'civet'
```

```typescript
a &&= b;
a ||= b;
a ??= b;

obj.key ??= 'civet';
```

:::

### Range literals

::: code-group

```coffee
a := ['a'..'d']
b := [0..6]
```

```typescript
const a = ['a', 'b', 'c', 'd'];
const b = [0, 1, 2, 3, 4, 5, 6];
```

:::

### Array Slicing

::: code-group

```coffee
numbers := [1, 2, 3, 4, 5, 6]
start := numbers[0..2]
middle := numbers[3..-2]
end := numbers[-2..]
```

```typescript
const numbers = [1, 2, 3, 4, 5, 6];
const start = numbers.slice(0, 1 + 2 || 1 / 0);
const middle = numbers.slice(3, 1 + -2 || 1 / 0);
const end = numbers.slice(-2);
```

:::

### Late assignment

::: code-group

```coffee
a + b = c
```

```typescript
a + (b = c);
```

:::

### Pipelines

::: code-group

```coffee
data
  |> Object.keys
  |> console.log
```

```typescript
console.log(Object.keys(data));
```

:::