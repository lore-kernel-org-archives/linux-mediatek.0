Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CDCC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 10:58:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481DF20663
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 10:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UubE2fZN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z/BzFjbg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 481DF20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zK10EfbAvUQf6HoL/xqzIeLsNJB9MVQxW4NnKOOV3bk=; b=UubE2fZNtTpv66iOzCM7vTYEP
	2AD+Vo6mBXV3bL4fNLnX/cWn06kmg5ma31ZqQ3RnAMxuI4RKqNRiPEPTry8a93PApHYf1Gybh2gJX
	088vqK8wubtceU3xMp3cQSNWZzOX8ynwSZ4D6+2fYupPoVEMjp64zl7+D2sgjkhyv1z3uJWFZ/+G8
	E5qGMSe4VGOGwhSIr6gBwvjLf2V4IgOqbLXusWA0E0BKIkFk8CE3tmyqrmBFzCz25nFQG2p39hm8N
	JKZON5zEJaXSV78KW5JgK1O2ObTVOQ3LdbqCDpOlSYJt6Fj5RDrxuPfxGm2j3omBV5WIYoLVenb6v
	lf688mm1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0jmv-0006EP-Ne; Wed, 29 Jul 2020 10:58:21 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0jmt-0006Cz-8p
 for linux-mediatek@lists.infradead.org; Wed, 29 Jul 2020 10:58:20 +0000
Received: by mail-vs1-xe44.google.com with SMTP id w22so7289599vsi.3
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2020 03:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nK5MzAuxnrLLTf1gFEuoiVLFsvF02S3WxqXWXquN7Zw=;
 b=Z/BzFjbga5ANtMEPLZ2KnCs7/NeG8UpIu2B8jQ8M2BL0O49bwh+OGBKxiTBzvwRNAA
 Gu6iVk9KOm5SBXE87ZiZmuR38DNVckxKp14bYzW1Am45cJsNBJhhg/AI7yhmIUdyoQWc
 XB2y/fTb3h4oLCRiPk7KWHhDzSy0cxwtDE9Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nK5MzAuxnrLLTf1gFEuoiVLFsvF02S3WxqXWXquN7Zw=;
 b=ZXTc0BLRqHcWQONi8cQQeZco8qn1HItwerZHI94FCZc22UaclmwrwdKFzyj3rcskYr
 +BKY0Lo+4pRN4eWa7vriOrWVQHrDK7ekfnAsdsSkB2+6rcTTk/3d1mnPkWGgyfsrubj7
 0F0m+Jo+3hR9/Ejy0o5B8VTZIsMvlCNWrVc850Bc5oiL3R7NorrCMAIxnI+XBQF6iVLa
 vCv1y2f/JuNmOt2zQPWd7yMHFt/rfqZPEkIRieIuLtz4w/zdS1QeCUQ412f6KZlO7vn0
 ASvKRrEhnzKYjC76W5K92NFpodv/i7jhC1wUQNJemP2HCLgk/XKX0t/dJEOX/QZMnmUo
 WjbA==
X-Gm-Message-State: AOAM531yLF5FEQk6a/53ayhVFi5jW1vYEWBP79OCmifeshjUwvgu7CyW
 UR5q7LPtQXOzykiSMQr5bOKMFb4rlYRkxks5ZofQaw==
X-Google-Smtp-Source: ABdhPJwOl8wWWEJIksoM3K8/EzRJs6oF3zTk24wYXwhjl29tUYjlMWaOxLC3GKFiBqP0wzf6UBSOc0KsyP4t1xltRDg=
X-Received: by 2002:a67:2602:: with SMTP id m2mr8867667vsm.1.1596020296942;
 Wed, 29 Jul 2020 03:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-5-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1596012277-8448-5-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 29 Jul 2020 18:58:06 +0800
Message-ID: <CANMq1KCG1xUan5-=DBZewvTqmUH=p7=nxy0Va=pdYBhAfYhhjQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: mediatek: Add configurable enable control to
 mtk_pll_data
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_065819_380245_3A960458 
X-CRM114-Status: GOOD (  24.52  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 29, 2020 at 4:44 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> In all MediaTek PLL design, bit0 of CON0 register is always
> the enable bit.
> However, there's a special case of usbpll on MT8192.
> The enable bit of usbpll is moved to bit2 of other register.
> Add configurable en_reg and pll_en_bit for enable control or
> default 0 where pll data are static variables.
> Hence, CON0_BASE_EN could also be removed.
> And there might have another special case on other chips,
> the enable bit is still on CON0 register but not at bit0.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  drivers/clk/mediatek/clk-pll.c | 18 +++++++++++-------
>  2 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index c3d6756..810eb97 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -233,6 +233,8 @@ struct mtk_pll_data {
>         uint32_t pcw_chg_reg;
>         const struct mtk_pll_div_table *div_table;
>         const char *parent_name;
> +       uint32_t en_reg;
> +       uint8_t pll_en_bit;
>  };
>
>  void mtk_clk_register_plls(struct device_node *node,
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 3c79e1a..1434e99 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -16,7 +16,6 @@
>  #define REG_CON0               0
>  #define REG_CON1               4
>
> -#define CON0_BASE_EN           BIT(0)
>  #define CON0_PWR_ON            BIT(0)
>  #define CON0_ISO_EN            BIT(1)
>  #define PCW_CHG_MASK           BIT(31)
> @@ -44,6 +43,7 @@ struct mtk_clk_pll {
>         void __iomem    *tuner_en_addr;
>         void __iomem    *pcw_addr;
>         void __iomem    *pcw_chg_addr;
> +       void __iomem    *en_addr;
>         const struct mtk_pll_data *data;
>  };
>
> @@ -56,7 +56,7 @@ static int mtk_pll_is_prepared(struct clk_hw *hw)
>  {
>         struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>
> -       return (readl(pll->base_addr + REG_CON0) & CON0_BASE_EN) != 0;
> +       return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) != 0;
>  }
>
>  static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
> @@ -247,8 +247,8 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>         writel(r, pll->pwr_addr);
>         udelay(1);
>
> -       r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
> -       writel(r, pll->base_addr + REG_CON0);
> +       r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
> +       writel(r, pll->en_addr);
>
>         r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;
>         writel(r, pll->base_addr + REG_CON0);
> @@ -283,9 +283,9 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>         r &= ~pll->data->en_mask;
>         writel(r, pll->base_addr + REG_CON0);
>
> -       r = readl(pll->base_addr + REG_CON0);
> -       r &= ~CON0_BASE_EN;
> -       writel(r, pll->base_addr + REG_CON0);
> +       r = readl(pll->en_addr);
> +       r &= ~BIT(pll->data->pll_en_bit);

1 line, but that'll come naturally from the change I requested in the
previous patch.

> +       writel(r, pll->en_addr);
>
>         r = readl(pll->pwr_addr) | CON0_ISO_EN;
>         writel(r, pll->pwr_addr);
> @@ -327,6 +327,10 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
>                 pll->tuner_addr = base + data->tuner_reg;
>         if (data->tuner_en_reg)
>                 pll->tuner_en_addr = base + data->tuner_en_reg;
> +       if (data->en_reg)
> +               pll->en_addr = base + data->en_reg;
> +       else
> +               pll->en_addr = pll->base_addr + REG_CON0;

Don't you need to set pll->data->pll_en_bit to CON0_BASE_EN here?
(which probably means that you need to add a pll->en_bit field to
struct mtk_clk_pll)

>         pll->hw.init = &init;
>         pll->data = data;
>
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
