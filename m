Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A78C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 22:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OED5+XLGpZE9O3sicmye54Xog+i2Z3HG5tduXpVm1qE=; b=IxeXBcoaXVgyM60yZT9aCE+pFF
	JaDJHTBNosy5Cc53UMOJTWH4gxPLGClsxO0bhf7E30Y07Q9TYT+liqt4E1B1flMAA399Pwcp0OAPV
	GJyt8cu6/Doe/DHEgXUTUGFE++xELBgnDAFeO81jQ2yNM4QPUfyLsAMRrPpqEV3BYRoihIdouGOjs
	UeQoYDbCT1xbsaM9HB1JFGSrXrPXx9/Pf/skkXWPGL5wACfiM8EgZ82t0Xx72cQ4BW2ppPiiauVxd
	9m2A2+QaiPMKEg7jB2/x5l6x2HvzhG6qxJASSxTJL9mB5TDV48DA+9USDGPEWa0Ad91zNAgRpItqB
	2JIfW4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3mj0-007dZN-F6; Tue, 21 Jun 2022 22:51:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3mix-007dYF-1k
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 22:51:56 +0000
X-UUID: 772fb19e650541e58c8d71bd75236f42-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:ef3ef978-f21d-4bf5-af4e-8a8cc1225a71,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:8
X-CID-META: VersionHash:b14ad71,CLOUDID:de4ead2d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 772fb19e650541e58c8d71bd75236f42-20220621
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1033449243; Tue, 21 Jun 2022 15:51:48 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 15:51:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 06:51:45 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 22 Jun 2022 06:51:45 +0800
From: <sean.wang@mediatek.com>
To: <pmenzel@molgen.mpg.de>
CC: <marcel@holtmann.org>, <johan.hedberg@gmail.com>,
	<sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
	<Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
	<steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
	<abhishekpandit@google.com>, <michaelfsun@google.com>, <mcchou@chromium.org>,
	<shawnku@google.com>, <linux-bluetooth@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Bluetooth: btmtksdio: Add in-band wakeup support
Date: Wed, 22 Jun 2022 06:51:44 +0800
Message-ID: <1655851904-15022-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1472eccd-429b-0a18-565c-7de2e5ed44f2@molgen.mpg.de--annotate>
References: <1472eccd-429b-0a18-565c-7de2e5ed44f2@molgen.mpg.de--annotate>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_155155_140219_51815F67 
X-CRM114-Status: GOOD (  22.09  )
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

>Dear Sean,
>
>
>Thank you for the patch.
>
>Am 10.06.22 um 02:17 schrieb sean.wang@mediatek.com:
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> 'ce64b3e94919 ("Bluetooth: mt7921s: Support wake on bluetooth")'
>> have added the waken-on-bluetooth via dedicated GPIO.
>
>Maybe:
>
>Commit ce64b3e94919 ("Bluetooth: mt7921s: Support wake on bluetooth") adds the wake on bluethooth via a dedicated GPIO.

Thanks! Look good to me. I will add it in the next version.

>
>> The patch extends the function to the waken-on-bluetooth via SDIO DAT1
>> pin (inband wakeup) when the SDIO host driver is able to support.
>
>Maybe:
>
>Extend the wake-on-bluetooth to use the SDIO DAT1 pin (in-band wakeup), when supported by the SDIO host driver.
>

Thanks! Look good to me. I will add it in the next version.

>How did you test this? In what datasheet is it documented?

We tested it on the MT8186 platform with wakening up by the keyboard or mouse when the platform is in the suspend state.

We can see the details on SDIO DAT1 pin in SDIO specification ver 3.00 section 8.2 Asynchronous Interrupt:
During the asynchronous interrupt period, the host can stop providing an SD clock to the card and the card
can generate an interrupt via SDIO DATA1 without SD clock.

or you can check the patch ("mmc: mediatek: add support for SDIO eint wakup IRQ")
in https://patchwork.kernel.org/project/linux-arm-kernel/patch/20220523074017.12649-4-axe.yang@mediatek.com/
that is the actual patch btmtksdio was tested against on MT8186 platfrom.

>
>> Co-developed-by: Yake Yang <yake.yang@mediatek.com>
>> Signed-off-by: Yake Yang <yake.yang@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>   drivers/bluetooth/btmtksdio.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/bluetooth/btmtksdio.c
>> b/drivers/bluetooth/btmtksdio.c index d6700efcfe8c..9ed3af4ba51a
>> 100644
>> --- a/drivers/bluetooth/btmtksdio.c
>> +++ b/drivers/bluetooth/btmtksdio.c
>> @@ -118,6 +118,7 @@ MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
>>   #define BTMTKSDIO_FUNC_ENABLED		3
>>   #define BTMTKSDIO_PATCH_ENABLED		4
>>   #define BTMTKSDIO_HW_RESET_ACTIVE	5
>> +#define BTMTKSDIO_INBAND_WAKEUP		6
>>
>>   struct mtkbtsdio_hdr {
>>	__le16	len;
>> @@ -1294,6 +1295,9 @@ static bool btmtksdio_sdio_wakeup(struct hci_dev *hdev)
>>		.wakeup_delay = cpu_to_le16(0x20),
>>	};
>>
>> +	if (test_bit(BTMTKSDIO_INBAND_WAKEUP, &bdev->tx_state))
>> +		return may_wakeup;
>> +
>>	if (may_wakeup && bdev->data->chipid == 0x7921) {
>>		struct sk_buff *skb;
>>
>> @@ -1384,6 +1388,10 @@ static int btmtksdio_probe(struct sdio_func *func,
>>	 */
>>	pm_runtime_put_noidle(bdev->dev);
>>
>> +	/* Mark if the mmc host can support waken by SDIO */
>
>Maybe:
>
>Mark if MMC host supports wake on bluetooth by SDIO

Thanks! Look good to me. I will add it in the next version.

>
>> +	if (device_can_wakeup(func->card->host->parent))
>> +		set_bit(BTMTKSDIO_INBAND_WAKEUP, &bdev->tx_state);
>> +
>>	err = device_init_wakeup(bdev->dev, true);
>>	if (err)
>>		bt_dev_err(hdev, "failed to initialize device wakeup");
>
>
>Kind regards,
>
>Paul
>
>

