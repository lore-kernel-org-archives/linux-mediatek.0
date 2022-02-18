Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4868BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+IR1aZusQcmYAoLIxEquEArlcK9wNvS1y31JxKGjYE=; b=FuWGrYGAChxzRM
	N6bdw2LqYcEw04m3fjVk63tpN4QWywLk2M3hUsuycdyNSWjDULllFoGhuhQJ3fdhgf1uxuY/E7WS+
	mZxvnL6Ch9sJih1a/d6DxM9dxdjbdam17j+dC+it3Q4gpeUIUjmdTMeUZLyDbYw6kvQi84hMOlHWw
	jOdC9sh7ktmX98aqnhxeSoEa4rFUlQrmLXLi1wo+B85rPaxKyxXYu+5XoMdYY3Dcx4v7vh7rsbLeE
	vJZ26TOPfKtcU3KmCDHOGq1yietIrmbIbOh/VmeETDZWuH5ft4cg92zS756uik4pVqX1Gv60L+Keh
	BMgKZniuVzAF+kFvDULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4fi-00Ermd-7d; Fri, 18 Feb 2022 14:55:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4eO-00Er4b-59; Fri, 18 Feb 2022 14:54:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A26911F46BA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645196062;
 bh=aJ3xIH2fN9ae3SbsE2VP6ml3rhW+Z3DMmyq7epfAAqc=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=WErC1atFCUoRx9/I6wMe2kPsGiJj6UAjtjLC3qrBKFMFKqo5v8jb5sh1yS6p1mIbR
 E4ThhBytCjU9fAMb9ZGmn6fuALC7GMtdvqXkFV/cKpvhntjFJON8WVVbVapC53dFof
 fHQ2QFvRHH+4YG+71qSaFiRI81GS3ls7RXCCSIAkTyy12dL3CSQbfmuaTMrW8g0cgk
 FN2bnL0sctrZ2Tw3hsg07b4ukcAWXgB6xrOOIbe3H8/e6Np9IzHT2DWHCXDqUXHTGo
 63dQ9Jp6ZqGxKoqNkCUdd5dT7Y+BeUq72dLV58RhItGoZ6WtZtjYbYGV9RTcXvGUHs
 BuOcPl9mAQzrg==
Message-ID: <a624679f-3b87-ff07-8983-982bbd983e94@collabora.com>
Date: Fri, 18 Feb 2022 15:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [v2 05/17] ASoC: mediatek: mt8186: support hw gain in platform
 driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, p.zabel@pengutronix.de,
 geert+renesas@glider.be, trevor.wu@mediatek.com, tzungbi@google.com,
 aaronyu@google.com, zhangqilong3@huawei.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-6-jiaxin.yu@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220217134205.15400-6-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065424_524772_4B460225 
X-CRM114-Status: GOOD (  18.94  )
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

Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> This path adds mt8186 hw gain dai driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   .../soc/mediatek/mt8186/mt8186-dai-hw-gain.c  | 245 ++++++++++++++++++
>   1 file changed, 245 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
> 
> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c b/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
> new file mode 100644
> index 000000000000..796878989727
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// MediaTek ALSA SoC Audio DAI HW Gain Control
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> +
> +#include <linux/regmap.h>
> +#include "mt8186-afe-common.h"
> +#include "mt8186-interconnection.h"
> +
> +#define HW_GAIN_1_EN_W_NAME "HW GAIN 1 Enable"
> +#define HW_GAIN_2_EN_W_NAME "HW GAIN 2 Enable"
> +
> +/* dai component */
> +static const struct snd_kcontrol_new mtk_hw_gain1_in_ch1_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH1 Switch", AFE_CONN13_1,
> +				    I_CONNSYS_I2S_CH1, 1, 0),
> +};
> +
> +static const struct snd_kcontrol_new mtk_hw_gain1_in_ch2_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH2 Switch", AFE_CONN14_1,
> +				    I_CONNSYS_I2S_CH2, 1, 0),
> +};
> +
> +static const struct snd_kcontrol_new mtk_hw_gain2_in_ch1_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN15,
> +				    I_ADDA_UL_CH1, 1, 0),
> +};
> +
> +static const struct snd_kcontrol_new mtk_hw_gain2_in_ch2_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN16,
> +				    I_ADDA_UL_CH2, 1, 0),
> +};
> +
> +static int mtk_hw_gain_event(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol,
> +			     int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	unsigned int gain_cur;
> +	unsigned int gain_con1;
> +
> +	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
> +		__func__, w->name, event);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		if (strcmp(w->name, HW_GAIN_1_EN_W_NAME) == 0) {
> +			gain_cur = AFE_GAIN1_CUR;
> +			gain_con1 = AFE_GAIN1_CON1;
> +		} else {
> +			gain_cur = AFE_GAIN2_CUR;
> +			gain_con1 = AFE_GAIN2_CON1;
> +		}
> +
> +		/* let hw gain ramp up, set cur gain to 0 */
> +		regmap_update_bits(afe->regmap,
> +				   gain_cur,
> +				   AFE_GAIN1_CUR_MASK_SFT,
> +				   0);

This fits in one line (86 columns is ok)

> +
> +		/* set target gain to 0 */
> +		regmap_update_bits(afe->regmap,
> +				   gain_con1,
> +				   GAIN1_TARGET_MASK_SFT,
> +				   0);

Same here.

> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dapm_widget mtk_dai_hw_gain_widgets[] = {
> +	/* inter-connections */
> +	SND_SOC_DAPM_MIXER("HW_GAIN1_IN_CH1", SND_SOC_NOPM, 0, 0,
> +			   mtk_hw_gain1_in_ch1_mix,
> +			   ARRAY_SIZE(mtk_hw_gain1_in_ch1_mix)),
> +	SND_SOC_DAPM_MIXER("HW_GAIN1_IN_CH2", SND_SOC_NOPM, 0, 0,
> +			   mtk_hw_gain1_in_ch2_mix,
> +			   ARRAY_SIZE(mtk_hw_gain1_in_ch2_mix)),
> +	SND_SOC_DAPM_MIXER("HW_GAIN2_IN_CH1", SND_SOC_NOPM, 0, 0,
> +			   mtk_hw_gain2_in_ch1_mix,
> +			   ARRAY_SIZE(mtk_hw_gain2_in_ch1_mix)),
> +	SND_SOC_DAPM_MIXER("HW_GAIN2_IN_CH2", SND_SOC_NOPM, 0, 0,
> +			   mtk_hw_gain2_in_ch2_mix,
> +			   ARRAY_SIZE(mtk_hw_gain2_in_ch2_mix)),
> +
> +	SND_SOC_DAPM_SUPPLY(HW_GAIN_1_EN_W_NAME,
> +			    AFE_GAIN1_CON0, GAIN1_ON_SFT, 0,
> +			    mtk_hw_gain_event,
> +			    SND_SOC_DAPM_PRE_PMU),
> +
> +	SND_SOC_DAPM_SUPPLY(HW_GAIN_2_EN_W_NAME,
> +			    AFE_GAIN2_CON0, GAIN2_ON_SFT, 0,
> +			    mtk_hw_gain_event,
> +			    SND_SOC_DAPM_PRE_PMU),
> +
> +	SND_SOC_DAPM_INPUT("HW Gain 1 Out Endpoint"),
> +	SND_SOC_DAPM_INPUT("HW Gain 2 Out Endpoint"),
> +	SND_SOC_DAPM_OUTPUT("HW Gain 1 In Endpoint"),
> +};
> +
> +static const struct snd_soc_dapm_route mtk_dai_hw_gain_routes[] = {
> +	{"HW Gain 1 In", NULL, "HW_GAIN1_IN_CH1"},
> +	{"HW Gain 1 In", NULL, "HW_GAIN1_IN_CH2"},
> +	{"HW Gain 2 In", NULL, "HW_GAIN2_IN_CH1"},
> +	{"HW Gain 2 In", NULL, "HW_GAIN2_IN_CH2"},
> +
> +	{"HW Gain 1 In", NULL, HW_GAIN_1_EN_W_NAME},
> +	{"HW Gain 1 Out", NULL, HW_GAIN_1_EN_W_NAME},
> +	{"HW Gain 2 In", NULL, HW_GAIN_2_EN_W_NAME},
> +	{"HW Gain 2 Out", NULL, HW_GAIN_2_EN_W_NAME},
> +
> +	{"HW Gain 1 In Endpoint", NULL, "HW Gain 1 In"},
> +	{"HW Gain 1 Out", NULL, "HW Gain 1 Out Endpoint"},
> +	{"HW Gain 2 Out", NULL, "HW Gain 2 Out Endpoint"},
> +};
> +
> +static const struct snd_kcontrol_new mtk_hw_gain_controls[] = {
> +	SOC_SINGLE("HW Gain 1 Volume", AFE_GAIN1_CON1,
> +		   GAIN1_TARGET_SFT, GAIN1_TARGET_MASK, 0),
> +	SOC_SINGLE("HW Gain 2 Volume", AFE_GAIN2_CON1,
> +		   GAIN2_TARGET_SFT, GAIN2_TARGET_MASK, 0),
> +};
> +
> +/* dai ops */
> +static int mtk_dai_gain_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	unsigned int rate = params_rate(params);
> +	unsigned int rate_reg = mt8186_rate_transform(afe->dev, rate, dai->id);
> +
> +	dev_info(afe->dev, "%s(), id %d, stream %d, rate %d\n",
> +		 __func__,
> +		 dai->id,
> +		 substream->stream,
> +		 rate);

This should be:
	dev_info(afe->dev, "%s(), id %d, stream %d, rate %d\n",

		 __func__, dai->id, substream->stream, rate);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
