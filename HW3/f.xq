<result> {
    for $x in /congress/people/person
    where $x/role/@current='1' and $x/role[@current='1']/@state='NY' and not(exists(/congress/committees/committee/member[@id = $x/@id])) and not(exists(/congress/committees/committee/subcommittee/member[@id = $x/@id]))
    order by $x/@name ascending
    return
        <member>
            {data($x/@name)}
        </member>
}
</result>