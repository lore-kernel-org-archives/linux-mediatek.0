Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770C9E87843
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Feb 2026 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocAdPwmDzHKxnVSldZBqLpITOD8v7ybbeSfd2Tme2zo=; b=y+fP7u6SnNv6FPZ3lquIQEhTdY
	T7ZeX+/6AIhmrdqG0UOapnVdjGeJgW1jO/fULeW6PEeiEFqPOvqabWtcB7VHudWnYnTP4Cc+KAbJV
	y8KaPB8S/C5XPrn9sQW88YFoEKqfjDdEbG3aIEdRzRQlxf5fZew7Udp97aSgpgMBJ7VzcCQFR/ZNF
	jBf0mZXgwYVV8yPdi2SR7+4WmGqtZcPll3ApFhcVvg0UaIgZ3Gxxf9QxL5fqx4l5rvA9H6+qFA16u
	N76t3aHlOdmvKF4Vbl7rF45oJ7MjnRuTqBBeCcijtcjZCiX36sRBEIGm4u0CDdVXvXTaFmlKOdOIg
	0IDu5Rfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIkx-00000006sJP-0cq5;
	Tue, 03 Feb 2026 15:55:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIkt-00000006sI7-3AhR
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Feb 2026 15:55:57 +0000
X-UUID: cf436ff8011811f1ad39f32c34db0b1c-20260203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ocAdPwmDzHKxnVSldZBqLpITOD8v7ybbeSfd2Tme2zo=;
	b=E0ZIqoAXcjAX1JYD6BnXHRCbQyg/hRhjqvoml8j7mO0Litpqun/nchz5kjQ+RXg2+DjfdgkamyZIfsgh/NYdZmdPzn+Wd6mk4q3/n8RgPEz6p7WMMvhKDpWQWATJ9qEOB9pDMph+3TbDPws2Uh8FO8oq+pWLpEggFzMVn/jbl28=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:24f26b78-5373-4720-adeb-66bb70146b1c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:18478b7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cf436ff8011811f1ad39f32c34db0b1c-20260203
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1694155400; Tue, 03 Feb 2026 08:55:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Feb 2026 23:55:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Feb 2026 23:55:46 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 v2 3/4] wifi: mt76: avoid to set ACK for MCU command if wait_resp is not set
Date: Tue, 3 Feb 2026 23:55:31 +0800
Message-ID: <20260203155532.1098290-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260203155532.1098290-1-shayne.chen@mediatek.com>
References: <20260203155532.1098290-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_075555_794791_17F517E3 
X-CRM114-Status: GOOD (  14.47  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

When wait_resp is not set but the ACK option is enabled in the MCU TXD,
the ACK event is enqueued to the MCU event queue without being dequeued
by the original MCU command request.

Any orphaned ACK events will only be removed from the queue when another
MCU command requests a response. Due to sequence index mismatches, these
events are discarded one by one until a matching sequence index is found.

However, if several MCU commands that do not require a response continue
to fill up the event queue, there is a risk that when an MCU command with
wait_resp enabled is issued, it may dequeue the wrong event skb,
especially if the queue contains events with all possible sequence
indices.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mcu.c        |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 535c3d8a9cc0..cbfb3bbec503 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -98,7 +98,7 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	/* orig skb might be needed for retry, mcu_skb_send_msg consumes it */
 	if (orig_skb)
 		skb_get(orig_skb);
-	ret = dev->mcu_ops->mcu_skb_send_msg(dev, skb, cmd, &seq);
+	ret = dev->mcu_ops->mcu_skb_send_msg(dev, skb, cmd, wait_resp ? &seq : NULL);
 	if (ret < 0)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 285cd83e7117..68d698033e43 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -322,13 +322,12 @@ mt7996_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 		uni_txd->pkt_type = MCU_PKT_ID;
 		uni_txd->seq = seq;
 
-		if (cmd & __MCU_CMD_FIELD_QUERY)
-			uni_txd->option = MCU_CMD_UNI_QUERY_ACK;
-		else
-			uni_txd->option = MCU_CMD_UNI_EXT_ACK;
+		uni_txd->option = MCU_CMD_UNI;
+		if (!(cmd & __MCU_CMD_FIELD_QUERY))
+			uni_txd->option |= MCU_CMD_SET;
 
-		if (mcu_cmd == MCU_UNI_CMD_SDO)
-			uni_txd->option &= ~MCU_CMD_ACK;
+		if (wait_seq)
+			uni_txd->option |= MCU_CMD_ACK;
 
 		if ((cmd & __MCU_CMD_FIELD_WA) && (cmd & __MCU_CMD_FIELD_WM))
 			uni_txd->s2d_index = MCU_S2D_H2CN;
-- 
2.51.0


