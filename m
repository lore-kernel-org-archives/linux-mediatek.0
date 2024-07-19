Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E687C3DA59
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 08:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+V9iTvENoLkDMcxv1MaALvsWBKCPdjEAwX/SNQRJv8=; b=Ru0Mv9aOEw2m0F828P50jdX4J7
	cs55grU3h93lv1DL4Wg2eM+0SU5S3VvcoO3dK/25QM7bJECoNKpKFzKFX68IuY54MRjy4w1VmHQ2t
	m+q5osJ67FRcWe3yiE6GTjkO23hALwo8D1TH3iGJ7uFshMsXzVwqkrrlvO6xsyRm/UzuXXoi43IEU
	V01URIrh9mmxf4LIRCdYButp2MRn1CezCYY+M5jJlK5w60ZrU9UsyEiqqFtNxWCOtiVl0AOLm7dg6
	pbO30BfG32yt/AXl1VwQ/P98XUN1zUStIfh9q7AJTr8YKBvReLESNNIKGhuCvQU3H+sgvb7i5wzH2
	SQ8OZe/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUibm-00000001zhD-1Kn6;
	Fri, 19 Jul 2024 08:04:54 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUia8-00000001zPv-1HHY
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 08:04:52 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so713217a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jul 2024 01:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721376190; x=1721980990; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+V9iTvENoLkDMcxv1MaALvsWBKCPdjEAwX/SNQRJv8=;
        b=HbZuLqte4x3/QOf+NJ0bQQOceDr9/IlqBD9L/nUfrOc8zuyGtMPUiS80T9rGzraOlu
         Nim9IFcZ8aaCpgSbjGuIAfRPuJgmmIpGvZUo97xopaeSreh/Vus9AjcT7twhFvuKCenW
         REmnQc/Oo3hLCOeCjFv7PovWVhh0D3Gz3nxh19cwgx9i2rl1P6FLrrQx5MW8C1+rMfA8
         UIO5+AWtzbHREOE9+BsiLCWy/0FwzLfVsBWtbcB6XKJy6NidbI9tixW+quX2PpzxER1v
         a9mcIvgauds4h8yzR+DDFVDoZekaPpG/Hkyiwnpe0flmdGNHIUuGv0p/NsrIYKY2HtXy
         vFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721376190; x=1721980990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+V9iTvENoLkDMcxv1MaALvsWBKCPdjEAwX/SNQRJv8=;
        b=wem1Rh7lZia3W9jooL2bf8y1srVL4DvhvUuOJOwj98qCqosJUC6niBdRlwGTLLAMCh
         THfZmt1gRXWwpv04hCh4iqSQNg62BFriTmi9NweUp8rKRLj3X0hH3Ep/gfJMio6xsUz0
         6GokJLlILUkHNhSX/Mla11N/20EOVdNcmSO1EAFWsnSJWYmdSex/LRoME2BRWV0H7l4K
         wD6UXCMbkiv/pc/LJzQVMFw51v7hGP1UQbg8pOgR/SD7tZeAoYpGvZkkICTxIuSIZKcf
         CekyqA6LQkKrwvKhMl9rpwY7y6oPyK10asHmBlDidwwZtLk39OWwqXOSlJm+QQrbdpjl
         waqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVovJpAuhU/I8qbyhG/EvBMBUTQXp89jdhWRtPB9ck0j/+nYYkDBP1vltaxepYs5jdG+SvAKeC8KCKF/KrVbTkY7x8+GPDR/sO8lsWHjbUxgUQv
X-Gm-Message-State: AOJu0Ywq5xKPgyzhiDpjWZEgfWvlkW13Ni9VEPLBbiRu5jUeu/bA0GSR
	1YDliy1qBIChSulSgsMHJH9yywt+DIO1EvDuR3FBMYqlSd42frXjxjy+nadZWKg=
X-Google-Smtp-Source: AGHT+IFSI/urq3kgCZ03qW/7Cfy3KmDoz5hvQStjC02N5fU8bds0AoRqbPquZ19VCIFBWcFmrd5RIA==
X-Received: by 2002:a17:906:ae84:b0:a75:2495:a6a3 with SMTP id a640c23a62f3a-a7a013c0f56mr554702166b.67.1721376189891;
        Fri, 19 Jul 2024 01:03:09 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a33ad4bfdsm72480666b.85.2024.07.19.01.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 01:03:09 -0700 (PDT)
Message-ID: <45b4a493-875a-4c9c-aa45-a6f32f74b865@baylibre.com>
Date: Fri, 19 Jul 2024 10:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] ASoC: codecs: add MT6357 support
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
 <1ca27c79-a83a-42a7-9e9b-766da0064c73@sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <1ca27c79-a83a-42a7-9e9b-766da0064c73@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_010312_379043_19ACC5DC 
X-CRM114-Status: GOOD (  15.55  )
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



On 21/06/2024 14:44, Mark Brown wrote:
> On Wed, Jun 19, 2024 at 04:46:48PM +0200, amergnat@baylibre.com wrote:
> 
>> +	/* gain default values*/
>> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, MT6357_AUDPREAMPLGAIN_MASK,
>> +			   UL_GAIN_0DB << MT6357_AUDPREAMPLGAIN_SFT);
>> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1, MT6357_AUDPREAMPRGAIN_MASK,
>> +			   UL_GAIN_0DB << MT6357_AUDPREAMPRGAIN_SFT);
>> +
>> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON1,
>> +			   MT6357_AUD_LOL_GAIN_MASK |
>> +			   MT6357_AUD_LOR_GAIN_MASK,
>> +			   DL_GAIN_0DB << MT6357_AUD_LOL_GAIN_SFT |
>> +			   DL_GAIN_0DB << MT6357_AUD_LOR_GAIN_SFT);
>> +
>> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON2,
>> +			   MT6357_AUD_HPL_GAIN_MASK |
>> +			   MT6357_AUD_HPR_GAIN_MASK,
>> +			   DL_GAIN_0DB << MT6357_AUD_HPL_GAIN_SFT |
>> +			   DL_GAIN_0DB << MT6357_AUD_HPR_GAIN_SFT);
>> +
>> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON3,
>> +			   MT6357_AUD_HS_GAIN_MASK, DL_GAIN_0DB);
> 
> We generally leave everything at chip defaults, why is this different?

Ok, after test, it isn't a problem to leave at chip defaults.

> 
>> +static int mt6357_codec_probe(struct snd_soc_component *codec)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +
>> +	mt6357_codec_init(priv);
>> +	return 0;
>> +}
> 
> Why not just inline mt6357_codec_init() into the one user?

You're right.

> 
>> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +	unsigned int val;
>> +
>> +	regmap_read(priv->regmap, reg, &val);
>> +	return val;
>> +}
>> +
>> +static int mt6357_write(struct snd_soc_component *codec, unsigned int reg, unsigned int value)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +
>> +	return regmap_update_bits(priv->regmap, reg, 0xffff, value);
>> +}
> 
> Why open code these, the core has standard adaptors for regmap?

You're right. snd_soc_component_write/read should be used instead

> 
>> +static const u32 micbias_values[MT6357_MICBIAS_ARRAY_SIZE] = {
>> +	1700000, 1800000, 1900000, 2000000,
>> +	2100000, 2500000, 2600000, 2700000
>> +};
> 
> Just use ARRAY_SIZE() for the size then the number can't be out of sync.
>
You're right.

-- 
Regards,
Alexandre

