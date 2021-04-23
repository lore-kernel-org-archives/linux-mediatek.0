Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E109FC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 03:48:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4088461417
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 03:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4088461417
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=NdoMLAdcM7OoSZziosdNbf7vrPbPc6NZFZYuv4+Rl8A=; b=eXoGZt1YpaefKTN+BXpB85hJB
	GMh3Co90BRxKu64omgLHXe7xl0TovYfV6g4PkDVtvVSU2jkJEf+88KbP73NJ/ms8izycIp+JCoyot
	vwPOiXgsct5m/sERpMxLr4+YZFoNFMefKsB/BQkH7gJmQfHtsnA1eahovMMOXL6J0bCVSXRh30+C/
	ZAmgOYa0v0/t2zbiVV1J31CqfNFRBsBKadccJTgwqFDweotS3rTuuLrjGQScCEnaRZZMeWMpneSWq
	RTXwb2ME/saHK+bVNoSxDLKHbqZMLw4qotf7h+bg3EB7HsumvHMPm1o5FJ7sRvFpW/AVPdp8bdhkg
	KsKYSle3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmnw-000WUG-RG; Fri, 23 Apr 2021 03:48:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmnf-000WT7-Vq; Fri, 23 Apr 2021 03:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:From:MIME-Version:In-Reply-To:
 Subject:Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:Sender:
 Reply-To:Content-ID:Content-Description:References;
 bh=JS9j0bHTkUewaAH2e+uPh445/ywslTJC1XXt0e9LGs8=; b=VtycQtFu8hsCf3pIYjXvD3tpTc
 zOjFad9pUBB9gECMM2MPvjpyOTO2RSO7pWDP8musakIQcasu9PF5atElK7MgpFbsCZRba4PN0zVtJ
 cBtKCJ+37IK2z2gUKmak9e02QGj5I4TUjeavM4BnREchkeddpkK2IQTzJac66wFjeO6XoWf2G35Vd
 odgryazoncqVIb6mTp0Jn/a6a84FOuI6jy3+0a9LUBlvUZRfvka3FkOq75OWfvjconCGNLOxiOD5k
 QiK5q6UZ4kIkBZTJFpAeD+QdZBqz+c6x7jWi7Up6boV/BFrEzJ1oFcKiovP3miTBCVU3tZngDqfYB
 qepIyIKw==;
Received: from m176149.mail.qiye.163.com ([59.111.176.149])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmnb-00E7lB-6H; Fri, 23 Apr 2021 03:48:13 +0000
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
 by m176149.mail.qiye.163.com (Hmail) with ESMTP id E5586282390;
 Fri, 23 Apr 2021 11:48:06 +0800 (CST)
Message-ID: <AOUAdwCCDk8v*1Yj0s9Qo4qH.3.1619149686926.Hmail.wangqing@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCBWNyAxLzJdIHdhdGNoZG9nOiBtdGs6IHN1cHBvcnQgcHJlLXRpbWVvdXQgd2hlbiB0aGUgYmFyayBpcnEgaXMgYXZhaWxhYmxl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <0de7e5c8-57a2-9b27-d8a8-ed7e0b394b02@roeck-us.net>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail (
 [127.0.0.1] ) ; Fri, 23 Apr 2021 11:48:06 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date: Fri, 23 Apr 2021 11:48:06 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGU1LTlZCSB4eS05CSRkeSE5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1IS0xIS0hMSkhON1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6NC46Hww4OD8QQw1RSiIRSwhCKhRPCjNVSFVKTUpCSk9CTUNMSUlPVTMWGhIXVQwaFRwKEhUc
 Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBSktDTUg3Bg++
X-HM-Tid: 0a78fcd7889f9395kuwse5586282390
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_204811_576238_1AFA75AF 
X-CRM114-Status: GOOD (  24.07  )
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


>On 4/22/21 7:53 PM, Wang Qing wrote:
>> Use the bark interrupt as the pretimeout notifier if available.
>> 
>> When the watchdog timer expires in dual mode, an interrupt will be
>> triggered first, then the timing restarts. The reset signal will be
>> initiated when the timer expires again.
>> 
>> The pretimeout notification shall occur at timeout-sec/2.
>> 
>> V2:
>> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.
>> 
>> V3:
>> - Modify the pretimeout behavior, manually reset after the pretimeout
>> - is processed and wait until timeout.
>> 
>> V4:
>> - Remove pretimeout related processing. 
>> - Add dual mode control separately.
>> 
>> V5:
>> - Fix some formatting and printing problems.
>> 
>> V6:
>> - Realize pretimeout processing through dualmode.
>> 
>> V7:
>> - Add set_pretimeout().
>> 
>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>> ---
>>  drivers/watchdog/mtk_wdt.c | 76 +++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 71 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>> index 97ca993..ab3ac5d
>> --- a/drivers/watchdog/mtk_wdt.c
>> +++ b/drivers/watchdog/mtk_wdt.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/reset-controller.h>
>>  #include <linux/types.h>
>>  #include <linux/watchdog.h>
>> +#include <linux/interrupt.h>
>>  
>>  #define WDT_MAX_TIMEOUT		31
>>  #define WDT_MIN_TIMEOUT		1
>> @@ -184,15 +185,23 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
>>  {
>>  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
>> +	unsigned int timeout_interval = timeout;
>>  	u32 reg;
>>  
>>  	wdt_dev->timeout = timeout;
>> -
>> +	/*
>> +	 * In dual mode, irq will be triggered at timeout / 2
>> +	 * the real timeout occurs at timeout
>> +	 */
>> +	if (wdt_dev->pretimeout) {
>> +		wdt_dev->pretimeout = timeout / 2;
>
>min_timeout is set to 1. I don't this works well if timeout == 1.
>You'll either need to set min_timeout to 2, or handle that case.

It is appropriate to change min_timeout  to 2.

>
>> +		timeout_interval = wdt_dev->pretimeout;
>
>timeout_interval is unnecessary. Just update timeout accordingly.
>It needs to take the situation of timeout == 1 into account, though.

timeout represents the reset time. When the user calls timeout_show, 
He hopes to get the configured timeout, not the value changed
by pre-timeout.
I modify it like this more in line with the original intention.

>
>> +	}
>>  	/*
>>  	 * One bit is the value of 512 ticks
>>  	 * The clock has 32 KHz
>>  	 */
>> -	reg = WDT_LENGTH_TIMEOUT(timeout << 6) | WDT_LENGTH_KEY;
>> +	reg = WDT_LENGTH_TIMEOUT(timeout_interval << 6) | WDT_LENGTH_KEY;
>>  	iowrite32(reg, wdt_base + WDT_LENGTH);
>>  
>>  	mtk_wdt_ping(wdt_dev);
>> @@ -239,13 +248,46 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>>  		return ret;
>>  
>>  	reg = ioread32(wdt_base + WDT_MODE);
>> -	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>> +	if (wdt_dev->pretimeout)
>> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>> +	else
>> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>>  	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>>  	iowrite32(reg, wdt_base + WDT_MODE);
>>  
>>  	return 0;
>>  }
>>  
>> +static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
>> +					unsigned int timeout)
>> +{
>> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
>> +	void __iomem *wdt_base = mtk_wdt->wdt_base;
>> +	u32 reg = ioread32(wdt_base + WDT_MODE);
>> +
>> +	if (timeout && !wdd->pretimeout) {
>> +		wdd->pretimeout = wdd->timeout / 2;
>> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>> +	} else if (!timeout && wdd->pretimeout) {
>> +		wdd->pretimeout = 0;
>> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>> +	} else
>> +		return 0;
>> +
>> +	iowrite32(reg, wdt_base + WDT_MODE);
>
>What is the point of setting the mode here ? It will
>be set again in mtk_wdt_set_timeout(). Seems to me all
>you need to do here is to set wdd->pretimeout,
>then call mtk_wdt_set_timeout().

mtk_wdt_set_timeout() only set timeout and ping().
Here also need to config to the dualmode or not.

Thanks,
Qing
>
>Guenter
>
>> +
>> +	return mtk_wdt_set_timeout(wdd, wdd->timeout);
>> +}
>> +
>> +static irqreturn_t mtk_wdt_isr(int irq, void *arg)
>> +{
>> +	struct watchdog_device *wdd = arg;
>> +
>> +	watchdog_notify_pretimeout(wdd);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>>  static const struct watchdog_info mtk_wdt_info = {
>>  	.identity	= DRV_NAME,
>>  	.options	= WDIOF_SETTIMEOUT |
>> @@ -253,12 +295,21 @@ static const struct watchdog_info mtk_wdt_info = {
>>  			  WDIOF_MAGICCLOSE,
>>  };
>>  
>> +static const struct watchdog_info mtk_wdt_pt_info = {
>> +	.identity	= DRV_NAME,
>> +	.options	= WDIOF_SETTIMEOUT |
>> +			  WDIOF_PRETIMEOUT |
>> +			  WDIOF_KEEPALIVEPING |
>> +			  WDIOF_MAGICCLOSE,
>> +};
>> +
>>  static const struct watchdog_ops mtk_wdt_ops = {
>>  	.owner		= THIS_MODULE,
>>  	.start		= mtk_wdt_start,
>>  	.stop		= mtk_wdt_stop,
>>  	.ping		= mtk_wdt_ping,
>>  	.set_timeout	= mtk_wdt_set_timeout,
>> +	.set_pretimeout	= mtk_wdt_set_pretimeout,
>>  	.restart	= mtk_wdt_restart,
>>  };
>>  
>> @@ -267,7 +318,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>>  	struct device *dev = &pdev->dev;
>>  	struct mtk_wdt_dev *mtk_wdt;
>>  	const struct mtk_wdt_data *wdt_data;
>> -	int err;
>> +	int err, irq;
>>  
>>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
>>  	if (!mtk_wdt)
>> @@ -279,7 +330,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>>  	if (IS_ERR(mtk_wdt->wdt_base))
>>  		return PTR_ERR(mtk_wdt->wdt_base);
>>  
>> -	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq > 0) {
>> +		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
>> +					&mtk_wdt->wdt_dev);
>> +		if (err)
>> +			return err;
>> +
>> +		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
>> +		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT / 2;
>> +	} else {
>> +		if (irq == -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +
>> +		mtk_wdt->wdt_dev.info = &mtk_wdt_info;
>> +	}
>> +
>>  	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
>>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
>>  	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
>> 
>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
