Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA58C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 17:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aJLHBzuAPglaYKhgTeHYbR1bwDv4XseRAZKQSfR8+M=; b=JP2bFpy9IHNTyP
	Ws7jz86oje3yffGN+SkcBUC3G0PRM8s9j02O2eEgqSYUOdjJE6HwSYjzAgkILZDj9PwoJd6zM4LZm
	E++srDwUDnzxfgU7UrlmlWomdqbxBGJxGuXvtVDMKqVZzEbeBIc55vCoaUajdomYfsH8KCAby1nTk
	pzcXGLTpB2IMRC9HRzkFuT8eFx4FKJj2yfSn+hWDCCS8IhkKDl8dDCQbPxTo7uLkPEUlFVDXUO07k
	cmjRTBk3OkSI1vSSt5VyDj5mwIOmrYB/Kkbh2vpk+bsq6oTXjlOUkzfXshiYhPRf8HY0XXdE+C+Z0
	NfbIThsesBBX5yrou2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtC4c-00GdtQ-68; Fri, 03 Dec 2021 17:10:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtC4Y-00Gdsv-E5
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 17:10:13 +0000
X-UUID: 3ba62bcd6c814326b10cb811341a9e6f-20211203
X-UUID: 3ba62bcd6c814326b10cb811341a9e6f-20211203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 824738798; Fri, 03 Dec 2021 10:10:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Dec 2021 09:10:04 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 4 Dec 2021 01:10:03 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 4 Dec 2021 01:10:03 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sven@narfation.org>, <jf@simonwunderlich.de>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Sean
 Wang" <sean.wang@mediatek.com>
Subject: Re: mt76: MT7921K monitor mode not working
Date: Sat, 4 Dec 2021 01:10:02 +0800
Message-ID: <1638551402-3864-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YapBMGjLcjuBo/vw@lore-desk--annotate>
References: <YapBMGjLcjuBo/vw@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_091010_506676_9674938D 
X-CRM114-Status: GOOD (  15.69  )
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

>> On Thursday, 2 December 2021 23:13:31 CET Lorenzo Bianconi wrote:
>> > IIRC you need to disable runtime-pm and deep-sleep to proper enable
>> > monitor
>> > mode:
>> >
>> > echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/runtime-pm
>> > echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/deep-sleep
>> >
>> > Can you please give it whirl?
>>
>> Jan gave me the card. I've set it to a rather busy channel (2.4GHz
>> channel 11), created a monitor interface, attached tcpdump and then
>> waited what happens. I didn't get anything and then I've tried to set
>> runtime-pm and deep- sleep to 0. This didn't change the behavior for
>> me at lot. I saw two packets and then it went silent again.
>>
>> I wanted to try the same on a different card (ath11k) in the same
>> system. But it crashed my complete system - so I had to recreate the
>> test setup. This time, I've set runtime-pm + deep-sleep to 0 before
>> creating mon0. After doing this, it seemed to work.
>
>interesting, adding Sean to the loop here.
>It seems the fw is mainting a different state in this case.

fw cannot receive any frame on monitor mode in deeply doze mode

so it seemed to me we need a patch to explicitly disable pm runtime in driver when monitor interface is enabled until it is being disabled.

>
>@Sean: any pointers?
>
>Regards,
>Lorenzo
>
>>
>> Kind regards,
>>	Sven
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
