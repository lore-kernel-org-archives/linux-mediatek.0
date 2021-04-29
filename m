Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26528C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 22:23:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 611D861461
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 22:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 611D861461
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9lpX2T5V7z7qiOnrPnfNQf8ixZyyrmBLu2kE7z2yL9c=; b=p+qbU6HmDK418AB5Eo2KW1TE0
	8u5XmuSBz4Wc6nPweL48UV905uyZMzgKpgfHoymRNPkkfByhjMQUS86q13Ciu5ZbXr9XLBMxzE49o
	6a/ZpEx/4F0sH4e2rcRF50eQIoCIyWbSndawRpA71/bVlmhcshuTOVFSw+av97HRsEMZmQR/4y/V/
	wr4NdueZkFvpvcFaMNYgWP4b6fCB6Bzl7RWTTOKGAzRK0NCbWn5lvW/u/LFCVZSMJHF/uhXOjI3im
	5RsaqrYjA3YT54nJAgFEml2UcU9sjWL5nIaA76L0FL5DIIxmWCwUUj5W/p1YPiF3wB67kJSnGY2yj
	yxr6u+24w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcF49-006dLK-74; Thu, 29 Apr 2021 22:23:25 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcF45-006dJr-6X; Thu, 29 Apr 2021 22:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=y/dh3xIKSWKWI3UZIKoQ5GqY1MGMaSfcmsOXMLuCmUQ=; b=BFQFypY4FumMwCrxc1rgeIlVPw
 +vnWw1HmztAu0gv6OMtrejPQuo058VUWNz9yyVE8ocsRKvOpikF4kyXHIBhVvHdRaS4oRjEWHxh+N
 jVI+ITskc/IsziHfvIArypoFJsgCd/SDj0ZmU2IMJ3NulSywDJxUGTDNUAA+EWqwdcDXqzJ/FZa+k
 l+dyi5uVFBfMP2YHGIdN3doPtl6AZ+6aDA060iAJsxZWr2AYmlqigymzB8tfEyJy4rPLKT53uNNsf
 XS2k+GUnC/fV3tn1SL+2sh5rV208rIfWXXplJFVIXgqtYLH1JlquOtrlvuVFOsyv5g6GmxYjR1Q+U
 aGBfxPYw==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcF3s-0010V5-8w; Thu, 29 Apr 2021 22:23:09 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 z25-20020a9d65d90000b02902a560806ca7so4097886oth.11; 
 Thu, 29 Apr 2021 15:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y/dh3xIKSWKWI3UZIKoQ5GqY1MGMaSfcmsOXMLuCmUQ=;
 b=dAsZd/yk5QzUquUfs85vKVW905qMZTKW9s6nVilgxzO2es+d4KGXVRrHYjC5RfMP35
 TTWegMsPxm0xUl7Mc96dSF7/Qi1vVtiN47cx7ChcNSVuhMpPmbyzoxy5BhW/l0Fhx/PK
 u8kl1H7w8yvHgNCj3njSJ7e345pBXFvqUeQwYr125Ittr9hZW5JpiidwjfG0AuIW13t7
 1j6EIQAktDlt6FnPpPmx8clHe68UASsCAADWNOKjOLa/SsmBjj1c1iqbWLd0wjPBKiPW
 +DAEv6hU8I5sd9cgv/ZaWsox6WKUi4vqlt9fnzoQmSUlxyUUQnr2KloJzHLWEgYes9Ui
 nOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=y/dh3xIKSWKWI3UZIKoQ5GqY1MGMaSfcmsOXMLuCmUQ=;
 b=mYAw5fgrdIDrtlxdRG9Inq4pSsLJ6oKHpGNeUU1VnGY0P2FcUbtAHqoSIgiX+ckfGO
 q92tRoTLJfAAZvK3t+ZkMqqEOzcd00RSevfL5cPYogJ03tOlwEN6i3BXdkDtXPHYA0iL
 aVTETpHfOJ9mmbsiJE0BINLYaDP4ReF+nalpvLYksbsWoizvbPO1Z64+gFaoxXI7MUoo
 PdjsYe3x8A9s/LmBcti4+Yw4IBv2CjuxAKoEdPy/lkp1pHLJp7toiPgd6cJnKtAodqKw
 juOIEyKA91QfnplV1XXDtmpfYcL6vvDSLrzfPNa+7fSLziYmgBy55MMNgidWebjRVAnS
 vlAA==
X-Gm-Message-State: AOAM533B5Zs9WToTjMA+Qd3vJKdb+qVYKiDUwIAwT7fhEo1bqOmuRe13
 OkCto56cOdIEcxhBBbq+jek=
X-Google-Smtp-Source: ABdhPJz3WGra1OmP3aqS/B/ab1uJM8iUaD9L6Vd7U1l/rskxuuAmvPzmWgOqO08sVQEZB7xS8deQFA==
X-Received: by 2002:a05:6830:2159:: with SMTP id
 r25mr1015600otd.313.1619734981071; 
 Thu, 29 Apr 2021 15:23:01 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id n37sm282774otn.9.2021.04.29.15.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 15:23:00 -0700 (PDT)
Subject: Re: [PATCH V9 1/2] watchdog: mtk: support pre-timeout when the bark
 irq is available
To: Wang Qing <wangqing@vivo.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1619315527-8171-1-git-send-email-wangqing@vivo.com>
 <1619315527-8171-2-git-send-email-wangqing@vivo.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <45ff044d-80ff-9001-1d4f-d39d0ae63060@roeck-us.net>
Date: Thu, 29 Apr 2021 15:22:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1619315527-8171-2-git-send-email-wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_152308_376589_4647786B 
X-CRM114-Status: GOOD (  32.78  )
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

On 4/24/21 6:52 PM, Wang Qing wrote:
> Use the bark interrupt as the pretimeout notifier if available.
> 
> When the watchdog timer expires in dual mode, an interrupt will be
> triggered first, then the timing restarts. The reset signal will be
> initiated when the timer expires again.
> 
> The pretimeout notification shall occur at timeout-sec/2.
> 
> V2:
> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.
> 
> V3:
> - Modify the pretimeout behavior, manually reset after the pretimeout
> - is processed and wait until timeout.
> 
> V4:
> - Remove pretimeout related processing. 
> - Add dual mode control separately.
> 
> V5:
> - Fix some formatting and printing problems.
> 
> V6:
> - Realize pretimeout processing through dualmode.
> 
> V7:
> - Add set_pretimeout().
> 
> V8/V9:
> - Fix some formatting problems.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Note that the version history should be after "---".

Guenter

> ---
>  drivers/watchdog/mtk_wdt.c | 77 +++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 72 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993..7bb0774
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -25,9 +25,10 @@
>  #include <linux/reset-controller.h>
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
> +#include <linux/interrupt.h>
>  
>  #define WDT_MAX_TIMEOUT		31
> -#define WDT_MIN_TIMEOUT		1
> +#define WDT_MIN_TIMEOUT		2
>  #define WDT_LENGTH_TIMEOUT(n)	((n) << 5)
>  
>  #define WDT_LENGTH		0x04
> @@ -187,12 +188,19 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  	u32 reg;
>  
>  	wdt_dev->timeout = timeout;
> +	/*
> +	 * In dual mode, irq will be triggered at timeout / 2
> +	 * the real timeout occurs at timeout
> +	 */
> +	if (wdt_dev->pretimeout)
> +		wdt_dev->pretimeout = timeout / 2;
>  
>  	/*
>  	 * One bit is the value of 512 ticks
>  	 * The clock has 32 KHz
>  	 */
> -	reg = WDT_LENGTH_TIMEOUT(timeout << 6) | WDT_LENGTH_KEY;
> +	reg = WDT_LENGTH_TIMEOUT((timeout - wdt_dev->pretimeout) << 6)
> +			| WDT_LENGTH_KEY;
>  	iowrite32(reg, wdt_base + WDT_LENGTH);
>  
>  	mtk_wdt_ping(wdt_dev);
> @@ -239,13 +247,48 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>  		return ret;
>  
>  	reg = ioread32(wdt_base + WDT_MODE);
> -	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	if (wdt_dev->pretimeout)
> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	else
> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>  	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>  	iowrite32(reg, wdt_base + WDT_MODE);
>  
>  	return 0;
>  }
>  
> +static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
> +				  unsigned int timeout)
> +{
> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
> +	void __iomem *wdt_base = mtk_wdt->wdt_base;
> +	u32 reg = ioread32(wdt_base + WDT_MODE);
> +
> +	if (timeout && !wdd->pretimeout) {
> +		wdd->pretimeout = wdd->timeout / 2;
> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	} else if (!timeout && wdd->pretimeout) {
> +		wdd->pretimeout = 0;
> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	} else {
> +		return 0;
> +	}
> +
> +	reg |= WDT_MODE_KEY;
> +	iowrite32(reg, wdt_base + WDT_MODE);
> +
> +	return mtk_wdt_set_timeout(wdd, wdd->timeout);
> +}
> +
> +static irqreturn_t mtk_wdt_isr(int irq, void *arg)
> +{
> +	struct watchdog_device *wdd = arg;
> +
> +	watchdog_notify_pretimeout(wdd);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static const struct watchdog_info mtk_wdt_info = {
>  	.identity	= DRV_NAME,
>  	.options	= WDIOF_SETTIMEOUT |
> @@ -253,12 +296,21 @@ static const struct watchdog_info mtk_wdt_info = {
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
> @@ -267,7 +319,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct mtk_wdt_dev *mtk_wdt;
>  	const struct mtk_wdt_data *wdt_data;
> -	int err;
> +	int err, irq;
>  
>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
>  	if (!mtk_wdt)
> @@ -279,7 +331,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(mtk_wdt->wdt_base))
>  		return PTR_ERR(mtk_wdt->wdt_base);
>  
> -	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq > 0) {
> +		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
> +				       &mtk_wdt->wdt_dev);
> +		if (err)
> +			return err;
> +
> +		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
> +		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT / 2;
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
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
