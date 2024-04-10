Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE583CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g67OSHlwNTDKaFrM3/uwoPsdE8uUwCxkLF5hYguHcs4=; b=VOZcYVe8PgdqMO9D8Hm5erZHLt
	zWdpvND/xcBhPm7sLCfb708SHOObQmO7w9XrDESPGNc0gkxtYUW+xQuFTTJFfUgYZCqAK9DMQu7hR
	BSElnnJNYkcZhnhRVg0ak+QI1EH7/nyNGTGgEL2DSB7ZcLk5k77bnW5vGrJyZQFn9aFo5M4pf6Ir2
	ToPYPqEgFNWJCDbvjAfVoy0POxIgkdJyOfkdReOsrovYr6a6llZBUIrrgkOfFoU5lsq1WIRSSFDXB
	8ADzmbDfW1e42U+mv+zzNBCVfHfd/3np8lhlu7QIENUobnP5sSOvy+PkLlcNH+wzdZIghEfoF76PZ
	afZjtiBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYUf-00000007L95-1EBC;
	Wed, 10 Apr 2024 14:00:05 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYUa-00000007L6A-1Q24
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 14:00:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-345600106d3so2840235f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712757597; x=1713362397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g67OSHlwNTDKaFrM3/uwoPsdE8uUwCxkLF5hYguHcs4=;
        b=XThBWSBIcBXPgiU0znAph3JTckJ7aHkL1bpNzWboc3aZOypdmiH7DArz1WMHeWWT1n
         6+KrcufLccFbNT9aiwVko04XyFsEBETeOB/QKgSVQa7pO2ilnofu8QhQFhOeCN88fbtm
         hT8iqHeTiJEE0ZiwlJC9IGzQTQNS0aJC3f4o+dWCTMP7lr0y8p3+1j376Zn18Kq3L8JP
         Jyp28J7D1A4x/rvB+Mk02HR439V5ato0dtWQIfVzzeMQOA0A9uqFdrCjeWpb4b/gGJEs
         8EBmM0c2CQKFFMhi4pQPa92W4IiAOu9fYNKtwg9A/uu5FPDu/hrnuanz89fCR/dfVqfo
         fAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712757597; x=1713362397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g67OSHlwNTDKaFrM3/uwoPsdE8uUwCxkLF5hYguHcs4=;
        b=B1fyxGNd3FZj4ftI7XJsxMd10BY1oD+jCQFZbcxIvub2mGCDHZGNXKJi6LbqiOK7Ut
         jT71jGGe3R/WjMyhYBsXmX+PYkWTBnm++xwiZmeSzYeCjhh6CqVyb2lZca4lteMrhkgF
         AQMdq0NXsVlEHY5DSCxTt2mBJkScWbbxko6kp0drxAJbVwlR5bGEFbZjlZpqWW9rk0hM
         PClZAi5wKMXsTKWyLABpc/rK2sTtoE/mQ+4Z1JX0O5dipET+QeN0S+vJcj8XAHGH38MD
         F8YZ9CrXa0Z74Nv8mXVkYmq194rWm3ia4Mm3Ou+P+o7lKW2HE47IVCuoIivTmsLj3yKJ
         MGBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjvBl0GAeqZZ6lBVu4ufpzl+eTLUmXriVDC0kqGRuiJyoOVRPh4+Rk7G+OLB0eu4OW/LQP2N3FTNZS08xiraI/tfZrLElwMYoEtKCWg5I68/7w
X-Gm-Message-State: AOJu0Yz3VisDYbv73FQSHfDTTFtM8suBJL7vndnu/I3nV6lMyw1jXtTx
	3HJAI/dlpHWH+iLec7xviH2hYJ8vlM9sf3oRNmlUiFNdoP3OEkKm6QZAy11QBt8=
X-Google-Smtp-Source: AGHT+IGRtn6DL2DEemnsBxsmvHHTd4nWEQsASvLDi6kfhHaIx+DPnIFaevFeAdtATqfu2OGeHdeMQw==
X-Received: by 2002:a5d:620c:0:b0:343:98ee:524 with SMTP id y12-20020a5d620c000000b0034398ee0524mr1624742wru.36.1712757597439;
        Wed, 10 Apr 2024 06:59:57 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id j15-20020a5d452f000000b00343e825d679sm13385379wra.87.2024.04.10.06.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:59:56 -0700 (PDT)
Message-ID: <cf0184c4-2b3e-4074-9e30-bf65ec7f0aaa@baylibre.com>
Date: Wed, 10 Apr 2024 15:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] ASoC: mediatek: mt8192: Migrate to
 mtk_soundcard_common_probe
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
 <20240409113310.303261-6-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_070000_503820_4617703C 
X-CRM114-Status: GOOD (  13.09  )
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



On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> @@ -1211,52 +1196,85 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
>   		if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
>   		    strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
>   			dai_link->ops = &mt8192_rt1015_i2s_ops;
> -
> -		if (!dai_link->platforms->name)
> -			dai_link->platforms->of_node = platform_node;
> -	}
> -
> -	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		ret = -ENOMEM;
> -		goto err_probe;
> -	}
> -	snd_soc_card_set_drvdata(card, priv);
> -
> -	ret = mt8192_afe_gpio_init(&pdev->dev);
> -	if (ret) {
> -		dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);

I don't think __func__ is necessary.

> -		goto err_probe;
>   	}
>   
> -	ret = devm_snd_soc_register_card(&pdev->dev, card);
> -	if (ret)
> -		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);

I don't think __func__ is necessary.

> -
> -err_probe:
>   	of_node_put(headset_codec);
>   err_headset_codec:
>   	of_node_put(speaker_codec);
>   err_speaker_codec:
> -	of_node_put(platform_node);
> -err_platform_node:
> -	of_node_put(hdmi_codec);
> +	if (hdmi_codec)
> +		of_node_put(hdmi_codec);
> +
>   	return ret;
>   }
>   
> +static int mt8192_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data, bool legacy)
> +{
> +	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
> +	struct snd_soc_card *card = card_data->card;
> +	int ret;
> +
> +	if (legacy) {
> +		ret = mt8192_mt6359_legacy_probe(soc_card_data);
> +		if (ret)
> +			return ret;
> +	} else {
> +		struct snd_soc_dai_link *dai_link;
> +		int i;
> +
> +		for_each_card_prelinks(card, i, dai_link)
> +			if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
> +			    strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
> +				dai_link->ops = &mt8192_rt1015_i2s_ops;
> +	}
> +
> +	ret = mt8192_afe_gpio_init(card->dev);
> +	if (ret)
> +		return dev_err_probe(card->dev, ret, "%s init gpio error\n", __func__);

I don't think __func__ is necessary.

> +
> +	return 0;
> +}

Beside that,
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

