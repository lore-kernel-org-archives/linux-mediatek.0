Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A10C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 09:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOjvOdKcp0rHcTc2YWUfL9ZjA8LNBQHWTjpm7DvPeCI=; b=S2f9LytapHPtTGP0mNxfzyOGoa
	qGDh3g5ILBo4WDuESootCjfVvUcnRzb7VVVxyUJKx7EjdRtHQN9mLC7+WbeikPhP+CdoXpszHAxAh
	nmi7csYhlSE9TevWqkFRV8WlHf3mEgwJnk9uuADdU685+ahOksBziNSNdoiWO7A/YVs/VpVTZELJY
	k3xdjcs6NYBBl4sq4+ZQjZoEi36LhZ2O5VsCQ4QcZd1f0wBUQvQyca2lbTNV9YZuuFUeOFaKet54s
	lcNWIOKqum1PvlCAwnKZEo373i1yqjY5XXXqns4VFjqLX8Xm1BvB+Hu7pdez3gZeFIUMuFcTRHM2L
	Xw9Pxl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs3b-00000000fwj-2OMa;
	Wed, 19 Jun 2024 09:56:47 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs33-00000000fdV-2FUD;
	Wed, 19 Jun 2024 09:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790972;
	bh=Y7T7l2wiKLsecC0XGOVIJK4YUv24/jXrKqNK1hO4nr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JF8R5ZHE0cX3H6/04BxiQ7Pdcrk2wx2KDP/Ze3hLJFTAZFbNfQX0Rb1hawmRHhpQL
	 piFvcjTZudgEUrlKkBirxpnPZVMrlJDd2DpPE5bNHIgVpi/StY9nNTVJU6owj+/aw7
	 MQw37Kx3g7jlV+4tu3vSZm/Hbxz4HwcHZGt6rIW4XhoKukdtmsRjSF3/ESylXasWSa
	 r2yojhWkdOP50umZnJDyvcxO12s5ShAgHrEYD4VbcGEsOotA3MjS121lbACc/2CTtb
	 Vy4YE0Pb07+W9lh/6yzdWkmAxwfifU3pYl/B/AFM99ZtgTN7999e2cCvc8jxYhXPnm
	 j7XE8hnzb7TMg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9A91B37821C0;
	Wed, 19 Jun 2024 09:56:10 +0000 (UTC)
Message-ID: <40e8fdb8-bec8-4dd0-a0c0-c7409f1a3af8@collabora.com>
Date: Wed, 19 Jun 2024 11:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 13/16] ASoC: mediatek: Add MT8365 support
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
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-13-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-13-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_025614_058326_FFD93AFA 
X-CRM114-Status: GOOD (  19.26  )
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

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> - Add specific config to enable:
>    - MT8365 sound support
>    - MT6357 audio codec support
> - Add the mt8365 directory and all drivers under it.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
>   sound/soc/mediatek/Makefile        |  1 +
>   sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
>   3 files changed, 36 insertions(+)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 5a8476e1ecca..c1c86ecc0601 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
>   	  boards with the MT6359 and other I2S audio codecs.
>   	  Select Y if you have such device.
>   	  If unsure select "N".
> +
> +config SND_SOC_MT8365
> +	tristate "ASoC support for Mediatek MT8365 chip"
> +	depends on ARCH_MEDIATEK
> +	select SND_SOC_MEDIATEK
> +	help
> +	  This adds ASoC platform driver support for Mediatek MT8365 chip
> +	  that can be used with other codecs.
> +	  Select Y if you have such device.
> +	  If unsure select "N".
> +
> +config SND_SOC_MT8365_MT6357
> +	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
> +	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
> +	select SND_SOC_MT6357
> +	help
> +	  This adds support for ASoC machine driver for Mediatek MT8365

s/Mediatek/MediaTek/g (here and everywhere else in other commits as well)

> +	  boards with the MT6357 codec.

MT6357 PMIC codec

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

