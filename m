Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3860EC48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yA+PBFosbscm5+zCThh6dERUv3TpNrfT0SQFABBnCHc=; b=pPqtkGms3DA97O
	HTNqTh6uc+nNlT24xb0RkfrdUNRzMJkrlVmkLBZeSdhhSWc5sSI1s5Ogx9XtZQYPheb8OTflQ2XeZ
	AOknD2ovZrMUZGTofX+HjoX1MV/CeG7fM7nbAvdSGvDJmiixjtLKNsfUMbhGM/07sCjbBp8MohHCy
	iQY9Vw10VI53kKQ2M0HZSBvmWiT3SUyoBXVTAOAGQfViE/bLB8p6JzOwqY1Xs3izH8HngOZl5NT8Z
	Ww13oC/SvrVcGqCnMdqHCeS4135tCDZAmNoY4mVisDpCwoo3jMSkAlyLvoWwZcwuPjXYUozOokUb/
	FoAuz1kTfnVRcHkbrqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZZl-0000000Fwye-3eRf;
	Thu, 15 Feb 2024 11:06:45 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZZi-0000000Fwws-1OhJ;
	Thu, 15 Feb 2024 11:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707995200;
	bh=fTMk6kpGDD0am7FVybzJCZuM86RqERCd+fAxCEDkTH8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WapOTuJMLSUvc3jt26olqTmyJloaIN0SXhbVHbpZ+5VugPrNtvoyf1WNNWLCCnFBa
	 hghmVz3GJ8bs7QiZEjAxa3yZjdw2fkp6Mzq1Iuw5brCZjYYVUfvWF934B0SxifV7/6
	 PNQPit8oMRaAyEI1uJ4kLdMdre2iMsp54AaCrlho2csFeZe6deH2eqeHcmjVom/1/w
	 qfVe34pfH2+mEH8RJBFWCAaooq5lTbR9J3vb+011bcSJFCszSooLOgYnlsHomxkzo2
	 /RAfT6SS/PS7qWGXfgcKqxni6mqbYZgcxpvcZVJZoMYlcEDVdr+epVC/IizhVX9WFc
	 zXXlZO7RILYzQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 950BF3781144;
	Thu, 15 Feb 2024 11:06:39 +0000 (UTC)
Message-ID: <44529502-250b-4c8a-94c3-2c481d1385cf@collabora.com>
Date: Thu, 15 Feb 2024 12:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] drm/mediatek: Support CRC in display driver
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
 <20240215101119.12629-11-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215101119.12629-11-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_030642_541574_30D4E14E 
X-CRM114-Status: GOOD (  26.74  )
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
Cc: linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, Sean Paul <seanpaul@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/02/24 11:11, Hsiao Chien Sung ha scritto:
> Register CRC related function pointers to support
> CRC retrieval.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 239 ++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  39 ++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   3 +
>   3 files changed, 281 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 14cf75fa217f9..6cb1ed419dee7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -68,6 +68,9 @@ struct mtk_drm_crtc {
>   	/* lock for display hardware access */
>   	struct mutex			hw_lock;
>   	bool				config_updating;
> +
> +	struct mtk_ddp_comp		*crc_provider;
> +	unsigned int			frames;
>   };
>   
>   struct mtk_crtc_state {
> @@ -635,6 +638,14 @@ static void mtk_crtc_ddp_irq(void *data)
>   	struct drm_crtc *crtc = data;
>   	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>   	struct mtk_drm_private *priv = crtc->dev->dev_private;
> +	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
> +
> +	/*
> +	 * crc providers should make sure the crc is always correct
> +	 * by resetting it in .crc_read()
> +	 */
> +	if (crtc->crc.opened)
> +		comp->funcs->crc_read(comp->dev);
>   
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
> @@ -646,6 +657,24 @@ static void mtk_crtc_ddp_irq(void *data)
>   	if (!priv->data->shadow_register)
>   		mtk_crtc_ddp_config(crtc, NULL);
>   #endif
> +
> +	/*
> +	 * drm_crtc_add_crc_entry() could take more than 50ms to finish
> +	 * put it at the end of the isr
> +	 */
> +	if (crtc->crc.opened) {
> +		/*
> +		 * skip the first crc because the first frame is configured by
> +		 * mtk_crtc_ddp_hw_init() when atomic enable
> +		 */
> +		if (++mtk_crtc->frames > 1) {
> +			drm_crtc_add_crc_entry(crtc, true,
> +					       drm_crtc_vblank_count(crtc),
> +					       comp->funcs->crc_entry(comp->dev));
> +		}
> +	} else {
> +		mtk_crtc->frames = 0;
> +	}
>   	mtk_drm_finish_page_flip(mtk_crtc);
>   }
>   
> @@ -704,6 +733,40 @@ static void mtk_drm_crtc_update_output(struct drm_crtc *crtc,
>   	}
>   }
>   
> +static int mtk_drm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src)
> +{
> +	if (src && strcmp(src, "auto") != 0) {
> +		DRM_ERROR("%s(crtc-%d): unknown source '%s'\n",
> +			  __func__, drm_crtc_index(crtc), src);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int mtk_drm_crtc_verify_crc_source(struct drm_crtc *crtc,
> +					  const char *src,
> +					  size_t *cnt)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
> +
> +	if (!comp) {
> +		DRM_ERROR("%s(crtc-%d): no crc provider\n",
> +			  __func__, drm_crtc_index(crtc));
> +		return -ENOENT;
> +	}
> +
> +	if (src && strcmp(src, "auto") != 0) {
> +		DRM_ERROR("%s(crtc-%d): unknown source '%s'\n",
> +			  __func__, drm_crtc_index(crtc), src);
> +		return -EINVAL;
> +	}
> +
> +	*cnt = comp->funcs->crc_cnt(comp->dev);
> +
> +	return 0;
> +}
> +
>   int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>   			     struct mtk_plane_state *state)
>   {
> @@ -841,6 +904,8 @@ static const struct drm_crtc_funcs mtk_crtc_funcs = {
>   	.atomic_destroy_state	= mtk_drm_crtc_destroy_state,
>   	.enable_vblank		= mtk_drm_crtc_enable_vblank,
>   	.disable_vblank		= mtk_drm_crtc_disable_vblank,
> +	.set_crc_source		= mtk_drm_crtc_set_crc_source,
> +	.verify_crc_source	= mtk_drm_crtc_verify_crc_source,
>   };
>   
>   static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
> @@ -1033,6 +1098,11 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>   
>   			if (comp->funcs->ctm_set)
>   				has_ctm = true;
> +
> +			if (comp->funcs->crc_cnt &&
> +			    comp->funcs->crc_entry &&
> +			    comp->funcs->crc_read)
> +				mtk_crtc->crc_provider = comp;
>   		}
>   
>   		mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
> @@ -1137,3 +1207,172 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>   
>   	return 0;
>   }
> +
> +void mtk_drm_crc_init(struct mtk_drm_crc *crc,
> +		      const u32 *crc_offset_table, size_t crc_count,
> +		      u32 reset_offset, u32 reset_mask)
> +{
> +	crc->ofs = crc_offset_table;
> +	crc->cnt = crc_count;
> +	crc->rst_ofs = reset_offset;
> +	crc->rst_msk = reset_mask;
> +	crc->va = kcalloc(crc->cnt, sizeof(*crc->va), GFP_KERNEL);
> +	if (!crc->va) {
> +		DRM_ERROR("failed to allocate memory for crc\n");
> +		crc->cnt = 0;
> +	}
> +}
> +
> +void mtk_drm_crc_read(struct mtk_drm_crc *crc, void __iomem *reg)
> +{

	u32 n; goes here

> +	if (!crc->cnt || !crc->ofs || !crc->va)
> +		return;
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	/* sync to see the most up-to-date copy of the DMA buffer */
> +	dma_sync_single_for_cpu(crc->cmdq_client.chan->mbox->dev,
> +				crc->pa, crc->cnt * sizeof(*crc->va),
> +				DMA_FROM_DEVICE);
> +#else
> +	/* read crc with cpu for the platforms without cmdq */
> +	{

then you don't need the braces.

Regards,
Angelo


