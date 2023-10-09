Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAA1E95A8E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 12:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDLmpJjE7kkT7cNLBDJBV6JgVppXP4rt7YhPwhJHMR8=; b=CXfwFHJ8OriyS93CjjhDpKmHi2
	7aPVOHl08fROXEX8E3g6sAAbWZyydTCeuA8Ue0E+4Q45srAXHc/ubIXtxLbork370zALoF6Pnb1fr
	AiC8caKOSfEdBafxpBejj6IKuJtYvG53IHvBxW4mpA8TFS1yXshTGVOCRmeUpgv/p7lKxNNIKzjV9
	NZlKRxWlpC3Nv7z2wiENrOgRvUY3QTL8ymIPpw/aUHYUdsmjHG9/m6XRfANHoB/yXTiBF8jwqgTee
	cAYcW3eeyx2JUcR3JtiODxtd60lSJXBwXGOvWiTfG1TAp4EvUUl5BMNJibLPZGyMn0fyBrmrE1gjJ
	txJZckVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppFq-00Afh8-1x;
	Mon, 09 Oct 2023 12:20:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppFk-00Afdi-01;
	Mon, 09 Oct 2023 12:20:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E698D660576C;
	Mon,  9 Oct 2023 13:20:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696854046;
	bh=ltBHVfNpOMGPjjWoCkqTtFcFuhUvovse3VSY6GPftr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DWF+bb2tcd3rtuLuii3pdK99bZopv8lB8c6HfzQOq1TrcL5yAutOz274686oyxOVV
	 ZW3BjdO4kgR8Ym4bnF/cjY2unKDQFCWCy33gyuzuGmavlvPXwEp7//oJPk3qriYA7S
	 x6ox4ErhcAeF3BloZaym3gjJdAy6hHWZWYKhCTHgMuU1m69J8xg32t1vkAvS6ItO5C
	 4GHZk9aXIVAdVmqpjs5ctx+Vu5zAEXUUyf9vEXFE/yts1uu80PMIyuKYSHtw4DDGXG
	 zAByRegOR8DOGtbl1UAwCkkn2vHgxSNOohCwZNZ9Thk0jmuWFq7jMaRdzgp4+zigHZ
	 MjzmO730nIeqw==
Message-ID: <9c28b84e-2d4e-7bc2-88f3-ad5b30d2c727@collabora.com>
Date: Mon, 9 Oct 2023 14:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [v4 2/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Content-Language: en-US
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231008014629.4971-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231008014629.4971-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231008014629.4971-3-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_052052_172068_2C813B46 
X-CRM114-Status: GOOD (  19.80  )
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

Il 08/10/23 03:46, xiazhengqiao ha scritto:
> To use RT5682S as the codec and MAX98390 as the amp, add a new
> sound card named mt8188_rt5682s.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> Reviewed-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/Kconfig                |   1 +
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 141 +++++++++++++++++++++-
>   2 files changed, 140 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 8d1bc8814486..43c8fea00439 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -250,6 +250,7 @@ config SND_SOC_MT8188_MT6359
>   	select SND_SOC_MAX98390
>   	select SND_SOC_NAU8315
>   	select SND_SOC_NAU8825
> +	select SND_SOC_RT5682S
>   	help
>   	  This adds support for ASoC machine driver for MediaTek MT8188
>   	  boards with the MT6359 and other I2S audio codecs.
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index e2416b981e1f..66f246126728 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -17,6 +17,7 @@
>   #include "mt8188-afe-common.h"
>   #include "../../codecs/nau8825.h"
>   #include "../../codecs/mt6359.h"
> +#include "../../codecs/rt5682.h"
>   #include "../common/mtk-afe-platform-driver.h"
>   #include "../common/mtk-soundcard-driver.h"
>   #include "../common/mtk-dsp-sof-common.h"
> @@ -32,7 +33,7 @@
>    #define TEST_MISO_DONE_2	BIT(29)
>   
>   #define NAU8825_HS_PRESENT	BIT(0)
> -
> +#define RT5682S_HS_PRESENT	BIT(1)
>   /*
>    * Maxim MAX98390
>    */
> @@ -52,6 +53,8 @@
>   #define SOF_DMA_UL4 "SOF_DMA_UL4"
>   #define SOF_DMA_UL5 "SOF_DMA_UL5"
>   
> +#define RT5682S_CODEC_DAI     "rt5682s-aif1"
> +
>   /* FE */
>   SND_SOC_DAILINK_DEFS(playback2,
>   		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
> @@ -258,6 +261,17 @@ static struct snd_soc_jack_pin nau8825_jack_pins[] = {
>   	},
>   };
>   
> +static struct snd_soc_jack_pin rt5682s_jack_pins[] = {

nau8825_jack_pins is exactly the same as this one, can we please commonize
and avoid duplicate declarations?

> +	{
> +		.pin    = "Headphone Jack",
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
> @@ -316,10 +330,18 @@ static const struct snd_soc_dapm_widget mt8188_nau8825_widgets[] = {
>   	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>   };
>   
> +static const struct snd_soc_dapm_widget mt8188_rt5682s_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +};

Same here...

> +
>   static const struct snd_kcontrol_new mt8188_nau8825_controls[] = {
>   	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
>   };
>   
> +static const struct snd_kcontrol_new mt8188_rt5682s_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> +};

...and here.

Regards,
Angelo


