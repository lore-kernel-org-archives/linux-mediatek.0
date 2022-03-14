Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FDAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIVeWvLHqXS9jsDHBx4s6/qY4nCwmx8oAN2xrvIhR9E=; b=Afh7d7CNEonz99
	sY5O+UWS4V74JUQcvsl4Gup/q6cLpPoLWXUmqoqsig8WaYQyj3MrX8GVJ5Ppq7WC062if+ewP2zSA
	TdCupNpkKqWVLI/rCtfk70HJgWPRAKxMyq7JB0HBu/buGHFe/qqCNZdO5VO83gg8FTAiLyjnXzaYk
	KJWiGv/0l8TpNwED/UBm8p6rum+YOQP+/vUysJakgRGbp3o+QjPrVclhh6DJNmdAKz1tmxz8hl90q
	iXjuQAW6gdjIDLcCElOqF5GYI0pJ1POGTgO4Izq0gFKYGyWYb9vI2RF2QKFzYkZSLj/llifPhneW3
	Q+2wWTlrHdq/OppSWgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThfV-004rj7-SC; Mon, 14 Mar 2022 10:11:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThfF-004rb0-VV; Mon, 14 Mar 2022 10:10:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 461EA1F43E0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647252656;
 bh=yA8iPc1qudE0RmbWKTE0OXypq9/1bFl/sCJMi3gV1Sw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gjrp0g5MeHLNDySyFqs5JRUzilUbUpmVggL+Y3GbxW77VoCvdsRZlx/VqBGFboED6
 yfnkByKHj6qvp+6voxCecxYBybDBxSZAfpqqUia6Gy4T9Mk7K3XbkHJP8NRzAuT5nT
 ocWtki6jabAOjuBYMO5NKNZ35Id2JZ6Vg29//qinOyrYTDPxh1jO9W3kE5wN9dxid/
 gOmOoZOWp2VOfLUEMmv3aV5VW2xVUtbGJ4d6o3CNkjm1Y2J4V7gAyDbhXHhc2dh/al
 3jSz7ci2EWDlHjyeyDnNmMHCGkplQLBZX66U2rXLdSORd8KC8BXRMCwNZmDY+HG13M
 ZYCmjz00HgYoQ==
Message-ID: <2ec34f38-a26a-92c0-0185-cf9cd09c202d@collabora.com>
Date: Mon, 14 Mar 2022 11:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V7 5/5] drm/mediatek: add display support for MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 jassisinghbrar@gmail.com, fparent@baylibre.com, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
 <20220314090033.25773-6-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220314090033.25773-6-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_031058_229507_F6FBC1C3 
X-CRM114-Status: GOOD (  13.99  )
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

Il 14/03/22 10:00, Rex-BC Chen ha scritto:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add mmsys driver data and compatible for MT8186 in mtk_drm_drv.c.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 33 ++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 247c6ff277ef..c5f88295b434 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -158,6 +158,24 @@ static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext[] = {
>   	DDP_COMPONENT_DPI0,
>   };
>   
> +static const enum mtk_ddp_comp_id mt8186_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_POSTMASK0,
> +	DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DSI0,
> +};
> +
> +static const enum mtk_ddp_comp_id mt8186_mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL_2L0,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_DPI0,
> +};
> +
>   static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
>   	DDP_COMPONENT_OVL0,
>   	DDP_COMPONENT_OVL_2L0,
> @@ -221,6 +239,13 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
> +	.main_path = mt8186_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8186_mtk_ddp_main),
> +	.ext_path = mt8186_mtk_ddp_ext,
> +	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.main_path = mt8192_mtk_ddp_main,
>   	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
> @@ -461,6 +486,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8183-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8186-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8192-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8173-disp-od",
> @@ -509,12 +536,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DPI },
>   	{ .compatible = "mediatek,mt8183-dpi",
>   	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8186-dpi",
> +	  .data = (void *)MTK_DPI },
>   	{ .compatible = "mediatek,mt2701-dsi",
>   	  .data = (void *)MTK_DSI },
>   	{ .compatible = "mediatek,mt8173-dsi",
>   	  .data = (void *)MTK_DSI },
>   	{ .compatible = "mediatek,mt8183-dsi",
>   	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8186-dsi",
> +	  .data = (void *)MTK_DSI },
>   	{ }
>   };
>   
> @@ -531,6 +562,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
>   	  .data = &mt8173_mmsys_driver_data},
>   	{ .compatible = "mediatek,mt8183-mmsys",
>   	  .data = &mt8183_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8186-mmsys",
> +	  .data = &mt8186_mmsys_driver_data},
>   	{ .compatible = "mediatek,mt8192-mmsys",
>   	  .data = &mt8192_mmsys_driver_data},
>   	{ }
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
