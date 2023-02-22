Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB6DC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 06:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NSMT0lcm6EAxxPcbyBTH5y2LsNF1ot+Tk8/CJS2AGO0=; b=NkgaA35n7g9k+5hlSYh2NjckFO
	4ZzSr1BHYf81GxB7RKuyHV4SBoijW3q+EcO8TpkyYnAAkRtETA6cAjK4Oc6v3dTeRM4NdspeR90jq
	iXDXrnll0+6BS9hvSJW61rKFgXaY5Z9h4VUTL6ZLgOptG46abkhPA9O8cX0u3i48EcGP1AtowUVVz
	cOpslNQwrlPcPa6tLqayTqlvNriNnftRVx1NeUm2y7WVcjH3DW/G2ZuHoTY1N41pHQiovr/cOu4R2
	ragVS2yLUeMmeMbGAqAqVGSPE962CRiHVkonyCvdR5OsfKzb+Z4NABjJPTqFvL9/Ephd+JxUxeVrP
	cIf6m4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUibh-00AweF-Au; Wed, 22 Feb 2023 06:28:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUibc-00AwdS-NC
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 06:27:59 +0000
X-UUID: 07204b12b27a11eda08d4d6090ec5a5c-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NSMT0lcm6EAxxPcbyBTH5y2LsNF1ot+Tk8/CJS2AGO0=;
	b=XP9WfvZKdb/U8PFceFHBml6410lkajJv4fSyPe8zU9KeJE+ceS/KAutwuAmXb8LUBsgorQ/T00G75VArUCl437sKw/Iw8TkO9mouZtGQPO0FuGqWegAyqap4QRbXxWXc/2Qi9fc+zoP3Sn/UrL9geg6nCbOvR5pHjULPxj/HYY0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:2126fe2c-d6aa-4f26-91e7-89e024b78350,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.20,REQID:2126fe2c-d6aa-4f26-91e7-89e024b78350,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:25b5999,CLOUDID:e47d35b1-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:230222142751QC3LVVEV,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 07204b12b27a11eda08d4d6090ec5a5c-20230221
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <sujuan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1222602462; Tue, 21 Feb 2023 23:27:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 22 Feb 2023 14:27:46 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 22 Feb 2023 14:27:46 +0800
From: Sujuan Chen <sujuan.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Sujuan Chen
	<sujuan.chen@mediatek.com>
Subject: [PATCH] wifi: mt76: drop the incorrect scatter and gather frame
Date: Wed, 22 Feb 2023 14:27:29 +0800
Message-ID: <acfc12f7f6a83151a1f3150febeff807fa8df45e.1677042139.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_222756_781844_9FDBCB9C 
X-CRM114-Status: GOOD (  12.05  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

The scatter and gather frame may be incorrect because WED and WO may
send frames to host driver interleaved.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 6 ++++--
 drivers/net/wireless/mediatek/mt76/dma.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index da281cd1d36f..738d7e1569bf 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -402,8 +402,8 @@ mt76_dma_get_buf(struct mt76_dev *dev, struct mt76_queue *q, int idx,
 		*info = le32_to_cpu(desc->info);
 
 	if (mt76_queue_is_wed_rx(q)) {
-		u32 token = FIELD_GET(MT_DMA_CTL_TOKEN,
-				      le32_to_cpu(desc->buf1));
+		u32 buf1 = le32_to_cpu(desc->buf1);
+		u32 token = FIELD_GET(MT_DMA_CTL_TOKEN, buf1);
 		struct mt76_txwi_cache *t = mt76_rx_token_release(dev, token);
 
 		if (!t)
@@ -424,6 +424,8 @@ mt76_dma_get_buf(struct mt76_dev *dev, struct mt76_queue *q, int idx,
 
 			*drop = !!(ctrl & (MT_DMA_CTL_TO_HOST_A |
 					   MT_DMA_CTL_DROP));
+
+			*drop |= !!(buf1 & MT_DMA_CTL_WO_DROP);
 		}
 	} else {
 		buf = e->buf;
diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index 4b9bc7f462b8..1b090d78cd05 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -19,6 +19,7 @@
 #define MT_DMA_CTL_TO_HOST_A		BIT(12)
 #define MT_DMA_CTL_DROP			BIT(14)
 #define MT_DMA_CTL_TOKEN		GENMASK(31, 16)
+#define MT_DMA_CTL_WO_DROP		BIT(8)
 
 #define MT_DMA_PPE_CPU_REASON		GENMASK(15, 11)
 #define MT_DMA_PPE_ENTRY		GENMASK(30, 16)
-- 
2.39.0


