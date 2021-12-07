Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E6CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2LyZNSmf7esE9R6TmAAREZAc0GPpu6KZbGtMNwtEo0=; b=W8+hH1ncbAR6Al
	N7R0zSE9W5yY47K1OiJXWSJ85DmfIt1exCGJpu7LjSe3lY7ZKTCXXvI/VSzKIlM6/N0MLcFEgkpUJ
	zKwPJztKR8QvHqFEdjPXdHGHkXKagLLYqUwMUpsv0D2nEn+OdvoHxJf+2iRbLSMRKU3zvTtHWg9Qs
	F7hWDghdDjeF7fEszckgyrNewg2GV+QLYvS5IQTHNk8nzW5rurc+rY1XT4R3G44GXUf/e8NkJ76y7
	qeEzatulR+libNM1Sta+1SEiW+ylbT0DiLxNBv+rTiWRo4uwLlGOkFECfoQF6OMuEz/jeJyjAKPW9
	SweZvkQEpBFkYr3+JcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mueAP-009XPO-2L; Tue, 07 Dec 2021 17:22:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mueAM-009XOt-7e
 for linux-mediatek@lists.infradead.org; Tue, 07 Dec 2021 17:22:11 +0000
X-UUID: e065c67523114aca85f4ea48f86d13dd-20211207
X-UUID: e065c67523114aca85f4ea48f86d13dd-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1780021980; Tue, 07 Dec 2021 10:22:06 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 09:22:05 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 01:22:03 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Dec 2021 01:22:03 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: fix possible resume failure
Date: Wed, 8 Dec 2021 01:21:57 +0800
Message-ID: <1638897717-14465-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <Ya8ysehFjoEGGEf+@lore-desk--annotate>
References: <Ya8ysehFjoEGGEf+@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_092210_321346_55496ED3 
X-CRM114-Status: GOOD (  16.06  )
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
>> Fix the possible resume failure due to mt76_connac_mcu_set_hif_suspend
>> timeout.
>>
>> That is because clearing the flag pm->suspended too early opened up a
>> race window, where mt7921_poll_tx/rx scheduled a ps_work to put the
>> device in doze mode, that is unexpected for the device is being
>> resumed from the suspend state and would make the remaining MCU
>> comamnds in resume handler failed to execute.
>
>do we have a similar issue in mt7921s_resume()?

We don't have the same issue found in mt7921s_resume because the driver
guarantees all MCU commands (even in mt7921s_resume) always work in the active
state.

But we can have the same patch for mt7921s just to make code consistent with
mt7921e.

>
>>
>> Fixes: ffa1bf97425b ("mt76: mt7921: introduce PM support")
>> Co-developed-by: YN Chen <YN.Chen@mediatek.com>
>> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
>> b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
>> index 5635de3c80b1..21a48f02ab60 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
>> @@ -315,7 +315,6 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
>>	struct mt76_connac_pm *pm = &dev->pm;
>>	int i, err;
>>
>> -	pm->suspended = false;
>>	err = pci_set_power_state(pdev, PCI_D0);
>>	if (err)
>>		return err;
>> @@ -353,7 +352,11 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
>>	if (!pm->ds_enable)
>>		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
>>
>> -	return mt76_connac_mcu_set_hif_suspend(mdev, false);
>> +	err = mt76_connac_mcu_set_hif_suspend(mdev, false);
>> +
>> +	pm->suspended = false;
>> +
>> +	return err;
>>  }
>>  #endif /* CONFIG_PM */
>>
>> --
>> 2.25.1
>>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
