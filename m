Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E392C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIa4RTsObwuJUbUExxfV8FuxhPw0d/YyOwSqNqVnpas=; b=EZqqub6OmPGfBiVRTnRpqWLxUC
	vqy/akeeQnNhSnLU09B3eCnr9aClRyXfFuDU3wY8NDbnxKvsyYihahlOkP9I1LZsc/jRdm1mq/7oY
	WNFwD4lnhNoLNEPAlliXPlKe/1jSunnatzVzcjqu3zXbCEbZwqQHyBoTlqo0N1NhDubHOLW3V5Dw4
	nNzGGAMzci0TbK0O/afdyJkjuqQZfwpaatZ7GgurxCZInFvUsR/ShJoaU2b1fmJl8w8nnD3Fn9BfR
	Fbx35InbsdXEwfhu1gyT0LZzjJ2diCeDtJIiY0xUptIySRPlwgtLaSgwhROSLX9B6ky9Mis2fYwv2
	SIXWqo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXbi-008ToU-2M; Thu, 21 Jul 2022 14:56:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXa2-008RCg-Vb; Thu, 21 Jul 2022 14:55:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C86916601AAA;
	Thu, 21 Jul 2022 15:55:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658415309;
	bh=EyTW2qzfSr+AZwVRWnf0cfBClBBVk9mIXqcmwKrTY2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aSEK3wBJW5ZfYWmPNlbU0sePZNNXqwE5AWAY0mJjsvUxtxBli+P/UKHnuJANoPXq7
	 i6YchppxsUCeAkZabMD3HcUnpaKhjWb8sHCBVZys24FUwLxG+uctouTt7zv/etPMVS
	 nolBLYYTQL+7sIBdXza+ndbUjXIo3MfypvJenbXhmDIFaxKNIH+DUA/zTkJ0sU2q+E
	 gG6FhfvlzqcTG3tjE9UfPG4RjFNhti5Z9yx/7arp0+aq0e2WejNFtNxiMZHhMF6i31
	 l11Wi9NEOqihzUURMuI23vmri2Ffz90BVG7OgT75M5Hf/vi33Nr+hpCpwVi1lFUhCy
	 AyJ2RTNWhDHFg==
Message-ID: <1eed6877-8868-6b29-b7c9-90986d230f36@collabora.com>
Date: Thu, 21 Jul 2022 16:55:06 +0200
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
 <b2676b5c-14b3-2058-9fb8-d6d78cc5d29c@collabora.com>
 <87ilnqh632.fsf@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <87ilnqh632.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_075511_345411_E96EAD76 
X-CRM114-Status: GOOD (  21.95  )
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

Il 21/07/22 16:51, Mattijs Korpershoek ha scritto:
> On Thu, Jul 21, 2022 at 10:34, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> Il 20/07/22 16:48, Mattijs Korpershoek ha scritto:
>>> MediaTek keypad has 2 modes of detecting key events:
>>> - single key: each (row, column) can detect one key
>>> - double key: each (row, column) is a group of 2 keys
>>>
>>> Double key support exists to minimize cost, since it reduces the number
>>> of pins required for physical keys.
>>>
>>> Double key is configured by setting BIT(0) of the KP_SEL register.
>>>
>>> Enable double key matrix support based on the mediatek,double-keys
>>> device tree property.
>>>
>>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>>
>>> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
>>> index bf447bf598fb..9a5dbd415dac 100644
>>> --- a/drivers/input/keyboard/mt6779-keypad.c
>>> +++ b/drivers/input/keyboard/mt6779-keypad.c
>>> @@ -18,6 +18,7 @@
>>>    #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
>>>    #define MTK_KPD_DEBOUNCE_MAX_MS	256
>>>    #define MTK_KPD_SEL		0x0020
>>> +#define MTK_KPD_SEL_DOUBLE_KP_MODE	BIT(0)
>>>    #define MTK_KPD_SEL_COL	GENMASK(15, 10)
>>>    #define MTK_KPD_SEL_ROW	GENMASK(9, 4)
>>>    #define MTK_KPD_SEL_COLMASK(c)	GENMASK((c) + 9, 10)
>>> @@ -31,6 +32,7 @@ struct mt6779_keypad {
>>>    	struct clk *clk;
>>>    	u32 n_rows;
>>>    	u32 n_cols;
>>> +	bool double_keys;
>>>    	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
>>>    };
>>>    
>>> @@ -67,8 +69,13 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
>>>    			continue;
>>>    
>>>    		key = bit_nr / 32 * 16 + bit_nr % 32;
>>> -		row = key / 9;
>>> -		col = key % 9;
>>> +		if (keypad->double_keys) {
>>> +			row = key / 13;
>>> +			col = (key % 13) / 2;
>>> +		} else {
>>> +			row = key / 9;
>>> +			col = key % 9;
>>> +		}
>>
>> I don't fully like this if branch permanently evaluating true or false, as no
>> runtime can actually change this result...
>>
>> In practice, it's fine, but I was wondering if anyone would disagree with the
>> following proposal...
>>
>> struct mt6779_keypad {
>> 	.......
>> 	void (*calc_row_col)(unsigned int *row, unsigned int *col);
>> };
>>
>> In mt6779_keypad_irq_handler:
>>
>> 	key = bit_nr / 32 * 16 + bit_nr % 32;
>> 	keypad->calc_row_col(&row, &col);
>>
>> and below...
>>
>>>    
>>>    		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
>>>    		/* 1: not pressed, 0: pressed */
>>> @@ -150,6 +157,8 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>>>    
>>>    	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
>>>    
>>> +	keypad->double_keys = device_property_read_bool(&pdev->dev, "mediatek,double-keys");
>>> +
>>>    	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",
>>>    		keypad->n_rows, keypad->n_cols, debounce);
>>>    
>>> @@ -166,6 +175,10 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>>>    	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
>>>    		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
>>>    
>>> +	if (keypad->double_keys)
>>
>> 		keypad->calc_row_col = mt6779_keypad_calc_row_col_double_kp;
>>
>>> +		regmap_update_bits(keypad->regmap, MTK_KPD_SEL,
>>> +				   MTK_KPD_SEL_DOUBLE_KP_MODE, MTK_KPD_SEL_DOUBLE_KP_MODE);
>>> +
>>
>> 	} else {
>> 		keypad->calc_row_col = mt6779_keypad_calc_row_col_single_kp;
>> 	}
>>
>>>    	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
>>>    			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
>>>    	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
>>
>> what do you think?
> 
> Hi Angelo,
> 
> Thank you for your detailed suggestion. I like it and since I have to
> resend a v2 anyways, I will consider implementing it.
> On the other hand, I'm a little reluctant because it means that I'll
> have to remove Matthias's reviewed-by :(
> 

Yes, you will have to. In that case:

Matthias, any considerations about this idea? :)))

>>
>> Cheers,
>> Angelo



