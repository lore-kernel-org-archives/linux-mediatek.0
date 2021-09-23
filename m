Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E61C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 08:39:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B80C861216
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 08:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B80C861216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Atwc7jIiinhklmF7QyVAtIj3cy1bFbreEXYs0SorCMA=; b=lNqi1RIi5xQzbo
	eb8ubzcMuu5ygsIKkAV+L2e2qWWIJxWBwshoiSr1dyuxXXTSXvAzol6V+76x81RVUFQeHEL69oiEb
	dxAUffC4dNKaNYHa84Gy7rmJfLj8Zgh3C5dMl5duaD7BB7YSZrqrf/l1C5Jy8rd1u1nY/smvs8ZLu
	lrZMh1iooeHPP8L8UphCAjlMqmRAtlvzMr25P4zc9gTLJYm6NNbMISgtJuU8DO135o2l+90qvNN8v
	W17TEXcr6aMyIOX44Lrh973lopkn+Dgj+GRC2bWPp7uCtpwUVdYtffHgxChVVIl8/IvsXTfBxtFSF
	oXos8ishweK7RHkoIYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTKFv-00AevN-QX; Thu, 23 Sep 2021 08:38:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTKFq-00Aeqg-EJ; Thu, 23 Sep 2021 08:38:58 +0000
X-UUID: ced06d67bcd74695b7309a05f03c2429-20210923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qsGD0W9oJ5N2pI9mjhb1Ys3WYX3DGA0eeCFpBLAMlv0=; 
 b=YXn1V3qGH0e7OSFbjzuL50eFxhH0oi03kRG6OxAOpkvKEpq7ygCzjLUpNHN5qMREaGWx7mOFOnZjOdW8SNKIfSQSTKA0nXlXR0dDmsJUhBZv4rqiNmd0OFwHWFTMxhSCpq0LP5bDBoBvzWUiDM/NVmWf1yvTyb7Eo/4VWvSWPX4=;
X-UUID: ced06d67bcd74695b7309a05f03c2429-20210923
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1977152745; Thu, 23 Sep 2021 01:38:42 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 01:38:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 16:38:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Sep 2021 16:38:38 +0800
Message-ID: <294565612d51e7d36a704a4ba24d64bff61c7b31.camel@mediatek.com>
Subject: Re: [PATCH v13 4/5] pinctrl: mediatek: support rsel feature
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, "Light
 Hsieh" <light.hsieh@mediatek.com>, Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, "Devicetree
 List" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
Date: Thu, 23 Sep 2021 16:38:40 +0800
In-Reply-To: <CAGXv+5Fp0coJn1zVHZU_TWQyqtuc0EEPU4a7uaEsjX6u6EEhzA@mail.gmail.com>
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
 <20210922025640.11600-5-zhiyong.tao@mediatek.com>
 <CAGXv+5Fp0coJn1zVHZU_TWQyqtuc0EEPU4a7uaEsjX6u6EEhzA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_013855_933947_8445AF14 
X-CRM114-Status: GOOD (  38.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-09-23 at 15:35 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Wed, Sep 22, 2021 at 10:59 AM Zhiyong Tao <
> zhiyong.tao@mediatek.com> wrote:
> > 
> > This patch supports rsel(resistance selection) feature for I2C
> > pins.
> > It provides more resistance selection solution in different ICs.
> > It provides rsel define and si unit solution by identifying
> > "mediatek,rsel_resistance_in_si_unit" property in pio dtsi node.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 231
> > +++++++++++++++---
> >  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  45 ++++
> >  drivers/pinctrl/mediatek/pinctrl-paris.c      |  60 +++--
> >  3 files changed, 288 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index 5b3b048725cc..e84001923aaf 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -661,6 +661,181 @@ static int
> > mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
> >         return err;
> >  }
> > 
> > +static int mtk_hw_pin_rsel_lookup(struct mtk_pinctrl *hw,
> > +                                 const struct mtk_pin_desc *desc,
> > +                                 u32 pullup, u32 arg, u32
> > *rsel_val)
> > +{
> > +       const struct mtk_pin_rsel *rsel;
> > +       int check;
> > +       bool found = false;
> > +
> > +       rsel = hw->soc->pin_rsel;
> > +
> > +       for (check = 0; check <= hw->soc->npin_rsel - 1; check++) {
> > +               if (desc->number >= rsel[check].s_pin &&
> > +                   desc->number <= rsel[check].e_pin) {
> > +                       if (pullup) {
> > +                               if (rsel[check].up_rsel == arg) {
> > +                                       found = true;
> > +                                       *rsel_val =
> > rsel[check].rsel_index;
> > +                                       break;
> 
> The code could simply `return 0` after setting *rsel_val, then we
> don't have
> to have the `found` variable.

We use "found" variable to identify whether user set the right si unit
value or not . 

> 
> Unless your goal is to use the last matching value in the case of
> duplicates,
> instead of the first. If that is the case you should add a comment
> stating
> so along with the reason,
> 
> And the structure could be written as
> 
>     if (pin not in range)
>         continue;
> 
>     ... check value ...
> 
> which would decrease the nesting level. Mostly stylistic though.
> 
> > +                               }
> > +                       } else {
> > +                               if (rsel[check].down_rsel == arg) {
> > +                                       found = true;
> > +                                       *rsel_val =
> > rsel[check].rsel_index;
> > +                                       break;
> > +                               }
> > +                       }
> > +               }
> > +       }
> > +
> > +       if (!found) {
> > +               dev_err(hw->dev, "Not support rsel value %d Ohm for
> > pin = %d (%s)\n",
> > +                       arg, desc->number, desc->name);
> > +               return -ENOTSUPP;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> 
> [...]
> 
> > +static int mtk_pinconf_bias_get_rsel(struct mtk_pinctrl *hw,
> > +                                    const struct mtk_pin_desc
> > *desc,
> > +                                    u32 *pullup, u32 *enable)
> > +{
> > +       int pu, pd, rsel, err;
> > +
> > +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_RSEL,
> > &rsel);
> > +       if (err)
> > +               goto out;
> > +
> > +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PU, &pu);
> > +       if (err)
> > +               goto out;
> > +
> > +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);
> 
> mtk_pinconf_bias_get_pu_pd() couldn't be reused?

It couldn't be reused. Because in the api, if user use rsel si unit, it
can return si unit value, if user use rsel define, it can return rsel
define value.

> 
> > +
> > +       if (pu == 0 && pd == 0) {
> > +               *pullup = 0;
> > +               *enable = MTK_DISABLE;
> > +       } else if (pu == 1 && pd == 0) {
> > +               *pullup = 1;
> > +               if (hw->rsel_si_unit)
> > +                       mtk_rsel_get_si_unit(hw, desc, *pullup,
> > rsel, enable);
> > +               else
> > +                       *enable = rsel + MTK_PULL_SET_RSEL_000;
> > +       } else if (pu == 0 && pd == 1) {
> > +               *pullup = 0;
> > +               if (hw->rsel_si_unit)
> > +                       mtk_rsel_get_si_unit(hw, desc, *pullup,
> > rsel, enable);
> > +               else
> > +                       *enable = rsel + MTK_PULL_SET_RSEL_000;
> > +       } else {
> > +               err = -EINVAL;
> > +               goto out;
> > +       }
> > +
> > +out:
> > +       return err;
> > +}
> > +
> >  static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
> >                                 const struct mtk_pin_desc *desc,
> >                                 u32 *pullup, u32 *enable)
> > @@ -742,44 +917,40 @@ static int
> > mtk_pinconf_bias_get_pupd_r1_r0(struct mtk_pinctrl *hw,
> >         return err;
> >  }
> > 
> > -int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> > -                               const struct mtk_pin_desc *desc,
> > -                               u32 pullup, u32 arg)
> > -{
> > -       int err;
> > -
> > -       err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
> > -       if (!err)
> > -               goto out;
> > -
> > -       err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc, pullup,
> > arg);
> > -       if (!err)
> > -               goto out;
> > -
> > -       err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup,
> > arg);
> > -
> > -out:
> > -       return err;
> > -}
> > -EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
> > -
> >  int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
> >                               const struct mtk_pin_desc *desc,
> >                               u32 *pullup, u32 *enable)
> >  {
> > -       int err;
> > +       int err = -ENOTSUPP;
> > +       u32 try_all_type;
> > 
> > -       err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
> > -       if (!err)
> > -               goto out;
> > +       if (hw->soc->pull_type)
> > +               try_all_type = hw->soc->pull_type[desc->number];
> > +       else
> > +               try_all_type = MTK_PULL_TYPE_MASK;
> > 
> > -       err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc, pullup,
> > enable);
> > -       if (!err)
> > -               goto out;
> > +       if (try_all_type & MTK_PULL_RSEL_TYPE) {
> > +               err = mtk_pinconf_bias_get_rsel(hw, desc, pullup,
> > enable);
> > +               if (!err)
> > +                       return err;
> > +       }
> > 
> > -       err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup,
> > enable);
> > +       if (try_all_type & MTK_PULL_PU_PD_TYPE) {
> > +               err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup,
> > enable);
> > +               if (!err)
> > +                       return err;
> > +       }
> > +
> > +       if (try_all_type & MTK_PULL_PULLSEL_TYPE) {
> > +               err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc,
> > +                                                         pullup,
> > enable);
> > +               if (!err)
> > +                       return err;
> > +       }
> > +
> > +       if (try_all_type & MTK_PULL_PUPD_R1R0_TYPE)
> > +               err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc,
> > pullup, enable);
> > 
> > -out:
> >         return err;
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > index a6f1bdb2083b..4908c7aedbe0 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > @@ -17,6 +17,22 @@
> >  #define MTK_ENABLE     1
> >  #define MTK_PULLDOWN   0
> >  #define MTK_PULLUP     1
> > +#define MTK_PULL_PU_PD_TYPE            BIT(0)
> > +#define MTK_PULL_PULLSEL_TYPE          BIT(1)
> > +#define MTK_PULL_PUPD_R1R0_TYPE                BIT(2)
> > +/* MTK_PULL_RSEL_TYPE can select resistance and can be
> > + * turned on/off itself. But it can't be selected pull up/down
> > + */
> > +#define MTK_PULL_RSEL_TYPE             BIT(3)
> > +/* MTK_PULL_PU_PD_RSEL_TYPE is a type which is controlled by
> > + * MTK_PULL_PU_PD_TYPE and MTK_PULL_RSEL_TYPE.
> > + */
> > +#define MTK_PULL_PU_PD_RSEL_TYPE       (MTK_PULL_PU_PD_TYPE \
> > +                                       | MTK_PULL_RSEL_TYPE)
> > +#define MTK_PULL_TYPE_MASK     (MTK_PULL_PU_PD_TYPE |\
> > +                                MTK_PULL_PULLSEL_TYPE |\
> > +                                MTK_PULL_PUPD_R1R0_TYPE |\
> > +                                MTK_PULL_RSEL_TYPE)
> > 
> >  #define EINT_NA        U16_MAX
> >  #define NO_EINT_SUPPORT        EINT_NA
> > @@ -42,6 +58,14 @@
> >         PIN_FIELD_CALC(_s_pin, _e_pin, 0, _s_addr, _x_addrs,
> > _s_bit,    \
> >                        _x_bits, 32, 1)
> > 
> > +#define PIN_RSEL(_s_pin, _e_pin, _rsel_index, _up_resl,
> > _down_rsel) {  \
> > +               .s_pin =
> > _s_pin,                                        \
> > +               .e_pin =
> > _e_pin,                                        \
> > +               .rsel_index =
> > _rsel_index,                              \
> > +               .up_rsel =
> > _up_resl,                                    \
> > +               .down_rsel =
> > _down_rsel,                                \
> > +       }
> > +
> >  /* List these attributes which could be modified for the pin */
> >  enum {
> >         PINCTRL_PIN_REG_MODE,
> > @@ -67,6 +91,7 @@ enum {
> >         PINCTRL_PIN_REG_DRV_E0,
> >         PINCTRL_PIN_REG_DRV_E1,
> >         PINCTRL_PIN_REG_DRV_ADV,
> > +       PINCTRL_PIN_REG_RSEL,
> >         PINCTRL_PIN_REG_MAX,
> >  };
> > 
> > @@ -129,6 +154,21 @@ struct mtk_pin_field_calc {
> >         u8  fixed;
> >  };
> > 
> > +/* struct mtk_pin_rsel - the structure that provides bias
> > resistance selection.
> 
> Since you went through the trouble of documenting all the fields,
> would
> you consider changing this to a kernel-doc style comment? It is
> similar
> to Java-doc, and would be like:
> 
> /**
>  * struct mtk_pin_rsel ......
>  * @s_pin: ....
>  * ...
>  */
> 
> Only the start of the comment block needs to be changed.
> See Documentation/doc-guide/kernel-doc.rst if you are unsure.

we will fix it in the next version.

> 
> > + * @s_pin:             the start pin within the rsel range
> > + * @e_pin:             the end pin within the rsel range
> > + * @rsel_index:        the rsel bias resistance index
> > + * @up_rsel:   the pullup rsel bias resistance value
> > + * @down_rsel: the pulldown rsel bias resistance value
> > + */
> > +struct mtk_pin_rsel {
> > +       u16 s_pin;
> > +       u16 e_pin;
> > +       u16 rsel_index;
> > +       u32 up_rsel;
> > +       u32 down_rsel;
> > +};
> > +
> >  /* struct mtk_pin_reg_calc - the structure that holds all ranges
> > used to
> >   *                          determine which register the pin would
> > make use of
> >   *                          for certain pin attribute.
> > @@ -206,6 +246,9 @@ struct mtk_pin_soc {
> >         bool                            ies_present;
> >         const char * const              *base_names;
> >         unsigned int                    nbase_names;
> > +       const unsigned int              *pull_type;
> > +       const struct mtk_pin_rsel       *pin_rsel;
> > +       unsigned int                    npin_rsel;
> > 
> >         /* Specific pinconfig operations */
> >         int (*bias_disable_set)(struct mtk_pinctrl *hw,
> > @@ -254,6 +297,8 @@ struct mtk_pinctrl {
> >         const char          **grp_names;
> >         /* lock pin's register resource to avoid multiple threads
> > issue*/
> >         spinlock_t lock;
> > +       /* identify rsel setting by si unit or rsel define in dts
> > node */
> > +       bool rsel_si_unit;
> >  };
> > 
> >  void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask,
> > u32 set);
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > index 38aec0177d15..d4e02c5d74a8 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > @@ -579,8 +579,9 @@ static int mtk_hw_get_value_wrap(struct
> > mtk_pinctrl *hw, unsigned int gpio, int
> >  ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> >         unsigned int gpio, char *buf, unsigned int buf_len)
> >  {
> > -       int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
> > +       int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1, rsel
> > = -1;
> >         const struct mtk_pin_desc *desc;
> > +       u32 try_all_type;
> > 
> >         if (gpio >= hw->soc->npins)
> >                 return -EINVAL;
> > @@ -591,24 +592,39 @@ ssize_t mtk_pctrl_show_one_pin(struct
> > mtk_pinctrl *hw,
> >                 pinmux -= hw->soc->nfuncs;
> > 
> >         mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
> > -       if (pullen == MTK_PUPD_SET_R1R0_00) {
> > -               pullen = 0;
> > -               r1 = 0;
> > -               r0 = 0;
> > -       } else if (pullen == MTK_PUPD_SET_R1R0_01) {
> > -               pullen = 1;
> > -               r1 = 0;
> > -               r0 = 1;
> > -       } else if (pullen == MTK_PUPD_SET_R1R0_10) {
> > -               pullen = 1;
> > -               r1 = 1;
> > -               r0 = 0;
> > -       } else if (pullen == MTK_PUPD_SET_R1R0_11) {
> > +
> > +       if (hw->soc->pull_type)
> > +               try_all_type = hw->soc->pull_type[desc->number];
> > +
> > +       if (hw->rsel_si_unit && (try_all_type &
> > MTK_PULL_RSEL_TYPE)) {
> > +               rsel = pullen;
> >                 pullen = 1;
> > -               r1 = 1;
> > -               r0 = 1;
> > -       } else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
> > -               pullen = 0;
> > +       } else {
> > +               /* Case for: R1R0 */
> > +               if (pullen == MTK_PUPD_SET_R1R0_00) {
> > +                       pullen = 0;
> > +                       r1 = 0;
> > +                       r0 = 0;
> > +               } else if (pullen == MTK_PUPD_SET_R1R0_01) {
> > +                       pullen = 1;
> > +                       r1 = 0;
> > +                       r0 = 1;
> > +               } else if (pullen == MTK_PUPD_SET_R1R0_10) {
> > +                       pullen = 1;
> > +                       r1 = 1;
> > +                       r0 = 0;
> > +               } else if (pullen == MTK_PUPD_SET_R1R0_11) {
> > +                       pullen = 1;
> > +                       r1 = 1;
> > +                       r0 = 1;
> > +               }
> > +
> > +               /* Case for: RSEL */
> > +               if (pullen >= MTK_PULL_SET_RSEL_000 &&
> > +                   pullen <= MTK_PULL_SET_RSEL_111) {
> > +                       rsel = pullen - MTK_PULL_SET_RSEL_000;
> > +                       pullen = 1;
> > +               }
> >         }
> >         len += scnprintf(buf + len, buf_len - len,
> >                         "%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
> > @@ -626,6 +642,8 @@ ssize_t mtk_pctrl_show_one_pin(struct
> > mtk_pinctrl *hw,
> >         if (r1 != -1) {
> >                 len += scnprintf(buf + len, buf_len - len, " (%1d
> > %1d)\n",
> >                         r1, r0);
> > +       } else if (rsel != -1) {
> > +               len += scnprintf(buf + len, buf_len - len, "
> > (%1d)\n", rsel);
> >         } else {
> >                 len += scnprintf(buf + len, buf_len - len, "\n");
> >         }
> > @@ -970,6 +988,12 @@ int mtk_paris_pinctrl_probe(struct
> > platform_device *pdev,
> > 
> >         hw->nbase = hw->soc->nbase_names;
> > 
> > +       if (of_find_property(hw->dev->of_node,
> > +                            "mediatek,rsel_resistance_in_si_unit",
> > NULL))
> 
> This new property should be documented in the bindings.
> 
we will add it in the next version.

> 
> Regards
> ChenYu
> 
> 
> 
> 
> > +               hw->rsel_si_unit = true;
> > +       else
> > +               hw->rsel_si_unit = false;
> > +
> >         spin_lock_init(&hw->lock);
> > 
> >         err = mtk_pctrl_build_state(pdev);
> > --
> > 2.25.1
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
