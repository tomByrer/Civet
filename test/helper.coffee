{parse} = require "../source/parser"
gen = require "../source/generate"

assert = require "assert"

compare = (src, result) ->
  assert.equal gen(parse(src)), result

testCase = (text) ->
  [desc, src, result] = text.split("\n---\n")

  it desc, ->
    compare src, result

throws = (text) ->
  assert.throws ->
    gen(parse(text))

module.exports = {
  compare
  testCase
  throws
}