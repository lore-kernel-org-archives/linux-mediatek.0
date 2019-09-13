From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/5] pinctrl: mediatek: Refine mtk_pinconf_get() and mtk_pinconf_set()
Date: Fri, 13 Sep 2019 14:39:26 +0200
Message-ID: <CACRpkdZnn2JdUjDO7518jBn_fLwH+89P6WTC1M9CpsxZ1CSgGA@mail.gmail.com>
References: <1567662796-25508-1-git-send-email-light.hsieh@mediatek.com> <1567662796-25508-3-git-send-email-light.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567662796-25508-3-git-send-email-light.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Light Hsieh <light.hsieh@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Sep 5, 2019 at 7:53 AM Light Hsieh <light.hsieh@mediatek.com> wrote:

> From: Light Hsieh <light.hsieh@mediatek.com>
>
> 1.Refine mtk_pinconf_get():
(...)
> 2.Refine mtk_pinconf_set():

This explodes on the build servers and it's because of this:

> @@ -78,93 +78,75 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>  {
>         struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
>         u32 param = pinconf_to_config_param(*config);
> -       int val, val2, err, reg, ret = 1;
> +       int err, reg, ret = 1;

Deletes "val" and "val2"

>         case MTK_PIN_CONFIG_TDSEL:
>         case MTK_PIN_CONFIG_RDSEL:
>                 reg = (param == MTK_PIN_CONFIG_TDSEL) ?
>                        PINCTRL_PIN_REG_TDSEL : PINCTRL_PIN_REG_RDSEL;
> -
>                 err = mtk_hw_get_value(hw, desc, reg, &val);
> -               if (err)
> -                       return err;
> -
> -               ret = val;
> -

Updates a bit, but look on the reg = line:
"val" is still used.

This patch can not have been properly compile tested.

Please rebase on latest "devel" branch from pinctrl, fix up the problems
and resubmit the entire series after making sure it compiles and works.

Yours,
Linus Walleij
