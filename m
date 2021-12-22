Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AB3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnvBjRygF2/6dvHyEga1vNHwtKd6pYpjKb+0y3xR1f4=; b=1Kevz5x52HiLcY
	ODAVbd2yBNhSMWObyWARnwr+13bFOgj52t2hkQibtS+bI6FIVuY6pZSO1cHQ+3nc1bVPupvqj/PNa
	TK9Hit579ru03vIr876gxkj0BtF1EvT2ZT+uTTp22rMX0OlFXUSZtTqJox1lCZ3FKnBR/vBO4nxa2
	qDAKiVLfu4gD+VwjupDma56FBBcDjErRXX0bZhWdxeBBKJjQGQy8hHvZFLyEInLiJ/AVF6krjy79P
	xRQtiT6nV7CLo7hRYjesd1xBbHsULUUMsHOVLpLbeaI9/uDiO/X+RjsVueZ9aQIDc5/3zvt90j0L2
	B3N497XXDiwYHVAlhUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n07H2-00BEQO-PM; Wed, 22 Dec 2021 19:27:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n07Gw-00BEPZ-PV
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 19:27:37 +0000
X-UUID: a4c238afbfef4607a399218b7d63bdbf-20211222
X-UUID: a4c238afbfef4607a399218b7d63bdbf-20211222
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 801682368; Wed, 22 Dec 2021 12:27:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Dec 2021 11:27:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 23 Dec 2021 03:27:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Dec 2021 03:27:29 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: sdio: lock sdio when it is needed
Date: Thu, 23 Dec 2021 03:27:28 +0800
Message-ID: <1640201248-14901-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YcMJDdDrDVIT0Y55@lore-desk--annotate>
References: <YcMJDdDrDVIT0Y55@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_112734_869445_3658A9E9 
X-CRM114-Status: GOOD (  13.75  )
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

>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Acquire the SDIO as needed as possible because either MT7663S or
>> MT7921S is a multiple-function device that always includes Bluetooth
>> that would share with the same SDIO bus. So not to avoid breaking
>> Bluetooth pairing, audio, and HID such kind of time critical
>> application on that, we only lock sdio bus when it is necessary in WiFi driver.
>>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>  drivers/net/wireless/mediatek/mt76/mt7615/sdio.c | 3 +++
>> drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 3 +++
>>  drivers/net/wireless/mediatek/mt76/sdio_txrx.c   | 8 ++++++++
>>  3 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
>> b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
>> index 31c4a76b7f91..71162befdae8 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
>> @@ -56,7 +56,10 @@ static int mt7663s_parse_intr(struct mt76_dev *dev, struct mt76s_intr *intr)
>>	struct mt7663s_intr *irq_data = sdio->intr_data;
>>	int i, err;
>>
>> +	sdio_claim_host(sdio->func);
>>	err = sdio_readsb(sdio->func, irq_data, MCR_WHISR,
>> sizeof(*irq_data));
>> +	sdio_release_host(sdio->func);
>
>I guess you can move this in mt76s_rx_handler() and remove the duplicated code in mt7921_sdio.c
>

I got your point, but I still prefer we can release sdio lock as early as possible when WiFi driver doesn't need it
to allow BT driver has the chance to get the lock quickly.

>Regards,
>Lorenzo
>
>> +
>>	if (err)
>>		return err;

<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
