Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C93C982D0
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 23:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9YGfpGG2ynRncYGiDzoG8oC5Zk7r9CYJBEST6kv/j8=; b=a+fjYLYm6ck3TGX2J9HcjVIy9q
	SN64vGXWDLnK2ZBMdTa6WddnouCd2nXBzznkxQ3mb9uw8z8PgD3GhNa9UrSUH2PM7H8UboBfuXC09
	SFLkTNvfEVFgJYIXjiE8rgrkhsclEH+iOBWFHZ+6e+fG2gNqPrkRr1+98D1VbuCsCCuy6ITi4698B
	qTJQMBBg+p/mOT3ht36v5MJb5Wvnn6GzpYGBqPLIGmsSwjGCDHehov+o9Erhes8hm3wvj9AFuK6yg
	8m2+yN0nTfFqOYmeWbsTjqysD6tEmosO33UDi8yHaHFcH7lsmkLU08HyhUBhhGkVGxn+Q3V8EKGI1
	i6UV7ZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L5m-0000000Cjz6-3v6F;
	Thu, 17 Sep 2026 23:00:34 +0000
Received: from mail-oi2-x09.google.com ([2607:f8b0:4864:32::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L5c-0000000Cjkl-0UT0
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 23:00:33 +0000
Received: by mail-oi2-x09.google.com with SMTP id 46e09a7af769-7f4e6693089so37652a34.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 16:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789686023; x=1790290823; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9YGfpGG2ynRncYGiDzoG8oC5Zk7r9CYJBEST6kv/j8=;
        b=Y9iliJVGlwqUEGwJhACsx3+QNLl2jf1xe4m83LV8i5ZKf1AUeq3KI2mjfD0Z+83EhY
         pNIj1fuww293CHcsOdFS/UeAqowd4yPbVJYowEy5R5CGMtEvlr2gaC7KNufiGyotdMDW
         KC9XvY0A5JcKhuGOi4qLdAYrJA/y3/DjgByng5YBYPEum/9lkEu6ioD1RZ/Kms54TxMU
         thUEdyl0Ga1ILYmq/Gf0MNCuPr/2mmdovaZQzY8zsBv69rv+b6kr6obfB06mMPjWqlM2
         Vh+dDSJ1ZUwkoxxqqN10vyr3qO8l65SKJ2MIxfDxGxN/k2hTi5+yGe4Z3dpVBTXNWp52
         cl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686023; x=1790290823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9YGfpGG2ynRncYGiDzoG8oC5Zk7r9CYJBEST6kv/j8=;
        b=FcID6QrdqfCHwKD5aeqC1+gXNrFyim+SWLiHhOBVd9Ey8PfqWqxAIjg/IEba2P5Prf
         uFCIJWaJDMvZkDShnbnkndPCCsj+r0+BZOGNaJSQDruRFDPlZzOQ/pLVpF2LJYZmCMPt
         fx4OAbkQRDpiPWWekK2/Q/F88mlXWayZHjlgjQah1MCaAZxtOG/SpoofMXni/BZB9w4F
         hd59B6XP8ntHXCM0d1SQf0k26haZNgFD/CqYvudbjFyMQ3HTstfqk1dtEpuVII2XWyeo
         IdtwJUP4Ky5in+i2lkibM9uuJPeV8ropCZd7dArTUW000rYatv5j7S4jMo9IaEf5IgpG
         2tYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPlfKpqCu7GgitmasSN6Im51TP+rZwwqPTW6SA0t9n9jnD8VepyHq3keIz2Dg3SYB+c9Lh3mcukBT64sLH2w==@lists.infradead.org
X-Gm-Message-State: AFuF++kFyxp523EfkgUuShiOiXjvHgi0nHt9AaUG/IdlGmj+cRT2qB2F
	7HcyjYQXFKdHoHsRm9vVTAPCyD+cy1kOu6Af9FOCjVgah3ssnN6yWEn6
X-Gm-Gg: AYBFou389s6J+1LFPYPT9iTqyBAOL3t4Khpomt25exFZ3GRD58Cyzs9xXybxExCFLKW
	H7Ez/q26akcPYACac/LMLGe/X3Nnw1iPArPknIL5S0EkbNLPqyZDTpuWvO4Qj3UiHX3dRQObtMf
	FVDrNgBnhGictemgn5mbKG8AKyMDExVp0s87aaiC3+ER+TxJi1XcOZ+NV8i24VksXczaXNxPFNp
	5KZp2/q+efj4+l/UPQXI2iMQOeS991RVChv++QFSjlWjpO4Y09nDQXWwwYV5dOhwS+GTs2fpamQ
	7ttE2/8H7/d+drzzkRKTykTjbngNQwZd9CroxQDf2jC9itGCzWFDzV16848H46FvFer2UmzGlJ8
	pBrGjjKDmEV79OdtMYpOadaEuz7OUuuvulggP2LuULWepUEaH2l3vqyL+FTDChfg7mNS4L1OskH
	MG7FI7J/4BWLUww8wSmOsavMlpT7L4sMH4owmOMvc++kP6p1gIQUKTaei4e2vEqD4Qg0E3kw1df
	zxi+PXFFtwyIck=
X-Received: by 2002:a05:6830:7009:b0:805:b3e5:18d9 with SMTP id 46e09a7af769-80ddff697ddmr866597a34.10.1789686022798;
        Thu, 17 Sep 2026 16:00:22 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80c4669b120sm4449271a34.10.2026.09.17.16.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 16:00:21 -0700 (PDT)
Message-ID: <9a4a8288-47e0-4388-8991-8674b85e2306@gmail.com>
Date: Thu, 17 Sep 2026 18:00:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
 <20260917044852.3da6f7e5@jic23-hlaptop>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260917044852.3da6f7e5@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_160024_403057_C25654FD 
X-CRM114-Status: GOOD (  54.18  )
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

On 9/16/26 10:48 PM, Jonathan Cameron wrote:
> On Tue, 15 Sep 2026 23:15:27 -0500
> Ryan Brue <ryanbrue.dev@gmail.com> wrote:
>
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
>>
>> Assisted-by: LLM
>> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> I took a quick look but Andy called out the biggest question,
> why doesn't it make sense to extend an existing driver to
> cover this part?  Might not make sense but you need to talk
> through why not in the cover letter.
I replied to Andy with an explanation [1], and I will justify in my 
cover letter for v2. In short, I think the new driver is justified, but 
if it's desired to roll in the mt6397 with another driver, let me know.
>> diff --git a/drivers/iio/adc/mt6397-auxadc.c b/drivers/iio/adc/mt6397-auxadc.c
>> new file mode 100644
>> index 000000000000..dbfa82341d6c
>> --- /dev/null
>> +++ b/drivers/iio/adc/mt6397-auxadc.c
> ...
>
>> +/*
>> + * CHR_CON16 and the two SOURCE_CH0 selects route either BATSNS or ISENSE onto
>> + * the battery channel. Only ISENSE is used: with a switching charger in the
>> + * power path BATSNS sits on the system rail rather than on the pack.
>> + */
>> +#define MT6397_CHR_CON16		0x0020
>> +#define MT6397_CHR_CON16_ADCIN_VSEN_EN	BIT(11)
>> +#define MT6397_CHR_CON16_ADCIN_VBAT_EN	BIT(10)
> These are used as values for the ADCIN_SEL.
> I think they should have names to make that clear and be
> 1 and 2 rather than bits.
The OR between VSEN_EN and VBAT_EN was a mistake. These two bits are 
part of a larger set of 5 mutually exclusive enable bits (CON16 bits 
12:8). I fixed this in v2, and also added the #define s for the others. 
Let me know if I shouldn't add those because we don't use them, I'm on 
the fence for that.
>> +#define MT6397_CHR_CON16_ADCIN_SEL	(MT6397_CHR_CON16_ADCIN_VSEN_EN | \
>> +					 MT6397_CHR_CON16_ADCIN_VBAT_EN)
> This would then be a register field mask from GENMASK()
Mentioned above, but these are mutually exclusive bits, not a field, but 
it's my fault that it looked like one. Fixed in v2.
>
>> +#define MT6397_AUXADC_CON14		0x055e
>> +#define MT6397_AUXADC_CON14_CH0_NORM_SEL BIT(2)
>> +#define MT6397_AUXADC_CON14_CH0_LBAT_SEL BIT(0)
> A common visual trick in IIO drivers separates register addresses from fields
> and from values.
> #define MT6397_AUXADC_CON14		0x055e
> #define   MT6397_AUXADC_CON14_CH0_NORM_SEL BIT(2)
> #define   MT6397_AUXADC_CON14_CH0_LBAT_SEL BIT(0)
>
> Also blank line here as the settle time is not directly related to the
> register.
>> +#define MT6397_AUXADC_ISENSE_SETTLE_US	USEC_PER_MSEC
>> +
>> +struct mt6397_auxadc {
>> +	struct regmap *regmap;
>> +	/* AUXADC doesn't support reading multiple channels simultaneously. */
> I'd rather you said why than simply not supported. Seems
> that it's a multi register sequence so needs to be atomic wrt
> to other channel reads.
Ack, I'll justify it in v2. You're right about the reason. In 
particular, all the channel reads need CON1.
>> +	struct mutex lock;
>> +};
>> +
>> +#define MTK_PMIC_IIO_CHAN(_name, _chan, _hwchan)                \
>> +{                                                               \
>> +	.type = IIO_VOLTAGE,                                    \
>> +	.indexed = 1,                                           \
>> +	.channel = _chan,                                       \
>> +	.address = _hwchan,                                     \
>> +	.datasheet_name = __stringify(_name),                   \
>> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |          \
>> +			      BIT(IIO_CHAN_INFO_SCALE),         \
>> +}
> For two the macro is of marginal benefit. I'd just put the structure
> values in directly.  Then we know which parameter is which etc.
Done in v2. If I had to guess why the LLM might have chosen the macro, 
it might be because there are other channels that exist, just not 
channels that my device uses (referencing the vendor's Amazon Fire OS 
which is based on Linux 3.18). Making it a macro would make it maybe 
cleaner for anybody who comes in and needs to add more channels? Who knows.
>> +
>> +/*
>> + * A device tree channel ID indexes this array; .address holds the PMIC channel
>> + * number. The thermistor reports as a voltage because that is all the PMIC
>> + * measures: the divider across an NTC whose curve belongs to the board.
>> + */
>> +static const struct iio_chan_spec mt6397_auxadc_channels[] = {
>> +	MTK_PMIC_IIO_CHAN(isense,   MT6397_AUXADC_ISENSE,
> If you do keep this, one space is enough. Aligning when there
> are lines in between brings little value that I can see.
>
>> +			  MT6397_AUXADC_HWCHAN_BATSNS),
>> +	MTK_PMIC_IIO_CHAN(bat_temp, MT6397_AUXADC_BAT_TEMP,
>> +			  MT6397_AUXADC_HWCHAN_BAT_TEMP),
>> +};
>> +
>> +static int mt6397_auxadc_read_once(struct mt6397_auxadc *adc,
>> +				   const struct iio_chan_spec *chan, int *val)
>> +{
>> +	struct regmap *map = adc->regmap;
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	ret = regmap_update_bits(map, MT6397_AUXADC_CON1,
>> +				 MT6397_AUXADC_CON1_CHSEL,
>> +				 FIELD_PREP(MT6397_AUXADC_CON1_CHSEL,
>> +					    chan->address));
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* START is edge triggered: it has to be lowered before being raised. */
>> +	ret = regmap_clear_bits(map, MT6397_AUXADC_CON1,
>> +				MT6397_AUXADC_CON1_START);
> For lines that go not much over 80 chars and where it helps readability it
> is fine to break that limit.  I think that applies here.
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_set_bits(map, MT6397_AUXADC_CON1,
>> +			      MT6397_AUXADC_CON1_START);
> and here.
Both done in v2.
>> +	if (ret)
>> +		return ret;
>> +
>> +	fsleep(MT6397_AUXADC_START_US);
>> +
>> +	ret = regmap_read_poll_timeout(map, MT6397_AUXADC_ADC(chan->address),
>> +				       reg, reg & MT6397_AUXADC_ADC_RDY,
>> +				       100, 100 * USEC_PER_MSEC);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_read(map, MT6397_AUXADC_ADC_TRIM(chan->address), &reg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*val = FIELD_GET(MT6397_AUXADC_ADC_VAL, reg);
>> +
>> +	return 0;
>> +}
>> +
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
> Add a blank line here
>> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
>> +				      MT6397_AUXADC_CON0_BUF_PWD_B);
>> +		if (ret)
>> +			return ret;
> and here.  Small readability improvement but worth having!
Done in v2
>> +		return regmap_set_bits(map, MT6397_CHR_CON7,
>> +				       MT6397_CHR_CON7_BATON_TDET_EN);
>> +	}
> For cases like this I'd use and else.
> Not strictly necessary but makes it visually obvious it is an either or
> question.
Done in v2
>> +
>> +	ret = regmap_clear_bits(map, MT6397_CHR_CON7,
>> +				MT6397_CHR_CON7_BATON_TDET_EN);
>> +	ret = ret ?: regmap_clear_bits(map, MT6397_AUXADC_CON0,
>> +				       MT6397_AUXADC_CON0_BUF_PWD_B);
>> +	return ret ?: regmap_clear_bits(map, MT6397_AUXADC_CON0,
>> +					MT6397_AUXADC_CON0_BUF_PWD_ON);
>> +}
>> +
>> +static int mt6397_auxadc_isense_disable(struct mt6397_auxadc *adc)
>> +{
>> +	struct regmap *map = adc->regmap;
>> +	int ret;
>> +
>> +	ret = regmap_clear_bits(map, MT6397_AUXADC_CON14,
>> +				MT6397_AUXADC_CON14_CH0_NORM_SEL |
>> +				MT6397_AUXADC_CON14_CH0_LBAT_SEL);
>> +
>> +	return ret ?: regmap_clear_bits(map, MT6397_CHR_CON16,
>> +					MT6397_CHR_CON16_ADCIN_SEL);
> Andy called this out already.  LLM being too clever maybe?
> Anyhow, just burn a few lines of code for readability!
Oh yeah, almost certainly. These are the kinds of lessons I learn when 
I'm new to kernel development and have no clue how simple or complex 
certain blocks should be, haha.
Done in v2, Sashiko also pointed out that the early return could leave 
some register bits set that should be cleared, so that will be fixed in 
v2 as well.
>> +}
>> +
>> +static int mt6397_auxadc_read_channel(struct mt6397_auxadc *adc,
>> +				      const struct iio_chan_spec *chan,
>> +				      int *val)
>> +{
>> +	unsigned int i, sum = 0;
> Please split variables that are initialized from ones that aren't.
> Can be hard to spot when just one is.
Done in v2.
>> +	int ret, sample;
>> +
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
>> +
>> +	for (i = 0; i < MT6397_AUXADC_SAMPLES; i++) {
> 	for (unsigned int i = 0; ...
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
>> +
>> +static int mt6397_auxadc_init(struct mt6397_auxadc *adc)
>> +{
>> +	return regmap_update_bits(adc->regmap, MT6397_AUXADC_CON0,
>> +				  MT6397_AUXADC_CON0_SPL_NUM,
>> +				  FIELD_PREP(MT6397_AUXADC_CON0_SPL_NUM, 1));
> Not worth having a helper to call just one thing. Put this regmap
> call inline.
Done in v2.
>> +}
>> +
>> +static const struct of_device_id mt6397_auxadc_of_match[] = {
>> +	{ .compatible = "mediatek,mt6397-auxadc" },
>> +	{ /* sentinel */ }
> 	{ }
>
> Is enough.  The sentinel nature of that is kind of obvious so
> a while back we removed all those comments from IIO.
>
Done in v2.
>> +};
>> +MODULE_DEVICE_TABLE(of, mt6397_auxadc_of_match);
>>

Thanks for the review!

[1] 
https://lore.kernel.org/all/2d1b80f2-53f6-4ed6-81bf-e35c0a9efb26@gmail.com/

Best regards,
Ryan

