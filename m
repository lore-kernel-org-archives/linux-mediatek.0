Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE498C19F28
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUgPmzfFrSU+sgyYZ7FLrRfFna9TgeCoupYf3hfmbVM=; b=clFPzQk+pKN0jLpNt4hKDAv9v0
	/dWD/cuYnonD3e3MICo87o8EpEHEaDd2KA0kfA3IpWgM+VeOQ7NzJNe9YBnQq18WCGc2iuY0jgyX/
	6mcAmZkcoRRfaDzQ968/eaIgpPR/HyMxKTxMDjLZmnRlB1fNX7n7yaliUv4dLsgZzSSXPNEzm1cvk
	sgaiKA1VOUjxc/wzmwk/sf26oTYPbhCQYkKJVbixk8CEOCMBGgMY+XGocY0ZUIC0CF2+1vfhbCgsd
	0aIbgLbZ+WDKAEpKzu9rlYFBYcrlbE4DFKKA+n+tF11uVkw7hZXognJsHXRlvnO4gJrUElP+b2Okg
	X+4v/+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJCnx-005Vhi-On; Wed, 03 Aug 2022 11:44:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJCnN-005VK8-2h; Wed, 03 Aug 2022 11:44:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id ay36-20020a05600c1e2400b003a4e30d7995so787096wmb.5;
        Wed, 03 Aug 2022 04:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LUgPmzfFrSU+sgyYZ7FLrRfFna9TgeCoupYf3hfmbVM=;
        b=I5iSeXD2E2HuW+RNmn6sqrIRZoU+oUnjHcoBMjjcK4Fg829T1o0xuSuO8J8DhWV7ED
         vEEgRzHzWk8Hf5b0vVxS0E+I/ioiSjXGxTdpFo84jTNaNHHkTLBbMNXwkUbAFukospM1
         f2ra3pCkANb2SQe17MGW1JGk3eLcjLZh6ORaMEWvR0Sdv+6uztD+KE6v+j2u34NNWqDk
         WzmS8bf3SUBYUpN/flrHKDDvUrEuXDKgajCogUm/R+jn6rLi5bYgl6TEVHQmLlEI5Le/
         Iz0cY1QqZlAcGiCkmE6Da3h8OW+kzCLhXHoQ0vZuCoMp/Xq/ZjO5LGpCcadpFevI8Dej
         KXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LUgPmzfFrSU+sgyYZ7FLrRfFna9TgeCoupYf3hfmbVM=;
        b=TqHYW2TZR5GpaLfcQ9Tc63tGQST/aocfn6B73upOF/0trPbO3WCjEvHPbpoOKx8McW
         ThEtEqkEWlxJo3/75eoUolAM/j/3DSPRdKTqdWvqWdlehTCg6kQLipjPxxfERM5PssoY
         QBHgZ0lHIy0YdNWJnbZiHb6pPncsIW6RgBYNP8SRXCEYOwRiVVrPQasMBIbm1UqmWkY1
         2liB9lQTgLAQuDt4JRTU1zYy0Hwd529LKzshpXv5urZAYVemh5rVZOOutHhRUriJ3Hyp
         KTw7fqwLbeN06dFLcZNg/B8kMKCnQWDDAtzKfD2PJpnbpSX+lbaCuhaLahlRKG+Su5Fh
         2sPQ==
X-Gm-Message-State: ACgBeo2vvnIyeINrlKCCIOAu5iWkKDWNVjjKO+AVGjxpFyj8fsoRQOU5
	x9KiE+kX7G3UFhV3NLz8IqY=
X-Google-Smtp-Source: AA6agR7Vug208ac1x5wt34gy+nfQqrOWgxntapVKh5V13+9AI/VPo4Tyuie4HoKDtGIXcWNmktMXzw==
X-Received: by 2002:a05:600c:34c9:b0:3a4:f1d7:edbd with SMTP id d9-20020a05600c34c900b003a4f1d7edbdmr2569978wmq.128.1659527050494;
        Wed, 03 Aug 2022 04:44:10 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p36-20020a05600c1da400b003a2eacc8179sm2307934wms.27.2022.08.03.04.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 04:44:09 -0700 (PDT)
Message-ID: <cb74e4d0-8170-0837-fa43-d269a8db4d90@gmail.com>
Date: Wed, 3 Aug 2022 13:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/1] leds: mt6360: Get rid of custom
 led_init_default_state_get()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>
References: <20220802212532.7091-1-andriy.shevchenko@linux.intel.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220802212532.7091-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_044413_332246_76DACEC8 
X-CRM114-Status: GOOD (  20.41  )
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



On 02/08/2022 23:25, Andy Shevchenko wrote:
> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/leds/flash/leds-mt6360.c | 38 +++++---------------------------
>   1 file changed, 6 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
> index e1066a52d2d2..1af6c5898343 100644
> --- a/drivers/leds/flash/leds-mt6360.c
> +++ b/drivers/leds/flash/leds-mt6360.c
> @@ -71,10 +71,6 @@ enum {
>   #define MT6360_STRBTO_STEPUS		32000
>   #define MT6360_STRBTO_MAXUS		2432000
>   
> -#define STATE_OFF			0
> -#define STATE_KEEP			1
> -#define STATE_ON			2
> -
>   struct mt6360_led {
>   	union {
>   		struct led_classdev isnk;
> @@ -84,7 +80,7 @@ struct mt6360_led {
>   	struct v4l2_flash *v4l2_flash;
>   	struct mt6360_priv *priv;
>   	u32 led_no;
> -	u32 default_state;
> +	enum led_default_state default_state;
>   };
>   
>   struct mt6360_priv {
> @@ -405,10 +401,10 @@ static int mt6360_isnk_init_default_state(struct mt6360_led *led)
>   		level = LED_OFF;
>   
>   	switch (led->default_state) {
> -	case STATE_ON:
> +	case LEDS_DEFSTATE_ON:
>   		led->isnk.brightness = led->isnk.max_brightness;
>   		break;
> -	case STATE_KEEP:
> +	case LEDS_DEFSTATE_KEEP:
>   		led->isnk.brightness = min(level, led->isnk.max_brightness);
>   		break;
>   	default:
> @@ -443,10 +439,10 @@ static int mt6360_flash_init_default_state(struct mt6360_led *led)
>   		level = LED_OFF;
>   
>   	switch (led->default_state) {
> -	case STATE_ON:
> +	case LEDS_DEFSTATE_ON:
>   		flash->led_cdev.brightness = flash->led_cdev.max_brightness;
>   		break;
> -	case STATE_KEEP:
> +	case LEDS_DEFSTATE_KEEP:
>   		flash->led_cdev.brightness =
>   			min(level, flash->led_cdev.max_brightness);
>   		break;
> @@ -760,25 +756,6 @@ static int mt6360_init_flash_properties(struct mt6360_led *led,
>   	return 0;
>   }
>   
> -static int mt6360_init_common_properties(struct mt6360_led *led,
> -					 struct led_init_data *init_data)
> -{
> -	const char *const states[] = { "off", "keep", "on" };
> -	const char *str;
> -	int ret;
> -
> -	if (!fwnode_property_read_string(init_data->fwnode,
> -					 "default-state", &str)) {
> -		ret = match_string(states, ARRAY_SIZE(states), str);
> -		if (ret < 0)
> -			ret = STATE_OFF;
> -
> -		led->default_state = ret;
> -	}
> -
> -	return 0;
> -}
> -
>   static void mt6360_v4l2_flash_release(struct mt6360_priv *priv)
>   {
>   	int i;
> @@ -852,10 +829,7 @@ static int mt6360_led_probe(struct platform_device *pdev)
>   
>   		led->led_no = reg;
>   		led->priv = priv;
> -
> -		ret = mt6360_init_common_properties(led, &init_data);
> -		if (ret)
> -			goto out_flash_release;
> +		led->default_state = led_init_default_state_get(child);
>   
>   		if (reg == MT6360_VIRTUAL_MULTICOLOR ||
>   		    reg <= MT6360_LED_ISNKML)

