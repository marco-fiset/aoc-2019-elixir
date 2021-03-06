defmodule Day3Test do
  use ExUnit.Case

  test "Parse movement coordinates" do
    {dir, length} = Day3.parse_move("R41")

    assert dir == :right
    assert length == 41
  end

  test "Moving sets new position" do
    new_pos = Day3.move([0,0], "R3")
    assert new_pos == [3, 0]
  end

  test "Can record all traversed points" do
    {_, points} = Day3.record_move("R3")
    assert points == [[1,0], [2,0], [3, 0]]
  end

  test "Can record multiple moves" do
    {new_pos, points} = Day3.record_moves(["R3", "U1", "L4"])
    assert new_pos == [-1, 1]
    assert points == [[1,0], [2,0], [3,0], [3,1], [2,1], [1,1], [0,1], [-1,1]]
  end

  test "Grid distance" do
    assert Day3.grid_distance([0, 1], [4, 3]) == 6
    assert Day3.grid_distance([-4, 3], [0, 0]) == 7
  end

  test "Examples - Closest crossing" do
    {_, wire1} = Day3.record_moves("R75,D30,R83,U83,L12,D49,R71,U7,L72")
    {_, wire2} = Day3.record_moves("U62,R66,U55,R34,D71,R55,D58,R83")

    assert Day3.closest_crossing(wire1, wire2) == 159

    {_, wire3} = Day3.record_moves("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51")
    {_, wire4} = Day3.record_moves("U98,R91,D20,R16,D67,R40,U7,R15,U6,R7")

    assert Day3.closest_crossing(wire3, wire4) == 135
  end

  test "Examples - shortest crossing" do
    {_, wire1} = Day3.record_moves("R75,D30,R83,U83,L12,D49,R71,U7,L72")
    {_, wire2} = Day3.record_moves("U62,R66,U55,R34,D71,R55,D58,R83")

    assert Day3.shortest_crossing(wire1, wire2) == 610

    {_, wire3} = Day3.record_moves("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51")
    {_, wire4} = Day3.record_moves("U98,R91,D20,R16,D67,R40,U7,R15,U6,R7")

    assert Day3.shortest_crossing(wire3, wire4) == 410
  end

  test "Wire crosses with itself" do
    {_, wire1} = Day3.record_moves("R3,U1,L1,D2")
    {_, wire2} = Day3.record_moves("D1,R4")

    assert Day3.shortest_crossing(wire1, wire2) == 10
  end
end
