Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B56C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPaODleuydbpyW0oBL1XNwJwvfUIp3A8aiBZ01eGt1Q=; b=bouAZavBjXVu05ag0imexQpKTl
	umrPvrS5GeoI8ZaOLW872LP+l0aCMcYySar9zu6Li6VwfnQfgLR4sdN7P5t8brvREdwuVV5tp0TJT
	h6FZA/xjBlgUnfZMYrMIq2OcVSEVhyM7SDYpmJr2WO16DewwNvsmA2D81XvUgxoGEFLM6+OZ+QqfA
	dgViquhaHh9d9OmlS7CZN5EuqgNfc3dn6coYluwMAWS4SXtG6UlEmRsQ3w5BuBOHrWcvCZk+ICiWV
	LcF/cdli5c9Imt5nZUQm4qAsXA4uvS524r2dXNR5uo3+TjIHxTPWMKByQUtY/XP2HhfrO3lTeu7G8
	zzMKIgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXZ3-008PWh-LU; Thu, 21 Jul 2022 14:54:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXWX-008MUE-Cm
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 14:51:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id n12so2616517wrc.8
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 07:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=IPaODleuydbpyW0oBL1XNwJwvfUIp3A8aiBZ01eGt1Q=;
        b=Bp2CpXtTwoG2Mnt4Fsd7PNBiqhFzvabUoEaCdKBe3coRfhSaMn+IIzpniKnrnFrdUL
         YhHsz3Ra5N7e+r023RiThEm579WWFjxT2W0IebSd/oCBBUrkN2xOrQcsyBg6JyfJ/B06
         uW2TLiUxl2xnqjMml93W/ohzP0oDXt+rL55KYML2aeVYi9E9IwK0fr75+lVU9M4E6WHn
         w+wMYeCQ/PNSDSqlUkF0fvC4GDYMUpr7/gqG3lio6pvxXZ229AUfF0LOIV9uFJw/fDXj
         xPhrjpbrWMoF9dB7pyMhKmgN+M7JS8WWrZtMk0sg7uhJaH7SOHY7byVkp4DdroOI7rGq
         6F3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=IPaODleuydbpyW0oBL1XNwJwvfUIp3A8aiBZ01eGt1Q=;
        b=OpBGAyig4Lc58+xxIET+5SkuHZ0S/wS48aiFQxnvnAbmyfIg82BXg2LfRa502IOxFM
         9SIoiXEmhe2KxaUNyqA3hm0hLwx3865Aw1KZW9UmHDfTgS6E9o7Q4yIse133EaUxH0BE
         AZ6c8PEEdK+w4zvb7Fh7KrKr4E0oIyVBuJUXIGz3RALu4Lp0wPVvGeoorM2SYQWtdSmk
         fex7MwD5BzZ8mC0ZriXD3jTaUMAO6ACPRlTtyPOTkIzRpuN3WyxWdVIMh5cokaW7ToJu
         1ooHm0xCFfHb+3famQ5ZoVVZpeB+KoOeqRl2DdHbt8Rzg0O67qj95StcG8CanV9WZavh
         oAFQ==
X-Gm-Message-State: AJIora+37F54++Q/Cp2CkcdXRaGc5Jl+JE18u7NmGKCah5QR3j5Y7bit
	eXPHmPhGtu/N5OnYth/9tEGYDQ==
X-Google-Smtp-Source: AGRyM1sfP4ZknR79BKzwBYDjRzsvFl6fMqYkGmVH+vZxkOOLeoF5imavLdHStfa8XEkO8/4kwJBLWg==
X-Received: by 2002:adf:f0c6:0:b0:21e:4480:2fa5 with SMTP id x6-20020adff0c6000000b0021e44802fa5mr9138352wro.377.1658415090631;
        Thu, 21 Jul 2022 07:51:30 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id q5-20020a1ce905000000b003a0323463absm2087311wmc.45.2022.07.21.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 07:51:30 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 4/6] Input: mt6779-keypad - support double keys matrix
In-Reply-To: <b2676b5c-14b3-2058-9fb8-d6d78cc5d29c@collabora.com>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-4-ef9fc29dbff4@baylibre.com>
 <b2676b5c-14b3-2058-9fb8-d6d78cc5d29c@collabora.com>
Date: Thu, 21 Jul 2022 16:51:29 +0200
Message-ID: <87ilnqh632.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_075133_457627_307F0583 
X-CRM114-Status: GOOD (  20.93  )
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

On Thu, Jul 21, 2022 at 10:34, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 20/07/22 16:48, Mattijs Korpershoek ha scritto:
>> MediaTek keypad has 2 modes of detecting key events:
>> - single key: each (row, column) can detect one key
>> - double key: each (row, column) is a group of 2 keys
>> 
>> Double key support exists to minimize cost, since it reduces the number
>> of pins required for physical keys.
>> 
>> Double key is configured by setting BIT(0) of the KP_SEL register.
>> 
>> Enable double key matrix support based on the mediatek,double-keys
>> device tree property.
>> 
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>> 
>> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
>> index bf447bf598fb..9a5dbd415dac 100644
>> --- a/drivers/input/keyboard/mt6779-keypad.c
>> +++ b/drivers/input/keyboard/mt6779-keypad.c
>> @@ -18,6 +18,7 @@
>>   #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
>>   #define MTK_KPD_DEBOUNCE_MAX_MS	256
>>   #define MTK_KPD_SEL		0x0020
>> +#define MTK_KPD_SEL_DOUBLE_KP_MODE	BIT(0)
>>   #define MTK_KPD_SEL_COL	GENMASK(15, 10)
>>   #define MTK_KPD_SEL_ROW	GENMASK(9, 4)
>>   #define MTK_KPD_SEL_COLMASK(c)	GENMASK((c) + 9, 10)
>> @@ -31,6 +32,7 @@ struct mt6779_keypad {
>>   	struct clk *clk;
>>   	u32 n_rows;
>>   	u32 n_cols;
>> +	bool double_keys;
>>   	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
>>   };
>>   
>> @@ -67,8 +69,13 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
>>   			continue;
>>   
>>   		key = bit_nr / 32 * 16 + bit_nr % 32;
>> -		row = key / 9;
>> -		col = key % 9;
>> +		if (keypad->double_keys) {
>> +			row = key / 13;
>> +			col = (key % 13) / 2;
>> +		} else {
>> +			row = key / 9;
>> +			col = key % 9;
>> +		}
>
> I don't fully like this if branch permanently evaluating true or false, as no
> runtime can actually change this result...
>
> In practice, it's fine, but I was wondering if anyone would disagree with the
> following proposal...
>
> struct mt6779_keypad {
> 	.......
> 	void (*calc_row_col)(unsigned int *row, unsigned int *col);
> };
>
> In mt6779_keypad_irq_handler:
>
> 	key = bit_nr / 32 * 16 + bit_nr % 32;
> 	keypad->calc_row_col(&row, &col);
>
> and below...
>
>>   
>>   		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
>>   		/* 1: not pressed, 0: pressed */
>> @@ -150,6 +157,8 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>>   
>>   	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
>>   
>> +	keypad->double_keys = device_property_read_bool(&pdev->dev, "mediatek,double-keys");
>> +
>>   	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",
>>   		keypad->n_rows, keypad->n_cols, debounce);
>>   
>> @@ -166,6 +175,10 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>>   	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
>>   		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
>>   
>> +	if (keypad->double_keys)
>
> 		keypad->calc_row_col = mt6779_keypad_calc_row_col_double_kp;
>
>> +		regmap_update_bits(keypad->regmap, MTK_KPD_SEL,
>> +				   MTK_KPD_SEL_DOUBLE_KP_MODE, MTK_KPD_SEL_DOUBLE_KP_MODE);
>> +
>
> 	} else {
> 		keypad->calc_row_col = mt6779_keypad_calc_row_col_single_kp;
> 	}
>
>>   	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
>>   			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
>>   	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
>
> what do you think?

Hi Angelo,

Thank you for your detailed suggestion. I like it and since I have to
resend a v2 anyways, I will consider implementing it.
On the other hand, I'm a little reluctant because it means that I'll
have to remove Matthias's reviewed-by :(

>
> Cheers,
> Angelo

