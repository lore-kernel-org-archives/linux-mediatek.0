Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Dec 2021 00:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCrW6LMfnlNjIas5nu7qlZFGgGDdqA6PzDuxeLaRKQw=; b=jiObKrQ0TO1dzn
	yzYxVPHObJ29NNmV7Qabeb8Zkjr6iv9lANLohL25cu05INsQBsBXxOtqh+TXwYcrqD3m2zjGBhmky
	P4hr/d/XAgvLGCqlMExHeVhvLEtSPvhm1NvZeWlTVr5soabaBG4ovdpm8Q/SJQscQdOyHbVJov093
	94MCFmdTTnqIAYedSvisLhvLciaiQT+aQqESYH0dECdT7tUuTrwF+BiU6tpGZNhgaHi/6Iw2MzzZE
	FsDQBHTrxtQIU9FH/QQpr5bIHiel/wXrBkele3xBp7LK/CZtjslxmJtUvuTxc5RiLe8XHomKRNLNv
	6QlrHZYrWP4nIfWAEDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtJKj-00HM9w-FC; Sat, 04 Dec 2021 00:55:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtJKg-00HM9b-8k
 for linux-mediatek@lists.infradead.org; Sat, 04 Dec 2021 00:55:19 +0000
X-UUID: e9b3bf76977a4d23b0df05f662b366c5-20211203
X-UUID: e9b3bf76977a4d23b0df05f662b366c5-20211203
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1502395143; Fri, 03 Dec 2021 17:55:13 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Dec 2021 16:55:12 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 4 Dec 2021 08:55:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 4 Dec 2021 08:55:04 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sven@narfation.org>, <jf@simonwunderlich.de>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Sean
 Wang" <sean.wang@mediatek.com>
Subject: Re: mt76: MT7921K monitor mode not working
Date: Sat, 4 Dec 2021 08:55:04 +0800
Message-ID: <1638579304-17794-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YapTmM3EztojTS9F@lore-desk--annotate>
References: <YapTmM3EztojTS9F@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_165518_365517_CCDF9BCC 
X-CRM114-Status: GOOD (  19.77  )
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
>> >> On Thursday, 2 December 2021 23:13:31 CET Lorenzo Bianconi wrote:
>> >> > IIRC you need to disable runtime-pm and deep-sleep to proper
>> >> > enable monitor
>> >> > mode:
>> >> >
>> >> > echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/runtime-pm
>> >> > echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/deep-sleep
>> >> >
>> >> > Can you please give it whirl?
>> >>
>> >> Jan gave me the card. I've set it to a rather busy channel (2.4GHz
>> >> channel 11), created a monitor interface, attached tcpdump and then
>> >> waited what happens. I didn't get anything and then I've tried to
>> >> set runtime-pm and deep- sleep to 0. This didn't change the
>> >> behavior for me at lot. I saw two packets and then it went silent again.
>> >>
>> >> I wanted to try the same on a different card (ath11k) in the same
>> >> system. But it crashed my complete system - so I had to recreate
>> >> the test setup. This time, I've set runtime-pm + deep-sleep to 0
>> >> before creating mon0. After doing this, it seemed to work.
>> >
>> >interesting, adding Sean to the loop here.
>> >It seems the fw is mainting a different state in this case.
>>
>> fw cannot receive any frame on monitor mode in deeply doze mode
>>
>> so it seemed to me we need a patch to explicitly disable pm runtime in driver when monitor interface is enabled until it is being disabled.
>
>ack, I agree, but I guess the point here is what is the difference (from the fw pov) if you disable runtime-pm/deep-sleep before/after the vif is added. I guess it is supposed to be the same, right?

yes, it is supposed to be the same.

>
>Regards,
>Lorenzo
>
>>
>> >
>> >@Sean: any pointers?
>> >
>> >Regards,
>> >Lorenzo
>> >
>> >>
>> >> Kind regards,
>> >>	Sven
>> >
>>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
