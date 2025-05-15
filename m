Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EB6C54756
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 03:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahqVB/novhOH9WPxx6JgqGkGBvhwvp7jmdh5ETAPdCM=; b=FlL8r7gFBjf53e4Ghw7/y4SyBh
	VNrMWaeyI7urqh0HtzGnIC1PGU4F4PBxWY6+4M7AQLkL5kgW0jHd/0SLTFzS6yyQfWFpQGWhnYip0
	2bCFinOY0bbAD96jaxGKmXPvPfmNQ6D4/ZaB2otodirW3OhInYJ5MtiD9m9H0Zn3UFhotqRO6pJyc
	RGurIk+WVs6mK1FB3Aky1FVi1P5hdrC/SfP0RmLl6cSmToWs6xi/1/fp/62Pn96XmNov7GDMUCF7Q
	JYIFInkWweZOtwkzS97Cphkm8AcqSg+MUYbZm3cLtF3bo+BWA9R/4VO78aNjxuWG3gvsHok+42T72
	vRbMdZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPL0-0000000GwQb-0EiX;
	Thu, 15 May 2025 03:32:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPKw-0000000GwNJ-2s5X
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 03:32:47 +0000
X-UUID: 427f7ad6313d11f08d385d50fb11b32d-20250514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ahqVB/novhOH9WPxx6JgqGkGBvhwvp7jmdh5ETAPdCM=;
	b=gm2d30KwAwyxNDFnbbT3LsbxAKVs8BYDNLOVa0t8frc5sSdUZSBg2jG+9vxcNxSneRttMv66KC7arbETAE3QXFvw3XbIZyRqGUgZnY2Hg6dHLUJMaCN3UdZoJDW5cb6FcXVnuj0ZuhrestRMwfXO7XYZxyGFV12bsFas+1mBM7Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:72517792-ca1e-4c1d-a2dc-8171647fdf06,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:7ffa00c0-eade-4d5b-9f81-31d7b5452436,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 427f7ad6313d11f08d385d50fb11b32d-20250514
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 391434481; Wed, 14 May 2025 20:32:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 11:32:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 11:32:39 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH mt76-next 7/9] wifi: mt76: mt7996: fix RX buffer size of MCU event
Date: Thu, 15 May 2025 11:29:50 +0800
Message-ID: <20250515032952.1653494-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515032952.1653494-1-shayne.chen@mediatek.com>
References: <20250515032952.1653494-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_203246_728353_23C9CA8A 
X-CRM114-Status: GOOD (  13.61  )
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

Some management frames are first processed by the firmware and then
passed to the driver through the MCU event rings. In CONNAC3, event rings
do not support scatter-gather and have a size limitation of 2048 bytes.
If a packet sized between 1728 and 2048 bytes arrives from an event ring,
the ring will hang because the driver attempts to use scatter-gather to
process it.

To fix this, include the size of struct skb_shared_info in the MCU RX
buffer size to prevent scatter-gather from being used for event skb in
mt76_dma_rx_fill_buf().

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c    | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index fe8cc1d3f738..c8bef0b2a144 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -531,7 +531,7 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU],
 			       MT_RXQ_ID(MT_RXQ_MCU),
 			       MT7996_RX_MCU_RING_SIZE,
-			       MT_RX_BUF_SIZE,
+			       MT7996_RX_MCU_BUF_SIZE,
 			       MT_RXQ_RING_BASE(MT_RXQ_MCU));
 	if (ret)
 		return ret;
@@ -540,7 +540,7 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU_WA],
 			       MT_RXQ_ID(MT_RXQ_MCU_WA),
 			       MT7996_RX_MCU_RING_SIZE_WA,
-			       MT_RX_BUF_SIZE,
+			       MT7996_RX_MCU_BUF_SIZE,
 			       MT_RXQ_RING_BASE(MT_RXQ_MCU_WA));
 	if (ret)
 		return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index c75189a02316..1ad6bc046f7c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -29,6 +29,9 @@
 #define MT7996_RX_RING_SIZE		1536
 #define MT7996_RX_MCU_RING_SIZE		512
 #define MT7996_RX_MCU_RING_SIZE_WA	1024
+/* scatter-gather of mcu event is not supported in connac3 */
+#define MT7996_RX_MCU_BUF_SIZE		(2048 + \
+					 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
 
 #define MT7996_DEVICE_ID		0x7990
 #define MT7996_DEVICE_ID_2		0x7991
-- 
2.39.2


