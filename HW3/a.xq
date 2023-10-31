<result> {
    for $x in /congress/people
    where ends-with($x/@name, 'Smith')
    (:for $x in /congress/people/name[ends-with(@name, 'Smith')]:)
    return
        $x
}
</result>