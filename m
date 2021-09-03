Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E560DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 14:05:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DFD610A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 14:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88DFD610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJg7dHH8QbP7rYf82zpldPYHLTREVMDbBugV/KnyOx8=; b=VM5pHHzWMwp2VJHSQQqp9a62UL
	aftoHJyfyv2fhmUjJjwtt6uXb9ESVRAvkRFTkbrzRBCFO6K4ALWW76Ot+UfO8rtcDDsX86M+bz9ex
	1PRN8hd34LDfEcZOQ1ZnuPTDN24U9LkQVmAzpEPirtXf5zCIJ2eJhUlhYQLO6ylP1kFUzdZEgtqJH
	rhmcBuzhBZh4o8Y/CIKTUCLbXZzu9/eR2aH93fTVH8/NPXPXj1XQWR6nTxWcKMVth6DTY0hhvdK81
	NvIY4rRNwnEnbnv/C2fgWD+DrILEwgZOeB0E+43qhebpaWug+ZJtw0J6yLYHQAd32pg1HnUKC/JYL
	2F59WqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM9od-00C6yM-22; Fri, 03 Sep 2021 14:05:11 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM9oa-00C6wd-1l; Fri, 03 Sep 2021 14:05:09 +0000
Received: by mail-oi1-x230.google.com with SMTP id w144so6476096oie.13;
 Fri, 03 Sep 2021 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=keqb0lLG5bXN4lNVT0FHbMoFuC2nxIHsD31TOnQa8pE=;
 b=D/exd8GSx7b96axCyEL+kndKDPAoWoF2EW7JzlK3Kwaq5cV9LvGcjUVLzcL0Nbk3TL
 Gf0mbr8DlQzVlErDpV+Jbv7NAY/w5hnIb+co+MmIALkL9p1v8X/Nai79r7lfzq/q9SEz
 WW0U/cWl43Rwyu4zWx2eR1rLTz8DJDUyk2eqDEmwK1K7IfYvPl9JXYFPWDUE1z00i4Mq
 JMIkIfbndXmnFX5U+Oml9LDbU0UUj4HFZ8uHdjxf1ABGJ1CEisK7huMqmwcClHLX3wFC
 xr2cFtE6BKWJbQYxrDLm6frklIff40brosW1o33eoX21zG3pLRygcOtmhCw3RVqu/ZMX
 JEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=keqb0lLG5bXN4lNVT0FHbMoFuC2nxIHsD31TOnQa8pE=;
 b=htC9xxoursZ0+88532lC/G8D6cuB7dlO5gGWsBjgtQU5thfpxFn/U2MOruqgAPUwiC
 GCjwLqHhGE1+XDrIXUjTKKQPm28sx+yu7nfUINpH2R3le2aCKEk9eyTkU2JPEQZ25+oR
 YM1GoUn0rIaWunfsZwsLW4NWYm+fB0cT8IcNZa4JyKYqzxrbNpPW2lPDNQ6bxIi5YNJJ
 UGFvK/Jmj38MBo5o0X1Y4cjPDbopM9AjjtEXiFd01WmeowyHgjgOQzAlQ3hPMzamHuBP
 yh9n+cIsw9Dt1QftezfSMZPlPAfcxy4wuZZzAGp67EffT2fL50bqriWHynQon2qnBU5E
 xWQg==
X-Gm-Message-State: AOAM533RnFxTPF2mIaobXdDqg9ORTUSbWwq/ElCf6XJNs0qdHljWT64G
 xCZdQ5DEsSQSun+e+HTeDxA=
X-Google-Smtp-Source: ABdhPJx+IRaT9B0hadGHsVNpszS4tQ96KiHprfMCwOHX8K8ad0EU8MWknjv6YjI6IB5Pay70Mpr8CQ==
X-Received: by 2002:aca:aa88:: with SMTP id t130mr2885592oie.3.1630677905257; 
 Fri, 03 Sep 2021 07:05:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f126sm1063872oob.9.2021.09.03.07.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 07:05:04 -0700 (PDT)
Subject: Re: [v2,1/2] watchdog: mtk: add disable_wdt_extrst support
To: Fengquan Chen <Fengquan.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tinghan.shen@mediatek.com, randy.wu@mediatek.com,
 rex-bc.chen@mediatek.com, christine.zhu@mediatek.com, joe.yang@mediatek.com,
 zhishuang.zhang@mediatek.com
References: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
 <20210903061623.10715-2-Fengquan.Chen@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <65cc931f-ba49-19b5-ce25-c49f7b984cec@roeck-us.net>
Date: Fri, 3 Sep 2021 07:05:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903061623.10715-2-Fengquan.Chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_070508_163524_59AE9FA3 
X-CRM114-Status: GOOD (  21.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/2/21 11:16 PM, Fengquan Chen wrote:
> In some cases, we may need watchdog just to trigger an
> internal soc reset without sending any output signal.
> 
> Provide a disable_wdt_extrst parameter for configuration.
> We can disable or enable it just by configuring dts.
> 
> Signed-off-by: fengquan.chen <fengquan.chen@mediatek.com>

Nit: You should set up git such that it uses "Fengquan Chen", not
"fengquan.chen".

Other than that, for my reference,

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

We'll have to wait for dt property approval before we can apply the patch.

Thanks,
Guenter

> ---
>   drivers/watchdog/mtk_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993bd009..276b6cb7d225 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -63,6 +63,7 @@ struct mtk_wdt_dev {
>   	void __iomem *wdt_base;
>   	spinlock_t lock; /* protects WDT_SWSYSRST reg */
>   	struct reset_controller_dev rcdev;
> +	bool disable_wdt_extrst;
>   };
>   
>   struct mtk_wdt_data {
> @@ -240,6 +241,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>   
>   	reg = ioread32(wdt_base + WDT_MODE);
>   	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	if (mtk_wdt->disable_wdt_extrst)
> +		reg &= ~WDT_MODE_EXRST_EN;
>   	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>   	iowrite32(reg, wdt_base + WDT_MODE);
>   
> @@ -309,6 +312,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   		if (err)
>   			return err;
>   	}
> +
> +	mtk_wdt->disable_wdt_extrst =
> +		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
> +
>   	return 0;
>   }
>   
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
