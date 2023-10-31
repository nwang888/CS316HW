<result> {
    for $x in /congress/people/person[@gender='F']
    where $x/role/@current='1' and $x/role[@current='1']/@party="Democrat"
    order by (2023 - fn:year-from-date($x/@birthday)) descending, $x/@name ascending
        (:~ order by (2023 - fn:year-from-date($x/@birthday)) descending ~:)

    return
    <person name="{data($x/@name)}"
            age="{2023 - fn:year-from-date($x/@birthday)}"
            state="{data($x/role[@current='1']/@state)}"
            type="{data($x/role[@current='1']/@type)}"/>
}
</result>