Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECA8C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zDqKrGl64ftCl/UtDpS3dJ8Z5FsjWvYjDB6txbpJn0=; b=B+/r4KYWaA/u0oGXMztfeDlsFs
	ltVDCEoYLzlwGhFIBZnx0vB7UNeCdZU9HoDSm/7N2g9CFd1g9RqERePAWrUo1pbQiAHYk/IeIl3tR
	lKRyC9f7XGYcKxHjW2NMsT37rPsOSG7PmKncmb2/PM+Vs+jk/EQmeqlwX+YyqgUlLwuwJHOkt94gg
	hxiudanfuQ/qQozAccIwQMS3R75UZnQpelP7DDOoc8F0aDppG5X7EuptNb3+sA3ywNDiB3wg2Eihn
	l+LR+T6NeP95jqgI1cesggs1ylaZnfev172UBjZ7BjCchucMMK18EHZctPZTcUJBiiIOr8orhZLYG
	wy1X6EQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERdQ-002ZwU-QT; Thu, 21 Jul 2022 08:34:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERdF-002Znc-5u; Thu, 21 Jul 2022 08:34:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1CACD66019C1;
	Thu, 21 Jul 2022 09:34:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658392443;
	bh=4s0tOiWFTuRlGEPdBFkuxG1+Ao4VWz7RCDX8gPnsqMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XnCG4umuepYhRdJ3Fp56ynSd1atBas01yoGYPrNVO0nKWX7TYRomdsr2gc02ZSKTz
	 3kgfeCrifiFObqN6VamY4jSbtgqT2avh5Vc1TtM0uP/QTW5UhjMdb5d5kBC47eGB8K
	 pED9e5UTcZBc11SDehoqwem45pj3qiDtsbyqj+g6dG/QDTDGLDE5A5HH6aAeD/Ql2q
	 VCIK2kuxdV2nOWlCkLIuksn2X97F4cv3C4pB/5BR/0NoC4nrmV0IRABJKHFl7QcmxV
	 0c2FCZBqZbK3zTQS+NMhr2tK2ZD88nH94WGvycs+lmkH8kLUgmpiOEAzDKBERj9N0R
	 94x72jHWPrQZw==
Message-ID: <b2676b5c-14b3-2058-9fb8-d6d78cc5d29c@collabora.com>
Date: Thu, 21 Jul 2022 10:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 4/6] Input: mt6779-keypad - support double keys matrix
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-4-ef9fc29dbff4@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720-mt8183-keypad-v1-4-ef9fc29dbff4@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_013405_390790_32838339 
X-CRM114-Status: GOOD (  20.50  )
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

Il 20/07/22 16:48, Mattijs Korpershoek ha scritto:
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
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
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

I don't fully like this if branch permanently evaluating true or false, as no
runtime can actually change this result...

In practice, it's fine, but I was wondering if anyone would disagree with the
following proposal...

struct mt6779_keypad {
	.......
	void (*calc_row_col)(unsigned int *row, unsigned int *col);
};

In mt6779_keypad_irq_handler:

	key = bit_nr / 32 * 16 + bit_nr % 32;
	keypad->calc_row_col(&row, &col);

and below...

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

		keypad->calc_row_col = mt6779_keypad_calc_row_col_double_kp;

> +		regmap_update_bits(keypad->regmap, MTK_KPD_SEL,
> +				   MTK_KPD_SEL_DOUBLE_KP_MODE, MTK_KPD_SEL_DOUBLE_KP_MODE);
> +

	} else {
		keypad->calc_row_col = mt6779_keypad_calc_row_col_single_kp;
	}

>   	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
>   			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
>   	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,

what do you think?

Cheers,
Angelo


