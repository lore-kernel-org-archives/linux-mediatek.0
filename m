Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B87C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:54:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE90611BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EE90611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oGlVI2xNubpx8EPm7sogBOGBDroUcuo48DdrhESG+Lo=; b=KcTw6RmuVF39czKxPG5m/BCtD
	GRhlb+OFdo9+renMmdRR9WW/zGQFcqrdnqZVW5gJwntyX8vLK4ttJ0DQEfFDv+c0U8CMMr0alNhuK
	q7XKuQp+AgosoUxrrD3alOp/hpX6KQSXf2ClzwIdE1tThEeDNW1imxYxHDU21wvR/rgk6XvXVkb8c
	BcGOuxUlthYG36loT3aVubIHY1LZQ7SdPbxh8RNHek6qySgB8KIVzFJ0c3+F84m2dd94+RnhWqJiJ
	yahjae/DSB37Sngqog2GbPtnApKUwkE0r+wIMdGIVp7sZzg0Ps+0REMX4HTJ7L4X2mA5ClSV+yYGa
	+B55ZAU3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljZlY-005oBA-8z; Thu, 20 May 2021 03:54:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZlV-005oAU-DZ
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 03:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=nrWgIXP1FQrsW/y0A3SqlWDCOp8q42eZwVMllIExaCY=; b=yyeacRQXB5UQv66395Bo2mwWOs
 oTnQCVbUM+J0xWPB8kfQn3jiWF9vqvsB2DwOGWEzqjxK+Knpq0gFa1dUX8CN4KMQisAZLC0CKC5f9
 uccc0jngEEaQ/ob0A/GB95GWUG27C1s86tvLqEUL1OFEAeTyZfp3JbkYszc1mx2vQ3wbKofgPoinN
 78hVtYFbG9OSxT4WuJALMhv54FRSbuOp/5kwmeous//UNvHJKh6e6wq0mGFAFocW0VsuHIlehM1oK
 yAGzfNuEGXItlnjGG3EDBx6wtIayxJtxfNlSpcgwg76Ykt0/aAbMMWVvVpfofEWO0IgrEJmM70m92
 udIjfUCQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZlR-00Fuul-HD
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 03:54:26 +0000
X-UUID: 0229b986b6ab44fca971d4304cfc7657-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nrWgIXP1FQrsW/y0A3SqlWDCOp8q42eZwVMllIExaCY=; 
 b=nGhlBDOlIYAv4Y0M0DZeEzE6nWt7U7nvRqXUxEnNZ/RY3IF7+P4dwW/KZVWfcOAk4CMYqDGrw3q4tzSDvDi8wmuJxEOuEmrvDU3VH/ciAc+MiyxVXqu0vEjYyxusZVJTizkE73teMNMF/Mz8oeUPOwIGeU+5hxsu//tBiYBi2lo=;
X-UUID: 0229b986b6ab44fca971d4304cfc7657-20210519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1288062383; Wed, 19 May 2021 20:54:16 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 20:46:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 11:46:52 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 20 May 2021 11:46:52 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 4/7] mt76: mt7921: avoid unnecessary consecutive WiFi resets
Date: Thu, 20 May 2021 11:46:38 +0800
Message-ID: <1621482401-29025-4-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1621482401-29025-1-git-send-email-sean.wang@mediatek.com>
References: <1621482401-29025-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_205425_603338_7CE8A6E0 
X-CRM114-Status: GOOD (  12.18  )
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

Avoid unnecessary consecutive WiFi resets by dropping reset
request when reset work is working.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c    | 5 ++++-
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index ebd365ceb70d..fdc69f306f7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1312,6 +1312,7 @@ void mt7921_mac_reset_work(struct work_struct *work)
 	int i;
 
 	dev_err(dev->mt76.dev, "chip reset\n");
+	dev->hw_full_reset = true;
 	ieee80211_stop_queues(hw);
 
 	cancel_delayed_work_sync(&dev->mphy.mac_work);
@@ -1338,6 +1339,7 @@ void mt7921_mac_reset_work(struct work_struct *work)
 		ieee80211_scan_completed(dev->mphy.hw, &info);
 	}
 
+	dev->hw_full_reset = false;
 	ieee80211_wake_queues(hw);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
@@ -1349,7 +1351,8 @@ void mt7921_reset(struct mt76_dev *mdev)
 {
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
 
-	queue_work(dev->mt76.wq, &dev->reset_work);
+	if (!dev->hw_full_reset)
+		queue_work(dev->mt76.wq, &dev->reset_work);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 03bcb210c357..710ad242fd53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -156,6 +156,7 @@ struct mt7921_dev {
 	u16 chainmask;
 
 	struct work_struct reset_work;
+	bool hw_full_reset;
 
 	struct list_head sta_poll_list;
 	spinlock_t sta_poll_lock;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
