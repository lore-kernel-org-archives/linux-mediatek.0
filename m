Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB87AC3DA78
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Jan 2023 05:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=woHIGTy1tCbpHZPvXSEIsCX2OT77rO8Vy17wFNBxBP0=; b=H3tmvkrpQYRzAvUdoynsF5XpV/
	BEaxtD8d1Lg9oZiAIim4lWkNXMvA1GLKE3839+3vzFAIa5FI4OnqLX4/VIVfSfBvGbQ0hufRhy2vW
	BFzxRkrQCo87312zdjisRmh2WE5sa3Pj2bYQUySJXfImIUyB0MbWW8/PO78HWbWVWVjHCZkghNOAg
	8fwLAMnk0nL+0I2X9LZqqRooOeoIflJzZGsD8dl3cfLwNev5MmFGXv6IVO/gJLyL+59Ux5faGsS8T
	29NHAs5TY5oIEudU60LRgInfez8pZutfukmBRFWvtsYu9FLz0kqjy9eqhxxmk2y5jOYP92Q2E5XOS
	3Kjxp5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGYuq-005Ge3-71; Sat, 14 Jan 2023 05:17:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGYum-005GdK-Ix
	for linux-mediatek@lists.infradead.org; Sat, 14 Jan 2023 05:17:14 +0000
X-UUID: af9b33a293ca11edbbe3f76fe852e059-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=woHIGTy1tCbpHZPvXSEIsCX2OT77rO8Vy17wFNBxBP0=;
	b=SY8Nd768Lmtd9abZN2J/NU3UnTbEnVLME0EmBCyFVfHuqSkF2ZsQfHhzGOYxAAN7nTfMkBsvHM1Mstw8fmeDV9khvqEy+HJhqdWKd8Qca7kkCkZtfTKXF0GajAO5ji7BYQEpWMQJxYhL9OpKXA5k1xHnTF4v0PswbBlcT3N//mA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:7e3a5c98-0eb1-4acd-b4b4-e85bb98820b1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:8d319f54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: af9b33a293ca11edbbe3f76fe852e059-20230113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1698040861; Fri, 13 Jan 2023 22:17:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 14 Jan 2023 12:57:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 14 Jan 2023 12:57:03 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, Eric-SY
 Chang <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder
 Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: add flexible polling wait-interval support
Date: Sat, 14 Jan 2023 12:56:46 +0800
Message-ID: <4113f5787a4e15271698219c61367d5105109c92.1673670759.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_211712_657912_B24BCB07 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

The default waiting unit is 10ms and the value is too much for
data path related control. Provide a new API mt76_poll_msec_tick()
to support different cases, such as 1ms polling waiting kick.

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h |  9 +++++----
 drivers/net/wireless/mediatek/mt76/util.c | 10 +++++-----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 1037d23bc4d0..af9051557e86 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -909,10 +909,11 @@ bool __mt76_poll(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
 
 #define mt76_poll(dev, ...) __mt76_poll(&((dev)->mt76), __VA_ARGS__)
 
-bool __mt76_poll_msec(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
-		      int timeout);
-
-#define mt76_poll_msec(dev, ...) __mt76_poll_msec(&((dev)->mt76), __VA_ARGS__)
+bool ____mt76_poll_msec(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
+			int timeout, int kick);
+#define __mt76_poll_msec(...)         ____mt76_poll_msec(__VA_ARGS__, 10)
+#define mt76_poll_msec(dev, ...)      ____mt76_poll_msec(&((dev)->mt76), __VA_ARGS__, 10)
+#define mt76_poll_msec_tick(dev, ...) ____mt76_poll_msec(&((dev)->mt76), __VA_ARGS__)
 
 void mt76_mmio_init(struct mt76_dev *dev, void __iomem *regs);
 void mt76_pci_disable_aspm(struct pci_dev *pdev);
diff --git a/drivers/net/wireless/mediatek/mt76/util.c b/drivers/net/wireless/mediatek/mt76/util.c
index 581964425468..fc76c66ff1a5 100644
--- a/drivers/net/wireless/mediatek/mt76/util.c
+++ b/drivers/net/wireless/mediatek/mt76/util.c
@@ -24,23 +24,23 @@ bool __mt76_poll(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
 }
 EXPORT_SYMBOL_GPL(__mt76_poll);
 
-bool __mt76_poll_msec(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
-		      int timeout)
+bool ____mt76_poll_msec(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
+			int timeout, int tick)
 {
 	u32 cur;
 
-	timeout /= 10;
+	timeout /= tick;
 	do {
 		cur = __mt76_rr(dev, offset) & mask;
 		if (cur == val)
 			return true;
 
-		usleep_range(10000, 20000);
+		usleep_range(1000 * tick, 2000 * tick);
 	} while (timeout-- > 0);
 
 	return false;
 }
-EXPORT_SYMBOL_GPL(__mt76_poll_msec);
+EXPORT_SYMBOL_GPL(____mt76_poll_msec);
 
 int mt76_wcid_alloc(u32 *mask, int size)
 {
-- 
2.18.0


