# Conditional Control Statements

            Conditional Control Statements
                /                    \
              IF                    CASE
               |                      |

              -> IF THEN            -> SIMPLE CASE
              -> IF THEN ELSE       -> SEARCHED CASE
              -> IF THEN ELSEIF
- [IF](#if)
  - [IF THEN](#if-then)
  - [IF THEN ELSE](#if-then-else)
  - [IF THEN ELSE IF](#if-then-elseif)
- [CASE](#case)
  - [SIMPLE CASE](#simple-case)
  - [SEARCHED CASE](#searched-case)

## IF

Usage of **if** keyword as a conditional control statement in PL/SQL.

### IF THEN

``` sql
IF <condition_1> THEN <statements_1>
END IF;
```

### IF THEN ELSE

``` sql
IF <condition_1> THEN <statements_1>
ELSE                  <statements_2>
END IF;
```

### IF THEN ELSEIF

``` sql
IF <condition_1> THEN <statements_1>
ELSEIF                <statements_2>
ELSEIF                <statements_3>
ELSE                  <statements_4>
END IF;
```

## CASE

Usage of **case** keyword as a conditional control statement in PL/SQL.

### SIMPLE CASE

```sql
CASE <selector>
  WHEN <selector_value_1> THEN <statements_1>
  WHEN <selector_value_2> THEN <statements_2>
  WHEN <selector_value_3> THEN <statements_3>
  ...
  WHEN <selector_value_n> THEN <statements_n>
  [ELSE <else_statements>]
END CASE;
```

### SEARCHED CASE

```sql
CASE
  WHEN <condition_1> THEN <statements_1>
  WHEN <condition_2> THEN <statements_2>
  WHEN <condition_3> THEN <statements_3>
  ...
  WHEN <condition_n> THEN <statements_n>
  [ELSE <else_statements>]
END CASE;
```
