Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA43C54E49
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAyULuroIYpcMbrAA7APk+1qWQ3OMVexBEVPiiEsAvg=; b=d6V0JVUoWlhSXVRrSXWqd8LeLx
	b9k9VhbQgJzhQ5B5RNMR5kpXBVPniGyufAhd879k0ebvOroW7K/RN1gi4g2M2q+CK10g1gAc2UUJ9
	i3LLj3MrS9c+SwHQepcOjDgpVorzU6Z7WFCitmO8AdlkVTZTkhyWx6sXpcY7h4I2tMJlsIvDN3E6O
	+IC+06kQygWlOhluV8z/MGbaWKRR3oLmEwhGikEWOTa/eqzlGroyYr52ZEr+spUUAM3Sgm683ohZ0
	19eNt88O9WdFWrXrj9i9hIv/GGfwrzi1OWUJ0saC8OiLPjOnyI+U9mw4UobUQoo0s+NhLpstOTlad
	ycGiaqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaI8-00000000dUr-00cl;
	Mon, 26 Feb 2024 12:41:08 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaGZ-00000000cjx-0XOx;
	Mon, 26 Feb 2024 12:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708951169;
	bh=WuE4kCD97wZ9bNjHBG7YNNj1l3uPwjiVFXgZ1NInp4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hruwiW9pNWUrPMI0AD9IZzA/Y9miBS1AqGYeG1A93mG9LQcQ10Ia9jew8ZNEcDawX
	 z2OBZElqRRK3DCorbhKBZoyHyjBIwBA/RxUar/Yj3jUrxr5yPQTsqVoA9ZJsyqBCfO
	 ZZHSzru6f0uYG+SaC3GO+7DoPUxMliKkt+/iWBNtLejHWATUq1lIpomysLNwyhKKQC
	 EIDI/5VBBFNI/7V17e1FzY0YgdFt2y4Vn8VxTTuE0glp/eUpn4mzPFVqSaOyu0XgQq
	 COC7lTErNp+kg4igLcu882DuuMGyfXjVUNGZPxRgNh+yjGuhSWHNC9clYphHHXteDs
	 hmtw0XcRhVcJQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DD07B37820CF;
	Mon, 26 Feb 2024 12:39:28 +0000 (UTC)
Message-ID: <e2f901aa-9d1b-4de9-ac18-7cfb57adb587@collabora.com>
Date: Mon, 26 Feb 2024 13:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/mediatek: Rename "pending_needs_vblank" to
 "needs_vblank"
Content-Language: en-US
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
 <20240226085059.26850-12-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240226085059.26850-12-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_043932_075512_A6E6B31B 
X-CRM114-Status: GOOD (  16.02  )
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

Il 26/02/24 09:50, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename "pending_needs_vblank" to "needs_vblank" to reduce the code size.
> 

This decreases human readability though, so I would prefer that we omit this one.

Regards,
Angelo

> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_crtc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
> index 7fe234de83a3..a1fb6c67681d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -42,7 +42,7 @@ struct mtk_crtc {
>   	struct drm_crtc			base;
>   	bool				enabled;
>   
> -	bool				pending_needs_vblank;
> +	bool				needs_vblank;
>   	struct drm_pending_vblank_event	*event;
>   
>   	struct drm_plane		*planes;
> @@ -105,9 +105,9 @@ static void mtk_crtc_finish_page_flip(struct mtk_crtc *mtk_crtc)
>   static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
>   {
>   	drm_crtc_handle_vblank(&mtk_crtc->base);
> -	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
> +	if (!mtk_crtc->config_updating && mtk_crtc->needs_vblank) {
>   		mtk_crtc_finish_page_flip(mtk_crtc);
> -		mtk_crtc->pending_needs_vblank = false;
> +		mtk_crtc->needs_vblank = false;
>   	}
>   }
>   
> @@ -571,7 +571,7 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
>   	mutex_lock(&mtk_crtc->hw_lock);
>   	mtk_crtc->config_updating = true;
>   	if (needs_vblank)
> -		mtk_crtc->pending_needs_vblank = true;
> +		mtk_crtc->needs_vblank = true;
>   
>   	for (i = 0; i < mtk_crtc->layer_nr; i++) {
>   		struct drm_plane *plane = &mtk_crtc->planes[i];



