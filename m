Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3CDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sb3X2bDJb9YOV8zb/Ty4+n2E+0kY2F4mrRv17yC5MY=; b=oV/g6Ux5mYqZJm
	QSMChJwUC6eMP2wi5Jpznl3Jtl//luNtWNx5kfQ8yPiTTm78dRKp2NZVsCyEmEwEFzMh6KXUbAAnV
	aLk89EB0U/1lT9Zy1MlRUoYn+tAeyWmPYdV38RUKiqxqir4eJW3cRMGK0JeinSb5QifVGwG/L5uJi
	HNN6MB/rutrLaV5ZFggV7Qmc7Q9tQ4dg/XjlcIgWURNoEm5gCZQ1+J9ZxBlhbpDFY9RtJjwIxWKXj
	ZKsORZi9YDdm64EQH3KneVTgkOvwJPNz135ZpiE8MoKSOKrvxLKMKMrPmR7wg0+JghmZG/TgKGvPr
	oU/4a8Bs3Prv7/mHZucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns2qX-00ChBO-7z; Fri, 20 May 2022 13:39:13 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns2qU-00Ch8N-8q; Fri, 20 May 2022 13:39:11 +0000
Received: by mail-ed1-x532.google.com with SMTP id p26so10852278eds.5;
 Fri, 20 May 2022 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vZ5EIynCj28UhpMo2WaUDTGXgrMDD6ssuzpbKQFTrE=;
 b=dbdCdy787bi5RG1nfo93JEf7fRSGqgvdGgWbhi5+jiM2gZq411FflPdY9L2o3Sz097
 XA9SzdoyvFOw4oNvCmxQtifumEL2ucGkRJdht2gKQbj9YVfuffNrO+QPvuuZxjrqoS0F
 NfU67GWBYzEpstGDy844RVUmfAl7HNRGvf/LwT4rnlN6DngXc2ZKIaPbBdhEQ53EpZ4s
 ITsYoJPxw+STd6rZ1MhtfXgofir7SDd7Ohuuh33FWGAKbBMX+xkiGJYwBkluf7rb/Tbk
 3LkMR2KGcBuBeRhqmlx3nsng24xG35IMWoTed7v6OpPZiYpWbvZKUFT3MZVg1KYI/Bnh
 bK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vZ5EIynCj28UhpMo2WaUDTGXgrMDD6ssuzpbKQFTrE=;
 b=Su4Ks8zwH8vkN4XxF09a/+vpClLulgWgygM1MmKlxii2rrjUCS5vw2xwgF06fOeeBD
 RLg16nLiEGNb4a0Mqe/tXm5rjOWuG4FwsZTrf5KO2TQEENFpX7RD1D6dNRIv46V+9EIm
 I2qww1VAryXqMQdrPHYrV+dk4ur65Z3wQVyfQSlAq9xcM0lF6yfBwxRt73l6B5qmZ1EI
 ecsQ8bbSAR9TEYhocTVLu711CfsC0mMSDh4FyAcNweUZR7f12K/dILGRZjptoslfGc8D
 X2WClx/qd4cgO61KgyWvnscJafdFBbQcFUAWu8f6WH6NqCFk1h4UrFf/JTvrtMX/cC9g
 c0QA==
X-Gm-Message-State: AOAM531AyEbXYNaJaaonH5WJbDneATDk3W8movSkEGROdLLiiWElIAUJ
 vHilBWqD2fKjWA8pdzJKup4HJjZg14k=
X-Google-Smtp-Source: ABdhPJzB4dDO6rQGcvP8GfFmFaDFqb3hZ0xhEwmOtYMgE32gUNPAUosh+C78GjzIs6waR9fAZFTMtw==
X-Received: by 2002:a05:6402:3488:b0:427:b4ec:991b with SMTP id
 v8-20020a056402348800b00427b4ec991bmr10869813edc.319.1653053945963; 
 Fri, 20 May 2022 06:39:05 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 b2-20020aa7df82000000b0042abfe32ac8sm4225152edy.30.2022.05.20.06.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 06:39:05 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: broonie@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
 nicolas.ferre@microchip.com, nsaenz@kernel.org, shawnguo@kernel.org,
 linux-imx@nxp.com, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 daniel@zonque.org, srinivas.kandagatla@linaro.org,
 linux-rockchip@lists.infradead.org, krzk@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, peter.ujfalusi@gmail.com,
 jarkko.nikula@bitmer.com, heiko@sntech.de, jbrunet@baylibre.com,
 kernel@pengutronix.de, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
Subject: Re: [PATCH 18/56] ASoC: rockchip: Update to use set_fmt_new callback
Date: Fri, 20 May 2022 15:39:03 +0200
Message-ID: <4375965.enAZpblka2@archbook>
In-Reply-To: <20220519154318.2153729-19-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-19-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_063910_400263_2CB21D72 
X-CRM114-Status: GOOD (  16.42  )
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

On Donnerstag, 19. Mai 2022 17:42:40 CEST Charles Keepax wrote:
> As part of updating the core to directly tell drivers if they are clock
> provider or consumer update these CPU side drivers to use the new direct
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/rockchip/rockchip_i2s.c     | 8 ++++----
>  sound/soc/rockchip/rockchip_i2s_tdm.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> index 4ce5d25793875..0a66c7df323dc 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c
> @@ -199,13 +199,13 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
>  
>  	pm_runtime_get_sync(cpu_dai->dev);
>  	mask = I2S_CKR_MSS_MASK;
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* Set source clock in Master mode */
>  		val = I2S_CKR_MSS_MASTER;
>  		i2s->is_master_mode = true;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		val = I2S_CKR_MSS_SLAVE;
>  		i2s->is_master_mode = false;
>  		break;
> @@ -486,7 +486,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
>  	.hw_params = rockchip_i2s_hw_params,
>  	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
>  	.set_sysclk = rockchip_i2s_set_sysclk,
> -	.set_fmt = rockchip_i2s_set_fmt,
> +	.set_fmt_new = rockchip_i2s_set_fmt,
>  	.trigger = rockchip_i2s_trigger,
>  };
>  
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
> index 98700e75b82a1..c90afccdae362 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -411,12 +411,12 @@ static int rockchip_i2s_tdm_set_fmt(struct snd_soc_dai *cpu_dai,
>  	}
>  
>  	mask = I2S_CKR_MSS_MASK;
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBC_CFC:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		val = I2S_CKR_MSS_MASTER;
>  		i2s_tdm->is_master_mode = true;
>  		break;
> -	case SND_SOC_DAIFMT_CBP_CFP:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		val = I2S_CKR_MSS_SLAVE;
>  		i2s_tdm->is_master_mode = false;
>  		break;
> @@ -1113,7 +1113,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
>  	.hw_params = rockchip_i2s_tdm_hw_params,
>  	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
>  	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
> -	.set_fmt = rockchip_i2s_tdm_set_fmt,
> +	.set_fmt_new = rockchip_i2s_tdm_set_fmt,
>  	.set_tdm_slot = rockchip_dai_tdm_slot,
>  	.trigger = rockchip_i2s_tdm_trigger,
>  };
> 

Please run ./scripts/get_maintainer.pl against the individual patches so
that I'm included in the recipients of the e-mail as well.

Anyway, for the i2s-tdm parts:

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Tested on a RK3566 connected to an RK817 codec.

Regards,
Nicolas Frattaroli



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
