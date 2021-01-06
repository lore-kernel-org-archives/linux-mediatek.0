Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439DDC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:38:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94DC23102
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E94DC23102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cnHJ1TcTehuU/H/ry1WSQbmeq29V6QvuybIe0FpItAc=; b=yuX2DPpHla1zBXhaIFLLwvjZx
	wjt6zYZ1x/dXbBLkK+YH35TEzCwE9FId4ZzNmLWKH52vLwrVMdT6makOSyXwoYAHFNsy1R+s5p+Nn
	Y7boD8BPm6pxORQCtY2hXip/h0hz1u4Aoi70iH1khjHC9FLHoZCLSKW6ogaAyW1hhFIFXUPqawpMs
	MvGNn3Q2dqFpZ3cLkLCpyZUw9bB2QXGormNUTIrqeSLoEjTLBD+r4hLivatHDg2+aYldwiMXleDWs
	Bvw/DUHpa0F6g200DD0najDmjYrGSIj99sAQW1rs9KKH4dwcJn+l+k03VKHNqX9yrbnIXq/B8raRc
	mm6nwP11w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx6Cm-0002Kf-Q3; Wed, 06 Jan 2021 10:38:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx6Ci-0002Gg-5d
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 10:38:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id t6so1360058plq.1
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 02:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ykF1Rb3QiEQMUMU6PE5g0toJSaxdQKEkjuP56ge2Po=;
 b=BKCkklBaIPc8Lsq0qg//XXFPAcTBHLOMOq5fFdPi6701/UvxlXpzzg5360reHNpmsb
 WnYtluMJQYiVkLoyzpN8CdR+K8VPmDiPBoCCIQL5iTvg404KKXqetpnIhpQg1uiGMmni
 aEtifk6yMcrayomUtYiuPH0RQduWPK+XRxghg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ykF1Rb3QiEQMUMU6PE5g0toJSaxdQKEkjuP56ge2Po=;
 b=miDI95fxKYeCTOwQorJE0M1olt84ejLMLZP5OX0SpM08X4FTzdpLV9TqnrGGIKEyPo
 9/iKSCGzRmPm3qy5lj8Did3CxRJ+gGeVZ6rJhl1Sq7ucVn9NzovrWAIk9KZTE03YF7hh
 AUQshOtjslXqYFNTlc7ZhkOQE08FLogAFD2b0+iJBzq6R3wLDFtk1G+nwlJu67rMk95x
 L+CaWsmIK76P3j73MXJbiN/jKuYSEFXb5Kl9ySEqnMwla0faftegTGVSPPownEJUZAiu
 vnehs7LwruD0rl+4AH3riRJ3ZGrYQCEcuz2IJSHg5gC+ami60+4q3hfrlYOIjenh9GMa
 WOeA==
X-Gm-Message-State: AOAM533HkeEYVX3E6tQS/GAig7Kn5BdJszKrlccJiVkAfCAh7ZhMmQ1Q
 7rm7BeavUPgSYIQqmQ4Cn0gQrUOB6ArNwxeFf5zftg==
X-Google-Smtp-Source: ABdhPJybAwz8Y0ZUFyv2j/otm9dwuw+OQd5TePRL99+ggjPgKnM/2LxZPzg3tJMbkaOANmzDOWF7PLPWmi6k0KNWVtE=
X-Received: by 2002:a17:90a:902:: with SMTP id
 n2mr3678005pjn.126.1609929489894; 
 Wed, 06 Jan 2021 02:38:09 -0800 (PST)
MIME-Version: 1.0
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-9-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1608642587-15634-9-git-send-email-weiyi.lu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 6 Jan 2021 18:37:59 +0800
Message-ID: <CAATdQgBvd_izVUZ7NiDeHzZsQ4rL0=3LZ04diO7HQXop5rxYsw@mail.gmail.com>
Subject: Re: [PATCH v6 08/22] clk: mediatek: Add configurable enable control
 to mtk_pll_data
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_053812_295016_6671D23C 
X-CRM114-Status: GOOD (  24.12  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 22, 2020 at 9:11 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
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

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  drivers/clk/mediatek/clk-pll.c | 15 ++++++++++-----
>  2 files changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index c3d6756..c580663 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -233,6 +233,8 @@ struct mtk_pll_data {
>         uint32_t pcw_chg_reg;
>         const struct mtk_pll_div_table *div_table;
>         const char *parent_name;
> +       uint32_t en_reg;
> +       uint8_t pll_en_bit; /* Assume 0, indicates BIT(0) by default */
>  };
>
>  void mtk_clk_register_plls(struct device_node *node,
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 11ed5d1..7fb001a 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -44,6 +44,7 @@ struct mtk_clk_pll {
>         void __iomem    *tuner_en_addr;
>         void __iomem    *pcw_addr;
>         void __iomem    *pcw_chg_addr;
> +       void __iomem    *en_addr;
>         const struct mtk_pll_data *data;
>  };
>
> @@ -56,7 +57,7 @@ static int mtk_pll_is_prepared(struct clk_hw *hw)
>  {
>         struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>
> -       return (readl(pll->base_addr + REG_CON0) & CON0_BASE_EN) != 0;
> +       return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) != 0;
>  }
>
>  static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
> @@ -248,8 +249,8 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>         writel(r, pll->pwr_addr);
>         udelay(1);
>
> -       r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
> -       writel(r, pll->base_addr + REG_CON0);
> +       r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
> +       writel(r, pll->en_addr);
>
>         div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
>         if (div_en_mask) {
> @@ -290,8 +291,8 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>                 writel(r, pll->base_addr + REG_CON0);
>         }
>
> -       r = readl(pll->base_addr + REG_CON0) & ~CON0_BASE_EN;
> -       writel(r, pll->base_addr + REG_CON0);
> +       r = readl(pll->en_addr) & ~BIT(pll->data->pll_en_bit);
> +       writel(r, pll->en_addr);
>
>         r = readl(pll->pwr_addr) | CON0_ISO_EN;
>         writel(r, pll->pwr_addr);
> @@ -333,6 +334,10 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
>                 pll->tuner_addr = base + data->tuner_reg;
>         if (data->tuner_en_reg)
>                 pll->tuner_en_addr = base + data->tuner_en_reg;
> +       if (data->en_reg)
> +               pll->en_addr = base + data->en_reg;
> +       else
> +               pll->en_addr = pll->base_addr + REG_CON0;
>         pll->hw.init = &init;
>         pll->data = data;
>
> --
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
