Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB8CC636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyeCuJfMUCxy7EMAlPrLoxGULlONEfkh83Jz9dZ7UVA=; b=e30UhzSSMSApjjr/iUwnXV9Clm
	FHF+6OdqhIgnpoKvmkoRAg/KCseFqkRE35MIwJlSG2xcylgelbhtlMg8eswxW4tfqqbpxs1E1856v
	41ZL/um3NCtYPwdFThRe7TJqCcDoD4rhzRLVBnpVV8hD+SkVb4tvYLU1zgtA9APsD5vChyHm3HqfU
	jI2cma3badmcOVE1WnMGMcJtLZN1sNsEWdQ21aMVZ2jKsCukmqGyI3VK3A7vmDi2g9CUwFfHCQh2V
	8JQ8xZXXHA1Y3/4CRCc5Q+kyO95RkupX+J0lPZDj8WbyAJXHWjdtpmfuCYJaWN3rGU3EaY1Sg/YwS
	PMT5hz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQQK4-005DOK-Jw; Fri, 10 Feb 2023 10:08:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQQK1-005DMw-SU
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 10:08:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id bg26so3464044wmb.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Feb 2023 02:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xyeCuJfMUCxy7EMAlPrLoxGULlONEfkh83Jz9dZ7UVA=;
        b=sWR20SCgtf76y4U/XIEaxHkrP6ANvlICRLPwf45DL/wRqO9AIjvyexqqaKunEYLPSp
         twdRk5vTtLGzN/+yzUKP3aluo8YqaDxegI0ZDJKD5YyhvDYD/1S/7O5zoj7BYWkmm3Wc
         QwzWY28r0LmXD0xOYEAD221FfwBAK4GN4czv1GlDYgHF1hjPfu2QVQZAPaZiQNE/7cCc
         ieQxCahwve30JSMn9J+VDIyhuOOzXdl+TXFWFi/9XeVlG53N+uIp/HFAwnyffLpKL3p3
         KNhbNha3SZFUJDKaJwUSHASAv/d56iD0a1Zr8rxBC9icjBQcEDmoE0mdrT4GG8o5STeu
         iSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyeCuJfMUCxy7EMAlPrLoxGULlONEfkh83Jz9dZ7UVA=;
        b=vhWfur7O84BQ6AjIWav7KhwCDeqMmeuDYSjxhqs0aUftz3LoUalkeJqqHR45Q7SnyC
         ij2qHoh5cA/LMQXtRO6nCrD8KgoZDgVeEIYoyx2jRKO6mMtdsPb/zIM+FIYwm8bvrIvI
         GcjdGcVzjEN3rS/VjEL0rWFpX5QcVpa7QZy33BAcfqWkvfvMvqJONG2Fhx3ov/7+zl5G
         K0U9Tdu2YKIrfcWLjbsrtp4hRMdsWnRVwhgwbjkoLoYkt1OyziLv8kR+LC1MJ2OAR/PB
         PPzmgECd/rjJWo50zG3Z64QV7m2KJQgiiADpmJQIRxoAt0awDmksL6rkEHLo+iie9gMM
         Gqqw==
X-Gm-Message-State: AO0yUKXZ7WGrFQvhhT7B+SyANjlc7YcyOej63LGBa1JZzvHcuAlWrE4Z
	o3C4cUi3uZ1verPW/x+OwJqHxQ==
X-Google-Smtp-Source: AK7set+YPV0CpsKvCiPZ8Co1e2QSTIfLBE8j5nmk1vVG7I0oCvj1N8XbKvsgMCKYJ1AP/zV8i9vvQA==
X-Received: by 2002:a05:600c:4386:b0:3df:94c3:4725 with SMTP id e6-20020a05600c438600b003df94c34725mr12427982wmn.38.1676023680549;
        Fri, 10 Feb 2023 02:08:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c3b9300b003daf7721bb3sm8247140wms.12.2023.02.10.02.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 02:08:00 -0800 (PST)
Message-ID: <f2d66681-a7b6-2369-b9f7-f886f8ea6ae5@linaro.org>
Date: Fri, 10 Feb 2023 11:07:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Make timer-mediatek
 become loadable module
Content-Language: en-US
To: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230210100058.19861-1-walter.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210100058.19861-1-walter.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_020802_016778_96573B3E 
X-CRM114-Status: GOOD (  25.80  )
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

On 10/02/2023 11:00, walter.chang@mediatek.com wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> This patch makes the timer-mediatek driver which can

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> register an always-on timer as tick_broadcast_device
> on MediaTek SoCs become loadable module in GKI.

Are you planning to answer other parts of that discussion? IOW, does the
system boot fine? What's the impact of this being a module?

> 
> This patch depends on the previous patch.
> https://lore.kernel.org/lkml/20230208094813.20874-1-walter.chang@mediatek.com/T/#t

This does not belong to commit msg. What's the point of keeping it in
commit history forever?

> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  drivers/clocksource/Kconfig          |  2 +-
>  drivers/clocksource/timer-mediatek.c | 43 ++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 4469e7f555e9..41345827055b 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -472,7 +472,7 @@ config SYS_SUPPORTS_SH_CMT
>  	bool
>  
>  config MTK_TIMER
> -	bool "Mediatek timer driver" if COMPILE_TEST
> +	tristate "Mediatek timer driver"
>  	depends on HAS_IOMEM
>  	select TIMER_OF
>  	select CLKSRC_MMIO
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index d5b29fd03ca2..806044ef391c 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -13,6 +13,9 @@
>  #include <linux/clocksource.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/sched_clock.h>
>  #include <linux/slab.h>
>  #include "timer-of.h"
> @@ -450,6 +453,46 @@ static int __init mtk_gpt_init(struct device_node *node)
>  
>  	return 0;
>  }
> +
> +#ifdef MODULE
> +static int mtk_timer_probe(struct platform_device *pdev)
> +{
> +	int (*timer_init)(struct device_node *node);
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	timer_init = of_device_get_match_data(&pdev->dev);
> +	return timer_init(np);
> +}
> +
> +static const struct of_device_id mtk_timer_match_table[] = {
> +	{
> +		.compatible = "mediatek,mt6577-timer",
> +		.data = mtk_gpt_init,
> +	},
> +	{
> +		.compatible = "mediatek,mt6765-timer",
> +		.data = mtk_syst_init,
> +	},
> +	{
> +		.compatible = "mediatek,mt6795-systimer",
> +		.data = mtk_cpux_init,
> +	},
> +	{}
> +};
> +
> +static struct platform_driver mtk_timer_driver = {
> +	.probe = mtk_timer_probe,
> +	.driver = {
> +		.name = "mtk-timer",
> +		.of_match_table = mtk_timer_match_table,
> +	},
> +};
> +MODULE_DESCRIPTION("MEDIATEK Module Timer driver");
> +MODULE_LICENSE("GPL v2");

I don't think you run checkpatch before sending... please do not use
humans for review which is done by automatic tools.

> +
> +module_platform_driver(mtk_timer_driver);

Follow coding convention like in very other driver, so this goes
immediately after definition of driver structure.

> +#else


Best regards,
Krzysztof


