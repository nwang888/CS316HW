<result> {
    for $x in /congress/people/person
    where $x/role/@current='1' and $x/role/@type='rep' and $x/role/@state='NC'
    return
    <person name="{data($x/@name)}"
            district="{2023 - fn:year-from-date($x/@birthday)}"
            party="{data($x/role[@current='1']/@state)}"/>
}
</result>