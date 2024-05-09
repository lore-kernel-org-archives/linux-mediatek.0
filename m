Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0C5C10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71S4ymiyZvNoQcHz5UTKOrz1F7Uu1XwMBs9mUTqHKZY=; b=KaUIyj2q/74rpWMVrSMvanC52z
	Koqv07h3pfH13KQZyo2BY0qXCRrkjYb2juY4eejhRECNuWMW/d6BnEGtbDlHDEPqjDzQ8DkYdrOJl
	X1xx2zBnhdpxFl3mb3vB7mZW76iKPkdlnsc8ggT2tqDcRvg9mRSqBgcU8uQWb+K2z1tf5xADoN8G/
	xc7MkShnFEbVS6jwfpJp/7P38GJrl6i9Oh3QC76f7HfGHScLZIKb/3MVi2+hh4IxK1zYTBrKN9NuV
	1UCxHwRNiM53afZeLf0Ooj2Qo5FaaRpQshJL+sUbXYahYX5XsCcrGzYJ9zVbD3iZan3QcVQOqk9D0
	h54+T5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s50k4-000000015Ru-1L1E;
	Thu, 09 May 2024 10:11:12 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s50jx-000000015Q1-0nA8;
	Thu, 09 May 2024 10:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715249461;
	bh=2LnYN9nc3SQsqAASkrGVaJVc2LgnjoBJzHW2Q9QiI6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0Hzv31iAsIm4B1HeTQAjmmQCSI3i7Ksjvh28OlgI0QFbqUVIBBggMoVuDGJoM2xzR
	 NRQF7Opxi8NtCObvbptm0TeTTCo5k7Br/nCEc8PmhaSOBwxL9MYvOxU4Df28dAJe8D
	 JidG8I/KjROo53PimQ71rzlTgYjHTsddh1uXyD1kT6rWty2Zw6conx5jodeW/0+5Ux
	 8RnDQloSkFHNRuNYp2FF5Q+uoKmfVREVGm0Cbwj/X5eC4w/AYcodYw9Tp0nKVBGSs7
	 RFPZPfb6E8TWevSntJJGzeyIOVfwHTdZ6wGLOYWGo7GGHmqqRuL6tNudvc70fKqfWK
	 AFt6QgH5hAqGQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 58C7B3780627;
	Thu,  9 May 2024 10:11:00 +0000 (UTC)
Message-ID: <a9980df7-7d65-4818-8dd3-b056ba5ac566@collabora.com>
Date: Thu, 9 May 2024 12:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: [RFC v1 5/5] arm64: dts: mediatek: Add mt7986 based
 Bananapi R3 Mini
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tianling Shen <cnsztl@gmail.com>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-6-linux@fw-web.de>
 <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
 <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de>
 <a18a10e5-42e1-4302-b9f3-43c6174e2cf9@collabora.com>
 <trinity-2158d675-7049-4432-b925-6ace44401aa0-1715192732273@3c-app-gmx-bs02>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <trinity-2158d675-7049-4432-b925-6ace44401aa0-1715192732273@3c-app-gmx-bs02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_031105_403551_4FBC8933 
X-CRM114-Status: GOOD (  21.45  )
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

Il 08/05/24 20:25, Frank Wunderlich ha scritto:
> Hi
> 
>> Gesendet: Dienstag, 07. Mai 2024 um 15:35 Uhr
>> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>>
>> Il 06/05/24 18:00, Frank Wunderlich ha scritto:
> 
>>>>> +	fan: pwm-fan {
>>>>> +		compatible = "pwm-fan";
>>>>> +		#cooling-cells = <2>;
>>>>> +		/* cooling level (0, 1, 2) - pwm inverted */
>>>>> +		cooling-levels = <255 96 0>;
>>>>
>>>> Did you try to actually invert the PWM?
>>>>
>>>> Look for PWM_POLARITY_INVERTED ;-)
>>>
>>> Mtk pwm driver does not support it
>>>
>>> https://elixir.bootlin.com/linux/latest/source/drivers/pwm/pwm-mediatek.c#L211
>>>
>>
>> You're right, sorry - I confused the general purpose PWM controller with the
>> rather specific DISP_PWM controller (which does support polarity inversion).
>>
>> It's good - but I'd appreciate if you can please add a comment stating that
>> the PWM values are inverted in SW because the controller does *not* support
>> polarity inversion... so that next time someone looks at this will immediately
>> understand what's going on and why :-)
> 
> so i would change comment like this:
> 
> 		/* cooling level (0, 1, 2)
> 		 * signal is inverted on board
> 		 * mtk pwm driver does not support
> 		 * PWM_POLARITY_INVERTED */
> 

There you go:

/*
  * The signal is inverted on this board and the general purpose
  * PWM HW IP in this SoC does not support polarity inversion.
  */
/* Cooling level < 0  1  2> */
cooling-levels = <255 96 0>;



>>>>> +		pwms = <&pwm 0 10000>;
>>>>> +		status = "okay";
>>>>> +	};
>>>>> +
>>>>> +	phy14: ethernet-phy@14 {
> ...
>>>>> +		interrupts-extended = <&pio 48 IRQ_TYPE_EDGE_FALLING>;
>>>>> +		reset-gpios = <&pio 49 GPIO_ACTIVE_LOW>;
>>>>> +		reset-assert-us = <10000>;
>>>>> +		reset-deassert-us = <20000>;
>>>>> +		phy-mode = "2500base-x";
>>>>> +		full-duplex;
>>>>> +		pause;
>>>>> +		airoha,pnswap-rx;
>>>>> +
>>>>> +		leds {
>>>>> +			#address-cells = <1>;
>>>>> +			#size-cells = <0>;
>>>>> +
>>>>> +			led@0 { /* en8811_a_gpio5 */
>>>>> +				reg = <0>;
>>>>> +				color = <LED_COLOR_ID_YELLOW>;
>>>>> +				function = LED_FUNCTION_LAN;
>>>>> +				function-enumerator = <1>;
>>>>
>>>> Why aren't you simply using a label?
>>>
>>> You mean the comment? I can add it of course like for regulators.
>>>
>>
>> I mean in place of the function-enumerator... that's practically used to
>> distinguish between instances, it's not too common to see it, and usually
>> "label" replaces exactly that - just that, instead of a different number,
>> it gets a different name with no (usually) meaningless numbers :-)
> 
> as far as i understand using label also makes "function" property useless, after discussing
> this with eric i would drop both on all 4 places by labels like these:
> 
> label = "yellow-lan";
> label = "green-lan";
> ...
> 
> not sure if we should drop color property too...
> 

I'm looking at the leds binding (leds/common.yaml) right now.

My suggestion of using 'label' was actually wrong - and your devicetree was
actually right!!! (apart from the default-trigger that may not work)

Infact, the documentation says, in brief:

- function-enumerator is ignored if label is present
- function doesn't say that gets ignored
- color doesn't say that gets ignored
- label says:
   - If not present -> get string from node name
   - function-enumerator ignored
   - This property is deprecated

...but the 'label' binding does not say 'deprecated: true', which is something
that must be fixed!


So, I'm sorry for the confusion, the noise and the useless loss of time around
this - you can keep the LED nodes as they are, and that's a lesson for the future
me reviewing another node like this one.

P.S.: This shouldn't have been a RFC, as the patches are more than RFC quality!!!

Cheers,
Angelo

>>>>> +				default-state = "keep";
>>>>> +				linux,default-trigger = "netdev";
>>>>> +			};
>>>>> +			led@1 { /* en8811_a_gpio4 */
>>>>> +				reg = <1>;
>>>>> +				color = <LED_COLOR_ID_GREEN>;
>>>>> +				function = LED_FUNCTION_LAN;
>>>>> +				function-enumerator = <2>;
>>>>> +				default-state = "keep";
>>>>> +				linux,default-trigger = "netdev";
>>>>> +			};
>>>>> +		};
>>>>> +	};
>>>>> +
>>>>> +	phy15: ethernet-phy@15 {
>>>>> +		reg = <15>;
>>>>
>>>> Same here.
>>>>
>>>> Cheers,
>>>> Angelo
> 
> regards Frank


