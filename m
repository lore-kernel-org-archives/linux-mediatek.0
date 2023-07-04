Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D7CEB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 08:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRIi8ghiiFqm8EXTcWBAaTdw7PSfHpRW1R2MsE3lTJI=; b=T0KUFMH0sFRvC9WnfrmZT4GmN4
	t7hKt9sme6trMBCQzm8ReZnJ/WUe+NYRmNTTX3SBtJFrCDA5MEHuryuG3H0wYrlbP94c/YGwW9Y73
	MUazgGB5X8lpEVOM5tfD/aePa3W/YitYrrxxlkb7jDPivXCQhHodiv3H+9cWjv1fBgy3p99jYCOU3
	re4u3nBV9Rn3+CWBsnAEEsM3VG2VRU6OnaWp0WKaCsRn69x4vRcMbriOeEWUjL0vZC5Mk4bwmkTp6
	cN2EhyGZ+JErgT5cexXrqRFHqk9ihVeMK+LE+9+emwLwoHWFZXLKpH/Hzdgt6tCkvGmbUKy/2nPBf
	DQDxAX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbrx-00CdmJ-0n;
	Tue, 04 Jul 2023 08:58:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbrt-00Cdk9-1p;
	Tue, 04 Jul 2023 08:58:43 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 606946606ED1;
	Tue,  4 Jul 2023 09:58:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688461118;
	bh=SjGu7YG2MyYo3NcWANYQRJtPw6x21qgJpQDVq9sIg40=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=diAkKC0mRWuRsit2iQeQ1D7RhtTmGuMxonq0MZHRcsLjqWkMY1hJsxU6qJ9VhNSok
	 ptnc7NjHpaZqq+JTZkG5HjlsxOUzg1Ta4Xr7ESYfQmosDTrV8RKiyIHgQpQMsV7VXd
	 Fge0rqRoi8cbmWe6AaPJn0qExzySMJAEaBrHtmN8+Jf2VFE0j3rz/TjLi5SCMy5NV6
	 qE28q0WmNiFcm8zXJa0UleCiSqxtCTlFLsNSgLp2fvWWfvx+0Tq3n+kMcntt8roYr7
	 BRR31fFWm81RnKdxJZPIzCd8iD8k3WXGPxceqdjEevrlyqwZfv43+1rsGPdahIfPQL
	 pPxEOpecAHPSQ==
Message-ID: <255bb946-2198-93e7-7f38-7b8e00f7677f@collabora.com>
Date: Tue, 4 Jul 2023 10:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/7] ASoC: mediatek: mt7986: support etdm in platform
 driver
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Ren Zhijie <renzhijie2@huawei.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230626023501.11120-1-maso.huang@mediatek.com>
 <20230626023501.11120-4-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230626023501.11120-4-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_015841_886335_E96D9CAC 
X-CRM114-Status: GOOD (  20.37  )
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

Il 26/06/23 04:34, Maso Huang ha scritto:
> Add mt7986 etdm dai driver support.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 421 ++++++++++++++++++++
>   1 file changed, 421 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
> 
> diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
> new file mode 100644
> index 000000000000..672deb59ea46
> --- /dev/null
> +++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
> @@ -0,0 +1,421 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MediaTek ALSA SoC Audio DAI eTDM Control
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Vic Wu <vic.wu@mediatek.com>
> + *         Maso Huang <maso.huang@mediatek.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm_params.h>
> +#include "mt7986-afe-clk.h"
> +#include "mt7986-afe-common.h"
> +#include "mt7986-reg.h"
> +
> +enum {
> +	HOPPING_CLK = 0,
> +	APLL_CLK = 1,
> +};
> +
> +enum {
> +	MTK_DAI_ETDM_FORMAT_I2S = 0,
> +	MTK_DAI_ETDM_FORMAT_DSPA = 4,
> +	MTK_DAI_ETDM_FORMAT_DSPB = 5,
> +};
> +
> +enum {
> +	ETDM_IN5 = 2,
> +	ETDM_OUT5 = 10,
> +};
> +
> +enum {
> +	MTK_ETDM_RATE_8K = 0,
> +	MTK_ETDM_RATE_12K = 1,
> +	MTK_ETDM_RATE_16K = 2,
> +	MTK_ETDM_RATE_24K = 3,
> +	MTK_ETDM_RATE_32K = 4,
> +	MTK_ETDM_RATE_48K = 5,
> +	MTK_ETDM_RATE_96K = 7,
> +	MTK_ETDM_RATE_192K = 9,
> +	MTK_ETDM_RATE_11K = 16,
> +	MTK_ETDM_RATE_22K = 17,
> +	MTK_ETDM_RATE_44K = 18,
> +	MTK_ETDM_RATE_88K = 19,
> +	MTK_ETDM_RATE_176K = 20,
> +};
> +
> +struct mtk_dai_etdm_priv {
> +	bool bck_inv;
> +	bool lrck_inv;
> +	bool slave_mode;
> +	unsigned int format;
> +};
> +
> +static unsigned int mt7986_etdm_rate_transform(struct device *dev,
> +					unsigned int rate)

Please either fix indentation or just do it in one line, 86 columns are ok.

> +{
> +	switch (rate) {
> +	case 8000:
> +		return MTK_ETDM_RATE_8K;
> +	case 11025:
> +		return MTK_ETDM_RATE_11K;
> +	case 12000:
> +		return MTK_ETDM_RATE_12K;
> +	case 16000:
> +		return MTK_ETDM_RATE_16K;
> +	case 22050:
> +		return MTK_ETDM_RATE_22K;
> +	case 24000:
> +		return MTK_ETDM_RATE_24K;
> +	case 32000:
> +		return MTK_ETDM_RATE_32K;
> +	case 44100:
> +		return MTK_ETDM_RATE_44K;
> +	case 48000:
> +		return MTK_ETDM_RATE_48K;
> +	case 88200:
> +		return MTK_ETDM_RATE_88K;
> +	case 96000:
> +		return MTK_ETDM_RATE_96K;
> +	case 176400:
> +		return MTK_ETDM_RATE_176K;
> +	case 192000:
> +		return MTK_ETDM_RATE_192K;
> +	default:
> +		dev_warn(dev, "%s(), rate %u invalid, use %d!!!\n",

s/use/using/g

> +			 __func__, rate, MTK_ETDM_RATE_48K);
> +		return MTK_ETDM_RATE_48K;
> +	}
> +}
> +
> +static int get_etdm_wlen(unsigned int bitwidth)
> +{
> +	return bitwidth <= 16 ? 16 : 32;
> +}
> +
> +/* dai component */
> +/* interconnection */
> +
> +static const struct snd_kcontrol_new o124_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("I032_Switch", AFE_CONN124_1, 0, 1, 0),
> +};
> +
> +static const struct snd_kcontrol_new o125_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("I033_Switch", AFE_CONN125_1, 1, 1, 0),
> +};
> +
> +static const struct snd_soc_dapm_widget mtk_dai_etdm_widgets[] = {
> +
> +	/* DL */
> +	SND_SOC_DAPM_MIXER("I150", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_MIXER("I151", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	/* UL */
> +	SND_SOC_DAPM_MIXER("O124", SND_SOC_NOPM, 0, 0,
> +			   o124_mix, ARRAY_SIZE(o124_mix)),

Fits in one line.

> +	SND_SOC_DAPM_MIXER("O125", SND_SOC_NOPM, 0, 0,
> +			   o125_mix, ARRAY_SIZE(o125_mix)),

This one too.

> +};
> +
> +static const struct snd_soc_dapm_route mtk_dai_etdm_routes[] = {
> +	{"I150", NULL, "ETDM Capture"},
> +	{"I151", NULL, "ETDM Capture"},
> +	{"ETDM Playback", NULL, "O124"},
> +	{"ETDM Playback", NULL, "O125"},
> +	{"O124", "I032_Switch", "I032"},
> +	{"O125", "I033_Switch", "I033"},
> +};
> +
> +/* dai ops */
> +static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +
> +	mt7986_afe_enable_clock(afe);
> +
> +	regmap_update_bits(afe->regmap, AUDIO_TOP_CON2, CLK_OUT5_PDN_MASK,
> +			   0);
> +	regmap_update_bits(afe->regmap, AUDIO_TOP_CON2, CLK_IN5_PDN_MASK,
> +			   0);

Both do fit in one line (and others in this file).

After fixing that,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

