Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E7AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AidbiN7/TOtN1To8h8oi+AYYmfuqAKEP1YhOl/IUjZI=; b=MfCI/xkQ7nWoTN
	FnnJ9HmzbTTKJSOLnL33YHz5Q5Eq/vFL/8A6oN4TbD7/KaZg+tkE01Grh7lWR5/sG6aBDtJKJmg9+
	Cveidpn4ihwv0lx7PsiXYtqIRKRzw8OYYVP8bEHxcJOW3yQiMz2kYxJyfSOenU96TGNEBz02u6Q/6
	h0KX7LpB3t8mWMy67gxm9TyxnwnjD56yW+jNDlRMZ7KQHVWsP1Izfiz9+vJTUy3pnPqwB4R2SAtlD
	KKCaWsOOfeLV00zwVc7NCYxzwdcFYXcPT8JyRWoI/v7toBp4HDAEbBoOCJKrgkEZAdcb0Z2l15BzK
	D3QcKLP1oebt8F8dU+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpCqJ-00HEDO-IT; Mon, 22 Nov 2021 17:10:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpCqG-00HED3-8J
 for linux-mediatek@lists.infradead.org; Mon, 22 Nov 2021 17:10:57 +0000
X-UUID: ca02cba7d53b40989698dbaeb9e2b750-20211122
X-UUID: ca02cba7d53b40989698dbaeb9e2b750-20211122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1500841079; Mon, 22 Nov 2021 10:10:52 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 09:10:50 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Nov 2021 01:10:36 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Nov 2021 01:10:36 +0800
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
Subject: Re: [PATCH 2/2] mt76: mt7921s: fix the device cannot sleep deeply in
 suspend
Date: Tue, 23 Nov 2021 01:10:35 +0800
Message-ID: <1637601035-16521-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YWcuGcFPGCtaPh+2@lore-desk--annotate>
References: <YWcuGcFPGCtaPh+2@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_091056_325268_39D48C82 
X-CRM114-Status: GOOD (  17.95  )
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
>>
>> <snip>
>>
>> >> >>
>> >> >> -		if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
>> >> >> -			if (!mt76s_txqs_empty(dev))
>> >> >> -				continue;
>> >> >> -			else
>> >> >> -				wake_up(&sdio->wait);
>> >> >> -		}
>> >> >>	} while (nframes > 0);
>> >> >>
>> >> >> +	if (test_bit(MT76_MCU_RESET, &dev->phy.state) &&
>> >> >> +	    mt76s_txqs_empty(dev))
>> >> >> +		wake_up(&sdio->wait);
>> >> >> +
>> >>
>> >> If doing so, mt76s_txqs_empty may not always be true because
>> >> enqueuing packets to q_tx or MCU command to q_mcu simultanenously
>> >> from the other contexts in different cpu is possible.
>> >>
>> >> It seemed to me we should check it for each iteration to guarantee
>> >> that we can wake up the one that is waiting for the all the queues are empty at some time.
>> >
>> >IIUC what we are interested here is there are no queued frames into the hw queues during suspend or reset, right?
>>
>> That is not completely true. Take the suspend procedure on mt7921s as an example.
>>
>> That should be "There are no queued frames into the hw queues right after mt76_connac_mcu_set_hif_suspend."
>>
>> The MCU data and WiFi are all handled in mt76s_txrx_worker so we
>> should synchronize all of the Tx queues are all empty and then handle
>> mt76_connac_mcu_set_hif_suspend to guarantee mt76_connac_mcu_set_hif_suspend is the last one to access the SDIO bus and there is no frame that accesses SDIO bus afterhand.
>
>ack, correct, "there are no queued frames into the hw queues right after mt76_connac_mcu_set_hif_suspend."
>What I mean is we are not really checking there are no frames in the hw queue here, but mt76 sdio has processed all the frames, got my point? maybe it is what we are looking for..

It seemed to me there is no a way to check if no frames in the hw queue for mt7921s

I think we can discuss the topic "it is ok move the check out of the loop" with another patch in the future

because it seemed not related to the patch.

>
>Regards,
>Lorenzo
>
>>
>> >
>> >>
>> >> >>	/* enable interrupt */
>> >> >>	sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
>> >> >>	sdio_release_host(sdio->func);
>> >> >>
>> >> >> Regards,
>> >> >> Lorenzo
>> >> >>
>> >> >> > --
>> >> >> > 2.25.1
>> >> >> >
>> >> >
>> >> >
>> >> >
>> >>
>> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
