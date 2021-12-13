Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2838C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsTuE2pGmpYdW5/jMLYwRIY/seyK1NNojnaso8WxWbA=; b=vxKHqSekWLpdJI
	v+enyyc2hr8zepLbAXj3iVaj2BPb5j5MT2YRhjOvqDDdVqspmbe5yCg1q5ks5Gp9vsC0a/sP7L2Z7
	xJY9BU87raYzpPaDYiSLmdNE/5SKRl4/svtQtyDGfCQ/WcR0G0icuLcDKBTb9bUvgVXj+syI9ms+T
	wDB9BiKq7vKACtR4BQOrKl55GS5WEtcdzGA+7VE4+7E5ExwBZAsUwR/CeJrxrfuQOe8vAK/LX57tH
	Ux7pCOy/qFfI1ioiGtSYrBxEz3a6HZQ5Dq+4brlo+ALAJorw99P7nlBUPVZzSl3BhoDQBPtBzECWK
	883S8LXMd2rV5GtH8NLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwqWj-00B2wx-HC; Mon, 13 Dec 2021 18:58:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwqWe-00B2ti-8q
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 18:58:19 +0000
X-UUID: 04e9a9eda2644cf0b0c3b782923e5d68-20211213
X-UUID: 04e9a9eda2644cf0b0c3b782923e5d68-20211213
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1520249331; Mon, 13 Dec 2021 11:58:10 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Dec 2021 10:58:09 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 14 Dec 2021 02:58:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 14 Dec 2021 02:58:07 +0800
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
Subject: Re: [PATCH 1/2] mt76: mt7921s: make pm->suspended usage consistent
Date: Tue, 14 Dec 2021 02:58:05 +0800
Message-ID: <1639421885-6126-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YbcYJ47OKfh0A5Vt@lore-desk--annotate>
References: <YbcYJ47OKfh0A5Vt@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_105816_365690_34F4FAFA 
X-CRM114-Status: GOOD (  16.22  )
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
>> >> From: Sean Wang <sean.wang@mediatek.com>
>> >>
>> >> Update pm->suspended usage to be consistent with mt7921e driver.
>> >>
>> >> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> >> ---
>> >>  drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 7 +++++--
>> >>  1 file changed, 5 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
>> >> b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
>> >> index 84be229a899d..44ee9369f6bf 100644
>> >> --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
>> >> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
>> >> @@ -278,7 +278,6 @@ static int mt7921s_resume(struct device *__dev)
>> >>	struct mt76_dev *mdev = &dev->mt76;
>> >>	int err;
>> >>
>> >> -	pm->suspended = false;
>> >>	clear_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
>> >>
>> >>	err = mt7921_mcu_drv_pmctrl(dev);
>> >> @@ -294,7 +293,11 @@ static int mt7921s_resume(struct device *__dev)
>> >>	if (!pm->ds_enable)
>> >>		mt76_connac_mcu_set_deep_sleep(mdev, false);
>> >>
>> >> -	return mt76_connac_mcu_set_hif_suspend(mdev, false);
>> >> +	err = mt76_connac_mcu_set_hif_suspend(mdev, false);
>> >
>> >should we check return value here? Something like:
>> >
>> >	if (err)
>> >		return err;
>> >
>> >	pm->suspended = false;
>> >	return 0;
>> >
>> >Or, is the chip up even if mt76_connac_mcu_set_hif_suspend() fails?
>>
>> yes, chip is eventually up again by recovered with the following wifi
>> reset
>>
>> with current logic, if do so (not mark pm->suspended back as false to
>> show suspend/resume is over),
>>
>> the pm runtime would not be enabled again after the wifi reset
>
>maybe we should just set pm->suspended = false; in mt7921_mac_reset_work() as we do for hw_full_reset, wdyt?

That looks fine to me. I will submit another patch for that prior to the patch.

>
>Regards,
>Lorenzo
>
>>
>> >> +
>> >> +	pm->suspended = false;
>> >> +
>> >> +	return err;
>> >>  }
>> >>
>> >>  static const struct dev_pm_ops mt7921s_pm_ops = {
>> >> --
>> >> 2.25.1
>> >>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
