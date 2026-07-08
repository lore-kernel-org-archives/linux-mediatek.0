Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4372EC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKgh5ApTuCOuav59S8TO2YqC8DCsibHGOqh1KF7QsrM=; b=xqWmadbVs5/w/JaDgt2aKA3KF8
	1Ckze2EI2TBLGRLRjUi+ZIk3SR4c+aT88D6JLGr4hkH6c5ON1JWmqjlJ6HJSNyBZADzVzu+XHGo7V
	HZ+1SOgTu51gUwyrguzN9+KkuXSjNr+XdBMqBD/ljKlBZbXtKlvlDJL+gi88d7g9gqdmpxFFfAiZL
	pDlmzvifyncFjwBvWd7Ag7h+fUHocd4EuaXDAQlamr6Jpq08TOj2m5qDh9i9GX/mLgMfNW6Z7ctok
	D+KyhgJBQtGWlL6fDBvEuope1LEjkZo29ECA3TXzbO5AbCzMUfIJAIbCoBn+2XLm7eMmOjk+mkkxN
	d9MKKGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVU3-000000001fC-3NXB;
	Wed, 08 Jul 2026 16:50:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVU1-000000001eO-2aCf
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 16:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783529448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKgh5ApTuCOuav59S8TO2YqC8DCsibHGOqh1KF7QsrM=;
	b=A9LKUhRVP6rfihWpJdXlRuMwjnRDNVmXlOXUdkfzk1mPjjVNmNilxaZvXws9zFfv4eKckS
	lL0fnj2LY+/0yBUP/K3aalWX3ecae+kWWt+/eKo6gDS9jxuohVfnm3zQuIaqAtmiTZVrmS
	TS3OtLpv+++17bSZvpGkCR+XtyH1BPM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-uQmPetWUOQeWiCqtCcY2bg-1; Wed, 08 Jul 2026 12:50:45 -0400
X-MC-Unique: uQmPetWUOQeWiCqtCcY2bg-1
X-Mimecast-MFC-AGG-ID: uQmPetWUOQeWiCqtCcY2bg_1783529444
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7ebbaaf1679so28822247b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 09:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529444; x=1784134244;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKgh5ApTuCOuav59S8TO2YqC8DCsibHGOqh1KF7QsrM=;
        b=ez2FgNo2gThemkk2doklbZ+l3DFcAqkD9Wrr/XP5V9jPzYJ9VJcxuvxJTUU68eFElQ
         MhoPWNYKG5uvusasB5olS/O/8FAb7YTluPketK2B0pb0dG+E3KHKFCoveYurlVvjeQxY
         EO29+b6yknE8CAOCgFW4c7BiwhfahtsZZUg66oB6Z0JCX6gcaNc/Sc2t6LEkawLqZnOO
         N2nAKFFKreJXQRFChGeK8G2McOUdxAr8Hh/gzvTIp4viYFM/Yc3/GDP2GelPuniu+Uhy
         MD9pHhjDtMWy6MI9e0ea63nbo0UBgQzLQIvY1nrfqc2dUD69FvsXIxPq+0oRLF7xqU/R
         l3Kg==
X-Forwarded-Encrypted: i=1; AHgh+RotkFfPTJ7zboGnc7lCDIoIvhr9+qE0BBpwWJGAT7q7nCXLfWN7Hs/HvN/cfqguSf2sfSZgZL44t03sAokaYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHiQfjmUn8/p2gDTu/7CUM5kJrCobYwVQWCwOFCv2wobgMoR4z
	zXoilw5h9GZDTsVVwVJGG2LNfMJyL+UAirBTjTGRyIG1jhJHSDSO6pIbkPy5EozBB5XtevSzk3W
	u6VNR4Hl6h++8eJ9YpWCtQP69slILR8nOZISPtksdeImln2Jg684EsNF75K2AX7Y6U2+v03dCBQ
	==
X-Gm-Gg: AfdE7cnFpdblM3DxN4tEQ/xxo7uJM0D8uKFCETdLmtOLU8ddwGQ2l/+Njv6FfRXDrLY
	Ktd1wiLRYTrE5HhZu++7Q8qQ+E9IJ8iwvZg1zZeStZZSs1CxgNmZ7czthbHoULyvAPl2beuhkc1
	1+vF7nD4xmlhbaNCSAe8y7t+YYq6QwlE/H7l4nIzwvqT1t+y4HQSpHY7AFXnLBhRq4TncpvpUoj
	bA6FVOy2LFes5/YVgtQ5QuF2isko7rmulPzLh9YOZUB2tjqoAbRdwjRMJth3bO2yQrFo6lU3Jat
	7cs9qEXz+NKpw8/DdV7wqNZYQ7Qt1y2eH2Tc8saZvDq9H85L+8ZbOR1lIyYZZmlj79D+vS26BCf
	PTW2N/jqp+12mH7jaRvFLIu0r101gZAfNEe05CrvGHMrzZA==
X-Received: by 2002:a05:690c:b03:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81dbf597344mr25866637b3.17.1783529444329;
        Wed, 08 Jul 2026 09:50:44 -0700 (PDT)
X-Received: by 2002:a05:690c:b03:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81dbf597344mr25866277b3.17.1783529443859;
        Wed, 08 Jul 2026 09:50:43 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8143dfebd55sm86860117b3.0.2026.07.08.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:50:43 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:50:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: pllfh: Fix IO remapping leak in
 register_pllfhs error path
Message-ID: <ak5_4aTPwWPdczms@redhat.com>
References: <20260708-clk-mediatek-pllfh-fix-v1-1-2cfc2d6b258e@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260708-clk-mediatek-pllfh-fix-v1-1-2cfc2d6b258e@collabora.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pGXBEe2x6s7Xb8TyZAGaji2RMVcnGsJd-kTPhDqz3hw_1783529444
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_095049_725665_AABB2898 
X-CRM114-Status: GOOD (  33.69  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Louis-Alexis,

Thanks for the patch.

On Wed, Jul 08, 2026 at 11:18:59AM +0200, Louis-Alexis Eyraud wrote:
> When mtk_clk_register_pllfhs function fails to register a PLL, it
> unregisters all PLLs and cleans up itself in its error path before
> returning, so the function callers don't need to do it.
> 
> But contrary to mtk_clk_unregister_pllfhs function, that does almost
> the same sequence, it does not free the IO memory mapped on fhctl node,
> leading to a leak.
> 
> Fix this leak by factorizing the cleanup sequence in a new private
> function and use it both mtk_clk_register_pllfhs and
> mtk_clk_unregister_pllfhs functions.
> 
> Also, change the loop index start value to avoid the -1 operation on
> index at each loop.
> 
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> This patch aims to fix a issue, detected by Sashiko
> during another series review ([1]), regarding the use of 
> mtk_clk_register_pllfhs function.
> 
> The patch is based on linux-next tree (tag: next-20260707).
> 
> [1]: https://sashiko.dev/#/patchset/20260701-mt8189-clocks-system-base-v1-0-2b048feea50a%40collabora.com?part=6
> ---
>  drivers/clk/mediatek/clk-pllfh.c | 87 ++++++++++++++++++----------------------
>  1 file changed, 39 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
> index aa95cd9197b3..7463aa35d7e3 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -197,6 +197,43 @@ static void mtk_clk_unregister_pllfh(struct clk_hw *hw)
>  	kfree(fh);
>  }
>  
> +static void mtk_clk_cleanup_pllfhs(const struct mtk_pll_data *plls, int num_plls,
> +				   struct mtk_pllfh_data *pllfhs, int num_fhs,
> +				   struct clk_hw_onecell_data *clk_data)
> +{
> +	void __iomem *base = NULL, *fhctl_base = NULL;
> +	int i;
> +
> +	for (i = num_plls - 1; i > 0; i--) {

It looks like this should be i >= 0

> +		const struct mtk_pll_data *pll = &plls[i];
> +		struct mtk_pllfh_data *pllfh;
> +		bool use_fhctl;
> +
> +		if (IS_ERR_OR_NULL(clk_data->hws[pll->id]))
> +			continue;
> +
> +		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
> +		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
> +
> +		if (use_fhctl) {
> +			fhctl_base = pllfh->state.base;
> +			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
> +		} else {
> +			base = mtk_clk_pll_get_base(clk_data->hws[pll->id],
> +						    pll);
> +			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
> +		}
> +
> +		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
> +	}
> +
> +	if (fhctl_base)
> +		iounmap(fhctl_base);
> +
> +	iounmap(base);

When use_fhctl is enabled for all PLLs, base will be NULL.

Brian

> +}
> +
> +
>  int mtk_clk_register_pllfhs(struct device *dev,
>  			    const struct mtk_pll_data *plls, int num_plls,
>  			    struct mtk_pllfh_data *pllfhs, int num_fhs,
> @@ -238,24 +275,7 @@ int mtk_clk_register_pllfhs(struct device *dev,
>  	return 0;
>  
>  err:
> -	while (--i >= 0) {
> -		const struct mtk_pll_data *pll = &plls[i];
> -		struct mtk_pllfh_data *pllfh;
> -		bool use_fhctl;
> -
> -		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
> -		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
> -
> -		if (use_fhctl)
> -			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
> -		else
> -			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
> -
> -		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
> -	}
> -
> -	iounmap(base);
> -
> +	mtk_clk_cleanup_pllfhs(plls, i, pllfhs, num_fhs, clk_data);
>  	return PTR_ERR(hw);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_pllfhs);
> @@ -264,38 +284,9 @@ void mtk_clk_unregister_pllfhs(const struct mtk_pll_data *plls, int num_plls,
>  			       struct mtk_pllfh_data *pllfhs, int num_fhs,
>  			       struct clk_hw_onecell_data *clk_data)
>  {
> -	void __iomem *base = NULL, *fhctl_base = NULL;
> -	int i;
> -
>  	if (!clk_data)
>  		return;
>  
> -	for (i = num_plls; i > 0; i--) {
> -		const struct mtk_pll_data *pll = &plls[i - 1];
> -		struct mtk_pllfh_data *pllfh;
> -		bool use_fhctl;
> -
> -		if (IS_ERR_OR_NULL(clk_data->hws[pll->id]))
> -			continue;
> -
> -		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
> -		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
> -
> -		if (use_fhctl) {
> -			fhctl_base = pllfh->state.base;
> -			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
> -		} else {
> -			base = mtk_clk_pll_get_base(clk_data->hws[pll->id],
> -						    pll);
> -			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
> -		}
> -
> -		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
> -	}
> -
> -	if (fhctl_base)
> -		iounmap(fhctl_base);
> -
> -	iounmap(base);
> +	mtk_clk_cleanup_pllfhs(plls, num_plls, pllfhs, num_fhs, clk_data);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_pllfhs);
> 
> ---
> base-commit: b3a87fbe738f19cbe19411cf749f3d8c09c04de4
> change-id: 20260708-clk-mediatek-pllfh-fix-7e9ca35989e2
> 
> Best regards,
> -- 
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> 


