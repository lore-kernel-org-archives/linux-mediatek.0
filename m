Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883FBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YB+dbpMCGr01pownYV7N6rAmXmkkPN+iJHzy5qZBaWo=; b=oLbMbu2BTfnErhItn4riMsHWVZ
	LvzNDv/iyshbLZwg/fcJm7y7hLcs9nqqOU3eep7Oh6OW1aN2ukNWy1my0Ks0z+Zw8w1Ka0Jy9t1Ad
	p+4PFFbiF9L3PIPVikqFMt4qsRv/NyUKLaHBZMC3INhpzwA2zds1M4SWSHADBL+lVSlN0u3iAYOxX
	f5CsfJkDhU7L/0dInp8G5/I+hqEG7OeTjC3OaiirgBkYjHeGZfEikVvKURtstd6ykdcZFRijWRjwL
	D95V0mct2XtYCmPjyo8DykF0Y8DBJtC9Z41CbztWK7EZFkzDS0Id5aBqR4fqKpDlpChbbbpTYXidK
	TeC5gmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Kaj-009Rcu-Mq; Fri, 17 Jun 2022 22:37:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Kae-009Rbz-Uz
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 22:37:23 +0000
X-UUID: 95345ece414b475991d61d05f4e1f84f-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:2670b092-fff0-47d4-a76d-c67cb40481c1,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:8
X-CID-META: VersionHash:b14ad71,CLOUDID:94e5b0f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 95345ece414b475991d61d05f4e1f84f-20220617
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1836512060; Fri, 17 Jun 2022 15:37:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jun 2022 15:37:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 18 Jun 2022 06:37:10 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 18 Jun 2022 06:37:10 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>
CC: <lorenzo.bianconi@redhat.com>, <sean.wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
	<Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
	<robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
	<Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
	<steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
	<jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/2] mt76: mt7921u: enable HW beacon filter
Date: Sat, 18 Jun 2022 06:37:09 +0800
Message-ID: <1655505429-4173-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <092a2631-4e91-203e-9199-96fd3c689afa@nbd.name--annotate>
References: <092a2631-4e91-203e-9199-96fd3c689afa@nbd.name--annotate>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_153721_039514_C64FE0B5 
X-CRM114-Status: GOOD (  12.38  )
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

>>On 16.06.22 03:10, sean.wang@mediatek.com wrote:
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> HW beacon filter and HW connection monitor can be supported on MT7921U
>> as well so we enable them to be consistent with MT7921[E,S].
>>
>> Tested-by: Deren Wu <deren.wu@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>   drivers/net/wireless/mediatek/mt76/mt7921/main.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> index acf6567368b7..d803a7dd5f83 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> @@ -677,8 +677,7 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
>>	if (changed & BSS_CHANGED_ASSOC) {
>>		mt7921_mcu_sta_update(dev, NULL, vif, true,
>>				      MT76_STA_INFO_STATE_ASSOC);
>> -		if (dev->pm.enable)
>> -			mt7921_mcu_set_beacon_filter(dev, vif, info->assoc);
>> +		mt7921_mcu_set_beacon_filter(dev, vif, info->assoc);
>To me it looks like patch description and code change don't really match. Could you please explain why you change it so that the beacon filter is enabled even if PM isn't?

dev->pm.enable is supposed to control runtime pm only and not related to hw beacon filter.

MT7921U still cannot support runtime pm as eafe031fd664 ("mt76: mt7921: disable runtime pm for usb") said.
but it doesn't only disable runtime pm but also would block the hw beacon filter to be enabled on MT7921U.
So here I correct dev->pm.enable usage to allow hw beacon filter enabled for MT7921U.

>
>- Felix
>



