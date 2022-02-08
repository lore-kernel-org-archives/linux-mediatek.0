Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AE6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U953LGqgf6W/SpRAKt+7+CYPK8M32xvxGC69yx4l3rA=; b=l4RH5rXLm0awLX
	kRX6Ti1Lu78v2qszJsef7apgPFxliKWNkc6dNx1K8ZO8ntk0jwAtbzuKUakeMwltZ2znxTSybilzu
	/3UQhqNzRsxRew741M3qvK9719Tjp8lQ05nxIdqrJ2SY4nudm1R0igNM/EhDDbNxXm6YU5qUT/L8u
	p7PhP7J0Xip38gxT3h1T85LDmhjmRAUn5dLongDzN3zRk5YCNNtfjsevXRytRH//N0eCPb2eZVGaE
	yv3dpK7BPeSNGyaUs/T6nf1vGRPSYHF8COzzkUb8OC7lMdsu/dYkHQ+mtIFK3osbj1FM5ZnVbiMG9
	CK4i6Txi4Hfbvmbw2plw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHNci-00DOXQ-9s; Tue, 08 Feb 2022 10:21:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHNcf-00DOW9-TI
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 10:21:23 +0000
X-UUID: e86ff91d2f1441cdab0fa342f4b59a0d-20220208
X-UUID: e86ff91d2f1441cdab0fa342f4b59a0d-20220208
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1434315278; Tue, 08 Feb 2022 03:21:13 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 02:21:11 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Feb 2022 18:21:09 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 8 Feb 2022 18:21:09 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: Fix channel state update error issue
Date: Tue, 8 Feb 2022 18:21:07 +0800
Message-ID: <a3640a21b801969744b4bd4e038bdb015d249ba2.1644312585.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_022121_984362_3099CD52 
X-CRM114-Status: GOOD (  11.70  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

Fix channel state update error issue due to wrong
register access for mt7916.

Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
v2:
 - add offset to parse channel mib info event.
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c  | 15 +++++++++++----
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  |  8 +++++---
 drivers/net/wireless/mediatek/mt76/mt7915/regs.h | 11 ++++++++---
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 3c38031..b693868 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1845,12 +1845,17 @@ void mt7915_mac_set_timing(struct mt7915_phy *phy)
 
 void mt7915_mac_enable_nf(struct mt7915_dev *dev, bool ext_phy)
 {
-	mt76_set(dev, MT_WF_PHY_RXTD12(ext_phy),
+	u32 reg;
+
+	reg = is_mt7915(&dev->mt76) ? MT_WF_PHY_RXTD12(ext_phy) :
+		MT_WF_PHY_RXTD12_MT7916(ext_phy);
+	mt76_set(dev, reg,
 		 MT_WF_PHY_RXTD12_IRPI_SW_CLR_ONLY |
 		 MT_WF_PHY_RXTD12_IRPI_SW_CLR);
 
-	mt76_set(dev, MT_WF_PHY_RX_CTRL1(ext_phy),
-		 FIELD_PREP(MT_WF_PHY_RX_CTRL1_IPI_EN, 0x5));
+	reg = is_mt7915(&dev->mt76) ? MT_WF_PHY_RX_CTRL1(ext_phy) :
+		MT_WF_PHY_RX_CTRL1_MT7916(ext_phy);
+	mt76_set(dev, reg, FIELD_PREP(MT_WF_PHY_RX_CTRL1_IPI_EN, 0x5));
 }
 
 static u8
@@ -1862,7 +1867,9 @@ mt7915_phy_get_nf(struct mt7915_phy *phy, int idx)
 	int nss, i;
 
 	for (nss = 0; nss < hweight8(phy->mt76->chainmask); nss++) {
-		u32 reg = MT_WF_IRPI(nss + (idx << dev->dbdc_support));
+		u32 reg = is_mt7915(&dev->mt76) ?
+			MT_WF_IRPI_NSS(0, nss + (idx << dev->dbdc_support)) :
+			MT_WF_IRPI_NSS_MT7916(idx, nss);
 
 		for (i = 0; i < ARRAY_SIZE(nf_power); i++, reg += 4) {
 			val = mt76_rr(dev, reg);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 94837ed..529a096 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3064,10 +3064,12 @@ int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
 	struct mt7915_dev *dev = phy->dev;
 	struct mt7915_mcu_mib *res, req[4];
 	struct sk_buff *skb;
-	int i, ret, start = 0;
+	int i, ret, start = 0, ofs = 20;
 
-	if (!is_mt7915(&dev->mt76))
+	if (!is_mt7915(&dev->mt76)) {
 		start = 4;
+		ofs = 0;
+	}
 
 	for (i = 0; i < 4; i++) {
 		req[i].band = cpu_to_le32(phy != &dev->phy);
@@ -3079,7 +3081,7 @@ int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
 	if (ret)
 		return ret;
 
-	res = (struct mt7915_mcu_mib *)(skb->data + 20);
+	res = (struct mt7915_mcu_mib *)(skb->data + ofs);
 
 	if (chan_switch)
 		goto out;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 6a0f681..e380fd9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -761,18 +761,23 @@ enum offs_rev {
 #define MT_WF_PP_TOP_RXQ_WFDMA_CF_5	MT_WF_PP_TOP(0x0e8)
 #define MT_WF_PP_TOP_RXQ_QID6_WFDMA_HIF_SEL_MASK	BIT(6)
 
-#define MT_WF_IRPI_BASE			0x83006000
-#define MT_WF_IRPI(ofs)			(MT_WF_IRPI_BASE + ((ofs) << 16))
+#define MT_WF_IRPI_BASE			0x83000000
+#define MT_WF_IRPI(ofs)			(MT_WF_IRPI_BASE + (ofs))
 
-/* PHY: band 0(0x83080000), band 1(0x83090000) */
+#define MT_WF_IRPI_NSS(phy, nss)	MT_WF_IRPI(0x6000 + ((phy) << 20) + ((nss) << 16))
+#define MT_WF_IRPI_NSS_MT7916(phy, nss)	MT_WF_IRPI(0x1000 + ((phy) << 20) + ((nss) << 16))
+
+/* PHY */
 #define MT_WF_PHY_BASE			0x83080000
 #define MT_WF_PHY(ofs)			(MT_WF_PHY_BASE + (ofs))
 
 #define MT_WF_PHY_RX_CTRL1(_phy)	MT_WF_PHY(0x2004 + ((_phy) << 16))
+#define MT_WF_PHY_RX_CTRL1_MT7916(_phy)	MT_WF_PHY(0x2004 + ((_phy) << 20))
 #define MT_WF_PHY_RX_CTRL1_IPI_EN	GENMASK(2, 0)
 #define MT_WF_PHY_RX_CTRL1_STSCNT_EN	GENMASK(11, 9)
 
 #define MT_WF_PHY_RXTD12(_phy)		MT_WF_PHY(0x8230 + ((_phy) << 16))
+#define MT_WF_PHY_RXTD12_MT7916(_phy)	MT_WF_PHY(0x8230 + ((_phy) << 20))
 #define MT_WF_PHY_RXTD12_IRPI_SW_CLR_ONLY	BIT(18)
 #define MT_WF_PHY_RXTD12_IRPI_SW_CLR		BIT(29)
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
