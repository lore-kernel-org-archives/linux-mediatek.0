Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D671C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 21:23:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0607261139
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 21:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0607261139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mwU6ldN0lqlrNcYmIWsjvfFf0jcB/eKsHItR/yQSEM=; b=otfWFmEb5SXT4x
	XK0VbgmiMwF3/6S5ebkM50B3qnN0hmOoSLnodd+wXEOPJUJENPTltcv9QjWVpPqLaWhTS0S8ObCVS
	t/H5uRsb8UddLdTw21z3DgY9M2PNT4k40Be4iE5NDDQG7ej6S/2CFKCYd0Ab/IPcJwc7PpkO4o3yt
	ZnQDDWjKSlXdWiowZlGCnxLjwtQubAdQnnLhmEcMmL2RNZjbHqYdFAcqZBFadRpQKo9vfVLXrixs9
	D4Km5mE3znbBVvxxtLWU3H/6IaOxgkQSnFUxlRXZBrqCAGkgFbnLnPC7AFXkHOkhXKx5SDlDfU1/R
	xbltMSTc5KyhgrAThSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maliR-000jHD-KZ; Wed, 13 Oct 2021 21:23:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maliP-000jG0-G5
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 21:23:10 +0000
X-UUID: 6ee3d51df01d44bd969be081abdbeb06-20211013
X-UUID: 6ee3d51df01d44bd969be081abdbeb06-20211013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1588934805; Wed, 13 Oct 2021 14:23:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Oct 2021 14:23:00 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Oct 2021 05:22:59 +0800
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
Subject: Re: [PATCH v4 11/16] mt76: sdio: extend sdio module to support CONNAC2
Date: Thu, 14 Oct 2021 05:22:58 +0800
Message-ID: <1634160178-17533-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YWcuGcFPGCtaPh+2@lore-desk--annotate>
References: <YWcuGcFPGCtaPh+2@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_142309_584531_B69AE592 
X-CRM114-Status: UNSURE (   9.75  )
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

From: Sean Wang <sean.wang@mediatek.com>

>[...]
>>
>> In the current driver, we can see we only created one Rx queue
>> (dev->q_rx with qid = 0) in mt76s_alloc_queues for processing all incoming packets including MCU events and wifi packets.
>>
>> And from the point of view of the device, mt7663s use the hardware
>> queue 0 for all MCU events and wifi packets; mt7921s use the hardware
>> queue 1 for all MCU events and wifi packets.
>>
>> So if we don't remap from hardware queue 1 to dev->q_rx[0] for mt7921s
>> to handle incoming packets, we will get the kernel panic on accessing the invalid pointer on dev->q_rx[1].
>>
>>	Sean
>>
>> >Regards,
>> >Lorenzo
>> >
>>
>> <snip>
>
>ok, what about doing something like the patch below?
>If it works for you, I will post a formal patch.

go ahead. that looks fine to me.

>
>Regards,
>Lorenzo
>

<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
