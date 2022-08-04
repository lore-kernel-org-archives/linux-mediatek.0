Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1C1C19F2D
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvoHeZ3GJfhWE1WIZEcM/iMOpmxjHnXPUotPQ7BW2AY=; b=Rk27jiXhkM4lEZGcsk0CozOTLQ
	4jNmBsD/+z1cCFWNqk52tJCdzLXjFnIz5sk5jHvyrg0LpqNS5CpjlU+NY1C85vtvDOcHFeEgc6gbB
	O/PeDEprkStTzStnH53O3zrg8r2X2YylhhRAuLkyuYVEsyZcooEDa09/zfANdiQGTlUcBKeBiHHkH
	SYZWP23mQGuiM/WGDIUy7dIibC9ijsfnETbtWbYugXkchj3O7ulkwg9vubvLRG6GBhx4LWgBBFQxk
	XKFAx+5gcynhNQ049Ua2fFKs/vJCVukNL8dsmPwu9Y7gHQVs+FTMFW/ThnNIvg5FMI3miwCSqPwYQ
	31QDGsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJabr-006AVI-CH; Thu, 04 Aug 2022 13:09:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJabn-006AT7-PE
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 13:09:54 +0000
X-UUID: 8821042fc5eb4d4cbde2bd233f43e23e-20220804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ae302f41-e3c5-476b-8d12-5c11e136c84a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:8
X-CID-META: VersionHash:0f94e32,CLOUDID:51284625-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 8821042fc5eb4d4cbde2bd233f43e23e-20220804
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 455805607; Thu, 04 Aug 2022 06:09:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 21:09:43 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Aug 2022 21:09:42 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: apply the previous MCU timeout
Date: Thu, 4 Aug 2022 21:09:41 +0800
Message-ID: <1659618581-20400-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YuuAX3aa/bmL5ZdM@localhost.localdomain--annotate>
References: <YuuAX3aa/bmL5ZdM@localhost.localdomain--annotate>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_060951_850263_1F196538 
X-CRM114-Status: GOOD (  12.89  )
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

From: Sean Wang <sean.wang@mediatek.com>

>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Apply back the previous MCU timeout that can trigger the chip reset to
>> recover the fatal error in time.
>>
>> Fixes: 8fcd1fb7cbd5 ("mt76: move mt76_connac2_mcu_fill_message in
>> mt76_connac module")
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>>  b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> index 0afcadce87fc..da8223c515eb 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> @@ -3050,7 +3050,10 @@ int mt76_connac2_mcu_fill_message(struct
>> mt76_dev  *dev, struct sk_buff *skb,
>>	u8 seq;
>>
>>	/* TODO: make dynamic based on msg type */
>> -	dev->mcu.timeout = 20 * HZ;
>> +	if (is_mt7921(dev))
>> +		dev->mcu.timeout = 3 * HZ;
>> +	else
>> +		dev->mcu.timeout = 20 * HZ;
>
>Hi Sean,
>
>I did not get the fix here since we are setting dev->mcu.timeout in mt76_connac2_mcu_fill_message caller (e.g. mt7921s_mcu_send_message).
>Am I missing something?

oops! You're right. The patch should be dropped out. Thanks for the head-up.

	Sean
>
>Regards,
>Lorenzo
>
>>
>>	seq = ++dev->mcu.msg_seq & 0xf;
>>	if (!seq)
>> --
>> 2.25.1
>>


