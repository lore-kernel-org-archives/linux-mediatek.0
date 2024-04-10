Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780ACCD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+P+72Hlq99kFNnxAOkF8xNKRqdp0Nj1rk4leGd6q+bQ=; b=pwNPSiPpoK9qaPKIYWlF1i86aC
	IfdZOYMcGgWiw0xmk654dhljXRW4YSl4kkEtLN/9njBlcFLFxRYQvaEnyFzi+qtxZVnXpwaJY0W02
	eNUWitWwTYhwugwrI05e9tJgqhxq+nJsVASw6lxTa2Xo55D1VMv/KfOuLqakcZuhD14UYayAZ+d8K
	ltMyi1BmmGtYOHUxKJp6hClw4xfdpChhE5TLckzyeo94G9TNOizfEEB2EdHd6+2Ecz6GODY0fnmMa
	T81k3yrW0cyNcwBAlFegl7PSuaFb7hATTRz43q8yZND83x98Z4zqkeSQRK0j8yjE1/aI7I6tjjKja
	59mXGzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZY9-00000007hNX-471R;
	Wed, 10 Apr 2024 15:07:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZY4-00000007hK3-0jEg
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 15:07:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-34665dd7610so405412f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 08:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712761657; x=1713366457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+P+72Hlq99kFNnxAOkF8xNKRqdp0Nj1rk4leGd6q+bQ=;
        b=ZLzZgEoANNfRTwZPWO0aMcrHaQYTpesrRLENPW80vGC3oLV0h3kUB+baxzrT5HN572
         taztUjI4HUQ8jYJzk3fmpPyw88fR0y5s/MlwoF8IJqqBrUxaNjSQAcINsm0MdoIXieVy
         DNuUnqumGn/a1MZb+eYfqm4X/a1MQw/SH6LtaueB46lj0e8KYQsdxLR6zAD5dNm9/5R6
         T3fqK80+YFK4hDucccRVP86foEWrHzZO4EcqyF+2lnVpyr7kfXIRordVopvYpU14Hnz4
         arGEp1XRfFofKP7hMfCKofrSocBXQH9Jaai0wh/EGtCh300GZfVuNeUiLfAh1kOt2bzu
         hEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712761657; x=1713366457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+P+72Hlq99kFNnxAOkF8xNKRqdp0Nj1rk4leGd6q+bQ=;
        b=riP4ZBgB67sGvhoayH1Ubn3Ddzz4BAgIoijSvKA/8WsnAX7aoPbajJgB+yldHmaIt5
         aETjhIYzuOK0FM51RLEhSYxMb0903vOr3LsRvMaJFrsOzrcn8EprUC6WdVOfrpGcHHqT
         j+tzyEL1IoWmLapiNt3vcBOuFVuBpPh0Ws5OrGD/9Qhhat8Vn+6Eq2Gz09hIa4nrfAlZ
         gTQxI/F+y7urXrym5mIbVbKlsGyyLr/WM1GUxSzvg1jVSDIbWrU2HqjGlaPKobDY9V6K
         PQwBMYDEwEKuBmm9jMsdZ7Kh6GNziZS/4MlKsmjKImkM1892StNj1bxlvJf86PHe7ojo
         PKWw==
X-Forwarded-Encrypted: i=1; AJvYcCWJqMhTHRXgYnVigPruDVgfLKslFNpggzUgJszkGuAO8GDB7R015+NjY1sGJBcfoaetounslYcKkPGXVATdPYLRCHTXaAJOeVPT+kaWueMnLXUx
X-Gm-Message-State: AOJu0YzSfCJaVz9vpFhY3q5folB0bsjPxE/epXw07c6rpX7aNKIt2Ac0
	4esmjuvCLmUqtWdb1VmY7FGeiS1kUGelWtGJlsFZKmYKu4QpHlXKxpPhHYF/Ui0=
X-Google-Smtp-Source: AGHT+IFhnB0gsdOm+IB5xuyR92fHk4A/RRmX5WG9qW/Rsc9kuPzli806ObV+/wdLIouJrwCNwH1GSA==
X-Received: by 2002:a5d:47a7:0:b0:343:bb25:82f0 with SMTP id 7-20020a5d47a7000000b00343bb2582f0mr2577063wrb.11.1712761657374;
        Wed, 10 Apr 2024 08:07:37 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id c8-20020adfe748000000b00343a0e2375esm13906254wrn.27.2024.04.10.08.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:07:37 -0700 (PDT)
Message-ID: <65b3ec7e-e753-4692-b778-a9246e9e6664@baylibre.com>
Date: Wed, 10 Apr 2024 17:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/18] ASoC: mediatek: mt8186-rt1019: Migrate to the
 common mtk_soundcard_startup
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-11-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_080740_392001_6AF532E7 
X-CRM114-Status: GOOD (  16.00  )
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

What is the purpose of these change ? I don't see the link with the 
migration to the common mtk_soundcard_startup.

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> index bfcfc68ac64d..dbe5afa0e9ee 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> @@ -2729,7 +2729,7 @@ static int mt8186_afe_runtime_resume(struct device *dev)
>   	struct mtk_base_afe *afe = dev_get_drvdata(dev);
>   	struct mt8186_afe_private *afe_priv = afe->platform_priv;
>   	int ret;
> -
> +pr_err("mt8186 afe runtime_resume\n");

Forgot to remove this print ?

>   	ret = mt8186_afe_enable_clock(afe);
>   	if (ret)
>   		return ret;
> @@ -2739,7 +2739,7 @@ static int mt8186_afe_runtime_resume(struct device *dev)
>   		return ret;
>   
>   	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
> -		goto skip_regmap;
> +		return 0;
>   
>   	regcache_cache_only(afe->regmap, false);
>   	regcache_sync(afe->regmap);
> @@ -2758,13 +2758,20 @@ static int mt8186_afe_runtime_resume(struct device *dev)
>   	/* enable AFE */
>   	regmap_update_bits(afe->regmap, AFE_DAC_CON0, AUDIO_AFE_ON_MASK_SFT, BIT(0));
>   
> -skip_regmap:
>   	return 0;
>   }
>   
>   static int mt8186_afe_component_probe(struct snd_soc_component *component)
>   {
> -	mtk_afe_add_sub_dai_control(component);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	snd_soc_component_init_regmap(component, afe->regmap);
> +
> +	ret = mtk_afe_add_sub_dai_control(component);
> +	if (ret)
> +		return ret;
> +
>   	mt8186_add_misc_control(component);
>   
>   	return 0;
> @@ -2929,6 +2936,10 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
>   		goto err_pm_disable;
>   	}
>   
> +	ret = regmap_reinit_cache(afe->regmap, &mt8186_afe_regmap_config);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
> +
>   	/* others */
>   	afe->mtk_afe_hardware = &mt8186_afe_hardware;
>   	afe->memif_fs = mt8186_memif_fs;
> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> index dbd157d1a1ea..b87b04928678 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> @@ -413,7 +413,7 @@ static const struct snd_soc_dapm_widget mtk_dai_adda_widgets[] = {
>   			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
>   
>   	SND_SOC_DAPM_SUPPLY_S("AUD_PAD_TOP", SUPPLY_SEQ_ADDA_AUD_PAD_TOP,
> -			      AFE_AUD_PAD_TOP, RG_RX_FIFO_ON_SFT, 0,
> +			      SND_SOC_NOPM, 0, 0,

Is it related to the regmap init function added in the AFE PCM probe ?

>   			      mtk_adda_pad_top_event,
>   			      SND_SOC_DAPM_PRE_PMU),
>   	SND_SOC_DAPM_SUPPLY_S("ADDA_MTKAIF_CFG", SUPPLY_SEQ_ADDA_MTKAIF_CFG,

-- 
Regards,
Alexandre

