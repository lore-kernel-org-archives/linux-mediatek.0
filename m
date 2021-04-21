Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC42C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 14:11:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDFB861445
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 14:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDFB861445
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hv7DmRLr6JjG35g+ryr/ZKguKYNAqFclbpZDWybdqRU=; b=lMCRVLWGDvsOZuhqWYVUdYzEi
	yrK3dZIIDdotni/LXO6PkdQBwLvosE/fX4Zf8vfmgK5xp6l/OdMfwxU3FvIXmDWeBkJLbV5fv99i9
	6AxgTKr8SSEQJvh1/7xwQ6O/6J7Y6gohAX07n7+rrWX1D6NGuTlbllhWd8cdzSdOAd2gYAEI/KB9Q
	Z422Cti5BrbHgtR7ebK2wfb7D3lLci86Qdpz3BmIOfwpy/1qFfIxucugrFZeC9LbnuLyVqH9hb2VF
	eUh8sZFW090pEzilmfI0ADA5vGflODL5qsvUbht3fgMW6N2eERNsqxFE63BYH8yU4kqeey3sgqACs
	VLD3AEm7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZDZr-00EXkG-0L; Wed, 21 Apr 2021 14:11:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZDZo-00EXk2-5e; Wed, 21 Apr 2021 14:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=C+MMGu6/cdDUyGRCAkorYxe8bF5C7WJDPp9/ShABlOU=; b=cMIHq+M5lqVaM0C+uEfSD+QZUi
 BwScSovI7vHDds9dJZQBSKaHfRoDQQqsNw5LXfgXvjbVMevBgJBpXXP2H+q5VfL7+28fhzF7JS4Fk
 D0z2QkVw6lhFvlCLH/utDKiMatvIR6+A1MvK+LSS8i5BM3H23w0bgw4vFUBWtoGFahDDPwZjm4TVu
 TVuhJiyVjFZPPTp9LFsGePTtGEV32hIqUDx+oiJbmQuVJWrO2G86/KeVcaTV1uWkCMr6IlVbt6Mhn
 zmYnXO+nkhYEDu11ROqm1wN/Mnd2QRVeJ5P82kn6Xi5uiWVS3CdY4J50wrAmeT2xlIZ25ajOBBL3z
 vySpoJOg==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZDZi-00Cwgz-Kh; Wed, 21 Apr 2021 14:11:34 +0000
Received: by mail-ot1-x335.google.com with SMTP id
 e89-20020a9d01e20000b0290294134181aeso13253692ote.5; 
 Wed, 21 Apr 2021 07:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C+MMGu6/cdDUyGRCAkorYxe8bF5C7WJDPp9/ShABlOU=;
 b=gmj1SVVbiQG/yKolJzH1wD8dfp3SWUUnQe9+lwQsSLYGZ3rqKl/lFThcD9ndaFzlmy
 pRH2PyQg5xTFUaLSVbp0DYqzUJXPBKVmm0JPcE+g2GmR8WDq0GcO74lwnCkEzdo+rqCg
 LrrognhvbjlOK7cZOXIMCZXQ+IJDmjAfnkFSFKKgsUUzXGWlcr9BG+9x8kXoPFacVpFE
 teq1Wajw89s18QYvTjN4XQ2t2BKKFSPZixeyQtOR0l0kJWtK1B2buoKi+JeHlcejynCI
 EVRhh4BXZ2Pl4mJ+5fiX5Iu7soWjMLQ2J/pBjyLaqxZwgh5IW3/Rp7DWN7TcaMQO7yXA
 BvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C+MMGu6/cdDUyGRCAkorYxe8bF5C7WJDPp9/ShABlOU=;
 b=uJGIqGrnAMRlP/pqwBx4XMbyXA7eta5qtGRNYMztRDSLRgFZR923n6bdaC5sX6f+Zn
 dGLFN0K1VbFWr6dBye7/lvphKwwnJaybfzAMXVV2xV0mk6svthfT3ocHxmCdd3oEoWuy
 9nuVc+4lSx+g8KneJh7gJB8WH3xIrVCbAHGvPpy1cl7pDrqWYKCeHfSxF/KrG4vUaz8B
 G9Um5Na+hMOcLtWfmWF47IhqTXHdUNXI3vtONYF7X9U7L3SbdGmreLXbIuXRVE4qKXPu
 4SNvw02IhSVeGLC/b0KQJ3nfy4L7hZsPZU1aik2JErgBzbQ0/V5I42J2JTGABdtp7MO4
 cdgA==
X-Gm-Message-State: AOAM5332ZNfyKSaqyLktchXtbYSxBO1UCwrBEINeCWbBo/BD9MFQ4riz
 92dSvzXbP/xtC4VLSSO7We8=
X-Google-Smtp-Source: ABdhPJwHg1FJRGDzgw5/MyTHpkZNNXQcNJAZciGSi3Ft8ARQ1p0BzIhuXFZUFjQoQ4x2M0mP67A3Ow==
X-Received: by 2002:a9d:7e8e:: with SMTP id m14mr10229356otp.302.1619014289335; 
 Wed, 21 Apr 2021 07:11:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c21sm474473ooa.48.2021.04.21.07.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 07:11:28 -0700 (PDT)
Subject: Re: [PATCH V5] watchdog: mtk: support dual mode when the bark irq is
 available
To: Wang Qing <wangqing@vivo.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
References: <1618992304-18903-1-git-send-email-wangqing@vivo.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <65b0c4d4-7b01-eb4c-3b1e-0d1427e85c3e@roeck-us.net>
Date: Wed, 21 Apr 2021 07:11:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1618992304-18903-1-git-send-email-wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_071130_708486_249879CB 
X-CRM114-Status: GOOD (  33.25  )
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

On 4/21/21 1:05 AM, Wang Qing wrote:
> Support using irq handling wdt bark first instead of directly resetting.
> 
> When the watchdog timer expires in dual mode, an interrupt will be
> triggered first, then the timing restarts. The reset signal will be
> initiated when the timer expires again.
> 
> The dual mode is disabled by default.
> 

This means the real timeout is now timeout * 2. This is not what
is supposed to happen. The hard watchdog timeout needs to happen at
'timeout'.

If you want to do this, it needs to be done using pre-timeout,
only the pre-timeout time (and thus the watchdog timeout written
into the chip) must be limited to timeout / 2. Pre-timeout must
by default be disabled and only be supported if an interrupt was
provided.

I don't see a need for an additional module parameter. Providing
an interrupt implies that pre-timeout support is wanted. This needs
to be documented accordingly.

I am not lot looking at the errors reported by 0-day. Please address those.

Guenter

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
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 36 ++++++++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993..40122f8
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
> @@ -57,6 +58,7 @@
>  
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  static unsigned int timeout;
> +static bool dual_mode;
>  
>  struct mtk_wdt_dev {
>  	struct watchdog_device wdt_dev;
> @@ -239,13 +241,23 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>  		return ret;
>  
>  	reg = ioread32(wdt_base + WDT_MODE);
> -	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	if (dual_mode)
> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	else
> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>  	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>  	iowrite32(reg, wdt_base + WDT_MODE);
>  
>  	return 0;
>  }
>  
> +static irqreturn_t mtk_wdt_isr(int irq, void *arg)
> +{
> +	panic("wdt bark!\n");
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static const struct watchdog_info mtk_wdt_info = {
>  	.identity	= DRV_NAME,
>  	.options	= WDIOF_SETTIMEOUT |
> @@ -267,7 +279,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct mtk_wdt_dev *mtk_wdt;
>  	const struct mtk_wdt_data *wdt_data;
> -	int err;
> +	int err, irq;
>  
>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
>  	if (!mtk_wdt)
> @@ -279,6 +291,19 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(mtk_wdt->wdt_base))
>  		return PTR_ERR(mtk_wdt->wdt_base);
>  
> +	if (dual_mode) {
> +		irq = platform_get_irq(pdev, 0);
> +		if (irq > 0) {
> +			err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
> +						&mtk_wdt->wdt_dev);
> +			if (err)
> +				return err;
> +		} else {
> +			dual_mode = 0;
> +			dev_info(&pdev->dev, "couldn't get wdt irq, set dual_mode = 0\n");
> +		}
> +	}
> +
>  	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
>  	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
> @@ -299,8 +324,8 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	if (unlikely(err))
>  		return err;
>  
> -	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
> -		 mtk_wdt->wdt_dev.timeout, nowayout);
> +	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d,
> +		 dual_mode=%d)\n", mtk_wdt->wdt_dev.timeout, nowayout, dual_mode);
>  
>  	wdt_data = of_device_get_match_data(dev);
>  	if (wdt_data) {
> @@ -368,6 +393,9 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>  			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> +module_param(dual_mode, bool, 0);
> +MODULE_PARM_DESC(dual_mode, "Dual mode triggers irq before reset (default=0)");
> +
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Matthias Brugger <matthias.bgg@gmail.com>");
>  MODULE_DESCRIPTION("Mediatek WatchDog Timer Driver");
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
