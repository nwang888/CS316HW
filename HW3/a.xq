<result> {
    for $x in /congress/people/person
    where ends-with($x/@name, 'Smith')
    return
        $x
}
</result>