Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAECC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:26:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8FFE60F56
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8FFE60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+laV51VWdghrEzZ+O9Xci91VUJSgRRvwFeSrWVvNC9s=; b=iEjxs4x33pXEDm
	7hwcCjoi7RaetcTW2ehiVs1rQbR0cKmjW1GV95t2fqMWZIaHOE0zPPbVymTh7YP1ltsk/FScqgfpN
	FfMrPVAVd4NbTW91ASaToIGvzvkVK+f5d5mO+QmBUKCT1jECgaltDPXPX0FCe7zlZFXk2lMXaW6dw
	flCMoSpzgjOHPlhAMWdZiuy9QUeaYup6soCVLH2iDmE/WslCdzaUjFWWbozMVeBVm84Br6WpNLYiK
	mxt7NipY9KmdOZymMrjB+a6MImFB/UNEEj0EQ59gDm7Gy40PxjKB2hJgBCt3JhpScioafwfyjrhCj
	HCeG3EAnAO9zTsfmUBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mffCM-004Q07-DY; Wed, 27 Oct 2021 09:26:18 +0000
Received: from mxout03.lancloud.ru ([45.84.86.113])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mffC7-004Pyv-Rr; Wed, 27 Oct 2021 09:26:06 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 8E5EB20ED992
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <d7a7d79a-a1b9-3c3d-13e1-ab4ab8e9989a@omp.ru>
Date: Wed, 27 Oct 2021 12:25:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 20/22] usb: host: xhci-mtk: deny IRQ0
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, <linux-usb@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
 <20211026173943.6829-21-s.shtylyov@omp.ru>
 <fee8297f6b34e530ef2e3da4e9bc9e324308b439.camel@mediatek.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <fee8297f6b34e530ef2e3da4e9bc9e324308b439.camel@mediatek.com>
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_022604_135691_77E45DF6 
X-CRM114-Status: UNSURE (   9.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27.10.2021 12:18, Chunfeng Yun wrote:

>> If platform_get_irq() returns IRQ0 (considered invalid according to
>> Linus)
>> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no
>> IRQ
>> at all. Deny IRQ0 right away, returning -EINVAL from the probe()
>> method...
>>
>> Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host
>> controller")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> ---
>>   drivers/usb/host/xhci-mtk.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
>> mtk.c
>> index c53f6f276d5c..d2dc8d9863ee 100644
>> --- a/drivers/usb/host/xhci-mtk.c
>> +++ b/drivers/usb/host/xhci-mtk.c
>> @@ -495,7 +495,7 @@ static int xhci_mtk_probe(struct platform_device
>> *pdev)
>>   		return ret;
>>   
>>   	irq = platform_get_irq_byname_optional(pdev, "host");
>> -	if (irq < 0) {
>> +	if (irq <= 0) {
>>   		if (irq == -EPROBE_DEFER)
>>   			return irq;
>>   
>> @@ -503,6 +503,8 @@ static int xhci_mtk_probe(struct platform_device
>> *pdev)
>>   		irq = platform_get_irq(pdev, 0);
>>   		if (irq < 0)
>>   			return irq;
>> +		if (!irq)
> it's "if (irq <= 0)"?

    No, if (irq == 0).

>> +			return -EINVAL;
>>   	}
>>   
>>   	wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");

MBR, Sergey

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
