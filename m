From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH] eint: add gpio vritual number select
Date: Sun, 16 Dec 2018 23:59:20 -0800
Message-ID: <CAGp9LzoiVQyWMbBx3X2SscnSrS5OPT2O+NbW+yq6p2qtfsnFag@mail.gmail.com>
References: <1544693783-25079-1-git-send-email-chuanjia.liu@mediatek.com>
 <CAGp9LzpcRCMWSn-u6K6+eRT=Zr8PR22Vd381miyhVYbF87N02g@mail.gmail.com> <1545016504.29293.10.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545016504.29293.10.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanjia.Liu@mediatek.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hongkun.cao@mediatek.com, youlin.pei@mediatek.com, eddie.huang@mediatek.com, zhiyong.tao@mediatek.com, hailong.fan@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Sun, Dec 16, 2018 at 7:15 PM Chuanjia Liu <Chuanjia.Liu@mediatek.com> wrote:
>
> On Thu, 2018-12-13 at 11:33 -0800, Sean Wang wrote:
> > On Thu, Dec 13, 2018 at 1:36 AM <chuanjia.liu@mediatek.com> wrote:
> > >
> > > From: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> > >
> > > This patch add gpio vritual number select,avoid virtual gpio set SMT.
> >
> > s/gpio/GPIO/
> > s/vritual/virtual/
> >
> > Virtual GPIOs you said here that means these pins only used inside SoC
> > and not being exported to outside SoC, right? It seems this kind of
> > pins doesn't need SMT.
> >
> Yes,virtual gpio only used inside SOC and these pins doesn't need set
> SMT
> > >
> > > Signed-off-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> > > ---
> > >  drivers/pinctrl/mediatek/mtk-eint.h              |    1 +
> > >  drivers/pinctrl/mediatek/pinctrl-mt8183.c        |    1 +
> > >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |    9 ++++++---
> > >  3 files changed, 8 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
> > > index 48468d0..c16beaf 100644
> > > --- a/drivers/pinctrl/mediatek/mtk-eint.h
> > > +++ b/drivers/pinctrl/mediatek/mtk-eint.h
> > > @@ -37,6 +37,7 @@ struct mtk_eint_hw {
> > >         u8              ports;
> > >         unsigned int    ap_num;
> > >         unsigned int    db_cnt;
> > > +       unsigned int    vir_start;
> > >  };
> > >
> > >  struct mtk_eint;
> > > diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> > > index 6262fd3..bbeafd3 100644
> > > --- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> > > +++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> > > @@ -497,6 +497,7 @@
> > >         .ports     = 6,
> > >         .ap_num    = 212,
> > >         .db_cnt    = 13,
> > > +       .vir_start = 180,
> > >  };
> > >
> > >  static const struct mtk_pin_soc mt8183_data = {
> > > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > index 4a9e0d4..ca3bae1 100644
> > > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > @@ -289,9 +289,12 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
> > >         if (err)
> > >                 return err;
> > >
> > > -       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, MTK_ENABLE);
> > > -       if (err)
> > > -               return err;
> > > +       if (gpio_n < hw->eint->hw->vir_start) {
> > > +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
> > > +                                      MTK_ENABLE);
> > > +               if (err)
> > > +                       return err;
> > > +       }
> >
> > The changes will break these SoCs without a properly configured vir_start.
> >
> > If SMT seems unnecessary for these kinds of virtual GPIOs pin in the
> > path, we can do it as
> >
> > err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
> >                                         MTK_ENABLE);
> > /* please add comments for the exclusion condition */
> > if (err && err != -ENOTSUPP)
> >         return err;
> >
> > If there is getting much special on certain pins between SoCs, and
> > then we can consider creating a desc->flag to split logic.
>
> Yes,SMT unnecessary for these kinds of virtual GPIOS pin in the path,if
> do it as
>         err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
>                                         MTK_ENABLE);
>         if (err && err != -ENOTSUPP)
>                   return err;
> I wonder if system will lose -ENOTSUPP information when smt was not
> successfully set by real gpio?

-ENOTSUPP shouldn't happen in a real pin as SMT is supposed to be
supported by every real pin.

If it is not true or there are more special on certain pins, and then
we consider to add a flag to struct mtk_pin_desc to group these pins
with their characteristics and to split and reuse the common code flow
with the extra flag.

So for now, I thought it's enough to handle your case with adding a
few well self-explained comments for the exclusion condition. These
words help us remember we should add adding an extra flag to pin
description as one of TODO if more needs like you come out.

> >
> > >
> > >         return 0;
> > >  }
> > > --
> > > 1.7.9.5
>
>
