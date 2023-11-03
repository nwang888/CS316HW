<result> {
    for $state in /congress/people//person/role[@current='1']/@state
    let $x := /congress/people/person[role[@current='1' and @state=$state]] 
    let $M := count($x[@gender='M'])
    let $F := count($x[@gender='F'])
    return 
        element {$state} {
            element {'M'} {
                attribute count {$M}
            },
            element {'F'} {
                attribute count {$F}
            }
        }
}
</result>