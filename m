Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AE0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 00:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXtXoYr4NAC0qd9ROn0Ch3qKBxzrbvD7jDTfXupvpdw=; b=OBuu1wuBGa9G7M
	FwH4n4JiWkvR2smXxytd8UV4v09OFaBtuZXtC2ru4mrc8Lo8jiNaGQ9W138ewlEMB+j01dznrHDfu
	sMzCaQDLvPvhAP7b+rlnAzcCLjrgPk9ze3LM1RnY01LBnOKurEbJ0DcW8oaTug3xKOEMXx46vl6zF
	ywyQDpwXBLCfhym9KOztaVu2izdFOuK89zq3uIZrWse33/0CEjhonXQIb1JPeJ6sYYD8phjQyNx+e
	9NBGCX1uY/Zv9PAb/IKlFkMfkMHAbDxFDT8oA7sVf6+YIxp7mzYSCjKdbfW9w/2ahO5MwVN8dmouB
	riITvsctR+LWJkvF/YEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7RpQ-000XkH-Bz; Wed, 12 Jan 2022 00:49:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7RpL-000XjL-S9
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 00:49:27 +0000
X-UUID: d6414f3c019e46729d30e2cc2498ac70-20220111
X-UUID: d6414f3c019e46729d30e2cc2498ac70-20220111
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1186434433; Tue, 11 Jan 2022 17:49:20 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 16:49:18 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 08:49:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 12 Jan 2022 08:49:16 +0800
From: <sean.wang@mediatek.com>
To: <khalid@gonehiking.org>
CC: <greearb@candelatech.com>, <nbd@nbd.name>, <lorenzo.bianconi83@gmail.com>, 
 <Ryder.Lee@mediatek.com>, <Shayne.Chen@mediatek.com>,
 <Sean.Wang@mediatek.com>, <kvalo@kernel.org>, <davem@davemloft.net>,
 <kuba@kernel.org>, <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Sean Wang <sean.wang@mediatek.com>
Subject: Re: [Bug] mt7921e driver in 5.16 causes kernel panic
Date: Wed, 12 Jan 2022 08:49:16 +0800
Message-ID: <1641948556-23414-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <c3a66426-e6a0-4fd2-dc09-85181c96b755@gonehiking.org--annotate>
References: <c3a66426-e6a0-4fd2-dc09-85181c96b755@gonehiking.org--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_164923_947639_3083E075 
X-CRM114-Status: GOOD (  23.28  )
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

>On 1/11/22 16:31, Ben Greear wrote:
>> On 1/11/22 3:17 PM, Khalid Aziz wrote:
>>> I am seeing an intermittent bug in mt7921e driver. When the driver
>>> module is loaded and is being initialized, almost every other time it
>>> seems to write to some wild memory location. This results in driver
>>> failing to initialize with message "Timeout for driver own" and at
>>> the same time I start to see "Bad page state" messages for random
>>> processes. Here is the relevant part of dmesg:
>>
>> Please see if this helps?
>>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> If the nic fails to start, it is possible that the reset_work has
>> already been scheduled.  Ensure the work item is canceled so we do not
>> have use-after-free crash in case cleanup is called before the work
>> item is executed.
>>
>> This fixes crash on my x86_64 apu2 when mt7921k radio fails to work.
>> Radio still fails, but OS does not crash.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>   drivers/net/wireless/mediatek/mt76/mt7921/main.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> index 6073bedaa1c08..9b33002dcba4a 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> @@ -272,6 +272,7 @@ static void mt7921_stop(struct ieee80211_hw *hw)
>>
>>       cancel_delayed_work_sync(&dev->pm.ps_work);
>>       cancel_work_sync(&dev->pm.wake_work);
>> +    cancel_work_sync(&dev->reset_work);
>>       mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
>>
>>       mt7921_mutex_acquire(dev);
>
>Hi Ben,
>
>Unfortunately that did not help. I still saw the same messages and a kernel panic. I do not see this bug if I power down the laptop before booting it up, so mt7921_stop() would make sense as the reasonable place to fix it.

Hi, Khalid

Could you try the patch below? It should be helpful to your issue

https://patchwork.kernel.org/project/linux-wireless/patch/70e27cbc652cbdb78277b9c691a3a5ba02653afb.1641540175.git.objelf@gmail.com/

>
>Thanks,
>Khalid
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
