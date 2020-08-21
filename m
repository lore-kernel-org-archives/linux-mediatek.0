Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0B2C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 04:47:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20572206FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 04:47:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dumh4q1a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j3xzh4AG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20572206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m9wGe8kZqSFPiyOqDv8gJW+FXNGF9sBzZonnCev9SyU=; b=Dumh4q1ah+1qpS7bKilD52ydQ
	HFQSIqKor9ms9Hf4lIdTjdXjlRE/TqvkYVxe4KIj61nt6WIwtSGdEi4ol0UE4msGOAsXU+HOIdLWn
	/MWvZAuDMG8m22VCLXsZiCq9TE0mQdbN2bgSyt8SG5qJ+76VC73CC0N2jcgxWPQgqhWsaDjbzyMIQ
	zeM+hbmFb1zz+Zg6hDD+xX+5oA7D05iZFdKHE9dIMiKFkt0rDrDEdbOkjmTUoobzjpLtosU2SnCAz
	NSinjRAXoX6oDaLQQJ+S3TG6hmmlSwGFF5a7L5P0IDawLr5f8jiItEV0KYTJFu8d+aMKf94GZCISH
	qCsyKwYNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yxf-0004ev-2v; Fri, 21 Aug 2020 04:47:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yxc-0004e8-C2
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 04:47:29 +0000
X-UUID: e0c2e1759e9947cd81f6ddd216a5c686-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rtSNcj9WdoW8N3anyRnK6q6++/r1djDG3stDnjKlZVI=; 
 b=j3xzh4AGxw6U6gl1ggHCDFu/e/MHoOGUz2jbI3q0hgXlgvUJ4PBOIOPcXseoUjcH2wlLcPPjAeXEYFSmml3CLE2+qUPvL0flr5cXRycGVwkRrW0QDobZSn+aTZQeM6w6h+R/a1Z9paSC/p16DKBPfyeNSQC7fJYuZxLJFNDfCBQ=;
X-UUID: e0c2e1759e9947cd81f6ddd216a5c686-20200820
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1961385894; Thu, 20 Aug 2020 20:47:20 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 21:47:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 12:47:10 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Aug 2020 12:47:10 +0800
Message-ID: <1597985231.23380.22.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/2] pinctrl: mediatek: support access registers
 without race-condition
From: Light Hsieh <light.hsieh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>
Date: Fri, 21 Aug 2020 12:47:11 +0800
In-Reply-To: <CAGp9Lzo31FPCQ5PMyA7wAgB_pGM3bZbxP84XYqL7Njb9d+w6Fw@mail.gmail.com>
References: <1597739776-15944-1-git-send-email-light.hsieh@mediatek.com>
 <CAGp9Lzo31FPCQ5PMyA7wAgB_pGM3bZbxP84XYqL7Njb9d+w6Fw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 51BC122EDEF3F1D67EED8335CAD5141E90041D04EFD83219FE1A1A71628C7C8B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_004728_782382_32D46037 
X-CRM114-Status: GOOD (  37.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-19 at 16:11 -0700, Sean Wang wrote:
> Hi Light,
> 
> On Tue, Aug 18, 2020 at 1:36 AM <light.hsieh@mediatek.com> wrote:
> >
> > From: Light Hsieh <light.hsieh@mediatek.com>
> >
> > Some MediaTek SOC provide more control registers other than value register.
> 
> s/MT6765/Some MediaTek SoC/
> 
> > Generanll, a value register need read-modify-write is at offset 0xXXXXXXXX0.
> 
> s/Generally/Generanll/
> 
> > A corresponding SET register is at offset 0xXXXXXXX4. Write 1s' to some bits
> >   of SET register will set same bits in value register.
> > A corresponding CLR register is at offset 0xXXXXXXX8. Write 1s' to some bits
> >   of CLR register will clear same bits in value register.
> > For GPIO mode selection, MWR register is provided at offset 0xXXXXXXXC.
> >   With MWR, the MSBit of GPIO mode selection field is for modification-enable,
> >   not for GPIO mode selection, and the remaining LSBits are for mode
> >   selection.
> >   Take mode selection field with 4-bits as example, to select mode 0~7 via
> >   MWR register, 8~15 (instead of 0~7) shall be written to corresponding mode
> >   selection field.
> > When using SET/CLR/MWR registers, read-modify-write of value register is not
> >   necessary. This can prevent from race condition when multiple bus masters
> >   concurrently read-modify-write the same value register for setting different
> >   fields of the same value register.
> >
> > Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 69 ++++++++++++++++++++++--
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  2 +
> >  2 files changed, 67 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index b77b18f..51f0b53 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -18,6 +18,29 @@
> >  #include "mtk-eint.h"
> >  #include "pinctrl-mtk-common-v2.h"
> >
> > +/* Some MediaTek SOC provide more control registers other than value register.
> 
> s/MT6765/Some MediaTek SoC/

Not only MT6765 provides such control registers.
Actually, many (but not all) MediaTek SoC support.
Other MediaTek SoC can enable such control according to its HW support.

> 
> > + * Generanll, a value register need read-modify-write is at offset 0xXXXXXXXX0.
> 
> s/Generally/Generanll/
> 
> > + * A corresponding SET register is at offset 0xXXXXXXX4. Write 1s' to some bits
> > + *  of SET register will set same bits in value register.
> > + * A corresponding CLR register is at offset 0xXXXXXXX8. Write 1s' to some bits
> > + *  of CLR register will clear same bits in value register.
> > + * For GPIO mode selection, MWR register is provided at offset 0xXXXXXXXC.
> > + *  With MWR, the MSBit of GPIO mode selection field is for modification-enable,
> > + *  not for GPIO mode selection, and the remaining LSBits are for mode
> > + *  selection.
> > + *  Take mode selection field with 4-bits as example, to select mode 0~7 via
> > + *  MWR register, 8~15 (instead of 0~7) shall be written to corresponding mode
> > + *  selection field.
> > + * When using SET/CLR/MWR registers, read-modify-write of value register is not
> > + *  necessary. This can prevent from race condition when multiple bus masters
> > + *  concurrently read-modify-write the same value register for setting different
> > + *  fields of the same value register.
> > + */
> > +
> > +#define SET_OFFSET 0x4
> > +#define CLR_OFFSET 0x8
> 
> can set/clr offset work for mode register?

Yes. However, use set/clr to change mode require 2 register access when
target mode is not all 0's or all 1's.
The mwr HW support is not available on mode register.

> 
> > +#define MWR_OFFSET 0xC
> > +
> >  /**
> >   * struct mtk_drive_desc - the structure that holds the information
> >   *                         of the driving current
> > @@ -64,6 +87,38 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
> >         mtk_w32(pctl, i, reg, val);
> >  }
> >
> > +
> > +static void mtk_hw_set_value_race_free(struct mtk_pinctrl *pctl,
> > +               struct mtk_pin_field *pf, u32 value)
> 
> s/mtk_hw_set_value_race_free/mtk_hw_w1sc/ to explictly indicate
> write-one ethier set or clear operation supported by hw
> 
> > +{
> > +       unsigned int set, clr;
> > +
> > +       set = value & pf->mask;
> > +       clr = (~set) & pf->mask;
> > +
> > +       if (set)
> > +               mtk_w32(pctl, pf->index, pf->offset + SET_OFFSET,
> > +                       set << pf->bitpos);
> > +       if (clr)
> > +               mtk_w32(pctl, pf->index, pf->offset + CLR_OFFSET,
> > +                       clr << pf->bitpos);
> > +}
> > +
> > +static void mtk_hw_set_mode_race_free(struct mtk_pinctrl *pctl,
> > +               struct mtk_pin_field *pf, u32 value)
> 
> s/mtk_hw_set_mode_race_free/mtk_hw_mwr/
> 
> > +{
> > +       unsigned int value_new;
> > +
> > +       /* MSB of mask is modification-enable bit, set this bit */
> > +       value_new = (1 << (pctl->soc->mwr_field_width - 1)) | value;
> 
> it seems to be we can use fls(pf->mask) to replace ctl->soc->mwr_field_width
> 

pf->mask cannot be used direct. It needs conversion.For example:
pf->mask: 0x1f -> value_new = (1 << 4) | value;
pf->mask: 0xf -> value_new = (1 << 3) | value;
pf->mask: 0x7 -> value_new = (1 << 2) | value;

The code size of perform conversion is greater than using a direct
mwr_field_width field.


> > +       if (value_new == value)
> > +               dev_notice(pctl->dev,
> > +                       "invalid mode 0x%x, use it by ignoring MSBit!\n",
> > +                       value);
> > +       mtk_w32(pctl, pf->index, pf->offset + MWR_OFFSET,
> > +               value_new << pf->bitpos);
> > +}
> > +
> >  static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
> >                                    const struct mtk_pin_desc *desc,
> >                                    int field, struct mtk_pin_field *pfd)
> > @@ -197,10 +252,16 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
> >         if (value < 0 || value > pf.mask)
> >                 return -EINVAL;
> >
> > -       if (!pf.next)
> > -               mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
> > -                       (value & pf.mask) << pf.bitpos);
> > -       else
> > +       if (!pf.next) {
> > +               if (hw->soc->race_free_access) {
> 
> let's create an extra flags caps under hw->soc and the SoC capability
> check, something like hw->soc->caps & MTK_HW_CAPS_RMW_ATOMIC to easily
> extend various things for future SoC
> 
> > +                       if (field == PINCTRL_PIN_REG_MODE)
> > +                               mtk_hw_set_mode_race_free(hw, &pf, value);
> > +                       else
> > +                               mtk_hw_set_value_race_free(hw, &pf, value);
> > +               }
> 
> let's create a function holding that specific hardware stuff (at least
> currently it look like), something like
> 
> static void mtk_hw_rmw(struct mtk_pinctrl *pctl,  struct mtk_pin_field *pf)
> {
>      if (pf->field == PINCTRL_PIN_REG_MODE) /* create a member field for pf */
>             mtk_hw_mwr(...);
>     else
>             mtk_hw_w1sc(...);
> }
> 

Sine there is no member 'field' in struct mtk_pin_field, pf->field
cannot be used. 
Therefore an extra function parameter is required if you want to use a
standalone function mtk_hw_rmw. Like this: 

void mtk_hw_rmw(struct mtk_pinctrl *pctl, struct mtk_pin_field *pf,
		int field, u32 value)
{
	if (field == PINCTRL_PIN_REG_MODE)
		mtk_hw_set_mode_race_free(hw, &pf, value);
	else
		mtk_hw_set_value_race_free(hw, &pf, value);
}

I wonder the necessity/efficiency of such extra intermediate function
with many function parameters. 


> > +                       mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
> > +                               (value & pf.mask) << pf.bitpos);
> > +       } else
> >                 mtk_hw_write_cross_field(hw, &pf, value);
> >
> >         return 0;
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > index 27df087..95fb329 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > @@ -203,6 +203,8 @@ struct mtk_pin_soc {
> >         /* Specific parameters per SoC */
> >         u8                              gpio_m;
> >         bool                            ies_present;
> > +       bool                            race_free_access;
> > +       unsigned int                    mwr_field_width;
> >         const char * const              *base_names;
> >         unsigned int                    nbase_names;
> >
> > --
> > 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
