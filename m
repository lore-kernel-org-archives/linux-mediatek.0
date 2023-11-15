Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFE0C07548
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 09:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+ropH59cwCaFTW1H7HiJcL2YGExE5clLL5VtQhbrFQ=; b=1rCcczO82o2rak6fpzESdb9oco
	09fUUJAfb2xOCb+oH2JZxnTh+spqSdK3D/q/IO/qs7+ji1jqaTgNklavETYl1jX3R2FzC/8dyI6VZ
	7YAgZ5hcqs9Eg3pPjcXZnKDuWj2op8r4v8f/Ah+v6ReOZ/q3A8pfFgprUhUtyyxTNb2hw1QEr5HYr
	bYqFJxV2C/qHWpWsPATNwFerSCXWrUWI+hx46Q30eghDDpq/s8dOPpKkGqIAds4RDJTtMK/udH5iA
	cybUtwOCx4D3JIpbsxWMIfGGKsus1PPVE1nvk4LAMcznOQhviHHS4vlkH/Mbm7WvQpE7NBo2kABEg
	eqF/V0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Bzx-000JmT-11;
	Wed, 15 Nov 2023 09:15:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Bzu-000JkY-29
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 09:15:48 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 495F566022D0;
	Wed, 15 Nov 2023 09:15:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700039737;
	bh=nDaRx6pEZU+HVzs1GynsYneaSgUwG+u1t1pVK6uu4FM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WoMBelWD+IZYzYAHIF1aYcRbbNs9aUjKXotj76r1mONyAddaQfs1EmjKPPaCfrU6a
	 4/vSDU0yvOeoD4Gxr4WHOPAVE2ZOE7YyBBZg5Tw9h2BNhThl72coktf7n57pKcnq/2
	 8iQMGQAGIbY0b/wHzsBNNNcms0JNxlJf8cCOMUN/2YoNFL1JaBvz1qHyT4J8clIePS
	 X1pzVNSubEREAk586n7qG0FmhKRRA6tGvY7rhdFnQuF9gbMMQb+wY2sR31B6jjwtBF
	 K95FOjSTHL3J5e2rfCM+n47IUSK5in3PrZj/kRmHmWZRPR0Do/NlnJcPKTkFIXiA+P
	 Q2ZvJTSMXpI0w==
Message-ID: <1b7a6572-25cc-40c8-b8bd-a0605fd8d317@collabora.com>
Date: Wed, 15 Nov 2023 10:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] ASoC: mediatek: mt8188-mt6359: add es8326 support
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, perex@perex.cz, allen-kh.cheng@mediatek.com,
 kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com>
 <20231115090903.578438-3-zhourui@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231115090903.578438-3-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_011547_009525_F34174FB 
X-CRM114-Status: GOOD (  20.56  )
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

Il 15/11/23 10:09, Rui Zhou ha scritto:
> To use ES8326 as the codec, add a new sound card
> named mt8186_es8326.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
> ---
>   sound/soc/mediatek/Kconfig                |   1 +
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 100 +++++++++++++++++++++-
>   2 files changed, 100 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index b93d455744ab..296b434caf81 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -252,6 +252,7 @@ config SND_SOC_MT8188_MT6359
>   	select SND_SOC_NAU8315
>   	select SND_SOC_NAU8825
>   	select SND_SOC_RT5682S
> +	select SND_SOC_ES8326
>   	help
>   	  This adds support for ASoC machine driver for MediaTek MT8188
>   	  boards with the MT6359 and other I2S audio codecs.
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index 33d477cc2e54..0421debe3ce4 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -34,6 +34,8 @@
>   
>   #define NAU8825_HS_PRESENT	BIT(0)
>   #define RT5682S_HS_PRESENT	BIT(1)
> +#define ES8326_HS_PRESENT	BIT(2)
> +#define MAX98390_TWO_AMP	BIT(3)
>   /*
>    * Maxim MAX98390
>    */
> @@ -48,6 +50,11 @@
>    */
>   #define NAU8825_CODEC_DAI  "nau8825-hifi"
>   
> +/*
> + * ES8326
> + */
> +#define ES8326_CODEC_DAI  "es8326-hifi"
> +
>   #define SOF_DMA_DL2 "SOF_DMA_DL2"
>   #define SOF_DMA_DL3 "SOF_DMA_DL3"
>   #define SOF_DMA_UL4 "SOF_DMA_UL4"
> @@ -261,6 +268,17 @@ static struct snd_soc_jack_pin nau8825_jack_pins[] = {
>   	},
>   };
>   
> +static struct snd_soc_jack_pin es8326_jack_pins[] = {

This is practically the same as nau8825_jack_pins, can we please avoid duplication?

> +	{
> +		.pin    = "Headphone",
> +		.mask   = SND_JACK_HEADPHONE,
> +	},
> +	{
> +		.pin    = "Headset Mic",
> +		.mask   = SND_JACK_MICROPHONE,
> +	},
> +};
> +
>   struct mt8188_card_data {
>   	const char *name;
>   	unsigned long quirk;
> @@ -943,6 +961,71 @@ static const struct snd_soc_ops mt8188_sof_be_ops = {
>   	.hw_params = mt8188_sof_be_hw_params,
>   };
>   
> +static int mt8188_es8326_codec_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
> +	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
> +	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
> +	struct snd_soc_jack *jack = &priv->headset_jack;
> +	int ret;
> +
> +	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
> +					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
> +					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
> +					 SND_JACK_BTN_3,
> +					 jack,
> +					 es8326_jack_pins,
> +					 ARRAY_SIZE(es8326_jack_pins));
> +	if (ret) {
> +		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +	ret = snd_soc_component_set_jack(component, jack, NULL);
> +
> +	if (ret) {
> +		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
> +		return ret;
> +	}
> +

This exact code pattern is repeated already twice: once for RT5682s and once for
NAU8825. Can we please commonize it?

> +	return ret;
> +};
> +
> +static void mt8188_es8326_codec_exit(struct snd_soc_pcm_runtime *rtd)
> +{

Same for this one.

> +	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
> +
> +	snd_soc_component_set_jack(component, NULL, NULL);
> +}
> +

Regards,
Angelo


