Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81108C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyypL/hab3ey+dCtRjB4SB42WUMdBz/hnOaiZfrDlYM=; b=NMRgeBqTZu9I4j
	tQOlQaimCHbuZPzKQuVg3pRJ+29pYekpxWOBk/9zEJFvg5/F1WewcV9ZgcaKnV7zHym4+H1upEcBq
	bHUHZ8jdgHhk4SBQmzxXcPqjlLIJT1F38W+uzvv7JQVB49yOy23avGDtkdwRWArYf6Zw4QWtcjZpM
	V0EE1GWTpUByQ2sJCbKt7Mcqzt7Qg8t6kuPHvJA2o7+fxSQartpBiDfiCqvj1n/t0wuJnf2Zo7c7H
	FAVVYYW+ckWEQRI9Opm7UX3TwIXmjhK+sCc3caGjp0x0iHW+eJL9vlPhp2UhVIGRa+IqXPuRJciVS
	6JN34Ccw2W5D7iMjZdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSq4-00CcTr-SH; Thu, 21 Apr 2022 09:11:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSnB-00CapA-BA; Thu, 21 Apr 2022 09:08:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6F36F1F45276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532080;
 bh=b12S/GGfLM+hr9wK/Kd71hajyO38MEtI8nnnJ80yYtE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kPrjkyumGDlUZvYYyc2UvX8vjPLZe/bwNGl5Km4Ya5MNPeQ1aRr1HfiYV0n2Nj59T
 7xn2w23N7m0oEIl8NVXR8w67DXmzlizmOtBd6+JkgrDOjjGK381HAQO0KJwfTXDuJs
 JxqxyPlrllgybpybDB8eYWmwJuR+sHL/NDxGNhptwMrhBJhPHZIwiSegY0p3Yri5XU
 97ShgEuIuUhSv3G1zPckAV2edbxsHCcFRes6LK1ehfvzu3djyPgztPEsmUOTAouxht
 TATNzmcIRPNoBdgj/yt9nKxrq/RVtZn5JBSW6Hq04domx5ipZh/cDvvoelLuhpFOug
 DZeEGCJfSHIuA==
Message-ID: <a2341eae-3a3a-ca26-8ce7-a4ba9219566c@collabora.com>
Date: Thu, 21 Apr 2022 11:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 04/12] clk: mediatek: reset: Merge and revise reset
 register function
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020801_561338_FA948AF0 
X-CRM114-Status: GOOD (  19.30  )
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

Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> Merge the reset register function of simple and set_clr into one function.
> - Input the version number to determine which version we will use.
> - Rename reset register function to "mtk_clk_register_rst_ctrl"
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/clk/mediatek/clk-mt2701-eth.c |  2 +-
>   drivers/clk/mediatek/clk-mt2701-g3d.c |  2 +-
>   drivers/clk/mediatek/clk-mt2701-hif.c |  2 +-
>   drivers/clk/mediatek/clk-mt2701.c     |  4 +--
>   drivers/clk/mediatek/clk-mt2712.c     |  4 +--
>   drivers/clk/mediatek/clk-mt7622-eth.c |  2 +-
>   drivers/clk/mediatek/clk-mt7622-hif.c |  4 +--
>   drivers/clk/mediatek/clk-mt7622.c     |  4 +--
>   drivers/clk/mediatek/clk-mt7629-eth.c |  2 +-
>   drivers/clk/mediatek/clk-mt7629-hif.c |  4 +--
>   drivers/clk/mediatek/clk-mt8135.c     |  4 +--
>   drivers/clk/mediatek/clk-mt8173.c     |  4 +--
>   drivers/clk/mediatek/clk-mt8183.c     |  3 ++-
>   drivers/clk/mediatek/clk-mtk.h        | 13 ++++++----
>   drivers/clk/mediatek/reset.c          | 35 ++++++++++++---------------
>   15 files changed, 44 insertions(+), 45 deletions(-)
> 

..snip..

> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index 6574b19daf0f..8e42deee80a3 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -65,14 +65,23 @@ static const struct reset_control_ops mtk_reset_ops_set_clr = {
>   	.reset = mtk_reset_set_clr,
>   };
>   
> -static void mtk_register_reset_controller_common(struct device_node *np,
> -			unsigned int num_regs, int regofs,
> -			const struct reset_control_ops *reset_ops)
> +static const struct reset_control_ops *rst_op[MTK_RST_MAX] = {
> +	[MTK_RST_SIMPLE] = &reset_simple_ops,
> +	[MTK_RST_SET_CLR] = &mtk_reset_ops_set_clr,
> +};

I don't think that we really need this to go to .rodata to get an improvement
in boot times in the order of nanoseconds....

> +
> +void mtk_clk_register_rst_ctrl(struct device_node *np,
> +			       u32 reg_num, u16 reg_ofs, u8 version)
>   {
>   	struct mtk_reset *data;
>   	int ret;
>   	struct regmap *regmap;
>   
> +	if (version >= MTK_RST_MAX) {
> +		pr_err("Error version number: %d\n", version);
> +		return;
> +	}
> +
>   	regmap = device_node_to_regmap(np);
>   	if (IS_ERR(regmap)) {
>   		pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
> @@ -84,10 +93,10 @@ static void mtk_register_reset_controller_common(struct device_node *np,
>   		return;
>   
>   	data->regmap = regmap;
> -	data->regofs = regofs;
> +	data->regofs = reg_ofs;
>   	data->rcdev.owner = THIS_MODULE;
> -	data->rcdev.nr_resets = num_regs * 32;
> -	data->rcdev.ops = reset_ops;
> +	data->rcdev.nr_resets = reg_num * 32;
> +	data->rcdev.ops = rst_op[version];
>   	data->rcdev.of_node = np;

...hence, I would prefer to see something like:

	switch (version) {
	case MTK_RST_SIMPLE:
		data->rcdev.ops = &reset_simple_ops;
		break;
	case MTK_RST_SET_CLR:
		data->rcdev.ops = &mtk_reset_ops_set_clr;
		break;
	default:
		pr_err("Unknown reset version %d\n", version);
		return;
	}

Like that, you'd also replace that if branch at the beginning where you
do the reset version sanity check.
If you don't want to allocate a struct mtk_reset before running this switch,
you can also declare a `struct reset_control_ops *rcops = NULL;` locally and
then assign `data->rcdev.ops = rcops;` later: that would also be acceptable.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
