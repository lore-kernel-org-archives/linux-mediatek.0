Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36B4C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 11:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6vLGeAzm+Ha7iruyKOsGbGZD+7kUPvDgcPDcBS5lXg=; b=P5k5vCBIw9k86C4v17uXA0lVgn
	isyIAUWfaJhwfAc9Nw9V3i7kzbhi2+Y+c75GdMOuQHM5xPK2mL19LXAVh+Wa61v/uWIHSyP/hVZFR
	tpLirwB18tqEpe7EhGLcm7xqy87wwO+TqTUpQZqObpylJ1obfDN0Jp1IdMp7TkUpfnF4BSh4nUPEt
	Ggtdh3ihzLUZzlGYffbdLSzrEOVfWinu30rezG/Jz7KHmJA9RKhLnZXdZtI8/+hppQ/74s+mUSS6W
	AMKhdEprC7GsND9vyXT2O+BirQyRlUU/9nsb9oSD7jxX93bK/g5Um5X4eETkPWmkz20Q6C0HOPYhZ
	BmPYdHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os0BK-00E6we-Vv; Mon, 07 Nov 2022 11:20:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os0Az-00E6m9-Vk; Mon, 07 Nov 2022 11:20:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B6693660239F;
	Mon,  7 Nov 2022 11:20:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667820024;
	bh=+5Huk55iq4Plx52+yZClp0DhD3oOu5tBVt54hs+t8xY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G3lKnascRvbEDCDGxRQEXRx+38Te7xbje/SdqqKVMsWC+tpsomycebcMeFRhkpYFG
	 GkR253l6CMfLGzU86DoQzcrSOfuNRwPm6vtOdzDr4rhEavDgoYcfV9ki/6MhNOonM9
	 PbnfEe7UHfHF/thyXAKD+zWjv+HSSIJ2cIMxjLjLHbZ/rYY4UrqjP8BbAJ8RGSH16k
	 UI+YmFeCJ/hqa8gNRTkCisWSD7pC+HUu74kQSZd1YuI+Iu8rlKHWrSPQF4TvP+tBxt
	 okiyNmzlEY4J7WpUOVoiOx7oWQcQh7blqSHEmuNJJf3Cv6+nDC3p+FO4CSidCB3pXm
	 jmEqaCqSzyuWw==
Message-ID: <05183178-32cb-98c0-4fcb-d5e78874e6c4@collabora.com>
Date: Mon, 7 Nov 2022 12:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 03/12] drm/mediatek: hdmi: use a regmap instead of
 iomem
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 mac.shen@mediatek.com, linux-phy@lists.infradead.org
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-3-a803f2660127@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v3-3-a803f2660127@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_032026_196880_DE72D827 
X-CRM114-Status: GOOD (  16.43  )
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

Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
> To prepare support for newer chips that need to share their address
> range with a dedicated ddc driver, use a regmap.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 43 +++++++++++--------------------------
>   1 file changed, 13 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 4c80b6896dc3..9b02b30a193a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -171,7 +171,7 @@ struct mtk_hdmi {
>   	u32 ibias_up;
>   	struct regmap *sys_regmap;
>   	unsigned int sys_offset;
> -	void __iomem *regs;
> +	struct regmap *regs;
>   	enum hdmi_colorspace csp;
>   	struct hdmi_audio_param aud_param;
>   	bool audio_enable;
> @@ -187,44 +187,29 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
>   	return container_of(b, struct mtk_hdmi, bridge);
>   }
>   
> -static u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
> +static int mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset, u32 *val)
>   {
> -	return readl(hdmi->regs + offset);
> +	return regmap_read(hdmi->regs, offset, val);
>   }
>   
>   static void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
>   {
> -	writel(val, hdmi->regs + offset);
> +	regmap_write(hdmi->regs, offset, val);
>   }
>   
>   static void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)

You don't need these functions anymore, as these are now simply wrapping
regmap calls, hence these don't contain any "real" logic anymore.

Please remove them and use the regmap API directly.

Thanks,
Angelo


