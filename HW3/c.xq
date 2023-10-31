<result> {
    for $x in /congress/people/person[@gender='F']
    where $x/role/@current='1'
    return
    <person name="{data($x/@name)}"
            age="{2023 - fn:year-from-date($x/@birthday)}"
            state="{data($x/role[@current='1']/@state)}"/>
}
</result>