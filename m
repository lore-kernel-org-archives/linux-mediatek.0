Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340DFC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858F122525
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858F122525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+hUwdX/NqQpNo0qeIjdT437clG+jxmrXMipyo6Li/Lg=; b=aJsS9aRJ3WyatvhrS9af/rEAn
	LN6f2XwBjEl7zrDQfr4Ucbo7gBx6LctW+n5wS1uNudlXBAECVxHYWIVYJti0yki9nC48Z8QOVdKxJ
	S48Erl2KuqBwrOl1DMDVwEKbC8g4h/t/Jz3BYRUO6L8XWSLpSkJJmvCbyDC+vpa2/KM4QBnJreSUW
	eKzbvFZpQR5mSrPOs3iW5tDWmS7Llvre5HRESfqt4oJ93AwO7jDvuLgPzjrUN+KwF3oU5YO2OxpnJ
	bewUDERezrLhskV23eMwAeuDRuaIARpiu/aC5INXdjnReFSDwXCIreVA3rOnKXqCcXUSHbUAtDlnY
	n6PYuEMcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwiDr-0003xC-21; Tue, 05 Jan 2021 09:01:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwiDo-0003un-4i
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 09:01:45 +0000
X-UUID: 59ff2744401b49d48b51d9ae50a5dbcf-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2LT30ue7EWISpEYfCW0ztnc78OMOPtnTmutTrYt1uyI=; 
 b=X5Uk6kwR6hEzqrj6wqnnwqSe7b1m9Qep6fp2v3bIgdgF5nobeXS9/gD/7piJD7JITQFpoFmS/BpECepFjyCZkoimICU0Fb32ColLS0kOSliFCzDbNsXs9S64GRT87vfaJmaFQxAZ3dtH0rqbIUrVVcYDXZjWK8x+94OCRvU9XEU=;
X-UUID: 59ff2744401b49d48b51d9ae50a5dbcf-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 269713326; Tue, 05 Jan 2021 01:01:38 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 00:56:13 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 16:56:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 16:56:06 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 2/6] mt76: testmode: make tx queued limit adjustable
Date: Tue, 5 Jan 2021 16:55:25 +0800
Message-ID: <20210105085529.14206-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210105085529.14206-1-shayne.chen@mediatek.com>
References: <20210105085529.14206-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_040144_590289_8D01F74B 
X-CRM114-Status: GOOD (  13.21  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Originally, tx queued limit is set to 1000 to prevent from running out
of tx token. If a new testmode tx is triggered while the previous one
hasn't finished yet, we'll wait a period of time until tx_done equals to
tx_queued. Normally, current queued limit can finish in 10 seconds.

However, if ipg is configured to a larger value, less than 1000 packets
can be done in the default timeout period, which may lead to a crash
when a new testmode tx triggered.

To deal with this, make tx queued limit dynamically adjusted according
to ipg value.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     | 1 +
 drivers/net/wireless/mediatek/mt76/testmode.c | 9 +++++++--
 drivers/net/wireless/mediatek/mt76/testmode.h | 2 ++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index cbe9689dc2ca..9de9a3b842d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -552,6 +552,7 @@ struct mt76_testmode_data {
 
 	u32 tx_pending;
 	u32 tx_queued;
+	u16 tx_queued_limit;
 	u32 tx_done;
 	struct {
 		u64 packets[__MT_RXQ_MAX];
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index 74cadf51df55..cc769645afa5 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -30,6 +30,7 @@ void mt76_testmode_tx_pending(struct mt76_phy *phy)
 	struct mt76_wcid *wcid = &dev->global_wcid;
 	struct sk_buff *skb = td->tx_skb;
 	struct mt76_queue *q;
+	u16 tx_queued_limit;
 	int qid;
 
 	if (!skb || !td->tx_pending)
@@ -38,9 +39,12 @@ void mt76_testmode_tx_pending(struct mt76_phy *phy)
 	qid = skb_get_queue_mapping(skb);
 	q = phy->q_tx[qid];
 
+	tx_queued_limit = td->tx_queued_limit ? td->tx_queued_limit : 1000;
+
 	spin_lock_bh(&q->lock);
 
-	while (td->tx_pending > 0 && td->tx_queued - td->tx_done < 1000 &&
+	while (td->tx_pending > 0 &&
+	       td->tx_queued - td->tx_done < tx_queued_limit &&
 	       q->queued < q->ndesc / 2) {
 		int ret;
 
@@ -196,7 +200,8 @@ mt76_testmode_tx_stop(struct mt76_phy *phy)
 
 	mt76_worker_enable(&dev->tx_worker);
 
-	wait_event_timeout(dev->tx_wait, td->tx_done == td->tx_queued, 10 * HZ);
+	wait_event_timeout(dev->tx_wait, td->tx_done == td->tx_queued,
+			   MT76_TM_TIMEOUT * HZ);
 
 	dev_kfree_skb(td->tx_skb);
 	td->tx_skb = NULL;
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index cecdf358aa44..e4849946f180 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -5,6 +5,8 @@
 #ifndef __MT76_TESTMODE_H
 #define __MT76_TESTMODE_H
 
+#define MT76_TM_TIMEOUT	10
+
 /**
  * enum mt76_testmode_attr - testmode attributes inside NL80211_ATTR_TESTDATA
  *
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
