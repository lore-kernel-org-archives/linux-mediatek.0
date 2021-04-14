Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEC0C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 11:24:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17F80613DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 11:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17F80613DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nd36mo7vKzeUb2UE+89xMhL4ttwUrThBd3BrLN99IVM=; b=AvxCAEIKo/C9VYHuHz/VTN1M7
	yJoRvC0RRFOqZI0NyZrJncXZFj3eZs9Oqpsl/89nBz15a4d0I6sYv9JimNd2grnnPt3ZbVyGIGU9F
	mzgbYiZAUczXHj4mcSu4MQmpUFczCax6bEjCXgx8zU3icZ8yl93AYVWttaOUVmrV2gSZsjoWlx+1G
	qChlvKCeyUA8wYAcGIfY3QM2LdKlMmE26Gjkp5kPs9Jz6R9ZKXQ5dtYeTMIpvC+7zzk8NATi+aFTT
	3IPWb57wyoopWTlCtRKGHciLJwt8dcgHrmiF4pnPQVnZ/HzYIf5Jr0UG3sanpxn5dNR47kO5Bd2AO
	LZwGN4S/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWdcc-00COY5-PC; Wed, 14 Apr 2021 11:23:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWdcX-00COWK-Es; Wed, 14 Apr 2021 11:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=+o8PYYJsjZVZf5tMo+rQ7pqa7OQfXYmx9xWhw0qDkvs=; b=wgFDK+nmE4gFACadF03qxWznAX
 n0eJGQPakXcQ7+5oc88JMuvtHiFyhGWvCkRL+PknrJbNCclEwbplw1d/W94OW1dUJuBeTNtr/iBsI
 +4dWMgNLtEGCffy/BJDFU1qBHIFb112de58EWD95e/zA3lODnRy+AYVqUodBvd7tqrv0QVikjO4nm
 8eAqs/ZgyuA37t/GgLyJX3bdgmXIUwQNyb7dgdFuU4jKRIx+jyN+jfM85Xw+Ln1WsZbkPiRQ67qQ0
 m5zQAwewxAch5KIeCpkix8aAZ+dbdVgPCmmNJ6eR2V8h3c9Ehdg8kp/ChHkRPS1oPcQSdK3nJ6pyJ
 lxRr48hw==;
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWdcU-007hxK-B7; Wed, 14 Apr 2021 11:23:44 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 a2-20020a0568300082b029028d8118b91fso525697oto.2; 
 Wed, 14 Apr 2021 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+o8PYYJsjZVZf5tMo+rQ7pqa7OQfXYmx9xWhw0qDkvs=;
 b=dKjKB9nQtCB4kmd5RkaSCIg7ImQSUVUrCneTikYCSi5e5NOr0CMcxTljcR79Glwm4C
 J4WaOsuGas5kcSDAXqbes8IAItR3mA1yM0ZMSQal99Jwoi/JSqHl3BhTvDiAEHEH7TjA
 +kp+/zIHqm6UNqyhuTsKljZsBT2suhV8GrHpmu8lg2iv8WP6wEOk5/HmKfXyOon4Uj99
 j9iUr9kDtK6RHQzhopbY3w8LGJgkazi3Ljtw4ChfT1Rs3vkGvno6KQToc84D74KmZTTB
 UZUauNc9eo5lk7AkhCFy80cycSQDHC/RDg694lSPCeYDDceUGHrmuuz52IcllGotwWUM
 Pg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+o8PYYJsjZVZf5tMo+rQ7pqa7OQfXYmx9xWhw0qDkvs=;
 b=IOqu+aNyzxJ1XgVac9QGSiqVj1bC8SaCpR4Dr6BwtInHw0JdmsP+sOSUPGTKc49+kL
 yjEreueWSd934UJV6dp5I1MqYuvBQsBfVVEgmL1+wUASBlX5P6G2+qOUJjm6MRrQhmmD
 CYyoLDTt+Vi+D8rY9z7t2CAq4U0UYMzChWlc0A7dph2bX3jIGRTJJrP6TY6gninNx3TD
 8gL3Zc2CqSMhVAl5tEP9MBf3N9Vhnewwi4KJ03YK5TVUcKMC0KpiuwZpko31fdkIWbrD
 7zdOJqsOHs/I+JJNLViQ9dfG9nDPjJIjGvyc2XoIneYk0KRuRncPesEjUk2hMOB3O1/Y
 IqgA==
X-Gm-Message-State: AOAM5320ST8MBn4mngR1M9+VtM3dI3bMbzlyW1dN6XFzPW6bjRxP8kFq
 UE8AbWjL84PEXSLWhZnnQbY=
X-Google-Smtp-Source: ABdhPJyahaCh7kd7QTJlPrP43Nuv9AfYshvMA2NaZgaWUZzgojzoODTHh/IFHA+mkChFz0B06XxFqQ==
X-Received: by 2002:a9d:3a4a:: with SMTP id j68mr31977690otc.4.1618399419506; 
 Wed, 14 Apr 2021 04:23:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i25sm4169284otf.37.2021.04.14.04.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 04:23:38 -0700 (PDT)
Subject: Re: [PATCH V2] watchdog: mtk: support pre-timeout when the bark irq
 is available
To: Wang Qing <wangqing@vivo.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
References: <1618385339-3527-1-git-send-email-wangqing@vivo.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <427a4dc7-3528-83c6-b951-8ca0b2ca09a3@roeck-us.net>
Date: Wed, 14 Apr 2021 04:23:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1618385339-3527-1-git-send-email-wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_042342_426155_BBD79C8E 
X-CRM114-Status: GOOD (  31.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/14/21 12:28 AM, Wang Qing wrote:
> Use the bark interrupt as the pretimeout notifier if available.
> 
> By default, the pretimeout notification shall occur one second earlier
> than the timeout.
> 
> V2:
> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 57 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993..b0ec933
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -25,6 +25,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
> +#include <linux/interrupt.h>
>  
>  #define WDT_MAX_TIMEOUT		31
>  #define WDT_MIN_TIMEOUT		1
> @@ -234,18 +235,41 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
>  	int ret;
>  
> -	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
> +	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout - wdt_dev->pretimeout);
>  	if (ret < 0)
>  		return ret;
>  
>  	reg = ioread32(wdt_base + WDT_MODE);
> -	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	reg &= ~WDT_MODE_IRQ_EN;
> +	if (wdt_dev->pretimeout)
> +		reg |= WDT_MODE_IRQ_EN;
> +	else
> +		reg &= ~WDT_MODE_IRQ_EN;
>  	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>  	iowrite32(reg, wdt_base + WDT_MODE);
> 


You said previously that the pretimeout would prevent the real timeout / reset
from happening, and the driver has no provision to set the real timeout.
That makes this a no-go.

>  	return 0;
>  }
>  
> +static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
> +				   unsigned int timeout)
> +{
> +	wdd->pretimeout = timeout;
> +	return mtk_wdt_start(wdd);
> +}
> +
> +static irqreturn_t mtk_wdt_isr(int irq, void *arg)
> +{
> +	struct watchdog_device *wdd = arg;
> +if (IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV))
> +	watchdog_notify_pretimeout(wdd);
> +else
> +	//panic by decault instead of WDT_SWRST;
> +	panic("MTk Watchdog bark!\n");
> +
The idea behind the pretimeout governor is that it can be disabled
by setting it to "none", and if pretimeout governors are disabled
it is supposed to be a no-op. The above bypasses this mechanism
and is not acceptable.

This suggests that the real timeout indeed doesn't happen when
WDT_MODE_IRQ_EN is set. Again, this is unacceptable.

On a side note, formatting is way off here.

Guenter

> +	return IRQ_HANDLED;
> +}
> +
>  static const struct watchdog_info mtk_wdt_info = {
>  	.identity	= DRV_NAME,
>  	.options	= WDIOF_SETTIMEOUT |
> @@ -253,12 +277,21 @@ static const struct watchdog_info mtk_wdt_info = {
>  			  WDIOF_MAGICCLOSE,
>  };
>  
> +static const struct watchdog_info mtk_wdt_pt_info = {
> +	.identity	= DRV_NAME,
> +	.options	= WDIOF_SETTIMEOUT |
> +			  WDIOF_PRETIMEOUT |
> +			  WDIOF_KEEPALIVEPING |
> +			  WDIOF_MAGICCLOSE,
> +};
> +
>  static const struct watchdog_ops mtk_wdt_ops = {
>  	.owner		= THIS_MODULE,
>  	.start		= mtk_wdt_start,
>  	.stop		= mtk_wdt_stop,
>  	.ping		= mtk_wdt_ping,
>  	.set_timeout	= mtk_wdt_set_timeout,
> +	.set_pretimeout	= mtk_wdt_set_pretimeout,
>  	.restart	= mtk_wdt_restart,
>  };
>  
> @@ -267,7 +300,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct mtk_wdt_dev *mtk_wdt;
>  	const struct mtk_wdt_data *wdt_data;
> -	int err;
> +	int err, irq;
>  
>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
>  	if (!mtk_wdt)
> @@ -279,7 +312,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(mtk_wdt->wdt_base))
>  		return PTR_ERR(mtk_wdt->wdt_base);
>  
> -	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq > 0) {
> +		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
> +								&mtk_wdt->wdt_dev);
> +		if (err)
> +			return err;
> +
> +		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
> +		mtk_wdt->wdt_dev.pretimeout = 1;
> +	} else {
> +		if (irq == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		mtk_wdt->wdt_dev.info = &mtk_wdt_info;
> +	}
> +
>  	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
>  	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
> @@ -360,7 +408,6 @@ static struct platform_driver mtk_wdt_driver = {
>  };
>  
>  module_platform_driver(mtk_wdt_driver);
> -
>  module_param(timeout, uint, 0);
>  MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds");
>  
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
