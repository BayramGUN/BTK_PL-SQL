# PL/SQL ITERATIVE CONTROL STATEMENTS (LOOPS & CURSORS)

- [LOOPS](#loops)
  - [Basic Loop](#basic-loop)
  - [For Loop](#for-loop)
  - [While Loop](#while-loop)

## LOOPS

### Basic Loop

It looping forever, breaks when we want to do.

```sql
LOOP
  <statement_1>;
  <statement_2>;

  -- we must use a condition to break/exit from basic loop
  -- even if we do not use condition it will be endless loop.
  -- or we do not want to break loop we use <continue_condition> 
  -- when we do not want to the codes that after condition does not work.
  [if <condition> 
    then exit;
  else
    continue; 
  end if;] -- alternative condition usage
  [exit when <exit_condition>;]
  [continue when <continue_condition>;]
  ...
  <statement_n>
END LOOP;
```

### For Loop

It has lower and upper limits. I starts from lower limit and works to the upper limit.
And it makes job with a counter.

```sql
FOR LOOP <loop_counter> IN 
  [REVERSE] -- This is an alternative that allows the loop to work in reverse.
  <lower_limit>..<upper_limit>

    <statement_1>;
    <statement_2>;

    -- we can use a condition to break/exit from for loop
    -- or we do not want to break loop we use <continue_condition> 
    -- when we do not want to the codes that after condition does not work.
    [if <condition> 
      then exit;
    else
      continue; 
    end if;] -- alternative condition usage
    [exit when <exit_condition>;]
    [continue when <continue_condition>;]
    ...
    <statement_n>
END LOOP;
```

### While Loop

It looping forever, breaks when we want to do.

```sql
WHILE <condition> LOOP
  <statement_1>;
  <statement_2>;

  -- we can use a condition to break/exit from while loop
  -- or we do not want to break loop we use <continue_condition> 
  -- when we do not want to the codes that after condition does not work.
  [if <condition> 
    then exit;
  else
    continue; 
  end if;] -- alternative condition usage
  [exit when <exit_condition>;]
  [continue when <continue_condition>;]
  ...
  <statement_n>
END LOOP;
```
