abstract class AppStates {}

class InitialState extends AppStates {}

class ChangeIndexOfTaskState extends AppStates {}

class AppDatabaseInitializedState extends AppStates {}

class TasksTableCreatedState extends AppStates {}

class ErrorTasksTableCreatedState extends AppStates {}

class TasksTableOpenedState extends AppStates {}

class LoadingGetTasksState extends AppStates {}

class ChangeTextDayColorState extends AppStates {}

class ChangeDayColorState extends AppStates {}

class SuccessGetTasksState extends AppStates {}

class UpdateTaskState extends AppStates {}

class UpdateFavoriteTaskState extends AppStates {}

class ChangeCheckBoxStatusState extends AppStates {}

class ChangeFavStatusState extends AppStates {}
