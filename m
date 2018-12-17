From: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
Subject: Re: [PATCH] eint: add gpio vritual number select
Date: Mon, 17 Dec 2018 11:19:28 +0800
Message-ID: <1545016768.29293.13.camel@mhfsdcap03>
References: <1544693783-25079-1-git-send-email-chuanjia.liu@mediatek.com>
         <CAGp9LzrTZjEPLKEB+OwSVbLx=KBQRFVmN41KDqj_xTJ5oyU0KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGp9LzrTZjEPLKEB+OwSVbLx=KBQRFVmN41KDqj_xTJ5oyU0KQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hongkun Cao =?UTF-8?Q?=28=E6=9B=B9=E6=B4=AA=E5=9D=A4=29?= <Hongkun.Cao@mediatek.com>, Youlin Pei =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?= <youlin.pei@mediatek.com>, Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= <eddie.huang@mediatek.com>, Zhiyong Tao =?UTF-8?Q?=28=E9=99=B6=E5=BF=97=E5=8B=87=29?= <Zhiyong.Tao@mediatek.com>, Hailong Fan =?UTF-8?Q?=28=E8=8C=83=E6=B5=B7=E9=BE=99=29?= <Hailong.Fan@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2018-12-14 at 03:51 +0800, Sean Wang wrote:
> And the subject should be also corrected with prefix starting with
> "pinctrl: mediatek:", typo fixup, and having a better subject close to
> the content.
I will change it in next patch.
> On Thu, Dec 13, 2018 at 1:36 AM <chuanjia.liu@mediatek.com> wrote:
> >
> > From: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> >
> > This patch add gpio vritual number select,avoid virtual gpio set SMT.
> >
> > Signed-off-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> > ---
> >  drivers/pinctrl/mediatek/mtk-eint.h              |    1 +
> >  drivers/pinctrl/mediatek/pinctrl-mt8183.c        |    1 +
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |    9 ++++++---
> >  3 files changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
> > index 48468d0..c16beaf 100644
> > --- a/drivers/pinctrl/mediatek/mtk-eint.h
> > +++ b/drivers/pinctrl/mediatek/mtk-eint.h
> > @@ -37,6 +37,7 @@ struct mtk_eint_hw {
> >         u8              ports;
> >         unsigned int    ap_num;
> >         unsigned int    db_cnt;
> > +       unsigned int    vir_start;
> >  };
> >
> >  struct mtk_eint;
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> > index 6262fd3..bbeafd3 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> > @@ -497,6 +497,7 @@
> >         .ports     = 6,
> >         .ap_num    = 212,
> >         .db_cnt    = 13,
> > +       .vir_start = 180,
> >  };
> >
> >  static const struct mtk_pin_soc mt8183_data = {
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index 4a9e0d4..ca3bae1 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -289,9 +289,12 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
> >         if (err)
> >                 return err;
> >
> > -       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, MTK_ENABLE);
> > -       if (err)
> > -               return err;
> > +       if (gpio_n < hw->eint->hw->vir_start) {
> > +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
> > +                                      MTK_ENABLE);
> > +               if (err)
> > +                       return err;
> > +       }
> >
> >         return 0;
> >  }
> > --
> > 1.7.9.5
