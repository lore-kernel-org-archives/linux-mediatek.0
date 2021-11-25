Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773B2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 08:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIy1IEBwuBXUF5mXCeSihvtN4nGgE4PSCt77ahx3dU4=; b=KyVA+rrdmT3+/N
	0JpKhDsa8jeye9vNizi0pnM3VHr/ruqRlxx7DmfK1QxLgIJOnNlexwPIwwYr9gJtOszT9oExBnWxw
	5HxKRSIBmW53ihZ+nPjP5buvCZUbHOfTX+uxKNzX/ubgNWGncmtPiv3hoA69AkZMrVw80kEdp4zKq
	usai2NwL+ERV/R6tOxwefkam0ERzKQWAFdUfr3equo4hVrJYPz1CZJy68HUHZgUy6BVpK/eIQjmCv
	LTYtTRhcVBcu00+b4WT3eUwftExQ4QdmzhgRJpxB+nvFligwRK2vEWbV9fezZ944xCLcWCt8xEPw4
	dUl27A1b/EEIQ1ZiVuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqA6j-006i5S-F5; Thu, 25 Nov 2021 08:27:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqA6T-006hzf-LD
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 08:27:40 +0000
X-UUID: b651d20e135a4f918ba02f23be32075c-20211125
X-UUID: b651d20e135a4f918ba02f23be32075c-20211125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1818087749; Thu, 25 Nov 2021 01:27:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 00:22:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 16:22:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Nov 2021 16:22:04 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <Mark-YW.Chen@mediatek.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
 <mcchou@chromium.org>, <shawnku@google.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] Bluetooth: btmtksdio: handle runtime pm only when
 sdio_func is available
Date: Thu, 25 Nov 2021 16:22:03 +0800
Message-ID: <1637828523-31925-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <74A2D0D6-6A65-4832-BAFC-BCBA68F8DE78@holtmann.org--annotate>
References: <74A2D0D6-6A65-4832-BAFC-BCBA68F8DE78@holtmann.org--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_002737_728916_EE129FEF 
X-CRM114-Status: GOOD (  14.11  )
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

From: Sean Wang <sean.wang@mediatek.com>

>>Hi Sean,
>
>> Runtime pm ops is not aware the sdio_func status that is probably
>> being disabled by btmtksdio_close. Thus, we are only able to access
>> the sdio_func for the runtime pm operations only when the sdio_func is
>> available.
>>
>> Fixes: 7f3c563c575e7 ("Bluetooth: btmtksdio: Add runtime PM support to
>> SDIO based Bluetooth")
>> Co-developed-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
>> Signed-off-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>> drivers/bluetooth/btmtksdio.c | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/bluetooth/btmtksdio.c
>> b/drivers/bluetooth/btmtksdio.c index 4f3412ad8fca..4c46c62e4623
>> 100644
>> --- a/drivers/bluetooth/btmtksdio.c
>> +++ b/drivers/bluetooth/btmtksdio.c
>> @@ -1037,6 +1037,9 @@ static int btmtksdio_runtime_suspend(struct device *dev)
>>	if (!bdev)
>>		return 0;
>>
>> +	if (!test_bit(HCI_RUNNING, &bdev->hdev->flags))
>> +		return 0;
>> +
>>	sdio_claim_host(bdev->func);
>>
>>	sdio_writel(bdev->func, C_FW_OWN_REQ_SET, MTK_REG_CHLPCR, &err); @@
>> -1064,6 +1067,9 @@ static int btmtksdio_runtime_resume(struct device *dev)
>>	if (!bdev)
>>		return 0;
>>
>> +	if (!test_bit(HCI_RUNNING, &bdev->hdev->flags))
>> +		return 0;
>> +
>>	sdio_claim_host(bdev->func);
>>
>>	sdio_writel(bdev->func, C_FW_OWN_REQ_CLR, MTK_REG_CHLPCR, &err);
>
>I dislike looking at HCI_RUNNING since that check should be removed from a driver. Do you really need it? I mean, a driver should now if it is running or not.

We don't really need it, instead we can use internal flags in the driver to know the status. I will do this in v2.

	Sean
>
>Regards
>
>Marcel
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
