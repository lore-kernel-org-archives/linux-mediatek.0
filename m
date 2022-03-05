Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEF2C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYqRywq//5FbMRRfZAvcSnf3MfEkqf6pX/amZShNvOs=; b=fsXtcX6qkzoCBc
	8POfcNHN2XVPi32IZyNXkTd78rjwNwgJ7DFkSReretosHIoz3xosLl/9m3aq6Nf3cnwF3l34tZYul
	v/BjW7aWVM/NlLFLM9E0JIJCTUiG10DYsZCWsn969Fd8b/icLEqFl5aSynF5cNUFem5ZySg3QN3s4
	hL4tpc1gQiDaOI4eatYPIYcruc5zZkDME4dH/lcu11z2k2zYa49jded/FjxZKgekJwTn1q89FsU0u
	q2OXWkNtBA7JM3UBrACCHcmJzDxWx0RtQhI1GegASjpSRIOl3ZSilJBfk0NFTWNqy8N+P81VwTmoL
	nBvqIlYP0JtCa1tKNk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQQFo-00D0qW-WC; Sat, 05 Mar 2022 08:59:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQQFb-00D0o4-VZ; Sat, 05 Mar 2022 08:58:58 +0000
X-UUID: 7b91dd1f9fbc49c9b60cf0c696d024f3-20220305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NWwr6J3cPBm92Ktn0U8+sTCTC3Wv2avTEDTA8nGphaM=; 
 b=cmtEZH0BFvARg67fAvLsS3cNI6I6V4sxDjS6cHM1QSmSfF8rq7dzhUBqWM4eAsiUgps4kSlZDr3wIM2Q8sWay8b0G8QnkNpwnGBU6CsX2aU0QBqm1wJe8OxwLZGaHWEiURDgbjSFkphFL6PlljMM7XE5RDM6T+HsAN24P5+uT30=;
X-UUID: 7b91dd1f9fbc49c9b60cf0c696d024f3-20220305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1839624732; Sat, 05 Mar 2022 01:58:46 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Mar 2022 00:58:44 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Mar 2022 16:58:43 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Mar 2022 16:58:42 +0800
Message-ID: <4aa814cdac002dde73fe01054c642e90b043429a.camel@mediatek.com>
Subject: Re: [v2 14/17] ASoC: mediatek: mt8186: add machine driver with
 mt6366, da7219 and max98357
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <aaronyu@google.com>, <zhangqilong3@huawei.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Sat, 5 Mar 2022 16:58:41 +0800
In-Reply-To: <70147e6f-a008-ab1a-eb07-dbb1236849b0@collabora.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-15-jiaxin.yu@mediatek.com>
 <70147e6f-a008-ab1a-eb07-dbb1236849b0@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220305_005856_097789_238F7813 
X-CRM114-Status: GOOD (  29.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-02-18 at 15:54 +0100, AngeloGioacchino Del Regno wrote:
> Il 17/02/22 14:42, Jiaxin Yu ha scritto:
> > This patch adds support for mt8186 board with mt6366, da7219 and
> > max98357.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >   .../mt8186/mt8186-mt6366-da7219-max98357.c    | 910
> > ++++++++++++++++++
> >   1 file changed, 910 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-
> > da7219-max98357.c
> > 
> > diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-
> > max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-
> > max98357.c
> > new file mode 100644
> > index 000000000000..6ba53b8d1e46
> > --- /dev/null
> > +++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
> > @@ -0,0 +1,910 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// mt8186-mt6366-da7219-max98357.c
> > +//	--  MT8186-MT6366-DA7219-MAX98357 ALSA SoC machine driver
> > +//
> > +// Copyright (c) 2022 MediaTek Inc.
> > +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > +//
> > +
> > +#include <linux/input.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <sound/pcm_params.h>
> > +#include <sound/soc.h>
> > +
> > +#include "../../codecs/da7219-aad.h"
> > +#include "../../codecs/da7219.h"
> > +#include "../../codecs/mt6358.h"
> > +#include "../common/mtk-afe-platform-driver.h"
> > +#include "mt8186-afe-common.h"
> > +#include "mt8186-afe-clk.h"
> > +#include "mt8186-afe-gpio.h"
> > +
> > +#define DA7219_CODEC_DAI "da7219-hifi"
> > +#define DA7219_DEV_NAME "da7219.5-001a"
> > +
> > +struct mt8186_mt6366_da7219_max98357_priv {
> > +	struct snd_soc_jack headset_jack, hdmi_jack;
> > +};
> > +
> > +static struct snd_soc_codec_conf mt6366_codec_conf[] = {
> > +	{
> > +		.dlc = COMP_CODEC_CONF("mt6358-sound"),
> > +		.name_prefix = "Mt6366",
> > +	},
> > +};
> > +
> > +static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +	struct mt8186_mt6366_da7219_max98357_priv *priv =
> > +		snd_soc_card_get_drvdata(rtd->card);
> > +	struct snd_soc_jack *jack = &priv->headset_jack;
> > +	struct snd_soc_component *cmpnt_codec =
> > +		asoc_rtd_to_codec(rtd, 0)->component;
> > +	int ret;
> > +
> > +	/* Enable Headset and 4 Buttons Jack detection */
> > +	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
> > +				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
> > +				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
> > +				    SND_JACK_BTN_3 | SND_JACK_LINEOUT,
> > +				    jack, NULL, 0);
> > +	if (ret) {
> > +		dev_err(rtd->dev, "Headset Jack creation failed: %d\n",
> > ret);
> > +		return ret;
> > +	}
> > +
> > +	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> > +	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
> > +	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
> > +	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
> > +
> > +	da7219_aad_jack_det(cmpnt_codec, &priv->headset_jack);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt8186_da7219_i2s_hw_params(struct snd_pcm_substream
> > *substream,
> > +				       struct snd_pcm_hw_params
> > *params)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd =
> > asoc_substream_to_rtd(substream);
> > +	struct snd_soc_dai *codec_dai;
> > +	unsigned int rate = params_rate(params);
> > +	unsigned int mclk_fs_ratio = 256;
> > +	unsigned int mclk_fs = rate * mclk_fs_ratio;
> > +	unsigned int freq;
> > +	int ret = 0, j;
> > +
> > +	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0,
> > +				     mclk_fs, SND_SOC_CLOCK_OUT);
> > +	if (ret < 0)
> > +		dev_err(rtd->dev, "failed to set cpu dai sysclk\n");
> 
> Does it really make sense to go on after this failure?
> 
> > +
> > +	for_each_rtd_codec_dais(rtd, j, codec_dai) {
> > +		if (!strcmp(codec_dai->component->name,
> > DA7219_DEV_NAME)) {
> > +			ret = snd_soc_dai_set_sysclk(codec_dai,
> > +						     DA7219_CLKSRC_MCLK
> > ,
> > +						     mclk_fs,
> > +						     SND_SOC_CLOCK_IN);
> > +			if (ret < 0)
> > +				dev_err(rtd->dev, "failed to set
> > sysclk\n");
> > +
> 
> I think that going on past this wouldn't make sense as well, as it
> may result
> in unexpected behavior... just return a failure here

Yes, it is.
> 
> > +			if ((rate % 8000) == 0)
> > +				freq = DA7219_PLL_FREQ_OUT_98304;
> > +			else
> > +				freq = DA7219_PLL_FREQ_OUT_90316;
> > +
> > +			ret = snd_soc_dai_set_pll(codec_dai, 0,
> > +						  DA7219_SYSCLK_PLL_SRM
> > ,
> > +						  0, freq);
> > +			if (ret)
> > +				dev_err(rtd->dev, "failed to start PLL:
> > %d\n",
> > +					ret);
> 
> and here
Yes, you are right.

> 
> > +		}
> > +	}
> > +
> 
> So, you've covered all failure cases already, for which, you can
> simply
> return 0 here.
Yes, it is.

> 
> > +	return ret;
> > +}
> > +
> > +static int mt8186_da7219_i2s_hw_free(struct snd_pcm_substream
> > *substream)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd =
> > asoc_substream_to_rtd(substream);
> > +	struct snd_soc_dai *codec_dai;
> > +	int ret = 0, j;
> > +
> > +	for_each_rtd_codec_dais(rtd, j, codec_dai) {
> > +		if (!strcmp(codec_dai->component->name,
> > DA7219_DEV_NAME)) {
> > +			ret = snd_soc_dai_set_pll(codec_dai,
> > +						  0,
> > DA7219_SYSCLK_MCLK, 0, 0);
> > +			if (ret < 0) {
> > +				dev_err(rtd->dev, "failed to stop PLL:
> > %d\n",
> > +					ret);
> > +				break;
> > +			}
> > +		}
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct snd_soc_ops mt8186_da7219_i2s_ops = {
> > +	.hw_params = mt8186_da7219_i2s_hw_params,
> > +	.hw_free = mt8186_da7219_i2s_hw_free,
> > +};
> > +
> > +static int mt8186_mt6366_hdmi_init(struct snd_soc_pcm_runtime
> > *rtd)
> > +{
> > +	struct snd_soc_component *cmpnt_codec =
> > +		asoc_rtd_to_codec(rtd, 0)->component;
> > +	struct mt8186_mt6366_da7219_max98357_priv *priv =
> > +		snd_soc_card_get_drvdata(rtd->card);
> > +	int ret;
> > +
> > +	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack",
> > SND_JACK_LINEOUT,
> > +				    &priv->hdmi_jack, NULL, 0);
> > +	if (ret) {
> > +		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n",
> > ret);
> > +		return ret;
> > +	}
> > +
> > +	return snd_soc_component_set_jack(cmpnt_codec, &priv-
> > >hdmi_jack, NULL);
> > +}
> > +
> > +static int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +	struct snd_soc_component *cmpnt_afe =
> > +		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
> > +	struct snd_soc_component *cmpnt_codec =
> > +		asoc_rtd_to_codec(rtd, 0)->component;
> > +	struct mtk_base_afe *afe =
> > snd_soc_component_get_drvdata(cmpnt_afe);
> > +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> > +	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
> > +	int ret;
> > +
> > +	/* set mtkaif protocol */
> > +	mt6358_set_mtkaif_protocol(cmpnt_codec,
> > +				   MT6358_MTKAIF_PROTOCOL_1);
> > +	afe_priv->mtkaif_protocol = MT6358_MTKAIF_PROTOCOL_1;
> > +
> > +	ret = snd_soc_dapm_sync(dapm);
> > +	if (ret) {
> > +		dev_info(rtd->dev, "failed to snd_soc_dapm_sync\n");
> 
> dev_err()
> 
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt8186_i2s_hw_params_fixup(struct snd_soc_pcm_runtime
> > *rtd,
> > +				      struct snd_pcm_hw_params *params)
> > +{
> > +	struct snd_interval *channels = hw_param_interval(params,
> > +		SNDRV_PCM_HW_PARAM_CHANNELS);
> > +	dev_info(rtd->dev, "%s(), fix format to 32bit\n", __func__);
> > +
> 
> dev_dbg()
> 
> > +	/* fix BE i2s channel to 2 channel */
> > +	channels->min = 2;
> > +	channels->max = 2;
> > +
> > +	/* fix BE i2s format to S32_LE, clean param mask first */
> > +	snd_mask_reset_range(hw_param_mask(params,
> > SNDRV_PCM_HW_PARAM_FORMAT),
> > +			     0, (__force unsigned
> > int)SNDRV_PCM_FORMAT_LAST);
> > +
> > +	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt8186_hdmi_i2s_hw_params_fixup(struct
> > snd_soc_pcm_runtime *rtd,
> > +					   struct snd_pcm_hw_params
> > *params)
> > +{
> > +	struct snd_interval *channels = hw_param_interval(params,
> > +		SNDRV_PCM_HW_PARAM_CHANNELS);
> > +	dev_info(rtd->dev, "%s(), fix format to 32bit\n", __func__);
> > +
> 
> dev_dbg()
> 
> > +	/* fix BE i2s channel to 2 channel */
> > +	channels->min = 2;
> > +	channels->max = 2;
> > +
> > +	/* fix BE i2s format to S24_LE, clean param mask first */
> > +	snd_mask_reset_range(hw_param_mask(params,
> > SNDRV_PCM_HW_PARAM_FORMAT),
> > +			     0, (__force unsigned
> > int)SNDRV_PCM_FORMAT_LAST);
> > +
> > +	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
> > +
> > +	return 0;
> > +}
> 

Ok, I will use this code which is really more concise.

> Besides, I would do the following instead:
> 
> static int mt8186_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> 
> 				  struct snd_pcm_hw_params *params,
> 
> 				  snd_pcm_format_t fmt)
> 
> {
> 
> 	struct snd_interval *channels = hw_param_interval(params,
> 
> 		SNDRV_PCM_HW_PARAM_CHANNELS);
> 
> 	dev_dbg(rtd->dev, "%s(), fix format to 32bit\n", __func__);
> 
> 
> 
> 	/* fix BE i2s channel to 2 channel */
> 
> 	channels->min = 2;
> 
> 	channels->max = 2;
> 
> 
> 
> 	/* fix BE i2s format to S32_LE, clean param mask first */
> 
> 	snd_mask_reset_range(hw_param_mask(params,
> SNDRV_PCM_HW_PARAM_FORMAT),
> 
> 			     0, (__force unsigned
> int)SNDRV_PCM_FORMAT_LAST);
> 
> 
> 
> 	params_set_format(params, fmt);
> 
> 
> 
> 	return 0;
> 
> }
> 
> 
> 
> static int mt8186_i2s_hw_params_fixup(struct snd_soc_pcm_runtime
> *rtd,
> 
> 				      struct snd_pcm_hw_params *params)
> 
> {
> 
> 	return mt8186_hw_params_fixup(rtd, params,
> SNDRV_PCM_FORMAT_S32_LE);
> 
> }
> 
> 
> 
> static int mt8186_hdmi_i2s_hw_params_fixup(struct snd_soc_pcm_runtime
> *rtd,
> 
> 					   struct snd_pcm_hw_params
> *params)
> 
> {
> 
> 	return mt8186_hw_params_fixup(rtd, params,
> SNDRV_PCM_FORMAT_S24_LE);
> 
> }
> 
> ... this reduces code duplication!
> 
> > +
> > +/* FE */
> > +SND_SOC_DAILINK_DEFS(playback1,
> > +		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
> > +		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
> > +		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> 
> 
> ..snip..
> 
> > +static int mt8186_mt6366_da7219_max98357_dev_probe(struct
> > platform_device *pdev)
> > +{
> > +	struct snd_soc_card *card =
> > &mt8186_mt6366_da7219_max98357_soc_card;
> > +	struct snd_soc_dai_link *dai_link;
> > +	struct mt8186_mt6366_da7219_max98357_priv *priv;
> > +	struct device_node *platform_node, *hdmi_codec;
> > +	int ret, i;
> > +
> > +	dev_info(&pdev->dev, "%s(), ++\n", __func__);
> > +
> > +	card->dev = &pdev->dev;
> > +
> > +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	platform_node = of_parse_phandle(pdev->dev.of_node,
> > +					 "mediatek,platform", 0);
> > +	if (!platform_node) {
> > +		dev_info(&pdev->dev,
> > +			 "Property 'platform' missing or invalid\n");
> 
> 	if (!platform_node)
> 		return dev_err_probe(&pdev->dev, -EINVAL,
> 				    "mediatek,platform missing or
> invalid\n");
> 
> > +		return -EINVAL;
got err_platform_node;
> > +	}
> > +
> > +	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
> > +				      "mediatek,hdmi-codec", 0);
> > +	if (!hdmi_codec) {
> > +		dev_info(&pdev->dev,
> > +			 "Property 'hdmi' missing or invalid\n");
> 
> dev_err()
> 
> > +		return -EINVAL;
> > +	}
Should I of_node_put(platform_node) befor return?

goto err_hdmi_node;


> > +
> > +	for_each_card_prelinks(card, i, dai_link) {
> > +		if (dai_link->platforms->name)
> > +			continue;
> > +
> > +		if (hdmi_codec && strcmp(dai_link->name, "I2S3") == 0)
> > {
> > +			dai_link->codecs->of_node = hdmi_codec;
> > +			dai_link->ignore = 0;
> > +		}
> > +
> > +		dai_link->platforms->of_node = platform_node;
> > +	}
> > +
> > +	snd_soc_card_set_drvdata(card, priv);
> > +
> > +	/* init gpio */
> > +	ret = mt8186_afe_gpio_init(&pdev->dev);
> > +	if (ret)
> > +		dev_info(&pdev->dev, "init gpio error\n");
> 
> dev_err() and goto end;
Yes, goto err_init_gpio and of_node_put for hdmi_codec and
platform_node.
> 
> > +
> > +	dev_info(&pdev->dev, "%s(), devm_snd_soc_register_card\n",
> > __func__);
> > +	ret = devm_snd_soc_register_card(&pdev->dev, card);
> > +	if (ret)
> > +		dev_info(&pdev->dev, "%s snd_soc_register_card fail
> > %d\n",
> > +			 __func__, ret);
> 
> dev_err_probe()
> 
> end:
> 
err_init_gpio:
> > +	of_node_put(hdmi_codec);
err_hdmi_node:
> > +	of_node_put(platform_node);
> > +
err_platform_node:
> > +	return ret;
> > +}
> > +
> > +#if IS_ENABLED(CONFIG_OF)
> > +static const struct of_device_id
> > mt8186_mt6366_da7219_max98357_dt_match[] = {
> > +	{.compatible =
> > "mediatek,mt8186_mt6366_da7219_max98357_sound",},
> > +	{}
> > +};
> > +#endif
> > +
> > +static struct platform_driver mt8186_mt6366_da7219_max98357_driver
> > = {
> > +	.driver = {
> > +		.name = "mt8186_mt6366_da7219_max98357",
> > +#if IS_ENABLED(CONFIG_OF)
> > +		.of_match_table =
> > mt8186_mt6366_da7219_max98357_dt_match,
> > +#endif
> > +		.pm = &snd_soc_pm_ops,
> > +	},
> > +	.probe = mt8186_mt6366_da7219_max98357_dev_probe,
> > +};
> > +
> > +module_platform_driver(mt8186_mt6366_da7219_max98357_driver);
> > +
> > +/* Module information */
> > +MODULE_DESCRIPTION("MT8186-MT6366-DA7219-MAX98357 ALSA SoC machine
> > driver");
> > +MODULE_AUTHOR("Jiaxin Yu <jiaxin.yu@mediatek.com>");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("mt8186_mt6366_da7219_max98357 soc card");
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
