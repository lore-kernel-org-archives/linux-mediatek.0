Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38567C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 14:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0wRoxXm0lXLU9vHgb65mx+sz5ayh2XUgm6rcM2W0Os=; b=St5lrnxEipnc8iNwTWn7t+l5FJ
	E5WIVkEz2FaKmCvYSMzxDv5WoUWlMTPVyYd8odfawZXj6TjcRODz4edpHpjbn5MOdRm2b/wsMCzPl
	KdN/PAl1YPDQshDwWFrRPbK8tExlX2bpu5wcJfxo8tNKOL32ylsvoikXKxDgBt/hU4hgtrBshW/BR
	Ng0QJjqkxqioVvpJaP08jdNa7U9abicosQ0A7lv47ZqT1DYn+pR3khDpdxQ6pIgJ5o64e9xk3t82N
	MTjMmaB8xvx+LgSVCTnpMUFt0aJb9O3h09onW5g9ZLNShXUUvKTEIOKETJXHFk9jb+SuoVJBD6ZVL
	R5i/eu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB4g-0078wc-Ef; Wed, 20 Jul 2022 14:53:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB4c-0078t0-0v; Wed, 20 Jul 2022 14:53:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id ay11-20020a05600c1e0b00b003a3013da120so1506590wmb.5;
        Wed, 20 Jul 2022 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y0wRoxXm0lXLU9vHgb65mx+sz5ayh2XUgm6rcM2W0Os=;
        b=DCcOQ/6pIyGvxCWOmJS1gJrYpFkWZT89oAWW0Ux6OQizF5MPa99CCwIX4LOJsPsX9B
         MIKDMfkNt7ahoBFEKs3Cca9tYTgh0BpStVWPIVr6tOfeV3GfP1kpCzT0RRsJrHIJUp0r
         sRoX0fzGoazOGVCzJrnwjsVm4Via8f/Wr3+oWYaKBgzplZRoO71GGex4cHaaTh3xaVw/
         LgAW498v1nQwVPf6cQNcoN6cFKGNKFh8JQX09MJLKHIIKIT4+d4/qLRHmYRL7gSUHNqi
         jsQb2kEubx44zU0PxxCYt8SXu6RRT4jRT3mGdWW8qIHIPprKiUnwt2ZlN0uxCqY1gRvq
         8YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y0wRoxXm0lXLU9vHgb65mx+sz5ayh2XUgm6rcM2W0Os=;
        b=QFiV/6xhBN3ABxSfCy2kKQHSJdXrgGFDDhqFgYtRKqfUKKK1sXzS13EUAwuxiTC5He
         /I0/KsKC5dWEMXEvJ/forVxx+fdop63lpEXQhpB2IIDSSvniFYrD00bz8JpXgZ33U3D3
         0JW21kNfe3JXnmOf5gucNwfZpVUZcSrFiNmznzNX0BjFN0JBw6CTRXZHdgqHwvEfTZKV
         ADrX+nOg82BudNFvVNwabETotJribXXVwsQfjs3/WP6eMsappWXmAQUqoMDSL2nwzhEE
         0ZZ3u7BaTACvglkaoF1k0jgIGor1lg3YEoLvcD7eDPBCiWwIA0SfLEGo2X+LLh2Df3QF
         Dc6Q==
X-Gm-Message-State: AJIora8VYFgOuWS7OjIIPxEisc6jTY/ZUWtGQC3iKz/3wbOnrrBXWvfk
	gNBnuRPaA8qTSn5QESL12cc=
X-Google-Smtp-Source: AGRyM1uWeUcffW8kDxoO+pUpEnNIyYERqP2oY3ASBFUAIzEgdBIasCmxz4OGqCxwoBCLupGt21noHw==
X-Received: by 2002:a05:600c:3553:b0:3a3:2b65:299e with SMTP id i19-20020a05600c355300b003a32b65299emr2373091wmq.145.1658328792662;
        Wed, 20 Jul 2022 07:53:12 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05600c3caa00b003a31b79dc0esm11233827wmb.1.2022.07.20.07.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 07:53:11 -0700 (PDT)
Message-ID: <43acea66-78e1-b7da-8d1c-3a60a5ddf4b6@gmail.com>
Date: Wed, 20 Jul 2022 16:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 4/6] Input: mt6779-keypad - support double keys matrix
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-4-ef9fc29dbff4@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220720-mt8183-keypad-v1-4-ef9fc29dbff4@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_075314_168668_7220EF27 
X-CRM114-Status: GOOD (  18.34  )
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



On 20/07/2022 16:48, Mattijs Korpershoek wrote:
> MediaTek keypad has 2 modes of detecting key events:
> - single key: each (row, column) can detect one key
> - double key: each (row, column) is a group of 2 keys
> 
> Double key support exists to minimize cost, since it reduces the number
> of pins required for physical keys.
> 
> Double key is configured by setting BIT(0) of the KP_SEL register.
> 
> Enable double key matrix support based on the mediatek,double-keys
> device tree property.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> 
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
> index bf447bf598fb..9a5dbd415dac 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -18,6 +18,7 @@
>   #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
>   #define MTK_KPD_DEBOUNCE_MAX_MS	256
>   #define MTK_KPD_SEL		0x0020
> +#define MTK_KPD_SEL_DOUBLE_KP_MODE	BIT(0)
>   #define MTK_KPD_SEL_COL	GENMASK(15, 10)
>   #define MTK_KPD_SEL_ROW	GENMASK(9, 4)
>   #define MTK_KPD_SEL_COLMASK(c)	GENMASK((c) + 9, 10)
> @@ -31,6 +32,7 @@ struct mt6779_keypad {
>   	struct clk *clk;
>   	u32 n_rows;
>   	u32 n_cols;
> +	bool double_keys;
>   	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
>   };
>   
> @@ -67,8 +69,13 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
>   			continue;
>   
>   		key = bit_nr / 32 * 16 + bit_nr % 32;
> -		row = key / 9;
> -		col = key % 9;
> +		if (keypad->double_keys) {
> +			row = key / 13;
> +			col = (key % 13) / 2;
> +		} else {
> +			row = key / 9;
> +			col = key % 9;
> +		}
>   
>   		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
>   		/* 1: not pressed, 0: pressed */
> @@ -150,6 +157,8 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>   
>   	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
>   
> +	keypad->double_keys = device_property_read_bool(&pdev->dev, "mediatek,double-keys");
> +
>   	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",
>   		keypad->n_rows, keypad->n_cols, debounce);
>   
> @@ -166,6 +175,10 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>   	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
>   		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
>   
> +	if (keypad->double_keys)
> +		regmap_update_bits(keypad->regmap, MTK_KPD_SEL,
> +				   MTK_KPD_SEL_DOUBLE_KP_MODE, MTK_KPD_SEL_DOUBLE_KP_MODE);
> +
>   	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
>   			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
>   	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
> 

