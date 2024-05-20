Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1055EC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uex4XCNgTSmerEHfH09Eq+Hqgh1bTavfU/Ri/xbeGoA=; b=C90/s4F3NQiuXN7Kaop0AwYj6q
	Lmt+NWz8NabKngR3ucohnoGckb6Ejr3t44s0mSKNRuBmvQUVoUFF6+epGISjdN/SYcTTxoqqh5xBA
	yhuQGNKafPLH/1/J9UqQXV8sr+ZgVaSnHauozRgIKhIXhsB7ERIowR4pxA4cTbamMQZYaHnSS+ceH
	dpLuFsayQ7/9WXMxFR6UHlk0CZF/FM6rZchI8HagO9rZBsxH4gVRTKwCOItNKwZxdjC2FFr9U3t1v
	FbOAkzlXNa2fvHj8FR/PT5DVAEJ/Yul3PIJn2cF5M94EsrJDe+9Qyv9R3HDAY7O57QyHO7QsmBlz1
	U4VKt3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90Fs-0000000E93C-2yPA;
	Mon, 20 May 2024 10:28:32 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90Fp-0000000E91T-03Qq;
	Mon, 20 May 2024 10:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716200907;
	bh=bRKzyqcLlrX4+PGCOXat0+khakBlpiwK24ehTi1z8yM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oH2UqPcVf6XjzjCSoqpkEqHstieql7cPzcsJsWmHIXOChB7KUapE0PdJGKSIRy41J
	 CXWTBi+k2jE8u/cFQL2b1EM+QEJu/jIQU5dsC83XXrIuCf5NL4M1xrLnzgvK/9VpGp
	 0lFlw7NDXoq4SjbEIn96ZNluNpPQiYuz3cPKdEmlRIQudJQHUNE39e9LPi6GjaMJ00
	 v9BjDdn3thsHM3OCvIrScN/zKKGJNbU/t227ZVc4FUrDP1Lia4DyfgRxTyodCfIHVH
	 1Xei0WncqWb5WcAePLRDmSSLDNSV4FAo3FQFR6Q78RqO24etRNvRJCzXx/tIRPj94M
	 8r5mmvtLAMauw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2E64137821B2;
	Mon, 20 May 2024 10:28:26 +0000 (UTC)
Message-ID: <08b60894-0023-4ad7-9c6b-b1e99b1b4cd8@collabora.com>
Date: Mon, 20 May 2024 12:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/16] ASoC: mediatek: mt8365: Add PCM DAI support
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-9-082b22186d4c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v4-9-082b22186d4c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_032829_224156_73087530 
X-CRM114-Status: GOOD (  17.04  )
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

Il 26/04/24 19:22, Alexandre Mergnat ha scritto:
> Add Pulse Code Modulation Device Audio Interface support for MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/mt8365/mt8365-dai-pcm.c | 293 +++++++++++++++++++++++++++++
>   1 file changed, 293 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
> new file mode 100644
> index 000000000000..a5de47c69620
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek 8365 ALSA SoC Audio DAI PCM Control
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + * Authors: Jia Zeng <jia.zeng@mediatek.com>
> + *          Alexandre Mergnat <amergnat@baylibre.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm_params.h>
> +#include "mt8365-afe-clk.h"
> +#include "mt8365-afe-common.h"
> +
> +struct mt8365_pcm_intf_data {
> +	bool slave_mode;
> +	bool lrck_inv;
> +	bool bck_inv;
> +	unsigned int format;
> +};
> +
> +/* DAI Drivers */
> +
> +static void mt8365_dai_enable_pcm1(struct mtk_base_afe *afe)
> +{
> +	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
> +			   PCM_INTF_CON1_EN, PCM_INTF_CON1_EN);
> +}
> +
> +static void mt8365_dai_disable_pcm1(struct mtk_base_afe *afe)
> +{
> +	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
> +			   PCM_INTF_CON1_EN, 0x0);
> +}
> +
> +static int mt8365_dai_configure_pcm1(struct snd_pcm_substream *substream,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	struct mt8365_pcm_intf_data *pcm_priv = afe_priv->dai_priv[MT8365_AFE_IO_PCM1];
> +	bool slave_mode = pcm_priv->slave_mode;
> +	bool lrck_inv = pcm_priv->lrck_inv;
> +	bool bck_inv = pcm_priv->bck_inv;
> +	unsigned int fmt = pcm_priv->format;
> +	unsigned int bit_width = dai->sample_bits;
> +	unsigned int val = 0;
> +
> +	if (!slave_mode) {
> +		val |= PCM_INTF_CON1_MASTER_MODE |
> +		       PCM_INTF_CON1_BYPASS_ASRC;
> +
> +		if (lrck_inv)
> +			val |= PCM_INTF_CON1_SYNC_OUT_INV;
> +		if (bck_inv)
> +			val |= PCM_INTF_CON1_BCLK_OUT_INV;
> +	} else {
> +		val |= PCM_INTF_CON1_SLAVE_MODE;
> +
> +		if (lrck_inv)
> +			val |= PCM_INTF_CON1_SYNC_IN_INV;
> +		if (bck_inv)
> +			val |= PCM_INTF_CON1_BCLK_IN_INV;
> +
> +		// TODO: add asrc setting

/* TODO ... */

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



