Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA65FC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BZFK1XtqSvSNazd1LQ0CL0w4JuW+TKw76ixJfKxBxw=; b=wjexyp1N4nJqNHMBpS8J4pTDkM
	4rOIZJU9ucq5l7NccnWN2jfAxjQI3RfbnESN8A2ItRy5oDFFEs3ifaOVWPD5k0Tg7vij9Co99akKr
	KFpzfNhiXsZ8wIvMpylRWsKWsc3IIvKfutOLL1mOyiOlb6XW+Zw2sWjQQeY6VjEZDGrlZ8UiCiqgk
	xCPsc2ilnBebjJUlQDjiX2gnWeb8HR/IovDzgVVyxX5iTNgjKOxpZ9FaEmn1wPftjpikQ+DeQIope
	NqU6VGgCzfYf4XFgSvVlE/IU8FTpe+EiqQDfk+KRyhXqI16xFLWwKTITdhzBpfmW2t7KxU6WIY2HN
	j6O4SOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4FK-009VgQ-CU; Wed, 04 Jan 2023 13:55:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD1q9-008itY-J3
	for linux-mediatek@lists.infradead.org; Wed, 04 Jan 2023 11:22:03 +0000
Received: by mail-ej1-x62f.google.com with SMTP id fy8so17771249ejc.13
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Jan 2023 03:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2BZFK1XtqSvSNazd1LQ0CL0w4JuW+TKw76ixJfKxBxw=;
        b=D4y6ujJrhUp5mtLkyIXKK6QsnxSPpgtp2jaKVZm71n7Zp/44nF9+6EzBtZ7cpaLFC6
         XQpOidJwPczJO0icZx5AaSK446dIzFYhP/mySwRcayjyQehY+ZXCNLy1iBFiyX7GSy5K
         GgApjnUCa8yHlAvfLvs1yOnLz3DNU5wNc7Bcdy0+bLzue51jXbws3pRZUsBs1KGzK5m0
         mgFuZwwCl1fth/vIIqEI5koHrA7lHKMaVJGXhs2dBEM9ph6b+gI81CA61XgdM0AHeMui
         IRY//i7ixgzBXRie2XbZ4xJUlQbBrey2mSw+k0nlIbuhJqt2tohyyFZXnXwvm/KPrr4A
         7chA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BZFK1XtqSvSNazd1LQ0CL0w4JuW+TKw76ixJfKxBxw=;
        b=aaRlDrAq+0tTLBwbiuPT7MPrHpdxylOvmDO1DDXmAoNjgF8nGMIGSnge/yb2rEU/wm
         ovt4HXYsfM8enni6NiivnyueBcKtpW2ZtwVzQfpX5AvaWlSt/slNwjDDPzKj+JWBES45
         OfOzpNDT9Xeuc1wHW6R0RE9o5NTOF7hx6hP9NN0wG3L8kx/NRwNtY86foI74QpNfsdbv
         rFhVXyWlR0HbpOA+4WfEXWncxCHx82S3VnSGnhwLlrGPrSgbxu3Mloq55NNMNbHe/+HV
         UMa8BlZIvKN2tAkw66bm4Zybc88cCDfVEHB14/7S8aUYatD1JRNyaLZf+ESKruPoK8Jm
         FGOQ==
X-Gm-Message-State: AFqh2krtqLkLQb5ogVFEEe5aHkIxsxyi/rZejyWXRTa4DZgrmLcwXCeo
	k/SxEBiEXeiCo2CsdiUrbAnLxA==
X-Google-Smtp-Source: AMrXdXuv+7PIVLUMmBdOXd5HetgMDw0bcTwbjm+KZvLng3jXTBr8JGR8nh0dMCF9lpxl28YuE9o9/A==
X-Received: by 2002:a17:906:eda7:b0:7c4:f402:9769 with SMTP id sa7-20020a170906eda700b007c4f4029769mr52241684ejb.76.1672831305960;
        Wed, 04 Jan 2023 03:21:45 -0800 (PST)
Received: from blmsp ([2001:4091:a245:805c:8713:84e4:2a9e:cbe8])
        by smtp.gmail.com with ESMTPSA id bx4-20020a170906a1c400b007c0e6d6bd10sm15134042ejb.132.2023.01.04.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:21:45 -0800 (PST)
Date: Wed, 4 Jan 2023 12:21:44 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	wenst@chromium.org, johnson.wang@mediatek.com,
	miles.chen@mediatek.com, fparent@baylibre.com,
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com,
	y.oudjana@protonmail.com, nfraprado@collabora.com,
	rex-bc.chen@mediatek.com, ryder.lee@kernel.org,
	daniel@makrotopia.org, jose.exposito89@gmail.com,
	yangyingliang@huawei.com, pablo.sun@mediatek.com,
	weiyi.lu@mediatek.com, ikjn@chromium.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 03/23] clk: mediatek: clk-gate: Propagate struct
 device with mtk_clk_register_gates()
Message-ID: <20230104112144.n2mx33xqavigxwa2@blmsp>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
 <20221223094259.87373-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221223094259.87373-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_032149_850320_108DAAFC 
X-CRM114-Status: GOOD (  29.42  )
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

Hi Angelo,

On Fri, Dec 23, 2022 at 10:42:39AM +0100, AngeloGioacchino Del Regno wrote:
> Commit e4c23e19aa2a ("clk: mediatek: Register clock gate with device")
> introduces a helper function for the sole purpose of propagating a
> struct device pointer to the clk API when registering the mtk-gate
> clocks to take advantage of Runtime PM when/where needed and where
> a power domain is defined in devicetree.
> 
> Function mtk_clk_register_gates() then becomes a wrapper around the
> new mtk_clk_register_gates_with_dev() function that will simply pass
> NULL as struct device: this is essential when registering drivers
> with CLK_OF_DECLARE instead of as a platform device, as there will
> be no struct device to pass... but we can as well simply have only
> one function that always takes such pointer as a param and pass NULL
> when unavoidable.
> 
> This commit removes the mtk_clk_register_gates() wrapper and renames
> mtk_clk_register_gates_with_dev() to the former and all of the calls
> to either of the two functions were fixed in all drivers in order to
> reflect this change.
> 
> Since a lot of MediaTek clock drivers are actually registering as a
> platform device, but were still registering the mtk-gate clocks
> without passing any struct device to the clock framework, they've
> been changed to pass a valid one now, as to make all those platforms
> able to use runtime power management where available.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

A few nitpicks, otherwise it looks good,

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

> ---
>  drivers/clk/mediatek/clk-gate.c              | 16 ++++------------
>  drivers/clk/mediatek/clk-gate.h              |  8 ++------
>  drivers/clk/mediatek/clk-mt2701-aud.c        |  2 +-
>  drivers/clk/mediatek/clk-mt2701-eth.c        |  2 +-
>  drivers/clk/mediatek/clk-mt2701-g3d.c        |  2 +-
>  drivers/clk/mediatek/clk-mt2701-hif.c        |  2 +-
>  drivers/clk/mediatek/clk-mt2701-mm.c         |  2 +-
>  drivers/clk/mediatek/clk-mt2701.c            |  6 +++---
>  drivers/clk/mediatek/clk-mt2712-mm.c         |  2 +-
>  drivers/clk/mediatek/clk-mt2712.c            |  6 +++---
>  drivers/clk/mediatek/clk-mt6765.c            |  6 +++---
>  drivers/clk/mediatek/clk-mt6779-mm.c         |  2 +-
>  drivers/clk/mediatek/clk-mt6779.c            |  4 ++--
>  drivers/clk/mediatek/clk-mt6795-infracfg.c   |  3 ++-
>  drivers/clk/mediatek/clk-mt6795-mm.c         |  3 ++-
>  drivers/clk/mediatek/clk-mt6795-pericfg.c    |  3 ++-
>  drivers/clk/mediatek/clk-mt6797-mm.c         |  2 +-
>  drivers/clk/mediatek/clk-mt6797.c            |  2 +-
>  drivers/clk/mediatek/clk-mt7622-aud.c        |  2 +-
>  drivers/clk/mediatek/clk-mt7622-eth.c        |  4 ++--
>  drivers/clk/mediatek/clk-mt7622-hif.c        |  4 ++--
>  drivers/clk/mediatek/clk-mt7622.c            |  9 +++++----
>  drivers/clk/mediatek/clk-mt7629-eth.c        |  5 +++--
>  drivers/clk/mediatek/clk-mt7629-hif.c        |  4 ++--
>  drivers/clk/mediatek/clk-mt7629.c            |  6 +++---
>  drivers/clk/mediatek/clk-mt7986-eth.c        |  6 +++---
>  drivers/clk/mediatek/clk-mt7986-infracfg.c   |  2 +-
>  drivers/clk/mediatek/clk-mt8135.c            |  4 ++--
>  drivers/clk/mediatek/clk-mt8167-aud.c        |  2 +-
>  drivers/clk/mediatek/clk-mt8167-img.c        |  2 +-
>  drivers/clk/mediatek/clk-mt8167-mfgcfg.c     |  2 +-
>  drivers/clk/mediatek/clk-mt8167-mm.c         |  2 +-
>  drivers/clk/mediatek/clk-mt8167-vdec.c       |  3 ++-
>  drivers/clk/mediatek/clk-mt8167.c            |  2 +-
>  drivers/clk/mediatek/clk-mt8173-mm.c         |  2 +-
>  drivers/clk/mediatek/clk-mt8173.c            | 12 ++++++------
>  drivers/clk/mediatek/clk-mt8183-audio.c      |  2 +-
>  drivers/clk/mediatek/clk-mt8183-mm.c         |  2 +-
>  drivers/clk/mediatek/clk-mt8183.c            |  8 ++++----
>  drivers/clk/mediatek/clk-mt8186-mm.c         |  3 ++-
>  drivers/clk/mediatek/clk-mt8192-aud.c        |  3 ++-
>  drivers/clk/mediatek/clk-mt8192-mm.c         |  3 ++-
>  drivers/clk/mediatek/clk-mt8192.c            | 12 ++++++------
>  drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  3 ++-
>  drivers/clk/mediatek/clk-mt8195-topckgen.c   |  3 ++-
>  drivers/clk/mediatek/clk-mt8195-vdo0.c       |  3 ++-
>  drivers/clk/mediatek/clk-mt8195-vdo1.c       |  3 ++-
>  drivers/clk/mediatek/clk-mt8365-mm.c         |  5 ++---
>  drivers/clk/mediatek/clk-mt8365.c            |  2 +-
>  drivers/clk/mediatek/clk-mt8516-aud.c        |  2 +-
>  drivers/clk/mediatek/clk-mt8516.c            |  2 +-
>  drivers/clk/mediatek/clk-mtk.c               |  4 ++--
>  52 files changed, 103 insertions(+), 103 deletions(-)
> 

[...]

> diff --git a/drivers/clk/mediatek/clk-mt7986-eth.c b/drivers/clk/mediatek/clk-mt7986-eth.c
> index 7868c0728e96..765df117afa6 100644
> --- a/drivers/clk/mediatek/clk-mt7986-eth.c
> +++ b/drivers/clk/mediatek/clk-mt7986-eth.c
> @@ -85,7 +85,7 @@ static void __init mtk_sgmiisys_0_init(struct device_node *node)
>  	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(sgmii0_clks));
>  
>  	mtk_clk_register_gates(node, sgmii0_clks, ARRAY_SIZE(sgmii0_clks),
> -			       clk_data);
> +			       clk_data, NULL);
>  
>  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
> @@ -103,7 +103,7 @@ static void __init mtk_sgmiisys_1_init(struct device_node *node)
>  	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(sgmii1_clks));
>  
>  	mtk_clk_register_gates(node, sgmii1_clks, ARRAY_SIZE(sgmii1_clks),
> -			       clk_data);
> +			       clk_data, NULL);
>  
>  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
> @@ -121,7 +121,7 @@ static void __init mtk_ethsys_init(struct device_node *node)
>  
>  	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(eth_clks));
>  
> -	mtk_clk_register_gates(node, eth_clks, ARRAY_SIZE(eth_clks), clk_data);
> +	mtk_clk_register_gates(node, eth_clks, ARRAY_SIZE(eth_clks), clk_data, NULL);

You kept within 80c nearly everywhere, but there are a few calls where
you added 'NULL' that go over the 80c now. Not sure if that was
intended?!

>  
>  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  

[...]

> diff --git a/drivers/clk/mediatek/clk-mt8183-mm.c b/drivers/clk/mediatek/clk-mt8183-mm.c
> index 11ecc6fb0065..f93043da26c0 100644
> --- a/drivers/clk/mediatek/clk-mt8183-mm.c
> +++ b/drivers/clk/mediatek/clk-mt8183-mm.c
> @@ -91,7 +91,7 @@ static int clk_mt8183_mm_probe(struct platform_device *pdev)
>  	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
>  
>  	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> -			clk_data);
> +			clk_data, &pdev->dev);

This is not aligned with the opening bracket here and a few below. Maybe
you can fix it with your patch as well.

>  
>  	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  }
[...]
> diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
> index 991d78a71644..e1b625b86911 100644
> --- a/drivers/clk/mediatek/clk-mt8192.c
> +++ b/drivers/clk/mediatek/clk-mt8192.c
> @@ -1127,7 +1127,7 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_top_composites;
>  
> -	r = mtk_clk_register_gates_with_dev(node, top_clks, ARRAY_SIZE(top_clks),
> +	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
>  					    top_clk_data, &pdev->dev);

Here and below, the function call got shorter, please fix the
indentation in the following lines.

Best,
Markus

