Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C852C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 03:47:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5BE606A5
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 03:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E5BE606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=cIGWaC9se6o/RROfky6RdqM6ny+uZXyIl8NSP3o4/k0=; b=ODuOkjii5lDPKn728n4U9O2sx
	6dPuT2Cyn1HPn6z3bcRLggn/a0VLZwh46223YVwFlMAP599RxOlLBhsAZ4fSwMCW6txQ+Ebd0WWPG
	YBgRiiqIelR8iitMzusjMn/hCyZml3vlVe8ryfGqRHYawbR3AlxfepiH5HiUi2rdkhvY+lu7hyxqs
	WgMC9KtBGM0HvHO0Hf4mhS1GQ4zPQdH0K5eZU/Ce/58xVcEjYQRGyX+8Qi8Uy5vGzhIJLS4MOclLt
	X+zu+9SY/1PkNq9wjuG278ImVws3eyw2LijS+Sj9K184pwW98/q5O9nkcSB+yqBimNOzv2YqIvBi8
	AfARimf/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQIj-00Fis3-Hq; Thu, 22 Apr 2021 03:46:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQIO-00Fipr-Ik; Thu, 22 Apr 2021 03:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:From:MIME-Version:In-Reply-To:
 Subject:Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:Sender:
 Reply-To:Content-ID:Content-Description:References;
 bh=epwyCKnYigL9Z4pCXqdnZcMjroOeKXltO3nZXTO5748=; b=wMnpdu2TGjVQoZqHFEdZZuzX6D
 loqUYnrOr8U8TQ3juXBtg7FlLQXSpJ+yMGVN4IjEIPNxBzrH+tHn9GTLndUr1wm5lv0fK2vJ4ztcJ
 ac75iIM/evF8Q1zJyxiBePsc+AtoM/s4ybsSsJrYNe4vUjU1GQL8L5KKs+kpULtSNKjdsmCJwApVi
 6TmIhAFvve3SVkiVBFCXiGoBW5E81Qq9YdGoxdifFAX4cgsQDIoY8Z2Og1V/SPJqSOw3nJPvuoIv2
 fCluFnj5b/UJRSq+sWDJb98VqSPRdT1vdksxp0s8IsiZ8h1YAZAgssKzWPDFp+Qsc1q+0uWZYjIAb
 OpG8aUNA==;
Received: from m176149.mail.qiye.163.com ([59.111.176.149])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQIJ-00DL9F-V7; Thu, 22 Apr 2021 03:46:26 +0000
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
 by m176149.mail.qiye.163.com (Hmail) with ESMTP id 25A0E282E70;
 Thu, 22 Apr 2021 11:46:18 +0800 (CST)
Message-ID: <AJYA1QBSDhatYsq-n3vbqqrl.3.1619063178146.Hmail.wangqing@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCBWNiAxLzJdIHdhdGNoZG9nOiBtdGs6IHN1cHBvcnQgcHJlLXRpbWVvdXQgd2hlbiB0aGUgYmFyayBpcnEgaXMgYXZhaWxhYmxl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <740481ed-97e0-3439-1af2-bc54cdb28536@roeck-us.net>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 22 Apr 2021 11:46:18 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date: Thu, 22 Apr 2021 11:46:18 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGR4ZS1ZJSU8fGUJKS0kYHxlVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1IS09OS0tDS05CN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6MSI6Sio5KD8TGg8iCApWFUgNGQoKCRdVSFVKTUpCS01ISkxDTktMVTMWGhIXVQwaFRwKEhUc
 Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBQkhPQjcG
X-HM-Tid: 0a78f7af83ad9395kuws25a0e282e70
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_204624_368951_FB8D91D2 
X-CRM114-Status: GOOD (  22.82  )
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


>On 4/21/21 7:45 PM, Wang Qing wrote:
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
>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>> ---
>>  drivers/watchdog/mtk_wdt.c | 53 +++++++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 48 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>> index 97ca993..ebc648b
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
>> @@ -184,15 +185,22 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
>>  {
>>  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
>> +	unsigned int timeout_interval;
>>  	u32 reg;
>>  
>> -	wdt_dev->timeout = timeout;
>> +	timeout_interval = wdt_dev->timeout = timeout;
>> +	/*
>> +	 * In dual mode, irq will be triggered at timeout/2
>> +	 * the real timeout occurs at timeout
>> +	 */
>> +	if (wdt_dev->pretimeout)
>> +		timeout_interval = wdt_dev->pretimeout = timeout/2;
>
>Please run checkpatch --strict and fix what it reports.
>Also, there should be a set_pretimeout function to set the
>pretimeout. It is ok to update it here, but it should be set
>in its own function to make sure that the actual value
>is reported back to userspace.
>
>Thanks,
>Guenter

The reason why the set_pretimeout interface is not provided is 
because the pretimeout is fixed after the timeout is set,  we need
to modify timeout after setting pretimeout, which is puzzling.

I will point out this behavior in the doc and comments,
or implement the set_pretimeout interface only as a print prompt.
What do you think of it?

Thanks,
Qing
>
>>  
>>  	/*
>>  	 * One bit is the value of 512 ticks
>>  	 * The clock has 32 KHz
>>  	 */
>> -	reg = WDT_LENGTH_TIMEOUT(timeout << 6) | WDT_LENGTH_KEY;
>> +	reg = WDT_LENGTH_TIMEOUT(timeout_interval << 6) | WDT_LENGTH_KEY;
>>  	iowrite32(reg, wdt_base + WDT_LENGTH);
>>  
>>  	mtk_wdt_ping(wdt_dev);
>> @@ -239,13 +247,25 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
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
>> @@ -253,6 +273,14 @@ static const struct watchdog_info mtk_wdt_info = {
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
>> @@ -267,7 +295,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>>  	struct device *dev = &pdev->dev;
>>  	struct mtk_wdt_dev *mtk_wdt;
>>  	const struct mtk_wdt_data *wdt_data;
>> -	int err;
>> +	int err, irq;
>>  
>>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
>>  	if (!mtk_wdt)
>> @@ -279,7 +307,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>>  	if (IS_ERR(mtk_wdt->wdt_base))
>>  		return PTR_ERR(mtk_wdt->wdt_base);
>>  
>> -	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq > 0) {
>> +		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
>> +							&mtk_wdt->wdt_dev);
>> +		if (err)
>> +			return err;
>> +
>> +		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
>> +		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT/2;
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
