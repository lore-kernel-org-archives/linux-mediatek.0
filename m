Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6693EC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQs36gcAEpaGcWdvwnSQ6VOzYegdEqT0+acCi5JjEPE=; b=Q4ZsFhHTpvfdl6/pB5Jxsce/ih
	LD0vd1nITwCk/ixfcNLTU9Fe5Pd2xgbm6G8jNLJF8WOIiEHJGP87F3l1SNi7TjDWCi8cjXgFTKO94
	tgR+ks687XW0kpJ6aEaHzYM9+TNClHa0aO4f3f5ZCKPjEEq2bVJU34iDSsJp+JDrY48Ot0ePzwc1g
	cZI3ziuyOcr6a3zH4DSqHq4hdLezmedcz4q/KD6kuZeAsjqKXbGpC8yI0xC8C5Bvacjh8yGJfMXZe
	ppOJQ8xkqTiptCa5mPCNkPWpgtjACEXLpvsDUuEPVTRNArtYI013vpC7TQOQn9czyPBzEwy4neJhS
	mXHXmf8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0Dd-00AnBo-1Q;
	Wed, 03 Jan 2024 12:19:33 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0Da-00AnB3-0h;
	Wed, 03 Jan 2024 12:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704284368;
	bh=sXvCTJMiMZYRpZ56qv2vfroblI96aeB5QJhYBTGQ51s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JQ2uUbfxeiEBF2kzZjHIHn9Tdpp3LgHNaU6HfR0+Ta1mDvIV09iUJyfCqgy3OBVYp
	 YOqMmMCP1NvVqwgSdrUALT2FXZ4PVcObau2maRNTgYKjl8b+aCUjv+7VBLX2KlyMeB
	 KpVAgw+uaCqls572liiibW+OaX3hzfqqn2XGBhfs+zEqNrHos/KSU+RkY4GpBzrHXl
	 cDYMyIrUza28IlH5XPy1XtMX6EUu2L6apf9/Az+zrQEPn1Jewg6oRuSvKq5Pyi6jSy
	 SUqO3O2GjG0l7TgZgCmY96PkGvKZQ1s9hakqYJz5NfC2zybaoMKzwuGA6H8Fb4LXua
	 qLtGS69h25y/A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 451A5378104C;
	Wed,  3 Jan 2024 12:19:27 +0000 (UTC)
Message-ID: <eed88b36-ae56-40d3-8588-0d5d75da71a6@collabora.com>
Date: Wed, 3 Jan 2024 13:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: mediatek: Introduce need_pm_runtime to
 mtk_clk_desc
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@collabora.com>
References: <20240102081402.1226795-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240102081402.1226795-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_041930_404775_E0258A77 
X-CRM114-Status: GOOD (  22.49  )
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

Il 02/01/24 09:12, Pin-yen Lin ha scritto:
> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
> this clock needs a runtime PM get on the clock controller during the
> probing stage.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Hello Pin-yen,

We have experienced something similar, but it was really hard to reproduce after
some changes.

In an effort to try to solve this issue (but again, reproducing is really hard),
Eugen has sent a commit in the hope that someone else found a way to easily
reproduce. Please look at [1].

I'm also adding Eugen to the Cc's of this email.

Cheers,
Angelo

[1]: 
https://patchwork.kernel.org/project/linux-pm/patch/20231225133615.78993-1-eugen.hristev@collabora.com/

> ---
> 
> Changes in v2:
> - Fix the order of error handling
> - Update the commit message and add a comment before the runtime PM call
> 
>   drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
>   drivers/clk/mediatek/clk-mtk.h |  2 ++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index 2e55368dc4d8..c31e535909c8 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -13,6 +13,7 @@
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/slab.h>
>   
>   #include "clk-mtk.h"
> @@ -494,6 +495,14 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>   			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
>   	}
>   
> +
> +	if (mcd->need_runtime_pm) {
> +		devm_pm_runtime_enable(&pdev->dev);
> +		r = pm_runtime_resume_and_get(&pdev->dev);
> +		if (r)
> +			return r;
> +	}
> +
>   	/* Calculate how many clk_hw_onecell_data entries to allocate */
>   	num_clks = mcd->num_clks + mcd->num_composite_clks;
>   	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
> @@ -574,6 +583,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>   			goto unregister_clks;
>   	}
>   
> +	if (mcd->need_runtime_pm)
> +		pm_runtime_put(&pdev->dev);
> +
>   	return r;
>   
>   unregister_clks:
> @@ -604,6 +616,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>   free_base:
>   	if (mcd->shared_io && base)
>   		iounmap(base);
> +
> +	if (mcd->need_runtime_pm)
> +		pm_runtime_put(&pdev->dev);
>   	return r;
>   }
>   
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 22096501a60a..c17fe1c2d732 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
>   
>   	int (*clk_notifier_func)(struct device *dev, struct clk *clk);
>   	unsigned int mfg_clk_idx;
> +
> +	bool need_runtime_pm;
>   };
>   
>   int mtk_clk_pdev_probe(struct platform_device *pdev);




