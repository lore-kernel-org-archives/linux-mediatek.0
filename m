From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v6 2/5] pinctrl: mediatek: Supporting driving setting
 without mapping current to register value
Date: Fri, 27 Sep 2019 10:34:34 -0700
Message-ID: <CAGp9LzoMcqD4bo9Brg9=DTeSNP0dJfDtRGadGWGxsX-vHSezQw@mail.gmail.com>
References: <1569560532-1886-1-git-send-email-light.hsieh@mediatek.com> <1569560532-1886-2-git-send-email-light.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569560532-1886-2-git-send-email-light.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Light Hsieh <light.hsieh@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Thu, Sep 26, 2019 at 10:02 PM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> Mediatek's smarphone project actual usage does need to know current value

MediaTek

> (in mA) in procedure of finding the best driving setting.
> The steps in the procedure is like as follow:
>
> 1. set driving setting field in setting register as 0, measure waveform,
>    perform test, and etc.
> 2. set driving setting field in setting register as 1, measure waveform,
>    perform test, and etc.
> ...
> n. set driving setting field in setting register as n-1, measure
>    waveform, perform test, and etc.
> Check the results of steps 1~n and adopt the setting that get best result.
>
> This procedure does need to know the mapping between current to register
> value.

you seem to use a hardware raw value instead of a human-readable value
to adjust driving current, right?

> Therefore, setting driving without mapping current is more pratical for

s/pratical/practical/

> Mediatek's smartphone usage.
>

MediaTek

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++--
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 21 +++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  5 +++++
>  drivers/pinctrl/mediatek/pinctrl-paris.c         |  1 +
>  4 files changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 32451e8..e024ebc 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -1077,8 +1077,8 @@
>         .bias_disable_get = mtk_pinconf_bias_disable_get,
>         .bias_set = mtk_pinconf_bias_set,
>         .bias_get = mtk_pinconf_bias_get,
> -       .drive_set = mtk_pinconf_drive_set_rev1,
> -       .drive_get = mtk_pinconf_drive_get_rev1,
> +       .drive_set = mtk_pinconf_drive_set_direct_val,
> +       .drive_get = mtk_pinconf_drive_get_direct_val,

I'm preferred to name it to mtk_pinconf_drive_[get,set]_raw.

>         .adv_pull_get = mtk_pinconf_adv_pull_get,
>         .adv_pull_set = mtk_pinconf_adv_pull_set,
>  };
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 8077855..acfddf9 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -608,6 +608,27 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>         return 0;
>  }
>
> +/* Revision direct value */

Remove the comment since that is straightforward.

> +int mtk_pinconf_drive_set_direct_val(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, u32 arg)
> +{
> +       int err;
> +
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);

We can dot it simply by "return mtk_hw_set_value(hw, desc,
PINCTRL_PIN_REG_DRV, arg);".

> +
> +       return err;
> +}
> +
> +int mtk_pinconf_drive_get_direct_val(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, int *val)
> +{
> +       int err;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
> +

Ditto as the above.

> +       return err;
> +}
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                              const struct mtk_pin_desc *desc, bool pullup,
>                              u32 arg)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index 1b7da42..b3bada0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -288,6 +288,11 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
>  int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>                                const struct mtk_pin_desc *desc, int *val);
>
> +int mtk_pinconf_drive_set_direct_val(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, u32 arg);
> +int mtk_pinconf_drive_get_direct_val(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, int *val);
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                              const struct mtk_pin_desc *desc, bool pullup,
>                              u32 arg);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 3e13ae7..5217f76 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -970,3 +970,4 @@ static int mtk_paris_pinctrl_resume(struct device *device)
>         .suspend_noirq = mtk_paris_pinctrl_suspend,
>         .resume_noirq = mtk_paris_pinctrl_resume,
>  };
> +

Remove the unnecessary the change

> --
> 1.8.1.1.dirty
>
