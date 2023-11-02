Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B79BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 16:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gguzMEHCAOAkLlkOwsmLBkPDw+hYzzL2wnFbTEDgn9w=; b=fNG8ZYYhV1Mei/3/8gK3QNI8Ht
	85Cdn2ZfhVXUEGlPM5x/zUmWmVdP3ymFuqGbc0rYHetgycmmODjX06hJXhC5m+PWjsUVSupLIort3
	QDwA32IkIw9HOu9bXBa6e5yg1S0gjGfAbS6UvBUAMTspPblXi+o7cjgRwEOq8Cvx4He+idZt5eoeF
	YwrD+1L5sNKkYL+jGxo18jrWMSYYFssxq3xZMYneLkUpOadl+EjiXly7ys+xd8zbRuTmamPtEskMZ
	mIGuBwAYQYKg9D+jKOgi8BWzLgAUaqVQ1r5+NXDGWvbI545RFIkrZK6KH7u80IEuYgk1vRr7h5hom
	qMAPQGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyaiB-009tjU-1H;
	Thu, 02 Nov 2023 16:38:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyai5-009ti8-0D;
	Thu, 02 Nov 2023 16:38:25 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F4A7660732D;
	Thu,  2 Nov 2023 16:38:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698943096;
	bh=2U2jNYxkhbQYRZodeTJJK+isFib8B36sDeFILwRywAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b0lMF5gVq5bLcfAU6k1wcNuaq8K5nN+WMRreweu7tYK2hlPVQRJxAUW4Z5d6TLkRL
	 PaSSzMVL34q6lsjMCWVkBXMZz2SNqWFMTN1aaUhqRqt1YXaWjCLcF0SqGYko81bU4R
	 jQZfQpGDqS8vdHKBYA+OVFpza2HSMds9MYAgHDAQeNVzcWvY/wzyLOjiQTlC+6FeQU
	 Ph5jhdrDwZdPzr0dJBUVJcUr4z9Cw7kGKKR7EWFdjpH87WqAadsZvAoZMsUs6TO7OJ
	 6rnic2Sh7E21fIdUsp5eHHZWgZAMqyWqG3e9oRLPKGaQYSong/SDnLNR9lDEFTjFTn
	 LFQeEF0SFD+Qg==
Message-ID: <7f033a16-bab6-4330-9dbf-a7f4158abe1e@collabora.com>
Date: Thu, 2 Nov 2023 17:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231102113345.24775-1-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231102113345.24775-1-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_093821_286832_D7BD8E4E 
X-CRM114-Status: GOOD (  14.96  )
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

Il 02/11/23 12:33, yu-chang.lee ha scritto:
> Add MT8188 VPPSYS0 and VPPSYS1 driver data.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

This change is valid, but you have to reflect that in the bindings.
Remove mediatek,mt8188-vppsys{0,1} from clock/mediatek,mt8188-clock.yaml and add
those to arm/mediatek/mediatek,mmsys.yaml like was done with MT8195.

Of course, bindings go to a separate commit.

I can't give you a R-b tag for this one without the bindings one..... :-)

Thanks,
Angelo

> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 7630e1d9b3a4..591e92468bea 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -89,6 +89,16 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
>   	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8188_vppsys0_driver_data = {
> +	.clk_driver = "clk-mt8188-vpp0",
> +	.is_vppsys = true,
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8188_vppsys1_driver_data = {
> +	.clk_driver = "clk-mt8188-vpp1",
> +	.is_vppsys = true,
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8192-mm",
>   	.routes = mmsys_mt8192_routing_table,
> @@ -440,6 +450,8 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>   	{ .compatible = "mediatek,mt8183-mmsys", .data = &mt8183_mmsys_driver_data },
>   	{ .compatible = "mediatek,mt8186-mmsys", .data = &mt8186_mmsys_driver_data },
>   	{ .compatible = "mediatek,mt8188-vdosys0", .data = &mt8188_vdosys0_driver_data },
> +	{ .compatible = "mediatek,mt8188-vppsys0", .data = &mt8188_vppsys0_driver_data },
> +	{ .compatible = "mediatek,mt8188-vppsys1", .data = &mt8188_vppsys1_driver_data },
>   	{ .compatible = "mediatek,mt8192-mmsys", .data = &mt8192_mmsys_driver_data },
>   	/* "mediatek,mt8195-mmsys" compatible is deprecated */
>   	{ .compatible = "mediatek,mt8195-mmsys", .data = &mt8195_vdosys0_driver_data },


