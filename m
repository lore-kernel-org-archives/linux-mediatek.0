Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF3DC282DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Mar 2025 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2m1f1Q0Xp3yYYFi1aHZoS/0l4HxK86VOxEt75O7eedQ=; b=xHMRrn09nyIbHhYrwclIusRaFI
	JJD7T8KqWwoacr3Fi2q5rsMhfNhgunw4UxHBqkpG+7l7BaEnllxYoE0wHoKXsMnX3zYzFxd1ByPhb
	9jwGH/hQKp5vw6/hEIvFw9TucYj6SACyC+6gP6wW9BjxUFsvEDqBGcgppBjxLPgc80T/jDAQglF4F
	/Yd/VUM15bGNmqkQZJaKg1L52TTWCnugfsF/Wfgcydum1udOAy3lFCgg+5W5Abf+ZqUZe7SsONqSe
	UkUcWJz8ndJ1PeO6ik4xkUzCXFOA3TMn+Hex6qCw5qpuUuq3JcNa9JytpucN/VfXteU+8userYfpD
	NtuTcKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfQi-00000003HlH-1jBk;
	Mon, 10 Mar 2025 15:52:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treyM-00000003AEz-2uN9;
	Mon, 10 Mar 2025 15:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741620197;
	bh=FsrNob6nsYTinqMDLQnwxWB5JuebUVtbm6f9dPHEPmw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ezMjG42PQoCUvWJwyE1etSVSl2pOVbYTTFBd+tpINRFgO3taiRrn8PtdywMYwaP4x
	 aTwgNJu0MysIGfmJ2Y8sHI64TdtqS5u8bua/d9GF5qTejC+S0qNN5kMlpPQ1fTWlp/
	 NoJJ2+vAM5BdzXw42ug76qMeVZz3GIDlHBhIa5+Si+sSKb+yL1/eypZ/4pm2eYfNaP
	 0slTx2WoQjntpRwnDmIYjn+6I/ng4efwbcW3w+BOM52iCIzH4UWksnoHdIe87SDUQC
	 8R4PYUlwjdJQN+7k76aBvSvQD1IDaLwLSVixwpsgO0iNi0OV7SY/tXsGmptVsYu3rf
	 WCRYwVYeVW+Sg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54CA417E0649;
	Mon, 10 Mar 2025 16:23:16 +0100 (CET)
Message-ID: <b5fd1376-6abb-40c1-b3f0-238e2b0056fa@collabora.com>
Date: Mon, 10 Mar 2025 16:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] ASoC: mediatek: common: modify mtk afe common
 driver for mt8196
To: "Darren.Ye" <darren.ye@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20250307124841.23777-1-darren.ye@mediatek.com>
 <20250307124841.23777-2-darren.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250307124841.23777-2-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_082318_884352_7DAE6CA8 
X-CRM114-Status: GOOD (  25.12  )
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

Il 07/03/25 13:47, Darren.Ye ha scritto:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Export register read and write interface, add sample reate interface, and
> update the mtk_memif_set_channel interface for the mt8196 platform.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>   sound/soc/mediatek/common/mtk-afe-fe-dai.c | 30 ++++++++++++++--------
>   sound/soc/mediatek/common/mtk-afe-fe-dai.h |  6 +++++
>   sound/soc/mediatek/common/mtk-base-afe.h   | 13 ++++++++++
>   3 files changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
> index 3809068f5620..c36dae520f04 100644
> --- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
> +++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
> @@ -18,7 +18,7 @@
>   
>   #define AFE_BASE_END_OFFSET 8
>   
> -static int mtk_regmap_update_bits(struct regmap *map, int reg,
> +int mtk_regmap_update_bits(struct regmap *map, int reg,
>   			   unsigned int mask,
>   			   unsigned int val, int shift)
>   {
> @@ -26,13 +26,16 @@ static int mtk_regmap_update_bits(struct regmap *map, int reg,
>   		return 0;
>   	return regmap_update_bits(map, reg, mask << shift, val << shift);
>   }
> +EXPORT_SYMBOL(mtk_regmap_update_bits);

Please don't export this function: it's not the greatest, `reg` should be unsigned
and so it should the shift - it's kinda wrong in principle, and you can simply use
regmap_update_bits() directly in your drivers. Please, do so.

> +
> +int mtk_regmap_write(struct regmap *map, int reg, unsigned int val)
>   
> -static int mtk_regmap_write(struct regmap *map, int reg, unsigned int val)
>   {
>   	if (reg < 0)
>   		return 0;
>   	return regmap_write(map, reg, val);
>   }
> +EXPORT_SYMBOL(mtk_regmap_write);
>   

Same here

>   int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
>   		       struct snd_soc_dai *dai)
> @@ -459,8 +462,12 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
>   	struct mtk_base_afe_memif *memif = &afe->memif[id];
>   	unsigned int mono;
>   
> -	if (memif->data->mono_shift < 0)
> -		return 0;
> +	dev_info(afe->dev, "%s(), id: %d, channel: %d\n", __func__, id, channel);

If you really really really need this print, it's for debugging, so this should be
dev_dbg() instead... but otherwise just delete it.

> +	mono = memif->data->mono_invert ^ (channel == 1);
> +
> +	if (memif->data->mono_shift > 0)
> +		mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
> +				       0x1, mono, memif->data->mono_shift);
>   
>   	if (memif->data->quad_ch_mask) {
>   		unsigned int quad_ch = (channel == 4) ? 1 : 0;
> @@ -470,11 +477,6 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
>   				       quad_ch, memif->data->quad_ch_shift);
>   	}
>   
> -	if (memif->data->mono_invert)
> -		mono = (channel == 1) ? 0 : 1;
> -	else
> -		mono = (channel == 1) ? 1 : 0;
> -
>   	/* for specific configuration of memif mono mode */
>   	if (memif->data->int_odd_flag_reg)
>   		mtk_regmap_update_bits(afe->regmap,
> @@ -482,8 +484,14 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
>   				       1, mono,
>   				       memif->data->int_odd_flag_shift);
>   
> -	return mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
> -				      1, mono, memif->data->mono_shift);

Don't break older platforms. You're removing functionality here.

> +	if (memif->data->ch_num_maskbit) {
> +		dev_info(afe->dev, "%s(), set ch num id: %d, channel: %d\n", __func__, id, channel);

Same comment applies (plus, this is a double print, even worse).

> +		mtk_regmap_update_bits(afe->regmap, memif->data->ch_num_reg,
> +				       memif->data->ch_num_maskbit,
> +				       channel, memif->data->ch_num_shift);
> +	}
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL_GPL(mtk_memif_set_channel);
>   
> diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.h b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
> index b6d0f2b27e86..64b10ccba291 100644
> --- a/sound/soc/mediatek/common/mtk-afe-fe-dai.h
> +++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
> @@ -12,7 +12,13 @@
>   struct snd_soc_dai_ops;
>   struct mtk_base_afe;
>   struct mtk_base_afe_memif;
> +struct mtk_base_irq_data;
>   
> +int mtk_regmap_update_bits(struct regmap *map, int reg,
> +			   unsigned int mask, unsigned int val,
> +			   int shift);
> +int mtk_regmap_write(struct regmap *map, int reg,
> +		     unsigned int val);

No, don't export these. Use regmap directly.

Regards,
Angelo


