Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ayFs1hRgxFSpke5pHgBt/aPCMcTe+cXAbV6OxhIlDQ=; b=t1maKeYbnBDLcE
	b3BoRpP7DXaUmdRsl8GjE2CXt2HLuTHD7uDUcH/pi3cXmnC/MMiwhujpjet2katMQmTxR+pu47YSE
	IgQvOAUZBbjclXZS1Wx4VDb1PRMceUDkQKt9atm0U/XiC1iGtzAr6JvzxeudcSCDMnExk6Svi0ByO
	mbfoUl5/XFU4rIxA11Y0BcJsk65WtDpqgMZg1ou4tzzhTbgyOILVWPPNfg1KuLDre0hMiN18Wjg9v
	IENMWFS7pPT4Lg5DXlrbU50Xdq4hkbM+SlVvecSgf2p2V9tVWgaxZV1Nxfw5N50rM3bltwsY0++Eu
	Ny3zQ+gB+ybABoXtrTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWJhs-0087Qv-L7; Mon, 21 Mar 2022 15:12:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWJhg-0087NA-TB; Mon, 21 Mar 2022 15:12:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23EFEB81744;
 Mon, 21 Mar 2022 15:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1DBC340E8;
 Mon, 21 Mar 2022 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647875533;
 bh=PrKpKY8QnE0N8PiVT+LSfP5YvP0HN8p+1UyF5N/GqUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nZGIoPL4eXPQhAqTlxO0JXw9JOtv+HL+2arpXrhi7QOLM3NYr/bydfX9fCC8lZuJW
 /bAEmtKZ5c4phI1Bezw4VJfeeROoozKZ641TNH2vSbYFIwXDxoSAFIY01oJYCbVkty
 eXRDgT8EjiJoRixrL+kkIS1GxkHSpg8+ibFbcF8F9JqmLo75HBE5SENbeCrS7vzD36
 zZEuNvaAnD3PQuVW47pxbF+c8UhSVKS/yz1ewKwf1cKV+DIeDT6n9YY2+CbrNjoiKd
 lsSEEv6b22IPmsRhQm5UtJLvLttp++37zLoFEbjF6zuuUgIFHw6XeOP8wlrlYzXGcd
 DBIRjYdVYF/og==
Date: Mon, 21 Mar 2022 23:12:09 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com,
 angelogioacchino.delregno@collabora.com, yc.hung@mediatek.com
Subject: Re: [PATCH v3 2/6] ASoC: mediatek: mt8195: merge machine driver
Message-ID: <YjiVySElUQZnJG9C@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321072312.14972-3-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_081217_266800_FEFE7ACF 
X-CRM114-Status: GOOD (  18.99  )
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

On Mon, Mar 21, 2022 at 03:23:08PM +0800, Trevor Wu wrote:
> -config SND_SOC_MT8195_MT6359_RT1019_RT5682
> -	tristate "ASoC Audio driver for MT8195 with MT6359 RT1019 RT5682 codec"
> -	depends on I2C && GPIOLIB
> -	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
> -	select SND_SOC_MT6359
> -	select SND_SOC_RT1015P
> -	select SND_SOC_RT5682_I2C
> -	select SND_SOC_RT5682S
> -	select SND_SOC_DMIC
> -	select SND_SOC_HDMI_CODEC
> -	help
> -	  This adds ASoC driver for Mediatek MT8195 boards
> -	  with the MT6359 RT1019 RT5682 audio codec.
> -	  Select Y if you have such device.
> -	  If unsure select "N".
> -
> -config SND_SOC_MT8195_MT6359_RT1011_RT5682
> -	tristate "ASoC Audio driver for MT8195 with MT6359 RT1011 RT5682 codec"
> +config SND_SOC_MT8195_MT6359
> +	tristate "ASoC Audio driver for MT8195 with MT6359 and I2S codec"

s/codec/codecs/.

>  	help
> -	  This adds ASoC driver for Mediatek MT8195 boards
> -	  with the MT6359 RT1011 RT5682 audio codec.
> +	  This adds support for ASoC machine driver for Mediatek MT8195 
> +	  boards with the MT6359 and other I2S audio codec.

s/codec/codecs/.

> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
[...]
> +static int mt8195_rt1011_etdm_hw_params(struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai;
> +	struct snd_soc_card *card = rtd->card;
> +	int srate, i, ret = 0;
> +
> +	srate = params_rate(params);
> +
> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1011_PLL1_S_BCLK,
> +					  64 * srate, 256 * srate);
> +		if (ret < 0) {
> +			dev_err(card->dev, "codec_dai clock not set\n");
> +			return ret;
> +		}
> +
> +		ret = snd_soc_dai_set_sysclk(codec_dai,
> +					     RT1011_FS_SYS_PRE_S_PLL1,
> +					     256 * srate, SND_SOC_CLOCK_IN);
> +		if (ret < 0) {
> +			dev_err(card->dev, "codec_dai clock not set\n");
> +			return ret;
> +		}
> +	}
> +	return ret;

I guess it may be just copied from mt8195-mt6359-rt1011-rt5682.c.  However, it
is good to turn the code into a better shape.  To be clear, just return 0 here
so that the initialization can be removed.

> +static int mt8195_rt1011_init(struct snd_soc_pcm_runtime *rtd)
[...]
> +	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_rt1011_routes,
> +				      ARRAY_SIZE(mt8195_rt1011_routes));
> +
> +	if (ret)

Remove the extra blank line.

> +static int mt8195_rt1019_init(struct snd_soc_pcm_runtime *rtd)
[...]
> +	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_rt1019_routes,
> +				      ARRAY_SIZE(mt8195_rt1019_routes));
> +
> +	if (ret)

Remove the extra blank line.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
