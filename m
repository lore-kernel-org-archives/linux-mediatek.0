Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12081C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 03:55:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC30022210
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 03:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fOxLutEn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rm8kt3Vp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC30022210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gXr8SbPefhd5YnJFWoZuB1hxzOqQr4o72HI7VFeis64=; b=fOxLutEnRbpuo8jMrxYeSp+6L
	cAmpxhTSesB9MMCCCAcPQQ5tNZ6SGB23/bVCUE+21o83Tf9yFtryw47DsNQdbwkhxPIfKaVWN2U+i
	5yTI8XnNnwY8FUvf7vlF/9RW0KHTQFCxPkJCuQz+MbKDVEF71ph62gzrLx+fF6KsCnahSmdbpIO2C
	k5425AzFSNoTgs9F33/C3Vxhn95O+bs2DQbLmgtF39uRpHuAmrrmqc43fI2vNH0qtVGnnVf78J2hP
	bZ3uqw1vSNxIX8lCHF5lql6wRZ/IL62zcjBVtT/EfE50wFEfRLDYUJZaLh1usgzEL2Ri1cGkpNmPg
	SoTv5IYzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfEYt-0001MW-5a; Wed, 18 Nov 2020 03:55:15 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfEYp-0001LH-Nj
 for linux-mediatek@lists.infradead.org; Wed, 18 Nov 2020 03:55:12 +0000
Received: by mail-pl1-x642.google.com with SMTP id 18so250131pli.13
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2020 19:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NF71P8SL20XuWGpve1Ss/ZaRaSfeH/zBmcqp/hYzjCw=;
 b=Rm8kt3VpI/aWCK8QuAXnBlKQgakkQESmJbYWI+EwQjN3Yhd6FbRj4gxVQKNgjbSmbZ
 aAQ47/Wg+l6lGrGnnOQJJ5+KfsqV0N6Ud4/ecG9Xz1eQi65hzeq14Ct5S68NUsWhGwJX
 3LPYA5gpgSwVClpU/N+5JpD4zCu629F+y6UQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NF71P8SL20XuWGpve1Ss/ZaRaSfeH/zBmcqp/hYzjCw=;
 b=LxioSYB7nwIyykfRtF0katLnVEVhnm9aaT5qom1IMgg/SgcbHuqR45r82zCNUQga2m
 QeS++iZcSXnAGvY102eiUb51uojad6QuyQWgKA4Xb7vso3yPtJmF4Vk+tOuNJze4qmsB
 HJWUe4SfyXi03ktPD/pjskQaYzL8+XaXtShHMRUxaZOaaCQ4wBvJ/th9EKE+hlbpRYJR
 HOx8NPi9a79vl/FcWjFEhHKBmZqaAQvW89UUDRo8J8O3LQw64aQQHhaNpdg+XTtWnU4L
 G8v3ufDDMrgMW12xE58dhvitOEidE8TNd9q1s+fsBJyD60+08yjRR77AO8+Pa98PyNfT
 GCTA==
X-Gm-Message-State: AOAM530egsNlifYdaXbI7VC9WW00bYryegOStWos5oCtcDMoaj1K8QIj
 XhWSLfH6iix0qll/BYV5888/nA==
X-Google-Smtp-Source: ABdhPJwrYH4odcpeAEWrzKDSnTEwhm/OO88XM2k1g4IF7+ohxJxegV50JUMuGHCnQDzpm2sHh6Ng3g==
X-Received: by 2002:a17:902:a705:b029:d6:e486:ef6 with SMTP id
 w5-20020a170902a705b02900d6e4860ef6mr2890732plq.0.1605671706956; 
 Tue, 17 Nov 2020 19:55:06 -0800 (PST)
Received: from chromium.org ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id 131sm7798031pfw.117.2020.11.17.19.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 19:55:06 -0800 (PST)
Date: Wed, 18 Nov 2020 11:55:02 +0800
From: Ikjoon Jang <ikjn@chromium.org>
To: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v5 07/24] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
Message-ID: <20201118035502.GB1049148@chromium.org>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
 <1604887429-29445-8-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604887429-29445-8-git-send-email-weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_225511_815131_7E6D9C5E 
X-CRM114-Status: GOOD (  24.18  )
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
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 09, 2020 at 10:03:32AM +0800, Weiyi Lu wrote:
> In fact, the en_mask is a combination of divider enable mask
> and pll enable bit(bit0).
> Before this patch, we enabled both divider mask and bit0 in prepare(),
> but only cleared the bit0 in unprepare().
> In the future, we hope en_mask will only be used as divider enable mask.
> The enable register(CON0) will be set in 2 steps:
> first is divider mask, and then bit0 during prepare(), and vice versa.
> But considering backward compatibility, at this stage we allow en_mask
> to be a combination or a pure divider enable mask.
> And then we will make en_mask a pure divider enable mask in another
> following patch series.

I have a question on this: Are there any possible problems on controlling
divider_en and bit0 at the same time? Or is this only for cleanups?

If mtk_pll_data::en_mask is not allowed to control with bit0 together,
I guess register_pll() also needs to check en_mask::bit0 is cleared?

> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index f440f2cd..11ed5d1 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -238,6 +238,7 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>  {
>  	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>  	u32 r;
> +	u32 div_en_mask;
>  
>  	r = readl(pll->pwr_addr) | CON0_PWR_ON;
>  	writel(r, pll->pwr_addr);
> @@ -247,10 +248,15 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>  	writel(r, pll->pwr_addr);
>  	udelay(1);
>  
> -	r = readl(pll->base_addr + REG_CON0);
> -	r |= pll->data->en_mask;
> +	r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
>  	writel(r, pll->base_addr + REG_CON0);
>  
> +	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
> +	if (div_en_mask) {
> +		r = readl(pll->base_addr + REG_CON0) | div_en_mask;
> +		writel(r, pll->base_addr + REG_CON0);
> +	}
> +
>  	__mtk_pll_tuner_enable(pll);
>  
>  	udelay(20);
> @@ -268,6 +274,7 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>  {
>  	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>  	u32 r;
> +	u32 div_en_mask;
>  
>  	if (pll->data->flags & HAVE_RST_BAR) {
>  		r = readl(pll->base_addr + REG_CON0);
> @@ -277,8 +284,13 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>  
>  	__mtk_pll_tuner_disable(pll);
>  
> -	r = readl(pll->base_addr + REG_CON0);
> -	r &= ~CON0_BASE_EN;
> +	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
> +	if (div_en_mask) {
> +		r = readl(pll->base_addr + REG_CON0) & ~div_en_mask;
> +		writel(r, pll->base_addr + REG_CON0);
> +	}
> +
> +	r = readl(pll->base_addr + REG_CON0) & ~CON0_BASE_EN;
>  	writel(r, pll->base_addr + REG_CON0);
>  
>  	r = readl(pll->pwr_addr) | CON0_ISO_EN;
> -- 
> 1.8.1.1.dirty
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
