Scenario: Получить список встреч весь API
    Given authorized with role EFS_CM_KEY_CLIENTS
    And the existing BD :
        |холдинг       |статус   |дата проведения |
        |ГазПромБанк   |активна  |20.07.2021 16:00|
        |СтройЖилИнвест|завершена|15.07.2021 10:00|
        |ИнжирингАктив |отменена |24.07.2021 11:00|
    And my request contains "type=KSK"
    When I request "list of KSK" endpoint
    Then I should receive list of "3" meetings
        
Scenario: Получить список встреч по холдингу API
    Given authorized with role EFS_CM_KEY_CLIENTS
    And the existing BD :
        |холдинг       |статус   |дата проведения |
        |ГазПромБанк   |активна  |20.07.2021 16:00|
        |ГазПромБанк   |завершена|20.05.2021 12:00|
        |СтройЖилИнвест|завершена|15.07.2021 10:00|
        |ИнжирингАктив |отменена |24.07.2021 11:00|
    And my request contains "type=KSK"
    And my request contains "holding=ГазПромБанк"
    When I request "list of KSK" endpoint
    Then I should receive a json list like:
        |ГазПромБанк   |активна  |20.07.2021 16:00|
        |ГазПромБанк   |завершена|20.05.2021 12:00|
    
Scenario: Получить список встреч по статусу API
    Given authorized with role EFS_CM_KEY_CLIENTS
    And the existing BD :
        |холдинг       |статус   |дата проведения |
        |ГазПромБанк   |активна  |20.07.2021 16:00|
        |СтройЖилИнвест|активна  |30.07.2021 17:00|
        |СтройЖилИнвест|завершена|15.07.2021 10:00|
        |ИнжирингАктив |отменена |24.07.2021 11:00|
    And my request contains "type=KSK"
    And my request contains "status=активна"
    When I request "list of KSK" endpoint
    Then I should receive a json list like:
        |ГазПромБанк   |активна  |20.07.2021 16:00|
        |СтройЖилИнвест|активна  |30.07.2021 17:00|
