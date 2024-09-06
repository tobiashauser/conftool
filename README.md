# conftool

```
conftool <biographies.csv> <abstracts.csv>
```

Build itineraries from conftool data.
			
For the biographies, export `Alle Autor*innen mit Beiträgen` with all boxes ticked.
Equally export `Exportiere Sitzungen` with all the boxes ticked for the abstracts.
			
Don't forget to export as a csv-file. Please choose `;` as the delimiter.

Define the times which the header should link to in a CSV-file with the form:

```
time;label
2023-09-23 9:00; EEEE, HH:mm |
2023-09-23 14:30; HH:mm
```

It is possible to define additional entries in much the same way. Create another
csv-file – with headers!. The columns for "title", "starttime", "endtime" and "location"
must be filled in. Additionally you can specify "type", "abstract", "biography" and
"sessionTitle". Authors are not possible to declare.

Furthermore, you can associate colors with the various session types in a csv-file
as well. Otherwise random colors will be chosen.

```
type;color;
Musik des 19. und frühen 20. Jahrhunderts;#6fa9bd
```
