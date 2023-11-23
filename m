Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CC9C624B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PULx9VtaXkrMfsuftPoltjbbdOIa9ePJbHlh5CDcp10=; b=MVZLIGJTL7pJHN/Tg06gwG2K3n
	9d8kUtTXq594vA+LkTrrQZNOReQe5BsdnNJKA+kI+DJHh/VBWO8ya3jrrMwqNQg4Q+1aWofGvxk7f
	zbRkEc0n0ggpVWzjuKc+byycHxUqNeYtIQsXv+TcJImWOSmJW+jbhgHD/Nmno5AaUmQc1FqlwGZFk
	x/W3ZHU1XHJQJRaK9Z2doy+EDW682jngUYnoSj00NKbmb1T33aT4hof0yNMSKz8tgCY1E68duuMRw
	pcilztojGTHPz7pSA1Ue/VnEJ1tONSQ/gHBvRFabHx9UwnJCY2jg4Vf8wPyNd+xFTAPlxVeQzEtmj
	bH2YVw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r66Re-004JyV-1b;
	Thu, 23 Nov 2023 09:56:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r66Ra-004JxQ-27;
	Thu, 23 Nov 2023 09:56:24 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2CF5C6607390;
	Thu, 23 Nov 2023 09:56:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700733378;
	bh=gAu++mm0U9mt5g8RN6c84qdtHW1L8vp8uMGDwrRFt2w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cYpgxRvXSU7lshcYEGilzhAYIy537CqAcQ8D/ubmzEPpgsvAdTARo54CTvvSOicjf
	 RuerpVWNozkRfg9DHrHYt7jdwaNWPZyF5lgNWvPz+IlCa0HrQFp+ugT/FYkNcjTWu4
	 2hC08R353s8zSVumTEgY8bSG+jxMQKWYIDTp4UFrlK4T0isEXyfekSwRukxaSZ/ecR
	 jK7DyHfN+23ph+i+1biWwPba3r9qeBLgyU4QoEhiLtswXprz+31BBwsgNdiIUpHBx1
	 FEzWbyxpYb+FVu9y0ktRSy71pGspK6abkZqSQQT8ybEISanVaNx/657zlGPuVeAsVj
	 SGVKlwej9j08g==
Message-ID: <fff2faef-6f3c-4009-840a-3ce83db90288@collabora.com>
Date: Thu, 23 Nov 2023 10:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: mediatek: mtk_disp_gamma: Fix breakage due to merge
 issue
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, nfraprado@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20231025104940.140605-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231025104940.140605-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_015622_911528_DE890F1D 
X-CRM114-Status: GOOD (  13.96  )
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

Il 25/10/23 12:49, AngeloGioacchino Del Regno ha scritto:
> While the commit that was sent to the mailing lists was fine, something
> happened during merge and the mtk_gamma_set() function got broken as
> a writel() was turned into a readl().
> 
> Fix that by changing that back to the expected writel().
> 
> Fixes: a6b39cd248f3 ("drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This was a urgent patch one month ago, and it got ignored.

Friendly ping.

Regards,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index 2fada9d6c95f..52c752bc5f41 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -203,7 +203,7 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>   	/* Disable RELAY mode to pass the processed image */
>   	cfg_val &= ~GAMMA_RELAY_MODE;
>   
> -	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
> +	writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);
>   }
>   
>   void mtk_gamma_config(struct device *dev, unsigned int w,



