SET LINES 200 PAGES 900 SERVEROUT OFF

SELECT  /*+
gather_plan_statistics
optimizer_features_enable('11.2.0.1')
leading(e)
use_nl(d)
index(d)
no_nlj_batching(d)
*/
      e.*, d.loc
  FROM scott.emp e, scott.dept d
 WHERE hiredate > DATE '1980-12-17' AND e.deptno = d.deptno;

SET PAGES 0

SELECT *
  FROM TABLE (
          DBMS_XPLAN.display_cursor (
             format   => 'BASIC +IOSTATS LAST -BYTES -ROWS +PREDICATE'));