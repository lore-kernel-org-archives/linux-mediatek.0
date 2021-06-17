Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E984C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 17:19:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB1A061408
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 17:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB1A061408
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alIbSKbjD2PrKxbfcCVBxEiR6N6HsgRiu7WQjXSQ6lE=; b=peXeeAILJL5HEx
	cy/fkzbpHL2+dLS7UYALHLW725+FLoXr+kSXPVTZfgTD8Tsld4MegQNzReZHG2QXlpHVDbR1qg/gX
	TKEYGmFQwEyyC6jqPv/o5bEwNnxc8YonHlBlA/3nwfQyGDo/H5A8yVYG9QEeiCb3k9hdry022eCbN
	1JHYLo4OzJSKmKUbwaCwhadV70KeK8cRMbHG+liJ6MLeOeLqE1Ztci6N3roOleKO3qor9Ntc1DeXO
	/H7/xWw7q1w2ifTlbm/tdBjKRQEHH5ATXRbE5NUWD3DIDhFVYSxPVtXvNW9Z6btmwEYxGtYJsoLSP
	Ol3jLmWHuk9QcEAlTXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltvgA-00BCXl-H6; Thu, 17 Jun 2021 17:19:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltvg5-00BCWf-PM
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 17:19:44 +0000
X-UUID: 08154e43f4834b74816148a02bc6d03a-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YNzP49TGch+3+6RjxbqV5ZnNepyQEkQaM4uRuJqZ0Uw=; 
 b=iwGHuhXe9+1QMbV1DaIEdHcflgqHDh/49F0UEVqO6PSD7hRX1qDj3D8zoF/agvGNbw+2x1gIYha0w1WA/OiCe5U9MmlTgrD2tt1incmZVKO07/9jJLa/l5vUk5F17rWylGxZAel+q3dg3u69UsrFJsm79/xwqhnq8Wn9pAPxb3w=;
X-UUID: 08154e43f4834b74816148a02bc6d03a-20210617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1887174403; Thu, 17 Jun 2021 10:19:39 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 10:19:38 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 01:19:36 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Jun 2021 01:19:36 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <jemele@google.com>, <yenlinlai@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: fix the coredump is being truncated
Date: Fri, 18 Jun 2021 01:19:35 +0800
Message-ID: <1623950375-23007-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YMtTlS3Nh4uGnJvq@lore-desk--annotate>
References: <YMtTlS3Nh4uGnJvq@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_101941_877711_84BBB3CC 
X-CRM114-Status: GOOD (  17.39  )
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
>> Fix the maximum size of the coredump generated with current mt7921
>> firmware. Otherwise, a truncated coredump would be reported to
>> userland via dev_coredumpv.
>>
>> Also, there is an additional error handling enhanced in the patch to
>> avoid the possible invalid buffer access when the system failed to
>> create the buffer to hold the coredump.
>>
>> Fixes: 0da3c795d07b ("mt76: mt7921: add coredump support")
>> Co-developed-by: YN Chen <YN.Chen@mediatek.com>
>> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>  drivers/net/wireless/mediatek/mt76/mt76_connac.h | 2 +-
>> drivers/net/wireless/mediatek/mt76/mt7921/mac.c  | 9 ++++++---
>>  2 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
>> b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
>> index 9b3f8d22f17e..d93ab1ece8ae 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
>> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
>> @@ -13,7 +13,7 @@
>>  #define MT76_CONNAC_MAX_SCAN_MATCH		16
>>
>>  #define MT76_CONNAC_COREDUMP_TIMEOUT		(HZ / 20)
>> -#define MT76_CONNAC_COREDUMP_SZ			(128 * 1024)
>> +#define MT76_CONNAC_COREDUMP_SZ			(1300 * 1024)
>>
>>  enum {
>>	CMD_CBW_20MHZ = IEEE80211_STA_RX_BW_20, diff --git
>> a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> index fb4de73df701..905dddbfbb0b 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> @@ -1557,7 +1557,7 @@ void mt7921_coredump_work(struct work_struct *work)
>>			break;
>>
>>		skb_pull(skb, sizeof(struct mt7921_mcu_rxd));
>> -		if (data + skb->len - dump > MT76_CONNAC_COREDUMP_SZ) {
>> +		if (!dump || data + skb->len - dump > MT76_CONNAC_COREDUMP_SZ) {
>
>why not just return if dump allocation fails? Doing so we will reset the device even if dump is NULL, do you think it is a real use-case?

We cannot just return if dump allocation fails because we still must properly free skb in coredump.msg_list to avoid
the memory leak.

Reset the device is eventually required even dump is NULL because mt7921 cannot work anymore in case coredump happens
so that needs the following reset to recover it back in time.

>Regards,
>Lorenzo
>
>>			dev_kfree_skb(skb);
>>			continue;
>>		}
>> @@ -1567,7 +1567,10 @@ void mt7921_coredump_work(struct work_struct
>> *work)
>>
>>		dev_kfree_skb(skb);
>>	}
>> -	dev_coredumpv(dev->mt76.dev, dump, MT76_CONNAC_COREDUMP_SZ,
>> -		      GFP_KERNEL);
>> +
>> +	if (dump)
>> +		dev_coredumpv(dev->mt76.dev, dump, MT76_CONNAC_COREDUMP_SZ,
>> +			      GFP_KERNEL);
>> +
>>	mt7921_reset(&dev->mt76);
>>  }
>> --
>> 2.25.1
>>
>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
