create or replace trigger InsertRepresentation
before insert or update on LesRepresentations

  declare

    num integer;

  begin

    select numS into num from LesSpectacles where LesSpectacles.nomSpec=:new.nomSpec;

    if (num <> null ) then
      insert into LesRepresentations values (num,new.dateRep);
    else
      raise_application_error(-20001,'ce spectacle nexiste pas');
    end if;
end;
/