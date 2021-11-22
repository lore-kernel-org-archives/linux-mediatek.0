Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 03:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hADzcU1v4BklwyJZf6VxzM+ZEaAe7Z/Zf+pzSlLNDjs=; b=mkIpIbgeVG50kG
	k8hdfikTU0yOIKa6yhczkVoKHJJX440auxqEIC+Tw9YHfVkZZIYti0eaL1+AGqAqRdl1M5AamHIt+
	iN47AlzYClm1mIHpi7vNjHnctssOZ2DBQUT+lgfYZ5rwQlpvm9cWCrT8VBxeE5o+m6re4+myWYmYy
	27vcxNIc+OcMyAb6PsCC0OW5a+P4vvhK69Qnufhg/3FMvoTVuz/CeQEQZhMSnOL6ieU+Ytrd4HMvR
	J9TT9DhW8wOxPm8Wy3ISHkuSW/OPytvcCysOQsTBE981PaS1v0/IYCamr61dyykqL5qYjuZP14niF
	DTF5+e9SmNUaWFMSOGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp0M1-00EmAq-0r; Mon, 22 Nov 2021 03:50:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp0Lx-00EmAS-9p
 for linux-mediatek@lists.infradead.org; Mon, 22 Nov 2021 03:50:52 +0000
X-UUID: 2c73d8e444ac4602a045ecaa109f6655-20211121
X-UUID: 2c73d8e444ac4602a045ecaa109f6655-20211121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2069399346; Sun, 21 Nov 2021 20:50:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Nov 2021 19:46:50 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 22 Nov 2021 11:46:49 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 22 Nov 2021 11:46:48 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
 <frankgor@google.com>, <jemele@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/2] mt76: mt7921s: fix the device cannot sleep deeply in
 suspend
Date: Mon, 22 Nov 2021 11:46:48 +0800
Message-ID: <1637552808-24472-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YZq9cBbzwtvzEKyN@lore-desk--annotate>
References: <YZq9cBbzwtvzEKyN@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_195049_376441_58C95FCE 
X-CRM114-Status: GOOD (  13.61  )
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


<snip>

>> >>
>> >> -		if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
>> >> -			if (!mt76s_txqs_empty(dev))
>> >> -				continue;
>> >> -			else
>> >> -				wake_up(&sdio->wait);
>> >> -		}
>> >>	} while (nframes > 0);
>> >>
>> >> +	if (test_bit(MT76_MCU_RESET, &dev->phy.state) &&
>> >> +	    mt76s_txqs_empty(dev))
>> >> +		wake_up(&sdio->wait);
>> >> +
>>
>> If doing so, mt76s_txqs_empty may not always be true because enqueuing
>> packets to q_tx or MCU command to q_mcu simultanenously from the other
>> contexts in different cpu is possible.
>>
>> It seemed to me we should check it for each iteration to guarantee
>> that we can wake up the one that is waiting for the all the queues are empty at some time.
>
>IIUC what we are interested here is there are no queued frames into the hw queues during suspend or reset, right?

That is not completely true. Take the suspend procedure on mt7921s as an example.

That should be "There are no queued frames into the hw queues right after mt76_connac_mcu_set_hif_suspend."

The MCU data and WiFi are all handled in mt76s_txrx_worker so we should synchronize all of
the Tx queues are all empty and then handle mt76_connac_mcu_set_hif_suspend to guarantee
mt76_connac_mcu_set_hif_suspend is the last one to access the SDIO bus and there is no frame that accesses SDIO bus afterhand.

>
>>
>> >>	/* enable interrupt */
>> >>	sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
>> >>	sdio_release_host(sdio->func);
>> >>
>> >> Regards,
>> >> Lorenzo
>> >>
>> >> > --
>> >> > 2.25.1
>> >> >
>> >
>> >
>> >
>>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
