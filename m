Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6777CD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0kfyfv4ta4qYQpadkoa8xGJxSxkjjSObeU1cL1n3M4=; b=L5NN/WWEfv6ZtOEweeNwjEg/eR
	AqSN2Sgi7GuEtnTCZePF11T6HAq40N9fJgrl/7wrEa8sNAxkKjCxrEEHApLdKj5JDouDGscAwbfD3
	UCvi2N8Mw7MDeCCC3Y9imx75ulhiGmFv1Q45eZFaXl+2ustT+MD8POwqel14yydXvm99lh8PDS5Gk
	5JntGg5Px0YgeLGbIfic+xhTX+ze9NSiqsIVriVaKfUQINw9HTmVgET5I7WQvFTW7QYOJzCFNM8gD
	8fLcU+FIv3AjvWDfZg3QLeSvPIu9DqwHbmwJGwJM64gOJOUGxk4O8Hd6MURRwgiSdBdcD8T2ZMku8
	GkX+B6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwgA-0000000AVK8-3D3I;
	Fri, 12 Jun 2026 07:51:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwg7-0000000AVHL-3y9y
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:51:49 +0000
X-UUID: 8cfe31f2663311f1acbe4559397dec65-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O0kfyfv4ta4qYQpadkoa8xGJxSxkjjSObeU1cL1n3M4=;
	b=kVejCrlukeycXMMz08J2CPKKMN2iAi9wRvAE1RSreoot4QMRNGa4bkMqFuuwEJqrFPi6bsftPIF6XC+fb80vttPUGMzPZCGp6CFaUa2uwUtNRumPcLxEEmIe3qywz9zU52EhuRwrv3jOyGvmF40ZdmqW5lcyNVkPMirzGXoQOfM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:20ae99ef-2307-4521-8433-697008662cb3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:52b59d7c-6afb-429f-b343-75c21528ad77,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8cfe31f2663311f1acbe4559397dec65-20260612
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1636750670; Fri, 12 Jun 2026 00:51:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 15:51:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 15:51:39 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <emery.hsin@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH 09/20] wifi: mt76: mt7925: rename WTBL registers to chip-specific format
Date: Fri, 12 Jun 2026 15:51:35 +0800
Message-ID: <20260612075136.2577553-4-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260612075136.2577553-1-jb.tsai@mediatek.com>
References: <20260612075136.2577553-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005147_993047_D847E010 
X-CRM114-Status: GOOD (  10.03  )
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

From: Emery Hsin <emery.hsin@mediatek.com>

Rename MT_WTBLON_TOP_WDUCR and MT_WTBL_UPDATE to MT7925-prefixed
versions since MT7928 uses different WTBL register offsets.

This is a preparation patch before enabling MT7928 PCIe support.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/mac.h  | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/regs.h | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 5dd895c3f205..44d5a1e7e415 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -12,10 +12,10 @@
 
 bool mt7925_mac_wtbl_update(struct mt792x_dev *dev, int idx, u32 mask)
 {
-	mt76_rmw(dev, MT_WTBL_UPDATE, MT_WTBL_UPDATE_WLAN_IDX,
+	mt76_rmw(dev, MT7925_WTBL_UPDATE, MT_WTBL_UPDATE_WLAN_IDX,
 		 FIELD_PREP(MT_WTBL_UPDATE_WLAN_IDX, idx) | mask);
 
-	return mt76_poll(dev, MT_WTBL_UPDATE, MT_WTBL_UPDATE_BUSY,
+	return mt76_poll(dev, MT7925_WTBL_UPDATE, MT_WTBL_UPDATE_BUSY,
 			 0, 5000);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.h b/drivers/net/wireless/mediatek/mt76/mt7925/mac.h
index 83ea9021daea..67148c87de76 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.h
@@ -14,7 +14,7 @@
 
 static inline u32 mt7925_mac_wtbl_lmac_addr(struct mt792x_dev *dev, u16 wcid, u8 dw)
 {
-	mt76_wr(dev, MT_WTBLON_TOP_WDUCR,
+	mt76_wr(dev, MT7925_WTBLON_TOP_WDUCR,
 		FIELD_PREP(MT_WTBLON_TOP_WDUCR_GROUP, (wcid >> 7)));
 
 	return MT_WTBL_LMAC_OFFS(wcid, dw);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
index 85adde2ad597..0bcfd1cf0338 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
@@ -90,10 +90,10 @@
 
 #define MT_WFSYS_SW_RST_B		0x7c000140
 
-#define MT_WTBLON_TOP_WDUCR		MT_WTBLON_TOP(0x370)
+#define MT7925_WTBLON_TOP_WDUCR		MT_WTBLON_TOP(0x370)
 #define MT_WTBLON_TOP_WDUCR_GROUP	GENMASK(4, 0)
 
-#define MT_WTBL_UPDATE			MT_WTBLON_TOP(0x380)
+#define MT7925_WTBL_UPDATE		MT_WTBLON_TOP(0x380)
 #define MT_WTBL_UPDATE_WLAN_IDX		GENMASK(11, 0)
 #define MT_WTBL_UPDATE_ADM_COUNT_CLEAR	BIT(14)
 
-- 
2.45.2


