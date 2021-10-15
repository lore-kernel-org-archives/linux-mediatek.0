Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B95EC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 11:25:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEDDA61108
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 11:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEDDA61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGyQRNzg01PvxUNoRAJ7duuNqpI0gEwOLOy85tpCYcg=; b=eoBWkb/noCE3EMWCjVDHNnKyKH
	UzG6rYRfQI4RBI4RSu2jX/YOi/zbseQlYQVR1hJJsTKWInY2o+FtUN1KpK6ZGFUuXJ2lPosYihMHK
	a++HTRAupFSBi47BqCfYPnL75jycHfurDgojCg1ide6G8cMQop6w47l7zybOPhZRFYk5BaDnw+zfu
	lWjJ/zc2zXl4usCO30nJ8mnHkVDpLVpIwuHOVMCSDnPxl2jAqHnW+GwBwbXjF1RAPTCS1oA34j5uN
	K3ug5NQfcvL56vKIFmZLqmuoxL4RcAmkoC2v+mlMGqDhej+XsdIwzjExCDA0f5G9HmNQRuQHtXtnV
	TrrlgUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbLKU-006htn-Kh; Fri, 15 Oct 2021 11:24:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbL1r-006cvD-EW
 for linux-mediatek@lists.infradead.org; Fri, 15 Oct 2021 11:05:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8E36B1F42D68
Subject: Re: [PATCH v1 6/9] soc: mediatek: mmsys: support mt8195 vppsys0/1
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
References: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
 <20210917032728.22367-7-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <fbc65370-28e6-14dc-5aa8-534d942f605c@collabora.com>
Date: Fri, 15 Oct 2021 13:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917032728.22367-7-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_040535_707591_702DD3C2 
X-CRM114-Status: GOOD (  19.88  )
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

> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add mt8195 vppsys clock driver name and routing table to
> the driver data of mtk-mmsys.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8195-mmsys.h    | 716 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       |  42 ++
>   drivers/soc/mediatek/mtk-mmsys.h       |   3 +
>   include/linux/soc/mediatek/mtk-mmsys.h |   4 +
>   4 files changed, 765 insertions(+)
> 

snip...

> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index cbae8063a187..35f57388fa90 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -69,6 +69,24 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>   	.clk_driver = "clk-mt8195-vdo1",
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8195_vppsys0_driver_data = {
> +	.clk_driver = "clk-mt8195-vpp0",
> +	.mdp_routes = mmsys_mt8195_mdp_routing_table,
> +	.mdp_num_routes = ARRAY_SIZE(mmsys_mt8195_mdp_routing_table),
> +	.mdp_mmsys_configs = mmsys_mt8195_mdp_vppsys_config_table,
> +	.mdp_num_mmsys_configs = ARRAY_SIZE(mmsys_mt8195_mdp_vppsys_config_table),
> +	.vppsys = true,
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8195_vppsys1_driver_data = {
> +	.clk_driver = "clk-mt8195-vpp1",
> +	.mdp_routes = mmsys_mt8195_mdp_routing_table,
> +	.mdp_num_routes = ARRAY_SIZE(mmsys_mt8195_mdp_routing_table),
> +	.mdp_mmsys_configs = mmsys_mt8195_mdp_vppsys_config_table,
> +	.mdp_num_mmsys_configs = ARRAY_SIZE(mmsys_mt8195_mdp_vppsys_config_table),
> +	.vppsys = true,
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8365-mm",
>   	.routes = mt8365_mmsys_routing_table,
> @@ -263,6 +281,18 @@ void mtk_mmsys_mdp_camin_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_camin_ctrl);
>   
> +void mtk_mmsys_write_reg(struct device *dev,
> +			 struct mmsys_cmdq_cmd *cmd,
> +			 u32 alias_id, u32 value, u32 mask)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const u32 *configs = mmsys->data->mdp_mmsys_configs;
> +
> +	cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id,
> +			    mmsys->addr + configs[alias_id], value, mask);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_write_reg);
> +
>   static int mtk_mmsys_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -301,6 +331,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   	if (IS_ERR(clks))
>   		return PTR_ERR(clks);
>   
> +	if (mmsys->data->vppsys)
> +		goto EXIT;

Labels should be lower-case.

> +
>   	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
>   					    PLATFORM_DEVID_AUTO, NULL, 0);
>   	if (IS_ERR(drm)) {
> @@ -308,6 +341,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		return PTR_ERR(drm);
>   	}
>   
> +EXIT:
exit:

>   	return 0;
>   }
>   

After the fixes...

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
