Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9743EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkD8DXJkjnwCjhjKEW/Fwu8cIu13TA8HNCafeOH7vAY=; b=ATAzcWlNRUcWn3
	Vu94dLjC5IhZv6I2jdpzdwYcAkJMPNKfS4xnFF/mrSegVDoh5ITBYrdQK9WOfRQGVIBSFIq/N0wOR
	s0KxxT4m3rLmpH9sqGzq0NJ7Y+4aAYf0OhbC+dbjiEbKFUAEmm9z+u63yx95vtune9XNWvjat8lsJ
	vKuV7syJbKZqDac2ecQeRsuWKDXiYdhwNQZ7IOh2Ppx5Bwpj3V5CWMctijaLtO+ZddZ9X9/IK8D5k
	ANcBcVOPuafDN4YssZPW6clF0/Sq7s10ZHJHlCSfW0OutVZuoH4BEZLyQTiGdNFPkc95DkPyavlRV
	3yz5i5j641JGkeDxtHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9ka-006EL7-Iq; Mon, 21 Feb 2022 14:33:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM9ie-006D3c-05; Mon, 21 Feb 2022 14:31:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7C2781F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453874;
 bh=mk0k2/MEJmiURqVRoi1Wk1mPXDdi5cLxGGCrvu3Zv+o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cAHt7Se+QbWvrlRL1ngiD9HhR8lKnozQrO13TG0uDtl7RyS2/LEdrMtzyAOBlbMHv
 mp0bZ9zLZgs1g0nPN0Sh01/GvEXPhDTOv7WjzJLOrx+S3y3ONUNvHrvGkEAd4g/za3
 FFBbM3R1VepHpLyS3iwOuiZ5hs7HSkDxwUDhnHcmLXzRZsT6Sws7LvaRyttjdj1mJg
 1/3tzkg59CBmstvES4lryQ95TF9kRHRW3Gy/Yszr7sJUSBUMitEClrh7awHB6L+2PV
 REfUL7zqfeiDuydEepo85W2hreRiHcj3ilQ9qyvLbUK84xmS5NsLN58QNXc3hcy/K9
 zTrhFB6wOe+hQ==
Message-ID: <0a6fe69b-245a-c889-15be-3136c29d3d61@collabora.com>
Date: Mon, 21 Feb 2022 15:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 10/19] drm/mediatek: dpi: move swap_shift to board
 config
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-11-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-11-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_063116_224377_E19550D0 
X-CRM114-Status: GOOD (  14.95  )
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

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> Add flexibility by moving the swap shift value to board config
> 

Same board->SoC as all the other commits..

> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 0d3acd08ea358..ec221e24e0fee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -131,6 +131,7 @@ struct mtk_dpi_conf {
>   	u32 dimension_mask;
>   	// Mask used for HSIZE and VSIZE (no shift)
>   	u32 hvsize_mask;
> +	u32 channel_swap_shift;
>   	const struct mtk_dpi_yc_limit *limit;
>   };
>   
> @@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
>   		break;
>   	}
>   
> -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP, CH_SWAP_MASK);
> +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
> +		     CH_SWAP_MASK << dpi->conf->channel_swap_shift);

I would say that this should be instead:
	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,

		     val << dpi->conf->channel_swap_shift, CH_SWAP_MASK);


>   }
>   
>   static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
> @@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>   	.swap_input_support = true,
>   	.dimension_mask = HPW_MASK,
>   	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>   	.limit = &mtk_dpi_limit,
>   };
>   
> @@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>   	.swap_input_support = true,
>   	.dimension_mask = HPW_MASK,
>   	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>   	.limit = &mtk_dpi_limit,
>   };
>   
> @@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>   	.swap_input_support = true,
>   	.dimension_mask = HPW_MASK,
>   	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>   	.limit = &mtk_dpi_limit,
>   };
>   
> @@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>   	.swap_input_support = true,
>   	.dimension_mask = HPW_MASK,
>   	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>   	.limit = &mtk_dpi_limit,
>   };
>   




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
