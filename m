From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH] eint: add gpio vritual number select
Date: Mon, 17 Dec 2018 12:04:42 +0800
Message-ID: <1545019482.27863.8.camel@mtksdaap41>
References: <1544693783-25079-1-git-send-email-chuanjia.liu@mediatek.com>
 <CAGp9LzpcRCMWSn-u6K6+eRT=Zr8PR22Vd381miyhVYbF87N02g@mail.gmail.com>
 <1545016504.29293.10.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1545016504.29293.10.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
Cc: youlin.pei@mediatek.com, hongkun.cao@mediatek.com, zhiyong.tao@mediatek.com, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, hailong.fan@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2018-12-17 at 11:15 +0800, Chuanjia Liu wrote:
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

Hi,

I don't see full patch in linux-mediatek archive. Maybe you are not
subscribed so it is rejected?

Please add this description to commit message and/or code comment.
I think 'internal GPIO' might be a better name for this. Does the name
'virtual GPIO' come from datasheet?


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


Since it is about GPIO and SMT, maybe it should be added to mtk_pin_soc
instead of mtk_eint_hw ?

Joe.C

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
> 	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
>                                         MTK_ENABLE);
> 	if (err && err != -ENOTSUPP)
>       		  return err;
> I wonder if system will lose -ENOTSUPP information when smt was not
> successfully set by real gpio?
> > 
> > >
> > >         return 0;
> > >  }
> > > --
> > > 1.7.9.5
> 
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
