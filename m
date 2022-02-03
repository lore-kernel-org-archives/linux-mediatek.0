Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF37C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msEalxrnyW47/RFJQJofpWvUEaiYxal1Rj4vP2O6Czw=; b=Qlz01UMIh3FY5q
	yC3PG8582OIDiukjUqdzs7zWn/LGMvpW53g9O9O7rdO5HUWcO89Hbf9r3LWGedl2yphsEiQWxtAS3
	PFVp6yYfMyeRS9I0Ol6jldGIv08yL6wR3UjDkOkiUaiphTgmEzRf1stNkX31Fpeeb7dNBU/UiIW96
	aVZ6S2Q2B+7z2ockx/Lz/HYEQEdJrUCpL8jga+qud/bFK0Cbtf19NPFpC6K78DrmlrpqKeBL52FD3
	KAzrwsCjVfxhr6lNs4sG9mgj3Slgz62iXr3uy+oZc4cfOzPalxFJjwCUOFZtuEYXiJcKsKylxKfOl
	PFMgm3U4pWjOaLAj2epw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYiV-000YNr-Oh; Thu, 03 Feb 2022 09:47:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYi6-000YBe-Dj; Thu, 03 Feb 2022 09:47:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4409D1F45304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881644;
 bh=daIWMKQR9fyJ/RDFOrTuswHu7PdSrexQuHGnoAKw++c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jTGw1yY7hHVFiriNMrM0FW1RuIe1U71Lsmz+XODL2SlNv3W6tVR3T4kL/qPILp9ln
 px2CeaskYzwexlU+lUpLsUxeE6yrjmXOgQHS4QJcZE9qMUGDi5RGJPMGdVHct6VkzS
 yIEGNn7r2jG3NxdPQpW7TTkKwIgSOaT4VhYufyAYLtrShi3CG9U+9RzNAmEm2tRudC
 XFymb/f07RCN2x4PQInqY0OwU4vk3Qs+ZFJfdNxIM5dPn33woMDw2FyPLe2HUBM7qO
 N3FSF2mXUEWu7ivJ5sgVoGrKLEfDxHxIc5CZKClCPRpyTqIGns6P5QU3ZDe8jLZc6a
 rdbhiCJtNJRrQ==
Message-ID: <540b2d6f-b3eb-5e7a-67b1-65cc27abb511@collabora.com>
Date: Thu, 3 Feb 2022 10:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 29/31] clk: mediatek: mt8195: Implement error handling
 in probe functions
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-30-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-30-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014726_645195_84556DF8 
X-CRM114-Status: GOOD (  17.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so all drivers did not do proper cleanup in
> their error paths.
> 
> Now that the library does have APIs to unregister clks, use them
> in the error path of the probe functions for the mt8195 clk drivers
> to do proper cleanup.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>   drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 13 ++++--
>   drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 11 ++++-
>   drivers/clk/mediatek/clk-mt8195-topckgen.c   | 49 +++++++++++++++-----
>   drivers/clk/mediatek/clk-mt8195-vdo0.c       |  4 +-
>   drivers/clk/mediatek/clk-mt8195-vdo1.c       |  4 +-
>   5 files changed, 63 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> index 5b1b7dc447eb..af8d80f25f30 100644
> --- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> @@ -120,17 +120,24 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
>   	if (!clk_data)
>   		return -ENOMEM;
>   
> -	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> -	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
> +	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
>   	if (r)
>   		goto free_apmixed_data;
>   
> +	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
> +	if (r)
> +		goto unregister_plls;
> +
>   	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>   	if (r)
> -		goto free_apmixed_data;
> +		goto unregister_gates;
>   
>   	return r;
>   
> +unregister_gates:
> +	mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
> +unregister_plls:
> +	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);

You mean mtk_clk_*un*register_{gates,plls} here... please fix!




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
