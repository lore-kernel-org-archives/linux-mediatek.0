Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50635C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 14:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfJ5wVfFGOGFzUMP+sgv7v9TF3Bb0zDsfnXFjwoOxUQ=; b=Klg12MhXNbmZ0nfJck1AF03cmk
	vF50mQxVyEzw94w7P+9nXdI8QJ2r6xZVfoJnoBoNpf4MjPpOzLgriT5Mi9hiMsxKVb6yO2K+uL/Kg
	j9ht2DWhsj5eUs65Op+/CzZRmHyA5/Mh4fUhMvcuK5UKWlkeHcRxeFIVBFYt9ADav3zDnDa6s4Kwp
	UVGOM2J/VqoLNV3UurEM0fnv5W5rJHCi3KTNF6X7AuwdbA5HwICcet3qKDIvicDhZBbkx28LlmG8N
	jqy1v8Qr1nUjZTx6dktNBklyI50Ojq1d4crYuuiNviNQV3mDBH4EszWIM434Jm3+C3W5O3BSEHWEC
	1l2BdS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6vn1-00BqHu-Gd; Mon, 10 Jan 2022 14:36:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6vmo-00BqEI-Pf; Mon, 10 Jan 2022 14:36:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 094D71F43880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641825397;
 bh=sPMEaHzrlyJz2hbJef7Mpl4Bv5tFXyVrTWSbB97vkfo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VFo7toPkxXSSLfY+VasyKPW08pEP5HFmBM8Ry0OAHZTy3NgVvFITsXodK47K6OuPv
 O/Ch59xUaV1AcL47MLH/fcJcwv5G697eIb9iO8eVWPmcpDNuKXHrYd+tI3iaVXU4o8
 bbkvYGfG6zSJT+XDL9DuoUqsmTxn5+Ew24cOaSgV8ChiwMoAMqb+rOVjVXB3id6Ofp
 seOwaAT5rNKRDnJ87Ur+2VLdXOwL+mxNoxJ89/goz7Jv+W3l6RaVp0fd3Jw0ft6+12
 rJM6NYBZkgXsygk8OAz+bYvKMU/NcQDUdWjBNKy82BxWZCetFjLcvDqkVhGB/oMkW6
 pI+aBJGpHWTSA==
Subject: Re: [v2 3/3] clk: mediatek: Integrate vppsys with mtk-mmsys in MT8195
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110005902.27148-1-chun-jie.chen@mediatek.com>
 <20220110005902.27148-4-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <e5ca60a0-4fee-0d6b-0714-77dc51f5a7cf@collabora.com>
Date: Mon, 10 Jan 2022 15:36:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110005902.27148-4-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_063639_139332_AB82E9B0 
X-CRM114-Status: GOOD (  26.99  )
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

Il 10/01/22 01:59, Chun-Jie Chen ha scritto:
> Integrate vpp0 and vpp1 with mtk-mmsys driver which
> will populate device by platform_device_register_data
> to start vppsys clock driver.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Hello Chun-Jie,

I agree with this series and I would be happy to give you my R-b, but
this patch will make these clocks to *never* probe in in the targeted
kernel version.

You forgot to mention that this patch will break vpp0/vpp1 clocks entirely
unless applied on top of patch series [1].

Please, either mention that said series is *required* for this one to work
as expected, or move series [1], patches 6 and 7 to this series instead;
since the MDP3 driver will need quite a while to get merged, I would suggest
to move the patches here, as to get something "complete" to merge.

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=568283

> ---
>   drivers/clk/mediatek/clk-mt8195-vpp0.c | 42 +++++++++++++++++---------
>   drivers/clk/mediatek/clk-mt8195-vpp1.c | 42 +++++++++++++++++---------
>   2 files changed, 56 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> index c3241466a8d0..68c375bfce8b 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> @@ -86,25 +86,39 @@ static const struct mtk_gate vpp0_clks[] = {
>   	GATE_VPP0_2(CLK_VPP0_WARP1_MDP_DL_ASYNC, "vpp0_warp1_mdp_dl_async", "top_wpe_vpp", 3),
>   };
>   
> -static const struct mtk_clk_desc vpp0_desc = {
> -	.clks = vpp0_clks,
> -	.num_clks = ARRAY_SIZE(vpp0_clks),
> -};
> +static int clk_mt8195_vpp0_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_onecell_data *clk_data;
> +	int r;
>   
> -static const struct of_device_id of_match_clk_mt8195_vpp0[] = {
> -	{
> -		.compatible = "mediatek,mt8195-vppsys0",
> -		.data = &vpp0_desc,
> -	}, {
> -		/* sentinel */
> -	}
> -};
> +	clk_data = mtk_alloc_clk_data(CLK_VPP0_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	r = mtk_clk_register_gates(node, vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
> +	if (r)
> +		goto free_vpp0_data;
> +
> +	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	if (r)
> +		goto unregister_clk;
> +
> +	return r;
> +
> +unregister_clk:
> +	mtk_clk_unregister(clk_data);
> +
> +free_vpp0_data:
> +	mtk_free_clk_data(clk_data);
> +	return r;
> +}
>   
>   static struct platform_driver clk_mt8195_vpp0_drv = {
> -	.probe = mtk_clk_simple_probe,
> +	.probe = clk_mt8195_vpp0_probe,
>   	.driver = {
>   		.name = "clk-mt8195-vpp0",
> -		.of_match_table = of_match_clk_mt8195_vpp0,
>   	},
>   };
>   builtin_platform_driver(clk_mt8195_vpp0_drv);
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> index ce0b9a40a179..237077c60f54 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> @@ -84,25 +84,39 @@ static const struct mtk_gate vpp1_clks[] = {
>   	GATE_VPP1_1(CLK_VPP1_VPP_SPLIT_26M, "vpp1_vpp_split_26m", "clk26m", 26),
>   };
>   
> -static const struct mtk_clk_desc vpp1_desc = {
> -	.clks = vpp1_clks,
> -	.num_clks = ARRAY_SIZE(vpp1_clks),
> -};
> +static int clk_mt8195_vpp1_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_onecell_data *clk_data;
> +	int r;
>   
> -static const struct of_device_id of_match_clk_mt8195_vpp1[] = {
> -	{
> -		.compatible = "mediatek,mt8195-vppsys1",
> -		.data = &vpp1_desc,
> -	}, {
> -		/* sentinel */
> -	}
> -};
> +	clk_data = mtk_alloc_clk_data(CLK_VPP1_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	r = mtk_clk_register_gates(node, vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
> +	if (r)
> +		goto free_vpp1_data;
> +
> +	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	if (r)
> +		goto unregister_clk;
> +
> +	return r;
> +
> +unregister_clk:
> +	mtk_clk_unregister(clk_data);
> +
> +free_vpp1_data:
> +	mtk_free_clk_data(clk_data);
> +	return r;
> +}
>   
>   static struct platform_driver clk_mt8195_vpp1_drv = {
> -	.probe = mtk_clk_simple_probe,
> +	.probe = clk_mt8195_vpp1_probe,
>   	.driver = {
>   		.name = "clk-mt8195-vpp1",
> -		.of_match_table = of_match_clk_mt8195_vpp1,
>   	},
>   };
>   builtin_platform_driver(clk_mt8195_vpp1_drv);
> 


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
