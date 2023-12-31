<result> {
    for $x in /congress/people/person
    where $x/role/@current='1' and $x/role[@current='1']/@type='rep' and $x/role/@state='NC'
    order by xs:integer($x/role[@current='1']/@district) ascending
    return <representative name="{data($x/@name)}"
            district="{data($x/role[@current='1']/@district)}"
            party="{data($x/role[@current='1']/@party)}"/>
}
</result>