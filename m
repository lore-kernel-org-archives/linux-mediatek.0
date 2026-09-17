Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27790C982D0
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 21:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+79viYgxDsziJXy6Z3ZyZxA3uUZqLw1sHaBsWajt9II=; b=YsTeUA/2r4rn65iv1+AREB6B8u
	pbdoo7AwPiwP78ae/HoJAKib7slJlhuehd705ZeNGd1KdXGzwQ9LqLBeKc25ZXgRsPo76z3y0IlRF
	zVTxPPjieuYlpr4oC275XBw349mjIYWVCzFA7KMMlsYYj6ecUYXNhqdJtfZYsvdFbfalJnGiwVhVJ
	PnoKWWPjECbPG/JlK5s9FP9tYCxreqjXmB/7eu5ufw9F2N6/CCYtLL4GK7rSDQ0HMAoV5ViH+cvcP
	RfrmprZQSF0Hypq5TFrrLds1DTlUfc2gz3gHvRNPcUGCdXQla+TwfYbOBmXeGD/vRlKog7DFfdGTV
	4QUbflXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JEw-0000000CVyi-00fS;
	Thu, 17 Sep 2026 21:01:54 +0000
Received: from mail-oi2-x0a.google.com ([2607:f8b0:4864:32::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JEt-0000000CVy1-3BAe
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 21:01:52 +0000
Received: by mail-oi2-x0a.google.com with SMTP id 5614622812f47-4c3975ebe46so34349b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 14:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678910; x=1790283710; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+79viYgxDsziJXy6Z3ZyZxA3uUZqLw1sHaBsWajt9II=;
        b=cZ6q3O9cOojrj/Pj9yM/N8BW7LM/3pKprbUH0V7KDW2Yl+ei1DFbxmq+OJYQaz/vnF
         m5VvKnL/t/ZDmLJkftgy3i6e3XjonMNd+fR9MiOXRR4BVixLfTxKECMDqeObgzrsm86b
         A4Y/8GIUIQq65d+nTKquLehVnWSNisRU+vZXmnJfm1c5GAemnvY2fuk6U/HNiNFz6Mzy
         X7/sBTZC35xgUp8x/Vc40dMiNWhMYtmLcQOcGwvMTgdSEgPKIahpH56Cvmpfs1DrK4bA
         uvFt/SF3fWoEpljS5mdoBBdiPEWRYoG1BTtdet/8uvEEQInItjdTFg9jQNKlZMmac0vN
         8Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678910; x=1790283710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+79viYgxDsziJXy6Z3ZyZxA3uUZqLw1sHaBsWajt9II=;
        b=gZCsGtd+Bhe5e5rxBJvdlIrRrUjGKwnzNO8HemolO6shSrLkkB8Lstq89N199LAdV1
         LpGT+wqbZEvqoLbdGNcMljgZKfZIVVT7Eg5GQ3PkjBD3jChmLoSrOrbebKqWlmJqtlO6
         3eyglaWSBeMx/suLgmruHZL7pUZVVlIc1XaUznSXNJZiCwptKT3ZYsTMn8DxCCSNskMw
         ODEKhdKILrPf4n1rvhSskW7Cl92GxbXTmVRztNfKiQKgxupNUiItbiIDRscuYq+wWHCU
         x4QUDXOPXWHNA8tj/lXoAEO9e/CIlAZ9wjJHqq4qde+FdTv8y+aC78pTVE9X8YaGsktR
         exaA==
X-Forwarded-Encrypted: i=1; AKwUvBxFY+lFVriYISBpSvACqS+YMTV2xNQLyYAm8zeBQH5uWWbNWsYi6JqkqT+55iwLsDp58XSqIzxstZx9f9TmVg==@lists.infradead.org
X-Gm-Message-State: AFuF++lx3A/yyzIfDm1DGg+spPls2z7d8yTPUfx/ZzmkWen6oMd1gm3q
	0qvIcSxzFhAcy+JNeAgCAVwmoQy3tWfSM9hNZKZlhVqPlWgET5a5OAcC
X-Gm-Gg: AYBFou1o9Tei6s6lzzIF33kSZs7pbGXPyGuKCpzUKkEWuTOUkC8C/tpV2u4TLZKpCep
	+IbM5q1qJyBUVvC+GNoSj78Grmi2X1nnU8whB3cghypv2/ZyHox7zgd2leMquETxGl9+rnr8dXU
	VCtG7xgIhE4aY1sLhujOtyd9EW7mgLv1AQ0fgikvpzlZbuveeYNi5vc70H0Q1SskaDP56NyoLYe
	J6zZU3Zhi421aTUGayTSSHk/S1jeseeWMjTimMaPqqdyRZlS71PEM63zwRKP+ShmC14KWLdx8X3
	7fe8CNNOHSArbBdpc14uj0n1hk2mzpLYkPMfPgZqub7AkI49VwTegY+cagpfFQ5THb3nhwPUFsh
	CODeAiRngSa+B2FXn+Ir2avBfUauU8UQ+MKLqwGT1RURXeHwpF7bF1vYRo9eozV/LF4Ptl0cj3z
	wFlzyorpiEj42sxa5q3t9QhDXCL8jVPvJZbazB25lXVGoYxuuYXWG2uXRObHy/o35yFZsNWZh+S
	XrJTGwGo7b1ItRfXbXs+LwwWrk=
X-Received: by 2002:a4a:ee12:0:b0:6ca:36f9:1799 with SMTP id 006d021491bc7-6ca90ca09fcmr332728eaf.8.1789678910429;
        Thu, 17 Sep 2026 14:01:50 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c8f6a5ac0esm4069086eaf.9.2026.09.17.14.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 14:01:49 -0700 (PDT)
Message-ID: <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Date: Thu, 17 Sep 2026 16:01:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
 <aqpnpT6hU5Z0s1TZ@ashevche-desk.local>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <aqpnpT6hU5Z0s1TZ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_140151_833212_0CAFE926 
X-CRM114-Status: GOOD (  28.72  )
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

On 9/16/26 4:55 AM, Andy Shevchenko wrote:
> On Tue, Sep 15, 2026 at 11:15:27PM -0500, Ryan Brue wrote:
>> The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
>> built around this PMIC it is the only way to read the battery: the SoC's
>> AUXADC is wired to board thermistors and the charger ICs these boards use
>> have no ADC of their own.
>>
>> Add a driver exposing the battery voltage and battery temperature
>> channels. Only those two are described, so a channel ID in the device tree
>> is an index into the driver's channel array rather than the PMIC's channel
>> number, as mt6323-auxadc does. The ready bit lives in a channel's raw
>> result register, but the value comes from the chip's trimmed copy of it,
>> which is what the vendor driver reads for a measurement.
>>
>> Both channels need more than that, as the vendor programs them. The
>> battery voltage is measured through ISENSE, because a board with a
>> switching charger in the power path leaves BATSNS on the charger's system
>> rail instead of on the pack. The thermistor only reads correctly with the
>> PMIC's battery-detect bias and input buffer enabled, which take 20 ms to
>> settle. Both are switched back off afterwards.
>>
>> Reads average sixteen conversions in software; the chip's sample
>> accumulator makes no measurable difference at any setting, so it is left
>> at one sample per conversion.
> ...
>
>> +/*
>> + * MediaTek MT6397 PMIC AUXADC IIO driver
>> + *
>> + * Copyright (c) 2026 Ryan Brue <ryanbrue.dev@gmail.com>
>> + *
>> + * Based on drivers/iio/adc/mt6323-auxadc.c
> Why not add this device support into that driver?
Please see [1].
>> + */
> ...
>
>> +#define MT6397_AUXADC_ISENSE_SETTLE_US	USEC_PER_MSEC
> (1 * USEC_PER_MSEC)
Ack, fixed in v2
> ...
>
>> +static const struct iio_chan_spec mt6397_auxadc_channels[] = {
>> +	MTK_PMIC_IIO_CHAN(isense,   MT6397_AUXADC_ISENSE,
> One space too many.
Ack, fixed in v2
>> +			  MT6397_AUXADC_HWCHAN_BATSNS),
>> +	MTK_PMIC_IIO_CHAN(bat_temp, MT6397_AUXADC_BAT_TEMP,
>> +			  MT6397_AUXADC_HWCHAN_BAT_TEMP),
>> +};
> ...
>
>> +static int mt6397_auxadc_battemp_bias(struct mt6397_auxadc *adc, bool on)
>> +{
>> +	struct regmap *map = adc->regmap;
>> +	int ret;
>> +
>> +	if (on) {
>> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
>> +				      MT6397_AUXADC_CON0_BUF_PWD_ON);
>> +		if (ret)
>> +			return ret;
>> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
>> +				      MT6397_AUXADC_CON0_BUF_PWD_B);
>> +		if (ret)
>> +			return ret;
>> +		return regmap_set_bits(map, MT6397_CHR_CON7,
>> +				       MT6397_CHR_CON7_BATON_TDET_EN);
>> +	}
>> +
>> +	ret = regmap_clear_bits(map, MT6397_CHR_CON7,
>> +				MT6397_CHR_CON7_BATON_TDET_EN);
>> +	ret = ret ?: regmap_clear_bits(map, MT6397_AUXADC_CON0,
>> +				       MT6397_AUXADC_CON0_BUF_PWD_B);
>> +	return ret ?: regmap_clear_bits(map, MT6397_AUXADC_CON0,
>> +					MT6397_AUXADC_CON0_BUF_PWD_ON);
> Huh?! Please, use standard pattern with 'if (ret) return ret;'.
> Ditto for other weird cases like this.
Fixed in v2, and also modified to allow the regmap clears and sets to 
fall through, so one failure doesn't leave some of those bits in the 
wrong state.
>> +}
> ...
>
>> +{
>> +	unsigned int i, sum = 0;
>> +	int ret, sample;
> It's preferred not to mix ret with other semantically different variables.
Ack, thanks! Fixed in v2
>> +	/* Held across the whole burst: the channel select is shared state. */
>> +	guard(mutex)(&adc->lock);
>> +
>> +	if (chan->channel == MT6397_AUXADC_ISENSE) {
>> +		ret = mt6397_auxadc_isense_enable(adc);
>> +		if (ret)
>> +			return ret;
>> +		fsleep(MT6397_AUXADC_ISENSE_SETTLE_US);
>> +	} else {
>> +		ret = mt6397_auxadc_battemp_bias(adc, true);
>> +		if (ret)
>> +			return ret;
>> +		fsleep(MT6397_AUXADC_BATTEMP_SETTLE_US);
>> +	}
>> +	for (i = 0; i < MT6397_AUXADC_SAMPLES; i++) {
> 	for (unsigned int i = 0; i < MT6397_AUXADC_SAMPLES; i++) {
>
>
>> +		ret = mt6397_auxadc_read_once(adc, chan, &sample);
>> +		if (ret)
>> +			break;
>> +
>> +		sum += sample;
>> +	}
>> +
>> +	/* Lower START so the converter is not left armed between reads. */
>> +	regmap_clear_bits(adc->regmap, MT6397_AUXADC_CON1,
>> +			  MT6397_AUXADC_CON1_START);
>> +
>> +	if (chan->channel == MT6397_AUXADC_ISENSE)
>> +		mt6397_auxadc_isense_disable(adc);
>> +	else
>> +		mt6397_auxadc_battemp_bias(adc, false);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	*val = DIV_ROUND_CLOSEST(sum, MT6397_AUXADC_SAMPLES);
>> +
>> +	return 0;
>> +}
> ...
>
> Otherwise nice and small driver.
Thanks for the review, Andy!

Best regards,
Ryan

