From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v1 2/5] pinctrl: mediatek: Supporting driving setting
 without mapping current to register value
Date: Tue, 13 Aug 2019 17:08:59 -0700
Message-ID: <CAGp9Lzr+cHZ5Ki6u1LP5LeOkuBZhbZR-xfDUHn24-w7xM2YSmg@mail.gmail.com>
References: <1565686400-5711-1-git-send-email-light.hsieh@mediatek.com> <1565686400-5711-3-git-send-email-light.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565686400-5711-3-git-send-email-light.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Light Hsieh <light.hsieh@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Hi, Light

a few nitpicks, but the overall changes look good to me

On Tue, Aug 13, 2019 at 1:53 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> From: Light Hsieh <light.hsieh@mediatek.com>
>
> Mediatek's smarphone project actual usage does need to know current value
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
> Therefore, setting driving without mapping current is more pratical for
> Mediatek's smartphone usage.
>
> Change-Id: Iacdabf0cada230fc5acad96673810c12a6c4556d

remove change-id

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

I prefer to mtk_pinconf_drive_[get,set]_raw_val that would be better
to understand.

>         .adv_pull_get = mtk_pinconf_adv_pull_get,
>         .adv_pull_set = mtk_pinconf_adv_pull_set,
>  };
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 4687f63..23a9529 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -607,6 +607,27 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>         return 0;
>  }
>
> +/* Revision direct value */
> +int mtk_pinconf_drive_set_direct_val(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, u32 arg)
> +{
> +       int err;
> +
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
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
> index 28b4951..71c94b2 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -964,3 +964,4 @@ static int mtk_paris_pinctrl_resume(struct device *device)
>         .suspend_noirq = mtk_paris_pinctrl_suspend,
>         .resume_noirq = mtk_paris_pinctrl_resume,
>  };
> +

remove unnecessary the empty line

> --
> 1.8.1.1.dirty
>
