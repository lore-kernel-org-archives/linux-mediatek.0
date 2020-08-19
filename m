Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68624C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 23:12:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3505020786
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 23:12:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BDVMPgKk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="msr7ExZT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3505020786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=queTqIe5N26ysubSMY+wsOiyz+/V/ii+qH1Py7S84N0=; b=BDVMPgKk9n9XHF36I9McIdOzY
	Tsnf/4CZqm9czlI+jp+MLkK+Unkqu3wzibTKB2bk14llfIpUqTGj6GC4FncNbhrvzEoZlQZPOGeBv
	Mkp/m3PhQQbnlZ3aRFMMi+fRfn5ExbF579eCBQdckbpNQStPpKgS8QDWDujoUw0AwlfA8dTp09x91
	nAslvi3lTutDqD2penV2WnMHYW4Ry5SFHBQDSce1FrD55HKqy24iqBni8Bca0tFp00uxZu6SwgH9K
	unxv0OpVj+SbM/6lSYkdB7jasuW5FFZOrYSLZscW6TZDVlVL8fCHkK0TwJXwXHIFTrz3f0sYkPQxb
	ow1eFq4sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8XFK-0005h9-AG; Wed, 19 Aug 2020 23:11:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8XFH-0005ge-En
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 23:11:52 +0000
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD64D20786
 for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2020 23:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597878710;
 bh=HSrbY+CwG0o4kd/iplMaWaPq8ahQhPaEf0XUQCHWYaM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=msr7ExZThidS+96kINTJqR4YknRvaeVHO5jJ1KSUefdmKuLrbcBNBH0K8+hAwMxL2
 T4ijatTXL6TM1zu729++oTuLZ+U2WOBdGjY+h7zKvrdwnh+JqV3A4J4iTuXUBY54NR
 iF9KjejifDWBPNrSpvMpzWrbqLhc2p2KYygjyAmo=
Received: by mail-il1-f181.google.com with SMTP id f12so202470ils.6
 for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2020 16:11:49 -0700 (PDT)
X-Gm-Message-State: AOAM531ATVYLA8iiAne3iJNulymBVWV9FvYo07vy4jiy+AarozPRNgg8
 XBJRdPpCUGaEPVZdnAc96NgiFPJFJVTlumEYCec=
X-Google-Smtp-Source: ABdhPJxFWTX1ujNyvxatyeyEWG8Qo5p3LPsyFmE3L/4R9pvY1L5UJaeUyca2FF9CpWOJiicuARMLZ6YV/t5Mc47vD2w=
X-Received: by 2002:a92:d488:: with SMTP id p8mr299429ilg.43.1597878709284;
 Wed, 19 Aug 2020 16:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <1597739776-15944-1-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1597739776-15944-1-git-send-email-light.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 19 Aug 2020 16:11:38 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzo31FPCQ5PMyA7wAgB_pGM3bZbxP84XYqL7Njb9d+w6Fw@mail.gmail.com>
Message-ID: <CAGp9Lzo31FPCQ5PMyA7wAgB_pGM3bZbxP84XYqL7Njb9d+w6Fw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: mediatek: support access registers
 without race-condition
To: Light Hsieh <light.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_191151_630843_AE4F8602 
X-CRM114-Status: GOOD (  30.00  )
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
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Light,

On Tue, Aug 18, 2020 at 1:36 AM <light.hsieh@mediatek.com> wrote:
>
> From: Light Hsieh <light.hsieh@mediatek.com>
>
> Some MediaTek SOC provide more control registers other than value register.

s/MT6765/Some MediaTek SoC/

> Generanll, a value register need read-modify-write is at offset 0xXXXXXXXX0.

s/Generally/Generanll/

> A corresponding SET register is at offset 0xXXXXXXX4. Write 1s' to some bits
>   of SET register will set same bits in value register.
> A corresponding CLR register is at offset 0xXXXXXXX8. Write 1s' to some bits
>   of CLR register will clear same bits in value register.
> For GPIO mode selection, MWR register is provided at offset 0xXXXXXXXC.
>   With MWR, the MSBit of GPIO mode selection field is for modification-enable,
>   not for GPIO mode selection, and the remaining LSBits are for mode
>   selection.
>   Take mode selection field with 4-bits as example, to select mode 0~7 via
>   MWR register, 8~15 (instead of 0~7) shall be written to corresponding mode
>   selection field.
> When using SET/CLR/MWR registers, read-modify-write of value register is not
>   necessary. This can prevent from race condition when multiple bus masters
>   concurrently read-modify-write the same value register for setting different
>   fields of the same value register.
>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 69 ++++++++++++++++++++++--
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  2 +
>  2 files changed, 67 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index b77b18f..51f0b53 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -18,6 +18,29 @@
>  #include "mtk-eint.h"
>  #include "pinctrl-mtk-common-v2.h"
>
> +/* Some MediaTek SOC provide more control registers other than value register.

s/MT6765/Some MediaTek SoC/

> + * Generanll, a value register need read-modify-write is at offset 0xXXXXXXXX0.

s/Generally/Generanll/

> + * A corresponding SET register is at offset 0xXXXXXXX4. Write 1s' to some bits
> + *  of SET register will set same bits in value register.
> + * A corresponding CLR register is at offset 0xXXXXXXX8. Write 1s' to some bits
> + *  of CLR register will clear same bits in value register.
> + * For GPIO mode selection, MWR register is provided at offset 0xXXXXXXXC.
> + *  With MWR, the MSBit of GPIO mode selection field is for modification-enable,
> + *  not for GPIO mode selection, and the remaining LSBits are for mode
> + *  selection.
> + *  Take mode selection field with 4-bits as example, to select mode 0~7 via
> + *  MWR register, 8~15 (instead of 0~7) shall be written to corresponding mode
> + *  selection field.
> + * When using SET/CLR/MWR registers, read-modify-write of value register is not
> + *  necessary. This can prevent from race condition when multiple bus masters
> + *  concurrently read-modify-write the same value register for setting different
> + *  fields of the same value register.
> + */
> +
> +#define SET_OFFSET 0x4
> +#define CLR_OFFSET 0x8

can set/clr offset work for mode register?

> +#define MWR_OFFSET 0xC
> +
>  /**
>   * struct mtk_drive_desc - the structure that holds the information
>   *                         of the driving current
> @@ -64,6 +87,38 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
>         mtk_w32(pctl, i, reg, val);
>  }
>
> +
> +static void mtk_hw_set_value_race_free(struct mtk_pinctrl *pctl,
> +               struct mtk_pin_field *pf, u32 value)

s/mtk_hw_set_value_race_free/mtk_hw_w1sc/ to explictly indicate
write-one ethier set or clear operation supported by hw

> +{
> +       unsigned int set, clr;
> +
> +       set = value & pf->mask;
> +       clr = (~set) & pf->mask;
> +
> +       if (set)
> +               mtk_w32(pctl, pf->index, pf->offset + SET_OFFSET,
> +                       set << pf->bitpos);
> +       if (clr)
> +               mtk_w32(pctl, pf->index, pf->offset + CLR_OFFSET,
> +                       clr << pf->bitpos);
> +}
> +
> +static void mtk_hw_set_mode_race_free(struct mtk_pinctrl *pctl,
> +               struct mtk_pin_field *pf, u32 value)

s/mtk_hw_set_mode_race_free/mtk_hw_mwr/

> +{
> +       unsigned int value_new;
> +
> +       /* MSB of mask is modification-enable bit, set this bit */
> +       value_new = (1 << (pctl->soc->mwr_field_width - 1)) | value;

it seems to be we can use fls(pf->mask) to replace ctl->soc->mwr_field_width

> +       if (value_new == value)
> +               dev_notice(pctl->dev,
> +                       "invalid mode 0x%x, use it by ignoring MSBit!\n",
> +                       value);
> +       mtk_w32(pctl, pf->index, pf->offset + MWR_OFFSET,
> +               value_new << pf->bitpos);
> +}
> +
>  static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
>                                    const struct mtk_pin_desc *desc,
>                                    int field, struct mtk_pin_field *pfd)
> @@ -197,10 +252,16 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>         if (value < 0 || value > pf.mask)
>                 return -EINVAL;
>
> -       if (!pf.next)
> -               mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
> -                       (value & pf.mask) << pf.bitpos);
> -       else
> +       if (!pf.next) {
> +               if (hw->soc->race_free_access) {

let's create an extra flags caps under hw->soc and the SoC capability
check, something like hw->soc->caps & MTK_HW_CAPS_RMW_ATOMIC to easily
extend various things for future SoC

> +                       if (field == PINCTRL_PIN_REG_MODE)
> +                               mtk_hw_set_mode_race_free(hw, &pf, value);
> +                       else
> +                               mtk_hw_set_value_race_free(hw, &pf, value);
> +               }

let's create a function holding that specific hardware stuff (at least
currently it look like), something like

static void mtk_hw_rmw(struct mtk_pinctrl *pctl,  struct mtk_pin_field *pf)
{
     if (pf->field == PINCTRL_PIN_REG_MODE) /* create a member field for pf */
            mtk_hw_mwr(...);
    else
            mtk_hw_w1sc(...);
}

> +                       mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
> +                               (value & pf.mask) << pf.bitpos);
> +       } else
>                 mtk_hw_write_cross_field(hw, &pf, value);
>
>         return 0;
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index 27df087..95fb329 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -203,6 +203,8 @@ struct mtk_pin_soc {
>         /* Specific parameters per SoC */
>         u8                              gpio_m;
>         bool                            ies_present;
> +       bool                            race_free_access;
> +       unsigned int                    mwr_field_width;
>         const char * const              *base_names;
>         unsigned int                    nbase_names;
>
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
