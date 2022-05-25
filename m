Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46575C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmIKNgnydD1mOhkEe/vlgUyvNNiI844IHZJBeJjF5eg=; b=eBlK1txy2V9UzB
	ezhcuTc7xbNGhK6hBIHiedcECyFDZ3RZi9qWJinEVYOIZNdM/fDL8OKdqfo5ickYxhiChBz26+Aok
	3ploz1LSDBm04SYItVKTvKv/AK1YSSqPiA0USrm7AvwXVM1HuEjZEUqPYpAmiQncxosA5CXy2gA86
	lJmhSQ75Xmry73P1CfRy7DWL2X/mLOiO6AaBagftlIlmpVZAD2kGIysTDBmV+umib05IczD1sFCqQ
	iRtiJCxxSnhr+YS50cghb1C0yxnpb/1vGIHFTTG+uJkBarEdU8LGKprlN+o2r0sXnUjD2FvxDLQk0
	ojjPDvMPMWdFemVBAPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntpiE-00B2Dr-Bi; Wed, 25 May 2022 12:02:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntphz-00B28V-JV; Wed, 25 May 2022 12:01:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 22D861F44D7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653480101;
	bh=F1F4jhbrNEQ3CCy7KGKBR+is9F4rhkQOEU0CQ1t/4vI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZaUKr/IggQ5jzu5IdAvmbRfj072K4RQwepDOrvHjQ9MwkmtGkxO2gtj7YfrKtV3HO
	 qnfdRjJwuNxI+0Ir0hKlxSvSwCtBIawpDNThcWifoltYpNGG8lse1rhjNeCDFNoM3V
	 Xl9tx06OUvZMtWhT8Y5uvNWkRKwBZ1gKHqayBiXuDAmwEq7G+2rZJI/opM1w4EPHma
	 XMOImZk4iTV/PPRbpu6WyQdtbYTK1Odd4W0DoCFgUuIL2tLd+rqpeSwKMgPD1hbSPc
	 GP6tLFP7Q01XExVCL8+bMWopFkWugUCveMrA3G2fkldDmceunmU97OQMpn4gfuSuMY
	 ibmA0HdwzZW1Q==
Message-ID: <4c19d5fb-1e45-9149-4208-5d848eeb7565@collabora.com>
Date: Wed, 25 May 2022 14:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v10 03/21] drm/edid: Convert cea_sad helper struct to
 kernelDoc
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-4-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523104758.29531-4-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_050147_839403_E93D1506 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   include/drm/drm_edid.h | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..37c420423625 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -359,12 +359,18 @@ struct edid {
>   
>   #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
>   
> -/* Short Audio Descriptor */
> +/**
> + * struct cea_sad - Short Audio Descriptor.

Perhaps....

* struct cea_sad - CEA Short Audio Descriptor

...but that's relative to personal liking and nothing else, it's also fine as
it is, if you like it more as it is. The ball is yours :-P

Regardless of any choice about changing the description or not:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> + * @format: See HDMI_AUDIO_CODING_TYPE_*.
> + * @channels: max number of channels - 1.
> + * @freq: See CEA_SAD_FREQ_*.
> + * @byte2: meaning depends on format.
> + */
>   struct cea_sad {
>   	u8 format;
> -	u8 channels; /* max number of channels - 1 */
> +	u8 channels;
>   	u8 freq;
> -	u8 byte2; /* meaning depends on format */
> +	u8 byte2;
>   };
>   
>   struct drm_encoder;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
