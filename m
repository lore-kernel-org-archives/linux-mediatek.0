Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAB3C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 08:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUTcbCHVxstaAZIlxqjQpWL9r9m5Uxs9b7lLsCjT4LU=; b=thMoTf3Capd+SglTEC4zbjKf5S
	ALA86dxtlqVle6gAQoVvHnHvSnhAb6rnTZUShQiymXm04fj4xlXPiC/oxfZfZXnp2qSrbxcGXlvJH
	P80z3I9cKlCbg1zphDxmkIxLe1EmeaMooXKF8ecFwEoqfM8bcQ+Ap9M5soDwMjREb/bVIXyxBxr5h
	zuk5MOKc9eXHPvrLAuKhBcx7NnljeSNZ2puXwJKhYj/Iw72BiVhN00uqlvixjjmduB9ga80bnC+C0
	n/zgkXkhmZxRV8jwgIkh/G2jqhlsudv19HDKanvJ3PifmiUWKOeiTOwyK7XnpE0MFwiXXqYv2pBBZ
	IVFBWyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIZT-002LBi-0V;
	Fri, 28 Jul 2023 08:11:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIZ7-002L2c-0C;
	Fri, 28 Jul 2023 08:11:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3EA5E660716B;
	Fri, 28 Jul 2023 09:11:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690531870;
	bh=EkunT6qAlkxVx2kwaXu/dTKwauLQQrcXBadtGCTRZEs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PQUfV85PpvBErXe+c+hvH0w/WQAUI3Dle9FXOpG/oVyKN5g2n6zRN9h4EVvvklnTM
	 TWcthWyAutv6fk5UD2vuqcYaNCVr7U+NBZpbTW3Z3imE/MRuhQc+WxD2jY+GgiDjZi
	 rb8BZma2PX3hsOuPOachVx4Iv0sg6l6WjEHariGaYdfFUQNh3ur6Zan0uIqLVmDR30
	 T3FjM5lQsoRKa7t58PKFUeQQUn9RmRm4WNQCKPvkdC8STgE700ZwcpI+Og41YWRxoF
	 s9a0Du+eFVFkffjigHItMUvWDEmzUaJ7rS52WauB3+WiPBJ6F4J0/NciA7Z2hub5ku
	 hNtpK7W42hI3g==
Message-ID: <7ba4f465-6910-8b23-e950-98598547e8d9@collabora.com>
Date: Fri, 28 Jul 2023 10:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 3/4] drm/mediatek: Add ability to support dynamic
 connector selection
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nathan Lu <nathan.lu@mediatek.com>
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
 <20230727164114.20638-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230727164114.20638-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_011113_231380_B24D402A 
X-CRM114-Status: GOOD (  21.78  )
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

Il 27/07/23 18:41, Jason-JH.Lin ha scritto:
> 1. Move output drm connector from each ddp_path array to connector array.
> 2. Add dynamic select available connector flow in crtc create and enable.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
>   drivers/gpu/drm/mediatek/mtk_dpi.c          |  9 +++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 75 ++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 26 +++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 +++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 20 ++++--
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  7 ++
>   8 files changed, 145 insertions(+), 6 deletions(-)
> 

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index f114da4d36a9..bc7b0a0c20db 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -304,6 +304,7 @@ static const struct mtk_ddp_comp_funcs ddp_dither = {
>   static const struct mtk_ddp_comp_funcs ddp_dpi = {
>   	.start = mtk_dpi_start,
>   	.stop = mtk_dpi_stop,
> +	.encoder_index = mtk_dpi_encoder_index,
>   };
>   
>   static const struct mtk_ddp_comp_funcs ddp_dsc = {
> @@ -507,6 +508,25 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
>   	return false;
>   }
>   
> +static int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
> +					      const struct mtk_drm_route *routes,
> +					      unsigned int routes_num,

`num_routes` would be more readable.

> +					      struct mtk_ddp_comp *ddp_comp)
> +{
> +	unsigned int i;
> +
> +	if (!routes)
> +		return 0;

if (!routes)
	return -EINVAL;

> +
> +	for (i = 0; i < routes_num; i++)
> +		if (dev == ddp_comp[routes[i].route_ddp].dev)
> +			return BIT(routes[i].crtc_id);
> +
> +	DRM_INFO("Failed to find comp in ddp connector table\n");

This print is redundant.

> +
> +	return 0;

return -ENODEV;

> +}
> +
>   int mtk_ddp_comp_get_id(struct device_node *node,
>   			enum mtk_ddp_comp_type comp_type)
>   {
> @@ -538,6 +558,12 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>   					  private->data->third_len, private->ddp_comp))
>   		ret = BIT(2);
>   	else
> +		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
> +							 private->data->conn_routes,
> +							 private->data->num_conn_routes,
> +							 private->ddp_comp);
> +
> +	if (ret == 0)

if (ret < 0)

>   		DRM_INFO("Failed to find comp in ddp table\n");
>   
>   	return ret;

Regards,
Angelo




