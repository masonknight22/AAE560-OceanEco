breed [sharks shark]
breed [fishes fish]
breed [rays ray]
breed [shrimps shrimp]
breed [megaladons megaladon]
breed [seahorses seahorse]

;sharks-own (name age)

to setup
  clear-all
  reset-ticks
  create-sharks num_sharks
  [
    set color blue
    setxy random-xcor random-ycor
  ]
  create-fishes num_fishes
  [
    set color green
    setxy random-xcor random-ycor
  ]
  create-rays num_rays
  [
    set color white
    setxy random-xcor random-ycor
  ]
  create-shrimps num_shrimps
  [
    set color cyan
    setxy random-xcor random-ycor
  ]
  create-megaladons num_megaladons
  [
    set color red
    setxy random-xcor random-ycor
  ]
  create-seahorses num_seahorses
  [
    set color yellow
    setxy random-xcor random-ycor
  ]

end

to go
  
  ask sharks [
    move
    eat
  ]
  ask fishes [
    move
  ]
  ask rays [
    move
    hunt
  ]
  ask shrimps [
    scurry
  ]
  ask megaladons [
    move
    eat
    devour
  ]
  ask seahorses [
    scurry
  ]
  tick
end

to move
  left random 50
  right random 50
  forward 1
end

to square
  repeat 4 [
    forward 10
    right 90
  ]
end

to eat
  let prey one-of fishes-here
  if prey != nobody [
    ask prey [die]
  ]

end

to devour
  let prey one-of sharks-here
  if prey != nobody [
    ask prey [die]
  ]

end

to hunt
  let prey one-of shrimps-here
  let food one-of seahorses-here
  if prey != nobody [
    ask prey [die]
  ]
  if food != nobody [
    ask food [die]
  ]

end

to scurry
  left random 50
  right random 50
  forward 4
end
