Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC395C61D97
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Jan 2023 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EegtgDiZvPxg3XvKag87hiBCFOeNYXfSdU0ZYoRxSBw=; b=OKJYL8CmbHYgUnR5K/NIN1sMdd
	mMRaa7CXguF85pxVksLJRwIoIwCatzgqwaxfMcMl6XGxRYdyU54bk568dVfhROav67oIhfeI7YFvq
	oTH3pAAiim15g9QGkeiQEsj4SwYIypqhqM6EOr2cB+dQ9WnXLCUJSf2fgIGFb8cN2iP4qDMX1Sqc8
	mBlcSyKXJUPgfxyc3vXrWUr0tdkqrL70xtGCQrgVdrP7gqqXjjJ5G/WIQZKL6QloXoj+DMGQQR79N
	IrNOYSq8ItSM2TJ4Bkb/q7QpnN54U2b7KE+nyt4InLmCJFfOq0ntbf65lrVwUfhYGyfer3SCQdMEk
	78JzapHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMApC-001ixy-MU; Sun, 29 Jan 2023 16:46:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMAp0-001iw1-TB; Sun, 29 Jan 2023 16:46:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ml19so2206062ejb.0;
        Sun, 29 Jan 2023 08:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EegtgDiZvPxg3XvKag87hiBCFOeNYXfSdU0ZYoRxSBw=;
        b=VdzR+cnOtJTwEvWU6Yiw5IVeGG3eLu4AyT2+ohh1pLLFbxBLHjtHzfbYHzZfYcpb1a
         Pj5FjZ/MYPbbTGZ6Kot1DGB+CiltOWI3pRk3VwkIBz7WNknhqgw7x0dyBZuBXBH5GjrK
         8/aq/tpabkdbL5C3uohhwT5nmnUZtRtgampiOrmYsLNwaFf+HvGowuAhJwziGjx8z1tY
         dxtx28jDhS4rbWSfJZgI1WaIJZnVaYlrs4zYa6i8bgJaLvprd4QhhF9kG+kTgcjHNzVz
         dGokq3nNks+LFdmRDKHuGo/z04twIU0RfpkS9fklE8KM1wollhsxYvfg4rAhjPRpkxTe
         SJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EegtgDiZvPxg3XvKag87hiBCFOeNYXfSdU0ZYoRxSBw=;
        b=8GXWBO8qKCkJfMf8SRCS0nPos03NC+6Inp61QxiVKcYRtz43pW7BCmIbhZgmmRjspd
         HCFVLggqq06uYkcyQQFaZL6BpbZS/3lJ6jnD8KGqczVe32XHuIM67u9WbxcFHMTa+cum
         rXUvlYJCG6JGLeh9DU+6itutBbXoPIBmEZ+6jXaZk17R9kfms/ZEVmSMGmxe/DXL4Xlu
         R+Bawr8vkZBIeiomdC5o4CEmFIY6HtCJbYJVLfhi0XxhbMUFeA2ztJsHZ98H/T6itsP2
         S9Co4m/wsyPu17hWnae0g6ah+iXocGHef4d/I0HbL3SWuVQ1LEOEquU38668TOpYk4LU
         19yg==
X-Gm-Message-State: AO0yUKWrsUkdrLAbhDOcz4Fnljg38vJn173Du1IqME1pSxVhAN3sxDUV
	e2qQm1jVnKlKXo5IEp9mifI=
X-Google-Smtp-Source: AK7set/wfa4/YB7Wk9XHH9KYPirORXWPAjxRN5Rp159iBOU50m4fZLx26H/r/3PbjZGo95JqDkqNPg==
X-Received: by 2002:a17:907:9801:b0:888:6294:a1fa with SMTP id ji1-20020a170907980100b008886294a1famr1526677ejc.14.1675010783791;
        Sun, 29 Jan 2023 08:46:23 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906311500b0087045ae5935sm5541795ejx.1.2023.01.29.08.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 08:46:23 -0800 (PST)
Message-ID: <df0594dc-d3d6-2636-49e6-07488ec2b5c9@gmail.com>
Date: Sun, 29 Jan 2023 17:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v16 1/2] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
Content-Language: en-US
To: ChiaEn Wu <chiaen@richtek.com>, pavel@ucw.cz, lee@kernel.org,
 matthias.bgg@gmail.com, andriy.shevchenko@linux.intel.com
Cc: peterwu.pub@gmail.com, cy_huang@richtek.com, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, szunichen@gmail.com,
 Alice Chen <alice_chen@richtek.com>, ChiaEn Wu <chiaen_wu@richtek.com>
References: <cover.1673886245.git.chiaen_wu@richtek.com>
 <1c4cf50600bb0334bd03027f49d7511b394c6ced.1673886245.git.chiaen_wu@richtek.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <1c4cf50600bb0334bd03027f49d7511b394c6ced.1673886245.git.chiaen_wu@richtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_084626_996116_2B1EB9C3 
X-CRM114-Status: GOOD (  20.27  )
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

Hi ChiaEn,

On 1/17/23 09:53, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> Add support for the MediaTek MT6370 Current Sink Type LED Indicator
> driver. It can control four channels current-sink RGB LEDs with 3 modes:
> constant current, PWM, and breath mode.
> 
> Co-developed-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v16
> - Remove blank line in the head text.
> - Move 'pwm_duty' to descrease the size of struct mt6370_pdata.
> - Move the field 'F_RGB_EN' write out from if/else in
>    'mt6370_isnk_brightness_set'.
> - Remove 'dev' in struct mt6370_priv.
> - Remove the proprety reading for 'linux,default-trigger', led core
>    already did it.
> - Change the module license from 'GPL v2' to 'GPL'
>    In the head text, already deslcred SPDX license as 'GPL-2.0-only'.
> ---
>   drivers/leds/rgb/Kconfig           |   13 +
>   drivers/leds/rgb/Makefile          |    1 +
>   drivers/leds/rgb/leds-mt6370-rgb.c | 1009 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 1023 insertions(+)
>   create mode 100644 drivers/leds/rgb/leds-mt6370-rgb.c
[...]
> +static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
> +				     struct led_pattern *pattern, u32 len,
> +				     u8 *pattern_val, u32 val_len)
> +{
> +	enum mt6370_led_ranges sel_range;
> +	struct led_pattern *curr;
> +	unsigned int sel;
> +	u32 val = 0;
> +	int i;
> +
> +	if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
> +		return -EINVAL;
> +
> +	/*
> +	 * Pattern list
> +	 * tr1:	 byte 0, b'[7: 4]
> +	 * tr2:	 byte 0, b'[3: 0]
> +	 * tf1:	 byte 1, b'[7: 4]
> +	 * tf2:	 byte 1, b'[3: 0]
> +	 * ton:	 byte 2, b'[7: 4]
> +	 * toff: byte 2, b'[3: 0]
> +	 */

Please provide documentation for the hardware pattern format.
Compare [0] and [1].

Otherwise looks good to me:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

[0] Documentation/leds/leds-sc27xx.rst
[1] Documentation/leds/leds-qcom-lpg.rst

-- 
Best regards,
Jacek Anaszewski

