create table if not exists metrics (
  file text PRIMARY KEY,
  name text,
  start_line real,
  end_line real,
  kind text,
  "metrics.nargs.total_functions" real,
  "metrics.nargs.total_closures" real,
  "metrics.nargs.average_functions" real,
  "metrics.nargs.average_closures" real,
  "metrics.nargs.total" real,
  "metrics.nargs.average" real,
  "metrics.nargs.functions_min" real,
  "metrics.nargs.functions_max" real,
  "metrics.nargs.closures_min" real,
  "metrics.nargs.closures_max" real,
  "metrics.nexits.sum" real,
  "metrics.nexits.average" real,
  "metrics.nexits.min" real,
  "metrics.nexits.max" real,
  "metrics.cognitive.sum" real,
  "metrics.cognitive.average" real,
  "metrics.cognitive.min" real,
  "metrics.cognitive.max" real,
  "metrics.cyclomatic.sum" real,
  "metrics.cyclomatic.average" real,
  "metrics.cyclomatic.min" real,
  "metrics.cyclomatic.max" real,
  "metrics.halstead.distinct_operators" real,
  "metrics.halstead.total_occurrences_of_operators" real,
  "metrics.halstead.distinct_operands" real,
  "metrics.halstead.total_occurrences_of_operands" real,
  "metrics.halstead.length" real,
  "metrics.halstead.estimated_program_length" real,
  "metrics.halstead.purity_ratio" real,
  "metrics.halstead.vocabulary" real,
  "metrics.halstead.volume" real,
  "metrics.halstead.difficulty" real,
  "metrics.halstead.level" real,
  "metrics.halstead.effort" real,
  "metrics.halstead.time" real,
  "metrics.halstead.bugs" real,
  "metrics.loc.sloc" real,
  "metrics.loc.ploc" real,
  "metrics.loc.lloc" real,
  "metrics.loc.cloc" real,
  "metrics.loc.blank" real,
  "metrics.loc.sloc_average" real,
  "metrics.loc.ploc_average" real,
  "metrics.loc.lloc_average" real,
  "metrics.loc.cloc_average" real,
  "metrics.loc.blank_average" real,
  "metrics.loc.sloc_min" real,
  "metrics.loc.sloc_max" real,
  "metrics.loc.cloc_min" real,
  "metrics.loc.cloc_max" real,
  "metrics.loc.ploc_min" real,
  "metrics.loc.ploc_max" real,
  "metrics.loc.lloc_min" real,
  "metrics.loc.lloc_max" real,
  "metrics.loc.blank_min" real,
  "metrics.loc.blank_max" real,
  "metrics.nom.functions" real,
  "metrics.nom.closures" real,
  "metrics.nom.functions_average" real,
  "metrics.nom.closures_average" real,
  "metrics.nom.total" real,
  "metrics.nom.average" real,
  "metrics.nom.functions_min" real,
  "metrics.nom.functions_max" real,
  "metrics.nom.closures_min" real,
  "metrics.nom.closures_max" real,
  "metrics.mi.mi_original" real,
  "metrics.mi.mi_sei" real,
  "metrics.mi.mi_visual_studio" real
);

create view if not exists before AS
select
  *
from
  metrics
where
  file like '%before.js';

create view if not exists after AS
select
  *
from
  metrics
where
  file like '%after.js';

create view if not exists differences AS
select
  after.name as name,
  after. "metrics.nargs.total_functions" - before. "metrics.nargs.total_functions" as "metrics.nargs.total_functions",
  after. "metrics.nargs.total_closures" - before. "metrics.nargs.total_closures" as "metrics.nargs.total_closures",
  after. "metrics.nargs.average_functions" - before. "metrics.nargs.average_functions" as "metrics.nargs.average_functions",
  after. "metrics.nargs.average_closures" - before. "metrics.nargs.average_closures" as "metrics.nargs.average_closures",
  after. "metrics.nargs.total" - before. "metrics.nargs.total" as "metrics.nargs.total",
  after. "metrics.nargs.average" - before. "metrics.nargs.average" as "metrics.nargs.average",
  after. "metrics.nargs.functions_min" - before. "metrics.nargs.functions_min" as "metrics.nargs.functions_min",
  after. "metrics.nargs.functions_max" - before. "metrics.nargs.functions_max" as "metrics.nargs.functions_max",
  after. "metrics.nargs.closures_min" - before. "metrics.nargs.closures_min" as "metrics.nargs.closures_min",
  after. "metrics.nargs.closures_max" - before. "metrics.nargs.closures_max" as "metrics.nargs.closures_max",
  after. "metrics.nexits.sum" - before. "metrics.nexits.sum" as "metrics.nexits.sum",
  after. "metrics.nexits.average" - before. "metrics.nexits.average" as "metrics.nexits.average",
  after. "metrics.nexits.min" - before. "metrics.nexits.min" as "metrics.nexits.min",
  after. "metrics.nexits.max" - before. "metrics.nexits.max" as "metrics.nexits.max",
  after. "metrics.cognitive.sum" - before. "metrics.cognitive.sum" as "metrics.cognitive.sum",
  after. "metrics.cognitive.average" - before. "metrics.cognitive.average" as "metrics.cognitive.average",
  after. "metrics.cognitive.min" - before. "metrics.cognitive.min" as "metrics.cognitive.min",
  after. "metrics.cognitive.max" - before. "metrics.cognitive.max" as "metrics.cognitive.max",
  after. "metrics.cyclomatic.sum" - before. "metrics.cyclomatic.sum" as "metrics.cyclomatic.sum",
  after. "metrics.cyclomatic.average" - before. "metrics.cyclomatic.average" as "metrics.cyclomatic.average",
  after. "metrics.cyclomatic.min" - before. "metrics.cyclomatic.min" as "metrics.cyclomatic.min",
  after. "metrics.cyclomatic.max" - before. "metrics.cyclomatic.max" as "metrics.cyclomatic.max",
  after. "metrics.halstead.distinct_operators" - before. "metrics.halstead.distinct_operators" as "metrics.halstead.distinct_operators",
  after. "metrics.halstead.total_occurrences_of_operators" - before. "metrics.halstead.total_occurrences_of_operators" as "metrics.halstead.total_occurrences_of_operators",
  after. "metrics.halstead.distinct_operands" - before. "metrics.halstead.distinct_operands" as "metrics.halstead.distinct_operands",
  after. "metrics.halstead.total_occurrences_of_operands" - before. "metrics.halstead.total_occurrences_of_operands" as "metrics.halstead.total_occurrences_of_operands",
  after. "metrics.halstead.length" - before. "metrics.halstead.length" as "metrics.halstead.length",
  after. "metrics.halstead.estimated_program_length" - before. "metrics.halstead.estimated_program_length" as "metrics.halstead.estimated_program_length",
  after. "metrics.halstead.purity_ratio" - before. "metrics.halstead.purity_ratio" as "metrics.halstead.purity_ratio",
  after. "metrics.halstead.vocabulary" - before. "metrics.halstead.vocabulary" as "metrics.halstead.vocabulary",
  after. "metrics.halstead.volume" - before. "metrics.halstead.volume" as "metrics.halstead.volume",
  after. "metrics.halstead.difficulty" - before. "metrics.halstead.difficulty" as "metrics.halstead.difficulty",
  after. "metrics.halstead.level" - before. "metrics.halstead.level" as "metrics.halstead.level",
  after. "metrics.halstead.effort" - before. "metrics.halstead.effort" as "metrics.halstead.effort",
  after. "metrics.halstead.time" - before. "metrics.halstead.time" as "metrics.halstead.time",
  after. "metrics.halstead.bugs" - before. "metrics.halstead.bugs" as "metrics.halstead.bugs",
  after. "metrics.loc.sloc" - before. "metrics.loc.sloc" as "metrics.loc.sloc",
  after. "metrics.loc.ploc" - before. "metrics.loc.ploc" as "metrics.loc.ploc",
  after. "metrics.loc.lloc" - before. "metrics.loc.lloc" as "metrics.loc.lloc",
  after. "metrics.loc.cloc" - before. "metrics.loc.cloc" as "metrics.loc.cloc",
  after. "metrics.loc.blank" - before. "metrics.loc.blank" as "metrics.loc.blank",
  after. "metrics.loc.sloc_average" - before. "metrics.loc.sloc_average" as "metrics.loc.sloc_average",
  after. "metrics.loc.ploc_average" - before. "metrics.loc.ploc_average" as "metrics.loc.ploc_average",
  after. "metrics.loc.lloc_average" - before. "metrics.loc.lloc_average" as "metrics.loc.lloc_average",
  after. "metrics.loc.cloc_average" - before. "metrics.loc.cloc_average" as "metrics.loc.cloc_average",
  after. "metrics.loc.blank_average" - before. "metrics.loc.blank_average" as "metrics.loc.blank_average",
  after. "metrics.loc.sloc_min" - before. "metrics.loc.sloc_min" as "metrics.loc.sloc_min",
  after. "metrics.loc.sloc_max" - before. "metrics.loc.sloc_max" as "metrics.loc.sloc_max",
  after. "metrics.loc.cloc_min" - before. "metrics.loc.cloc_min" as "metrics.loc.cloc_min",
  after. "metrics.loc.cloc_max" - before. "metrics.loc.cloc_max" as "metrics.loc.cloc_max",
  after. "metrics.loc.ploc_min" - before. "metrics.loc.ploc_min" as "metrics.loc.ploc_min",
  after. "metrics.loc.ploc_max" - before. "metrics.loc.ploc_max" as "metrics.loc.ploc_max",
  after. "metrics.loc.lloc_min" - before. "metrics.loc.lloc_min" as "metrics.loc.lloc_min",
  after. "metrics.loc.lloc_max" - before. "metrics.loc.lloc_max" as "metrics.loc.lloc_max",
  after. "metrics.loc.blank_min" - before. "metrics.loc.blank_min" as "metrics.loc.blank_min",
  after. "metrics.loc.blank_max" - before. "metrics.loc.blank_max" as "metrics.loc.blank_max",
  after. "metrics.nom.functions" - before. "metrics.nom.functions" as "metrics.nom.functions",
  after. "metrics.nom.closures" - before. "metrics.nom.closures" as "metrics.nom.closures",
  after. "metrics.nom.functions_average" - before. "metrics.nom.functions_average" as "metrics.nom.functions_average",
  after. "metrics.nom.closures_average" - before. "metrics.nom.closures_average" as "metrics.nom.closures_average",
  after. "metrics.nom.total" - before. "metrics.nom.total" as "metrics.nom.total",
  after. "metrics.nom.average" - before. "metrics.nom.average" as "metrics.nom.average",
  after. "metrics.nom.functions_min" - before. "metrics.nom.functions_min" as "metrics.nom.functions_min",
  after. "metrics.nom.functions_max" - before. "metrics.nom.functions_max" as "metrics.nom.functions_max",
  after. "metrics.nom.closures_min" - before. "metrics.nom.closures_min" as "metrics.nom.closures_min",
  after. "metrics.nom.closures_max" - before. "metrics.nom.closures_max" as "metrics.nom.closures_max",
  after. "metrics.mi.mi_original" - before. "metrics.mi.mi_original" as "metrics.mi.mi_original",
  after. "metrics.mi.mi_sei" - before. "metrics.mi.mi_sei" as "metrics.mi.mi_sei",
  after. "metrics.mi.mi_visual_studio" - before. "metrics.mi.mi_visual_studio" as "metrics.mi.mi_visual_studio"
from
  before
  join after on before.name = after.name;

create view listed_differences as
select
  diff.name,
  cols.name as metric,
  (
    select
      case
        cols.name
        when 'metrics.nargs.total_functions' then "metrics.nargs.total_functions"
        when 'metrics.nargs.total_closures' then "metrics.nargs.total_closures"
        when 'metrics.nargs.average_functions' then "metrics.nargs.average_functions"
        when 'metrics.nargs.average_closures' then "metrics.nargs.average_closures"
        when 'metrics.nargs.total' then "metrics.nargs.total"
        when 'metrics.nargs.average' then "metrics.nargs.average"
        when 'metrics.nargs.functions_min' then "metrics.nargs.functions_min"
        when 'metrics.nargs.functions_max' then "metrics.nargs.functions_max"
        when 'metrics.nargs.closures_min' then "metrics.nargs.closures_min"
        when 'metrics.nargs.closures_max' then "metrics.nargs.closures_max"
        when 'metrics.nexits.sum' then "metrics.nexits.sum"
        when 'metrics.nexits.average' then "metrics.nexits.average"
        when 'metrics.nexits.min' then "metrics.nexits.min"
        when 'metrics.nexits.max' then "metrics.nexits.max"
        when 'metrics.cognitive.sum' then "metrics.cognitive.sum"
        when 'metrics.cognitive.average' then "metrics.cognitive.average"
        when 'metrics.cognitive.min' then "metrics.cognitive.min"
        when 'metrics.cognitive.max' then "metrics.cognitive.max"
        when 'metrics.cyclomatic.sum' then "metrics.cyclomatic.sum"
        when 'metrics.cyclomatic.average' then "metrics.cyclomatic.average"
        when 'metrics.cyclomatic.min' then "metrics.cyclomatic.min"
        when 'metrics.cyclomatic.max' then "metrics.cyclomatic.max"
        when 'metrics.halstead.distinct_operators' then "metrics.halstead.distinct_operators"
        when 'metrics.halstead.total_occurrences_of_operators' then "metrics.halstead.total_occurrences_of_operators"
        when 'metrics.halstead.distinct_operands' then "metrics.halstead.distinct_operands"
        when 'metrics.halstead.total_occurrences_of_operands' then "metrics.halstead.total_occurrences_of_operands"
        when 'metrics.halstead.length' then "metrics.halstead.length"
        when 'metrics.estimated_program_length' then "metrics.estimated_program_length"
        when 'metrics.halstead.purity_ratio' then "metrics.halstead.purity_ratio"
        when 'metrics.halstead.vocabulary' then "metrics.halstead.vocabulary"
        when 'metrics.halstead.volume' then "metrics.halstead.volume"
        when 'metrics.halstead.difficulty' then "metrics.halstead.difficulty"
        when 'metrics.halstead.level' then "metrics.halstead.level"
        when 'metrics.halstead.effort' then "metrics.halstead.effort"
        when 'metrics.halstead.time' then "metrics.halstead.time"
        when 'metrics.halstead.bugs' then "metrics.halstead.bugs"
        when 'metrics.loc.sloc' then "metrics.loc.sloc"
        when 'metrics.loc.ploc' then "metrics.loc.ploc"
        when 'metrics.loc.lloc' then "metrics.loc.lloc"
        when 'metrics.loc.cloc' then "metrics.loc.cloc"
        when 'metrics.loc.blank' then "metrics.loc.blank"
        when 'metrics.loc.sloc_average' then "metrics.loc.sloc_average"
        when 'metrics.loc.ploc_average' then "metrics.loc.ploc_average"
        when 'metrics.loc.lloc_average' then "metrics.loc.lloc_average"
        when 'metrics.loc.cloc_average' then "metrics.loc.cloc_average"
        when 'metrics.loc.blank_average' then "metrics.loc.blank_average"
        when 'metrics.loc.sloc_min' then "metrics.loc.sloc_min"
        when 'metrics.loc.sloc_max' then "metrics.loc.sloc_max"
        when 'metrics.loc.cloc_min' then "metrics.loc.cloc_min"
        when 'metrics.loc.cloc_max' then "metrics.loc.cloc_max"
        when 'metrics.loc.ploc_min' then "metrics.loc.ploc_min"
        when 'metrics.loc.ploc_max' then "metrics.loc.ploc_max"
        when 'metrics.loc.lloc_min' then "metrics.loc.lloc_min"
        when 'metrics.loc.lloc_max' then "metrics.loc.lloc_max"
        when 'metrics.loc.blank_min' then "metrics.loc.blank_min"
        when 'metrics.loc.blank_max' then "metrics.loc.blank_max"
        when 'metrics.nom.functions' then "metrics.nom.functions"
        when 'metrics.nom.closures' then "metrics.nom.closures"
        when 'metrics.nom.functions_average' then "metrics.nom.functions_average"
        when 'metrics.nom.closures_average' then "metrics.nom.closures_average"
        when 'metrics.nom.total' then "metrics.nom.total"
        when 'metrics.nom.average' then "metrics.nom.average"
        when 'metrics.nom.functions_min' then "metrics.nom.functions_min"
        when 'metrics.nom.functions_max' then "metrics.nom.functions_max"
        when 'metrics.nom.closures_min' then "metrics.nom.closures_min"
        when 'metrics.nom.closures_max' then "metrics.nom.closures_max"
        when 'metrics.mi.mi_original' then "metrics.mi.mi_original"
        when 'metrics.mi.mi_sei' then "metrics.mi.mi_sei"
        when 'metrics.mi.mi_visual_studio' then "metrics.mi.mi_visual_studio"
        else 0
      end
    from
      differences
    where
      differences.name = diff.name
    limit
      1
  ) as value
from
  differences diff
  join (
    SELECT
      name
    FROM
      pragma_table_info('metrics')
    limit
      5, -1
  ) cols;
