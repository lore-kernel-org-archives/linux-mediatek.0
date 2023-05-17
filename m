Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0432CC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXqGGH4gJWuiMJtK2wX2jpVK7SWDWM7eRLwPeNX1gF4=; b=wrQK1SwGzkUbRFhygJJGCX2iA4
	LoTbJaWuMDt4qonY4jIUOjNd8e1wotjDUrzpQ1t3kC0K0VWf+tsCZ+2U3UKuCfiOcN6vSWkg55hB/
	lLSzhvm8aOkzvXnUsyDub2xjJNLmP9pkyRIlFt9cmVMW5KQBvYOaSkmzCy1ZFOA8hdhSBD9/9XCEg
	k5irbBD7kzCrOc516PTEhouFkKjzhrZQ3xgZX38i2ILEKrcIcnEyDWTFRdyLTxXCDt/3/thAALEDt
	qGPXOBx1VD10PTpjo+cGpBPzy/VTiGJd8HBXnbax6u/t6IzNsXeMiaua3nbcLFzSvwqsuR/DxLoVR
	qHyroeqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFjd-009h0V-0P;
	Wed, 17 May 2023 11:54:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFjV-009gwR-16;
	Wed, 17 May 2023 11:54:18 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EE2116605909;
	Wed, 17 May 2023 12:54:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684324455;
	bh=Oz1+XIA+Tu5g8JfG9yTKx716ef2j09dwG3Nq0+Ip6z8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=It8Oq9iYKr5mHR65+J23asb3mBtgRcnKPLI7zeLsUMF/OrIN7zdffv1ut+1rFlvLL
	 6MIHkEUgStlOENPDAlIHfzeRxLbO6mOUPeHk8dDwAezY7x0/J4aJyZ8G0ueqz/UVkv
	 JUHSVt6c6Yo1G+Z12LeBnglbaQvRS3qQzpcMSEkTT3k4wQvq76b4G2HJ1dm8bFJsjp
	 Mx3iPiZfjDm7VJQPYkIMREhNeBMUPzhDWSsAvM9oi6F/sXHqkhc7IgNuBQTvjR/wsT
	 HN7Xsh361x4RL9dTKxViQSFNHNp6B/aWTS3tBBmQvp/uNf7PI3s+gMHsLmwBG5l6BB
	 dqLf06n+bxgnQ==
Message-ID: <8b76c893-e7bc-7a99-b86d-74e3378f9b4e@collabora.com>
Date: Wed, 17 May 2023 13:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/5] ASoC: mediatek: mt8188-mt6359: support new board with
 nau88255
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-5-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230517111534.32630-5-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_045417_515367_27EA14B9 
X-CRM114-Status: GOOD (  22.38  )
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

Il 17/05/23 13:15, Trevor Wu ha scritto:
> This patch adds multiple i2s codecs support including NAU88L25,
> MAX98390, and the dumb amp like NAU8318 usage. In addition, dmic-codec
> is also added to skip the beginning pop noise.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/Kconfig                |   4 +
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 267 +++++++++++++++++++++-
>   2 files changed, 270 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 4baac72677d9..4ea012342b52 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -225,6 +225,10 @@ config SND_SOC_MT8188_MT6359
>   	depends on SND_SOC_MT8188 && MTK_PMIC_WRAP
>   	select SND_SOC_MT6359
>   	select SND_SOC_HDMI_CODEC
> +	select SND_SOC_DMIC
> +	select SND_SOC_MAX98390
> +	select SND_SOC_NAU8315
> +	select SND_SOC_NAU8825
>   	help
>   	  This adds support for ASoC machine driver for MediaTek MT8188
>   	  boards with the MT6359 and other I2S audio codecs.
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index 6c3f36e2fffd..15fce2741f01 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -6,6 +6,7 @@
>    * Author: Trevor Wu <trevor.wu@mediatek.com>
>    */
>   
> +#include <linux/input.h>
>   #include <linux/module.h>
>   #include <linux/of_device.h>
>   #include <linux/pm_runtime.h>
> @@ -13,10 +14,25 @@
>   #include <sound/pcm_params.h>
>   #include <sound/soc.h>
>   #include "mt8188-afe-common.h"
> +#include "../../codecs/nau8825.h"
>   #include "../../codecs/mt6359.h"
>   #include "../common/mtk-afe-platform-driver.h"
>   #include "../common/mtk-soundcard-driver.h"
>   
> +/*
> + * Maxim MAX98390
> + */
> +#define MAX98390_CODEC_DAI     "max98390-aif1"
> +#define MAX98390_DEV0_NAME     "max98390.0-0038" /* rear right */
> +#define MAX98390_DEV1_NAME     "max98390.0-0039" /* rear left */
> +#define MAX98390_DEV2_NAME     "max98390.0-003a" /* front right */
> +#define MAX98390_DEV3_NAME     "max98390.0-003b" /* front left */
> +
> +/*
> + * Nau88l25
> + */
> +#define NAU8825_CODEC_DAI  "nau8825-hifi"
> +
>   /* FE */
>   SND_SOC_DAILINK_DEFS(playback2,
>   		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
> @@ -143,12 +159,15 @@ SND_SOC_DAILINK_DEFS(pcm1,
>   SND_SOC_DAILINK_DEFS(ul_src,
>   		     DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC")),
>   		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
> -						   "mt6359-snd-codec-aif1")),
> +						   "mt6359-snd-codec-aif1"),
> +					COMP_CODEC("dmic-codec",
> +						   "dmic-hifi")),
>   		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
>   
>   struct mt8188_mt6359_priv {
>   	struct snd_soc_jack dp_jack;
>   	struct snd_soc_jack hdmi_jack;
> +	struct snd_soc_jack headset_jack;
>   };
>   
>   static struct snd_soc_jack_pin mt8188_hdmi_jack_pins[] = {
> @@ -165,11 +184,50 @@ static struct snd_soc_jack_pin mt8188_dp_jack_pins[] = {
>   	},
>   };
>   
> +static struct snd_soc_jack_pin nau8825_jack_pins[] = {
> +	{
> +		.pin    = "Headphone",

One Intel driver using NAU8825 declares this as

		.pin	= "Headphone Jack",

can we please use the same name, so that we're able to eventually share the
same configuration in the userspace?

For reference, please check intel/avs/boards/nau8825.c

Thanks,
Angelo


