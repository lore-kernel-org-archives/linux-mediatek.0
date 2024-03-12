Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21D3C54E5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HREX7H/9qDu7coR15IdnVSKnBY8ogVJjtclSGzuYtSo=; b=ALQ0XtID1W/FmeX3YgMmFHAZo4
	QjM7hFlL4HFKudmU/OMd4JP6/fkUvon7ox2Rdcfn2IxZ1m9lQDaz1JA0ad5KGopRgpjJVniAunLQS
	+u16gkB4RqyVMJWoGfKHgfz+SghKcDTMYfe4U1GfZqc+PMe32XSs6wZXfA8B1/cbyYKk20kZuBHZY
	QYxgKdY/nH+KOtFOw+XIKf5t9lv7pwoCmJutASF6NDNhC2h6cVINZXpSqmVUZ7gl6h5YIpDyX+R3P
	xdCrm9Z7IXbNb5yi5/NKzB6sSv0HY4Z2Y55q8gmBZCgFrMq81qLpRs80wHkePmjp2vjrHNmsyXFXd
	uv3zly9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk6TO-00000006xeh-3duz;
	Tue, 12 Mar 2024 18:03:35 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk6TL-00000006xcc-0JfB
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Mar 2024 18:03:33 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-513b022a238so2546390e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Mar 2024 11:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710266608; x=1710871408; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HREX7H/9qDu7coR15IdnVSKnBY8ogVJjtclSGzuYtSo=;
        b=shfyNia+j8eHf0mEl49BpeRd/NrR2v74mvuqeFviI7C4Ge35Q4Rbm2WLSAIoDGSBip
         v1oxH3smaBwe6SlyHutnOsuHWSpe//wP53MRqRQWhiSI4rtYrTLeJvUM0w0kEUcaWdWw
         rgTFk6IRSZ6RSwMqjhr4ETTgSMfOJwZahxGHofSpjX4Kt9lpeoktBwi07EZBMH2XgruJ
         v5kbNQ7XgLERLzydxFYf0BhtE0mXNA2rds2mIaOVYiFF/EyuzTu/HIbkqb3I9Kg5YXtL
         YGXBH3Zxv9vA7eA0bjryKJWMTuKlG64CSaoYnTBv0pp7/ZxMf+lMcv2PZBfOh1HpiWQL
         sdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710266608; x=1710871408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HREX7H/9qDu7coR15IdnVSKnBY8ogVJjtclSGzuYtSo=;
        b=YdYNgDuB6alM1VKimkk9F6mhQplCm+Vvc38nmnfRxFbF8/3LBCORIXSuCzmgh4Ehsp
         BVsxULuLrDsacE1K0Sp6rI9rWvr7j5q0SkqEOKRh0FQ5NlDQLykYe+gSoglTKRK519gk
         g7CZWFH9PXjKXHlXC91BF1iVoWpWCr+q/Pi9LKqx3Yaq4aZ93lcfJzsSh6jkxnC5iRK4
         hoKS/5rikoUcwf2M/I9e67m8lMY6umNhn6vvvcS5Thgejep4c+m706FegsnmU3pwhZn3
         DfHTJpim+u1JEbt9juOYNZ4ei7om2+GuYCmiCzFG6Qg7pSFZn1gWQjGo6dHj4Q1/K1Ez
         SCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgACazkW4cPkt3EDiSp6qzRG3ePQgYHTAUYrP27JTx81oIhpkzyD43M9Xhuh/JkMI1aMREL3fGuxrTHDqilkMUCJM4ebz7szxtzpzpHPy7cjmM
X-Gm-Message-State: AOJu0YwW6As3Y1ExjvYKVz2gPV/lBVEWMTJbN6xkLkJt0YO0FcSsJgnY
	NSXcfEoElHo+r/hV3Btbn2+Wct9CVIoNOUggveJqp4qBGxF0gCOADu38nl1ZRQs=
X-Google-Smtp-Source: AGHT+IH4QkVIYDqyhzAKmOcXC+nBQU3/7sOVXezpH3hXulIwAWJtf0fWxm8Rb21sEMqvyOTNR1ZG+Q==
X-Received: by 2002:a05:6512:ba4:b0:513:a72c:de7c with SMTP id b36-20020a0565120ba400b00513a72cde7cmr2898449lfv.46.1710266608394;
        Tue, 12 Mar 2024 11:03:28 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id bq7-20020a5d5a07000000b0033e95794186sm6250688wrb.83.2024.03.12.11.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 11:03:27 -0700 (PDT)
Message-ID: <c441a132-b16b-4244-a712-8971c902d4d7@baylibre.com>
Date: Tue, 12 Mar 2024 19:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
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
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_110331_377588_433678B7 
X-CRM114-Status: GOOD (  29.12  )
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



On 26/02/2024 17:09, Mark Brown wrote:
> On Mon, Feb 26, 2024 at 03:01:50PM +0100, amergnat@baylibre.com wrote:
> 
>> index 000000000000..13e95c227114
>> --- /dev/null
>> +++ b/sound/soc/codecs/mt6357.c
>> @@ -0,0 +1,1805 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MT6357 ALSA SoC audio codec driver
>> + *
> 
> Please use a C++ comment for the whole comment to make it clearer that
> this is intentional.

ok

> 
>> +static void set_playback_gpio(struct mt6357_priv *priv, bool enable)
>> +{
>> +	if (enable) {
>> +		/* set gpio mosi mode */
>> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, GPIO_MODE2_CLEAR_ALL);
>> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_SET, GPIO8_MODE_SET_AUD_CLK_MOSI |
>> +								  GPIO9_MODE_SET_AUD_DAT_MOSI0 |
>> +								  GPIO10_MODE_SET_AUD_DAT_MOSI1 |
>> +								  GPIO11_MODE_SET_AUD_SYNC_MOSI);
> 
> This would be a lot more legible if you worked out the values to set and
> then had a single set of writes, currently the indentation makes it very
> hard to read.  Similarly for other similar functions.

ok

> 
>> +static int mt6357_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(component);
>> +	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	ret = snd_soc_put_volsw(kcontrol, ucontrol);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	switch (mc->reg) {
>> +	case MT6357_ZCD_CON2:
>> +		regmap_read(priv->regmap, MT6357_ZCD_CON2, &reg);
>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTL] =
>> +			(reg & AUD_HPL_GAIN_MASK) >> AUD_HPL_GAIN_SFT;
>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTR] =
>> +			(reg & AUD_HPR_GAIN_MASK) >> AUD_HPR_GAIN_SFT;
>> +		break;
> 
> It would probably be less code and would definitely be clearer and
> simpler to just read the values when we need them rather than constatly
> keeping a cache separate to the register cache.

Actually you must save the values because the gain selected by the user 
will be override to do a ramp => volume_ramp(.....):
- When you switch on the HP, you start from gain=-40db to final_gain 
(selected by user).
- When you switch off the HP, you start from final_gain (selected by 
user) to gain=-40db.

Also, the microphone's gain change when it's enabled/disabled.

So, it can implemented differently but currently it's aligned with the 
other MTK codecs and I don't see any resource wasted here.

> 
>> +	/* ul channel swap */
>> +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),
> 
> On/off controls should end in Switch.

Sorry, I don't understand your comment. Can you reword it please ?

> 
>> +static const char * const hslo_mux_map[] = {
>> +	"Open", "DACR", "Playback", "Test mode"
>> +};
>> +
>> +static int hslo_mux_map_value[] = {
>> +	0x0, 0x1, 0x2, 0x3,
>> +};
> 
> Why not just use a normal mux here, there's no missing values or
> reordering?  Similarly for other muxes.

I've dug into some other codecs and it's done like that, but I've 
probably misunderstood something.

The only bad thing I see is enum is missing currently:

enum {
	PGA_MUX_OPEN = 0,
	PGA_MUX_DACR,
	PGA_MUX_PB,
	PGA_MUX_TM,
	PGA_MUX_MASK = 0x3,
};

static const char * const hslo_mux_map[] = {
	"Open", "DACR", "Playback", "Test mode"
};

static int hslo_mux_map_value[] = {
	PGA_MUX_OPEN, PGA_MUX_DACR, PGA_MUX_PB, PGA_MUX_TM,
};

> 
>> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +	unsigned int val;
>> +
>> +	pr_debug("%s() reg = 0x%x", __func__, reg);
>> +	regmap_read(priv->regmap, reg, &val);
>> +	return val;
>> +}
> 
> Remove these, there are vastly more logging facilities as standard in
> the regmap core.

ok

> 
>> +/* Reg bit defines */
>> +/* MT6357_GPIO_DIR0 */
>> +#define GPIO8_DIR_MASK				BIT(8)
>> +#define GPIO8_DIR_INPUT				0
> 
> Please namespace your defines, these look very generic.

ok

-- 
Regards,
Alexandre

