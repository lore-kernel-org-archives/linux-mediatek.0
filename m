Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF50C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnBdFOZcvOKupagMaLBcutAFAhE4UNPsdohJ1+rSw4w=; b=2o/CF3S7bn6/bZ
	k+p7ASOz1745NndF9WVBYZFBj7Y6+scdROc7fgiCuIPnNk1zrvt+CGtKuylC0uob6z4S/c1SqenlG
	lZprd6OxT8lH87ZsDSqsN2yXSZOQtX56N9eniBS+GDezGX6KMyGPbBpT7kgM1z6IkNuVe8vz0QEVW
	wmg/tGlDQbJioa2pYJ4DbTjufqBobAiU8EZBJnaM4LGj63Awjboq01fRmt2anp+9nijUoXcA2PY98
	x2aO+HFb+jdsVcWLFAg+X58abjLQ80hWRnwpgTu/55ME385den1mxDfq6+9FuC7fubbOsxkrWlO5Z
	+l15PtlhTWvXnWL+uzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYkMp-007in7-AI; Mon, 28 Mar 2022 08:04:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYkMa-007ihr-Ns; Mon, 28 Mar 2022 08:04:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6A11F1F42F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648454668;
 bh=OgeZn3h62XRwSUZAUHSs6JjYPCvTevBe27bS/7gUpUU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RYSAAir6nrRU1Bv61iSlbrH6+U+cZjsjYqInwDj/OIUQpvqrymdIIn/bg8TvOTvun
 U7K6MQUOZmaOMEzQ2bOcq3rv7glozuTwUnHAADB55ZmlByZyawn3Oh8hklLJuEM/Fx
 F8jZNLKTAGZtBTykPIf/+nsEWBtpa7Tsp9kI05bCOHix34dlzPJzC/JZhl9dDjju0s
 XHADgeqcLyRs9PlPLGlclF5ilyASiSDqC/pggNZRefQahGSBi2D0E7klkS4cHtNhZm
 /t6CjUsFLlXSRFX2MhoHYXteDVyOGWJfhOKBmdRv9UNBkfBBGkiALXB/7UjOL0QFye
 BoNjq6IFiSFcg==
Message-ID: <0c523ad5-6a71-5c71-17b8-1f15c1860d89@collabora.com>
Date: Mon, 28 Mar 2022 10:04:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 04/22] drm/edid: Convert cea_sad helper struct to
 kernelDoc
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, airlied@linux.ie,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-5-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220327223927.20848-5-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_010432_999588_4377559D 
X-CRM114-Status: GOOD (  12.19  )
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

Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   include/drm/drm_edid.h | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..5d4d840b9904 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -359,12 +359,17 @@ struct edid {
>   
>   #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
>   
> -/* Short Audio Descriptor */

Hello Guillaume,

> +/* struct cea_sad - Short Audio Descriptor.
> +	@format: See HDMI_AUDIO_CODING_TYPE_*.
> +	@channels: max number of channels - 1.
> +	@freq: See CEA_SAD_FREQ_*.
> +	@byte2: meaning depends on format.
> +*/

I appreciate the effort, but this is not valid kerneldoc.

Please refer to https://docs.kernel.org/doc-guide/kernel-doc.html

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
