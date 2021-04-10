Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA9DC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 02:49:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A10F9611AF
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 02:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A10F9611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=NTDQvjqMfbCrWb2u8JfbpPm6mVOOFl22WeRtdTXh/TE=; b=rRj0JUkyM71ZPrWHsxu+lYe9G
	fyE5JlYNRY0IaQYBISCYMcRLKWPDbERz1BAwzG7Hq72wjLjFQJzO8cM88uQTFnb4wTGimJjbdpPqu
	bH2oD2sQFSkx5octRjBSOw+enN/6qEAQYWGayPjjLJ96VLdCigmNNMNK4PUJLSsdm9mi5shcnvaMA
	2z/nE2/Eo/jlnFKSpvNeWtH6oZtJ7apFR6VU+BzhAX26PnsV0S1z8i1kSNaWdmc+RYVRVzSbv5W2W
	XPHuaLo7mTwIO2tFeFbCf5ZbeNZTThQEy9svIDXOp/jnLJGw5z6cgEL3MY9EbgMn/etLXhoEggnt+
	NQt5a3o9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV3g3-0020Bn-3J; Sat, 10 Apr 2021 02:48:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV3aA-001zwN-Bm; Sat, 10 Apr 2021 02:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:From:MIME-Version:In-Reply-To:
 Subject:Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:Sender:
 Reply-To:Content-ID:Content-Description:References;
 bh=tk/hRv1eW3T7oToMb/E4wjMXwR8fz1/pakezdzJ4jUw=; b=Fch51V6blZqcihU1JBOzTMzVr1
 ty+3/QRSwigcFvqYEgr7BNdEYl35DpLdE5+OwoLuDsQ4l/7GbbZrT9+dYM8EqQ1TGnBBbX1qFkye/
 8BdlW+nLvCO+hLQXIruI9oEumUFE8DnMtV9COqfXxuQUqGEB3A50F5Mcu0MovsNtOKoFWj5YsrpY7
 BugdGadpafeef5GQ3U+DHwggjUkKcQrqXac268x6jGtB3owVvOK4GbpKvmfWNfYwG2yJ87niOdzbj
 XbjvJMgBtCskJnvc1fdbPoZCeSUBL4Ot5s2dUKdBll/hIKG+Nyea690+59TReN7zy5beWALLG1GFw
 6WRzDMIQ==;
Received: from m176149.mail.qiye.163.com ([59.111.176.149])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV3a4-004ubf-79; Sat, 10 Apr 2021 02:42:43 +0000
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
 by m176149.mail.qiye.163.com (Hmail) with ESMTP id 4F3A4282535;
 Sat, 10 Apr 2021 10:42:33 +0800 (CST)
Message-ID: <ANUA4QBkDhibiES5bK7X8Ko8.3.1618022553315.Hmail.wangqing@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gd2F0Y2hkb2c6IG10azogc3VwcG9ydCBwcmUtdGltZW91dCB3aGVuIHRoZSBiYXJrIGlycSBpcyBhdmFpbGFibGU=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <58b6f50a-4522-dc21-3411-7ed18059b480@roeck-us.net>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail (
 [127.0.0.1] ) ; Sat, 10 Apr 2021 10:42:33 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date: Sat, 10 Apr 2021 10:42:33 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQh0aQ1ZDHx4dGk1DTEMaTxpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1JTElDQ0hMQkxDN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6NS46Tyo5ED8TEhkSPihOGTBMI0MwFENVSFVKTUpDS0lJTk5ITkxKVTMWGhIXVQwaFRwKEhUc
 Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBT0tPSjcG
X-HM-Tid: 0a78b9a8d6ef9395kuws4f3a4282535
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_194240_456111_B0986BDE 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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


>On 4/9/21 2:55 AM, Wang Qing wrote:
>> Use the bark interrupt as the pretimeout notifier if available.
>> 
>> By default, the pretimeout notification shall occur one second earlier
>> than the timeout.
>> 
>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>> ---
>>  drivers/watchdog/mtk_wdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 44 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>> index 97ca993..8b919cc
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
>> @@ -234,18 +235,35 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
>>  	int ret;
>>  
>> -	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>> +	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout - wdt_dev->pretimeout);
>
>That looks suspiciously like the real watchdog won't happen at all.
>What will happen if the pretimeout governor is set to none ?
>
>Guenter
>
The pretimeout governor is panic by default. If pretimeout is enabled and the governor is
set to none, it means the timeout behavior does not need to be processed, only printing.

Thanks.

Qing Wang.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
