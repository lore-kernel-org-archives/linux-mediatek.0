Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E577C55174
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 09:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fsC614TKS/vHmLaryHTB0it3OzZUqc+ekzKbdu5lys=; b=fSO1wwJnW3cb/ng5uIFVsdqZu1
	J0p26w7Ic3G2AXWnunzSYDvdExVevGt90H+6HEguiGK/tZrIZBoBLnAdg+4K+3nnK1WRNGUbhPKjM
	6fh1O45J83R5O1UNH27yRj0b75cKUkyKHkvjOEcBtbqCw2eNMlKo1T2Se0hbQydYQfRYeHO2RnJqS
	QNktwNOVkDa4G/RINlImwk0vBEMjKpjI8s9UNTCwHMx2uhUeQlWDQysfnQ5rVUPowgEPDrFUZGHpF
	N1TUDb1glbqGr84uoXSBzk64khXiNj/p3IW37Zd1tUXoaB/KVrV6SAta+sGJoVMPJQKLkdp6LvdhQ
	0XX9yDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXsb-00000003c9C-468U;
	Wed, 05 Aug 2026 09:25:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXsZ-00000003c8H-3O3g
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 09:25:41 +0000
X-UUID: 9d83647490af11f1afed4741b24580c9-20260805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1fsC614TKS/vHmLaryHTB0it3OzZUqc+ekzKbdu5lys=;
	b=VuerLLrMF1AvyKqaZhUxV1osFGwF1IwhKb1X3Ebs3uHyNLJKSYs/I/knADX3m2fx2EsBmObW01eLzB4KgPg6oMcHz6MrmRQUNg6f63RguEAYyB4sz2Zx2RXbcpIrG378DZD6XW252GpgbcfSZw8yPT4jWyniFMb4/y+A1+C4wJI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:85c9801f-4671-44be-b7ed-5a886c602c3a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:a64bd443-e456-4e07-b769-8a7d4c457d3d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|100|102|158,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9d83647490af11f1afed4741b24580c9-20260805
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1791777939; Wed, 05 Aug 2026 02:25:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 5 Aug 2026 17:25:33 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 5 Aug 2026 17:25:33 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <ck.chang@mediatek.com>,
	<eason.lai@mediatek.com>
Subject: [PATCH v1 2/2] wifi: mt76: mt7925: Add coredump end collect mechanism
Date: Wed, 5 Aug 2026 17:25:31 +0800
Message-ID: <20260805092531.1490746-3-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260805092531.1490746-1-eason.lai@mediatek.com>
References: <20260805092531.1490746-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_022539_853179_124CA5E6 
X-CRM114-Status: GOOD (  13.00  )
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

From: "ck.chang" <ck.chang@mediatek.com>

Add collect mechanism, when parse to specific coredump string, immediately save the collected coredump content into coredump file

Signed-off-by: ck.chang <ck.chang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h |  1 +
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |  8 +++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 10 +++++++++-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index b1677ca24703..6374add14160 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -128,6 +128,7 @@ struct mt76_connac_coredump {
 	struct sk_buff_head msg_list;
 	struct delayed_work work;
 	unsigned long last_activity;
+	bool complete;
 };
 
 struct mt76_connac_sta_key_conf {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index b5dd1b58618c..77b6fa34a1ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1580,12 +1580,18 @@ void mt7925_coredump_work(struct work_struct *work)
 
 	dev = (struct mt792x_dev *)container_of(work, struct mt792x_dev, coredump.work.work);
 
-	if (time_is_after_jiffies(dev->coredump.last_activity +
+	/* if received the last coredump payload or timeout, start
+	 * saving coredump file and trigger reset.
+	 * Otherwise, wait for other coredump payload coming
+	 */
+	if (!dev->coredump.complete &&
+		time_is_after_jiffies(dev->coredump.last_activity +
 				  4 * MT76_CONNAC_COREDUMP_TIMEOUT)) {
 		queue_delayed_work(dev->mt76.wq, &dev->coredump.work,
 				   MT76_CONNAC_COREDUMP_TIMEOUT);
 		return;
 	}
+	dev->coredump.complete = false;
 
 	skb_queue_head_init(&local_list);
 	spin_lock_bh(&dev->mt76.lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index fa29c486a455..c4194c800dc6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -671,6 +671,7 @@ static void
 mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 				    struct sk_buff *skb)
 {
+#define COREDUMP_END_STR	"; coredump end"
 	struct mt7925_mcu_rxd *rxd;
 
 	rxd = (struct mt7925_mcu_rxd *)skb->data;
@@ -700,10 +701,17 @@ mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 	case MCU_UNI_EVENT_RSSI_MONITOR:
 		mt7925_mcu_rssi_monitor_event(dev, skb);
 		break;
-	case MCU_UNI_EVENT_COREDUMP:
+	case MCU_UNI_EVENT_COREDUMP: {
+		size_t hdr_len = sizeof(struct mt7925_mcu_rxd) + 8;
+
 		dev->fw_assert = true;
+		if (skb->len > hdr_len &&
+			strnstr(skb->data + hdr_len, COREDUMP_END_STR,
+				skb->len - hdr_len))
+			dev->coredump.complete = true;
 		mt76_connac_mcu_coredump_event(&dev->mt76, skb, &dev->coredump);
 		return;
+	}
 	case MCU_UNI_EVENT_NAN:
 		mt7925_nan_mcu_event(dev, skb);
 		break;
-- 
2.45.2


