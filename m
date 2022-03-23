Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED8DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEIhV2v6WxG7HIokGLpdgzRv8kHvbS1ZZv4We1aPSy0=; b=Qt5X4grYTTnWNC
	nZq2h495KcRy3KtzzevGMouSkB4ukKwuKJVy9nRAc0/VFgiWPg8CoFQ5BVuKNeXOi9QEH3TKBdqte
	oE4k4YG0BNbrX+ai0zCkyRAW0WEvDDbgsiIaTJObTqWpaQPcR9KJIxSdu0xiUTO5D0E0mLP1D6A5y
	8GAgXug5dfTNa3Nt9zkd9/bxsSzAytAZC83/FKEDsU0jT5wXb/kPFEe0+Bt0Y1XE6hfdC7Yr65J3x
	F8BRasrOqwvHTdttzO0Y5b9W0PKum0iJhxJKU1vc3hhohJcohp1a70BwZHRaB4su9azlowjzkJs10
	xXs8qKfQFkW7O3rWhSfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWwJJ-00D6P6-HU; Wed, 23 Mar 2022 08:25:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWwJE-00D6Mk-NR; Wed, 23 Mar 2022 08:25:40 +0000
X-UUID: 9868bce49c9f412986dd13745d99af18-20220323
X-UUID: 9868bce49c9f412986dd13745d99af18-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 926619274; Wed, 23 Mar 2022 01:25:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 01:15:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 23 Mar 2022 16:15:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 16:15:31 +0800
Message-ID: <1d3f9ddc742c8af2e4613e6e1008b4a63b33e244.camel@mediatek.com>
Subject: Re: [PATCH v3 2/6] ASoC: mediatek: mt8195: merge machine driver
From: Trevor Wu <trevor.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>, <angelogioacchino.delregno@collabora.com>,
 <yc.hung@mediatek.com>
Date: Wed, 23 Mar 2022 16:15:30 +0800
In-Reply-To: <YjiVySElUQZnJG9C@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-3-trevor.wu@mediatek.com>
 <YjiVySElUQZnJG9C@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_012536_801620_8F6CE4BB 
X-CRM114-Status: GOOD (  23.50  )
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

On Mon, 2022-03-21 at 23:12 +0800, Tzung-Bi Shih wrote:
> On Mon, Mar 21, 2022 at 03:23:08PM +0800, Trevor Wu wrote:
> > -config SND_SOC_MT8195_MT6359_RT1019_RT5682
> > -	tristate "ASoC Audio driver for MT8195 with MT6359 RT1019
> > RT5682 codec"
> > -	depends on I2C && GPIOLIB
> > -	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
> > -	select SND_SOC_MT6359
> > -	select SND_SOC_RT1015P
> > -	select SND_SOC_RT5682_I2C
> > -	select SND_SOC_RT5682S
> > -	select SND_SOC_DMIC
> > -	select SND_SOC_HDMI_CODEC
> > -	help
> > -	  This adds ASoC driver for Mediatek MT8195 boards
> > -	  with the MT6359 RT1019 RT5682 audio codec.
> > -	  Select Y if you have such device.
> > -	  If unsure select "N".
> > -
> > -config SND_SOC_MT8195_MT6359_RT1011_RT5682
> > -	tristate "ASoC Audio driver for MT8195 with MT6359 RT1011
> > RT5682 codec"
> > +config SND_SOC_MT8195_MT6359
> > +	tristate "ASoC Audio driver for MT8195 with MT6359 and I2S
> > codec"
> 
> s/codec/codecs/.

OK.
> 
> >  	help
> > -	  This adds ASoC driver for Mediatek MT8195 boards
> > -	  with the MT6359 RT1011 RT5682 audio codec.
> > +	  This adds support for ASoC machine driver for Mediatek
> > MT8195 
> > +	  boards with the MT6359 and other I2S audio codec.
> 
> s/codec/codecs/.
OK.

> 
> > diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-
> > rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> 
> [...]
> > +static int mt8195_rt1011_etdm_hw_params(struct snd_pcm_substream
> > *substream,
> > +					struct snd_pcm_hw_params
> > *params)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd =
> > asoc_substream_to_rtd(substream);
> > +	struct snd_soc_dai *codec_dai;
> > +	struct snd_soc_card *card = rtd->card;
> > +	int srate, i, ret = 0;
> > +
> > +	srate = params_rate(params);
> > +
> > +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> > +		ret = snd_soc_dai_set_pll(codec_dai, 0,
> > RT1011_PLL1_S_BCLK,
> > +					  64 * srate, 256 * srate);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "codec_dai clock not
> > set\n");
> > +			return ret;
> > +		}
> > +
> > +		ret = snd_soc_dai_set_sysclk(codec_dai,
> > +					     RT1011_FS_SYS_PRE_S_PLL1,
> > +					     256 * srate,
> > SND_SOC_CLOCK_IN);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "codec_dai clock not
> > set\n");
> > +			return ret;
> > +		}
> > +	}
> > +	return ret;
> 
> I guess it may be just copied from mt8195-mt6359-rt1011-
> rt5682.c.  However, it
> is good to turn the code into a better shape.  To be clear, just
> return 0 here
> so that the initialization can be removed.
> 
Yes, I copied it directly.
I will update this in v4.

> > +static int mt8195_rt1011_init(struct snd_soc_pcm_runtime *rtd)
> 
> [...]
> > +	ret = snd_soc_dapm_add_routes(&card->dapm,
> > mt8195_rt1011_routes,
> > +				      ARRAY_SIZE(mt8195_rt1011_routes))
> > ;
> > +
> > +	if (ret)
> 
> Remove the extra blank line.

OK. I didn't notice the blank line.
> 
> > +static int mt8195_rt1019_init(struct snd_soc_pcm_runtime *rtd)
> 
> [...]
> > +	ret = snd_soc_dapm_add_routes(&card->dapm,
> > mt8195_rt1019_routes,
> > +				      ARRAY_SIZE(mt8195_rt1019_routes))
> > ;
> > +
> > +	if (ret)
> 
> Remove the extra blank line.

OK.

Thanks,
Trevor


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
