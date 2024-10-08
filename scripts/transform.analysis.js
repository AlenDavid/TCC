#!node

if (process.argv.length < 2) process.exit(1);

const path = require("node:path");

const files = process.argv.slice(2);

const pattern = /\d+\w+/;

const keys = [
  "file",
  "name",
  "start_line",
  "end_line",
  "kind",
  '"metrics.nargs.total_functions"',
  '"metrics.nargs.total_closures"',
  '"metrics.nargs.average_functions"',
  '"metrics.nargs.average_closures"',
  '"metrics.nargs.total"',
  '"metrics.nargs.average"',
  '"metrics.nargs.functions_min"',
  '"metrics.nargs.functions_max"',
  '"metrics.nargs.closures_min"',
  '"metrics.nargs.closures_max"',
  '"metrics.nexits.sum"',
  '"metrics.nexits.average"',
  '"metrics.nexits.min"',
  '"metrics.nexits.max"',
  '"metrics.cognitive.sum"',
  '"metrics.cognitive.average"',
  '"metrics.cognitive.min"',
  '"metrics.cognitive.max"',
  '"metrics.cyclomatic.sum"',
  '"metrics.cyclomatic.average"',
  '"metrics.cyclomatic.min"',
  '"metrics.cyclomatic.max"',
  '"metrics.halstead.distinct_operators"',
  '"metrics.halstead.total_occurrences_of_operators"',
  '"metrics.halstead.distinct_operands"',
  '"metrics.halstead.total_occurrences_of_operands"',
  '"metrics.halstead.length"',
  '"metrics.halstead.estimated_program_length"',
  '"metrics.halstead.purity_ratio"',
  '"metrics.halstead.vocabulary"',
  '"metrics.halstead.volume"',
  '"metrics.halstead.difficulty"',
  '"metrics.halstead.level"',
  '"metrics.halstead.effort"',
  '"metrics.halstead.time"',
  '"metrics.halstead.bugs"',
  '"metrics.loc.sloc"',
  '"metrics.loc.ploc"',
  '"metrics.loc.lloc"',
  '"metrics.loc.cloc"',
  '"metrics.loc.blank"',
  '"metrics.loc.sloc_average"',
  '"metrics.loc.ploc_average"',
  '"metrics.loc.lloc_average"',
  '"metrics.loc.cloc_average"',
  '"metrics.loc.blank_average"',
  '"metrics.loc.sloc_min"',
  '"metrics.loc.sloc_max"',
  '"metrics.loc.cloc_min"',
  '"metrics.loc.cloc_max"',
  '"metrics.loc.ploc_min"',
  '"metrics.loc.ploc_max"',
  '"metrics.loc.lloc_min"',
  '"metrics.loc.lloc_max"',
  '"metrics.loc.blank_min"',
  '"metrics.loc.blank_max"',
  '"metrics.nom.functions"',
  '"metrics.nom.closures"',
  '"metrics.nom.functions_average"',
  '"metrics.nom.closures_average"',
  '"metrics.nom.total"',
  '"metrics.nom.average"',
  '"metrics.nom.functions_min"',
  '"metrics.nom.functions_max"',
  '"metrics.nom.closures_min"',
  '"metrics.nom.closures_max"',
  '"metrics.mi.mi_original"',
  '"metrics.mi.mi_sei"',
  '"metrics.mi.mi_visual_studio"',
];

const values = (file) => [
  file.name,
  pattern.exec(file.name)?.[0] ?? file.name,
  file.start_line,
  file.end_line,
  file.kind,
  file.metrics.nargs.total_functions,
  file.metrics.nargs.total_closures,
  file.metrics.nargs.average_functions,
  file.metrics.nargs.average_closures,
  file.metrics.nargs.total,
  file.metrics.nargs.average,
  file.metrics.nargs.functions_min,
  file.metrics.nargs.functions_max,
  file.metrics.nargs.closures_min,
  file.metrics.nargs.closures_max,
  file.metrics.nexits.sum,
  file.metrics.nexits.average,
  file.metrics.nexits.min,
  file.metrics.nexits.max,
  file.metrics.cognitive.sum,
  file.metrics.cognitive.average,
  file.metrics.cognitive.min,
  file.metrics.cognitive.max,
  file.metrics.cyclomatic.sum,
  file.metrics.cyclomatic.average,
  file.metrics.cyclomatic.min,
  file.metrics.cyclomatic.max,
  file.metrics.halstead.n1,
  file.metrics.halstead.N1,
  file.metrics.halstead.n2,
  file.metrics.halstead.N2,
  file.metrics.halstead.length,
  file.metrics.halstead.estimated_program_length,
  file.metrics.halstead.purity_ratio,
  file.metrics.halstead.vocabulary,
  file.metrics.halstead.volume,
  file.metrics.halstead.difficulty,
  file.metrics.halstead.level,
  file.metrics.halstead.effort,
  file.metrics.halstead.time,
  file.metrics.halstead.bugs,
  file.metrics.loc.sloc,
  file.metrics.loc.ploc,
  file.metrics.loc.lloc,
  file.metrics.loc.cloc,
  file.metrics.loc.blank,
  file.metrics.loc.sloc_average,
  file.metrics.loc.ploc_average,
  file.metrics.loc.lloc_average,
  file.metrics.loc.cloc_average,
  file.metrics.loc.blank_average,
  file.metrics.loc.sloc_min,
  file.metrics.loc.sloc_max,
  file.metrics.loc.cloc_min,
  file.metrics.loc.cloc_max,
  file.metrics.loc.ploc_min,
  file.metrics.loc.ploc_max,
  file.metrics.loc.lloc_min,
  file.metrics.loc.lloc_max,
  file.metrics.loc.blank_min,
  file.metrics.loc.blank_max,
  file.metrics.nom.functions,
  file.metrics.nom.closures,
  file.metrics.nom.functions_average,
  file.metrics.nom.closures_average,
  file.metrics.nom.total,
  file.metrics.nom.average,
  file.metrics.nom.functions_min,
  file.metrics.nom.functions_max,
  file.metrics.nom.closures_min,
  file.metrics.nom.closures_max,
  file.metrics.mi.mi_original,
  file.metrics.mi.mi_sei,
  file.metrics.mi.mi_visual_studio,
];

const statement = (items) => {
  const escapedValues = items.map((v) => {
    const type = typeof v;
    if (type === "string") return `'${v}'`;
    if (type === "boolean") return "" + v;
    if (type === "number") return v;
    if (v === null || v === undefined) return 0;

    throw new Error(`Cannot parse ${type} into SQL statement`);
  });

  const sqlKeys = keys.join(", ");
  const sqlValues = escapedValues.join(", ");

  const sqlSet = keys.map((k, i) => `${k}=${escapedValues[i]}`).join(", ");

  return `insert into metrics(${sqlKeys}) values(${sqlValues}) on conflict do update set ${sqlSet};`;
};

for (const filepath of files) {
  let file = require(path.join(process.cwd(), filepath));

  console.log(statement(values(file)));
}

