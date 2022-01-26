Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F471C63682
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 08:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YUq5cC2+3SrXn1aMCYLA+aUgO3IRxAk8ZNTMRIQy1o=; b=VIT6QAHke9+++0
	w1mJINZDTT7lAJnGdzQgJo39jUdvhrA2WcYd31eJtZXxXmbLOAsDzTm8Ru1R19FbenOQzrbeLawBQ
	5N1KpriGQBJlKljmU+VK2qjeRWzFmsYx6jB5l5hASt13W8RNAUuua5fCwj+TGz8YbOSjVMDMf1YaG
	hFw/X8Eorb48Rhsddcf2guuhG3cvmXwdEVVdg0Qt82Kv0ZCiXXNcbxi4mokWc4FCnTyrGuA7Qa8+1
	3zuMZwjQPdR36Gdj0+dkoz2f/LExwFU7WaJ/uPPgfVj4rtnqz9jlvRlC0QXEEIvr3NN/IrWWgjwoq
	BHDe4cYkgGZDnqamPFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCdyB-00Amrt-8i; Wed, 26 Jan 2022 08:47:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCdxz-00AmqK-Jb; Wed, 26 Jan 2022 08:47:49 +0000
X-UUID: b766697c48ef40beb5ac9fdb30eb26ca-20220126
X-UUID: b766697c48ef40beb5ac9fdb30eb26ca-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1253789268; Wed, 26 Jan 2022 01:47:45 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 00:37:42 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 16:37:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 16:37:41 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 29/31] clk: mediatek: mt8195: Implement error handling in
 probe functions
Date: Wed, 26 Jan 2022 16:37:41 +0800
Message-ID: <20220126083741.18563-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-30-wenst@chromium.org>
References: <20220122091731.283592-30-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_004747_681743_5702C747 
X-CRM114-Status: GOOD (  19.62  )
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

> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so all drivers did not do proper cleanup in
> their error paths.
> 
> Now that the library does have APIs to unregister clks, use them
> in the error path of the probe functions for the mt8195 clk drivers
> to do proper cleanup.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 13 ++++--
>  drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 11 ++++-
>  drivers/clk/mediatek/clk-mt8195-topckgen.c   | 49 +++++++++++++++-----
>  drivers/clk/mediatek/clk-mt8195-vdo0.c       |  4 +-
>  drivers/clk/mediatek/clk-mt8195-vdo1.c       |  4 +-
>  5 files changed, 63 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> index 5b1b7dc447eb..af8d80f25f30 100644
> --- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> @@ -120,17 +120,24 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
>  	if (!clk_data)
>  		return -ENOMEM;
>  
> -	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> -	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
> +	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
>  	if (r)
>  		goto free_apmixed_data;
>  
> +	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
> +	if (r)
> +		goto unregister_plls;
> +
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>  	if (r)
> -		goto free_apmixed_data;
> +		goto unregister_gates;
>  
>  	return r;
>  
> +unregister_gates:
> +	mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
> +unregister_plls:
> +	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
>  free_apmixed_data:
>  	mtk_free_clk_data(clk_data);
>  	return r;
> diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
> index db449ff877d7..1fff6f3d2dc7 100644
> --- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
> +++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
> @@ -66,13 +66,20 @@ static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
>  	if (!clk_data)
>  		return -ENOMEM;
>  
> -	mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
>  	if (r)
>  		goto free_apusys_pll_data;
>  
> +	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	if (r)
> +		goto unregister_plls;
> +
> +	platform_set_drvdata(pdev, clk_data);
> +
>  	return r;
>  
> +unregister_plls:
> +	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
>  free_apusys_pll_data:
>  	mtk_free_clk_data(clk_data);
>  	return r;
> diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> index 3e2aba9c40bb..3631f49a5e5a 100644
> --- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
> +++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> @@ -1239,25 +1239,52 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
>  		goto free_top_data;
>  	}
>  
> -	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
> -				    top_clk_data);
> -	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
> -	mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
> -			       &mt8195_clk_lock, top_clk_data);
> -	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
> -				    &mt8195_clk_lock, top_clk_data);
> -	mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
> -				    &mt8195_clk_lock, top_clk_data);
> -	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
> +	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
> +					top_clk_data);
>  	if (r)
>  		goto free_top_data;
>  
> +	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
> +	if (r)
> +		goto unregister_fixed_clks;
> +
> +	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
> +				   &mt8195_clk_lock, top_clk_data);
> +	if (r)
> +		goto unregister_factors;
> +
> +	r = mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
> +					&mt8195_clk_lock, top_clk_data);
> +	if (r)
> +		goto unregister_muxes;
> +
> +	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
> +					&mt8195_clk_lock, top_clk_data);
> +	if (r)
> +		goto unregister_composite_muxes;
> +
> +	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
> +	if (r)
> +		goto unregister_composite_divs;
> +
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
>  	if (r)
> -		goto free_top_data;
> +		goto unregister_gates;
>  
>  	return r;
>  
> +unregister_gates:
> +	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
> +unregister_composite_divs:
> +	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
> +unregister_composite_muxes:
> +	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
> +unregister_muxes:
> +	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
> +unregister_factors:
> +	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
> +unregister_fixed_clks:
> +	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
>  free_top_data:
>  	mtk_free_clk_data(top_clk_data);
>  	return r;
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
> index f7ff7618c714..af34eb564b1d 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
> @@ -105,10 +105,12 @@ static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>  	if (r)
> -		goto free_vdo0_data;
> +		goto unregister_gates;
>  
>  	return r;
>  
> +unregister_gates:
> +	mtk_clk_unregister_gates(vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
>  free_vdo0_data:
>  	mtk_free_clk_data(clk_data);
>  	return r;
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
> index 03df8eae8838..6b502bbc730c 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
> @@ -122,10 +122,12 @@ static int clk_mt8195_vdo1_probe(struct platform_device *pdev)
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>  	if (r)
> -		goto free_vdo1_data;
> +		goto unregister_gates;
>  
>  	return r;
>  
> +unregister_gates:
> +	mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
>  free_vdo1_data:
>  	mtk_free_clk_data(clk_data);
>  	return r;
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
