From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH] eint: add gpio vritual number select
Date: Thu, 13 Dec 2018 11:51:40 -0800
Message-ID: <CAGp9LzrTZjEPLKEB+OwSVbLx=KBQRFVmN41KDqj_xTJ5oyU0KQ@mail.gmail.com>
References: <1544693783-25079-1-git-send-email-chuanjia.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544693783-25079-1-git-send-email-chuanjia.liu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: chuanjia.liu@mediatek.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hongkun.cao@mediatek.com, youlin.pei@mediatek.com, eddie.huang@mediatek.com, zhiyong.tao@mediatek.com, hailong.fan@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

And the subject should be also corrected with prefix starting with
"pinctrl: mediatek:", typo fixup, and having a better subject close to
the content.

On Thu, Dec 13, 2018 at 1:36 AM <chuanjia.liu@mediatek.com> wrote:
>
> From: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
>
> This patch add gpio vritual number select,avoid virtual gpio set SMT.
>
> Signed-off-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/mtk-eint.h              |    1 +
>  drivers/pinctrl/mediatek/pinctrl-mt8183.c        |    1 +
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |    9 ++++++---
>  3 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
> index 48468d0..c16beaf 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.h
> +++ b/drivers/pinctrl/mediatek/mtk-eint.h
> @@ -37,6 +37,7 @@ struct mtk_eint_hw {
>         u8              ports;
>         unsigned int    ap_num;
>         unsigned int    db_cnt;
> +       unsigned int    vir_start;
>  };
>
>  struct mtk_eint;
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> index 6262fd3..bbeafd3 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> @@ -497,6 +497,7 @@
>         .ports     = 6,
>         .ap_num    = 212,
>         .db_cnt    = 13,
> +       .vir_start = 180,
>  };
>
>  static const struct mtk_pin_soc mt8183_data = {
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 4a9e0d4..ca3bae1 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -289,9 +289,12 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
>         if (err)
>                 return err;
>
> -       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, MTK_ENABLE);
> -       if (err)
> -               return err;
> +       if (gpio_n < hw->eint->hw->vir_start) {
> +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
> +                                      MTK_ENABLE);
> +               if (err)
> +                       return err;
> +       }
>
>         return 0;
>  }
> --
> 1.7.9.5
