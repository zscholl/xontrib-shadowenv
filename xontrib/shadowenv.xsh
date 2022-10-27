import json

def __shadowenv() -> None:
    shadow_data = $(shadowenv hook --json)
    if shadow_data:
        envs = json.loads(shadow_data)
        for shadow_key in ["exported", "unexported"]:
            for k,v in envs.get(shadow_key, {}).items():
                if v is None:
                    del ${k}
                else:
                    ${k} = v

@events.on_post_rc
def __shadowenv_post_rc(**kwargs) -> None:
    __shadowenv()

@events.on_chdir
def __shadowenv_on_chdir(olddir: str, newdir: str, **kwargs) -> None:
    __shadowenv()
