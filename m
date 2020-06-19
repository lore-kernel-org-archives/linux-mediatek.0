Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33A1C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:55:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FE42078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DrpGJAsr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qkhCKXPX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FE42078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fy92O+nbzXBwpwIRcEKf/xdxKNpZT3AJTG1DyMMngYc=; b=DrpGJAsrTyyli2
	jG7h5B2LCIBnjCBrcB7lVwvMh/4uy4uXsE+I2rnhMZS9+OtPTChHFTlezTC1KfcLD2tqXkWSC7E09
	qjNJ0EbBMBwpCFKA+cf1wPaCFiWf12hlz7uyhNhNZvnK87Gi3sewEc+IWYE95sKFuI+dKzbj1yVBC
	JSjgSYmv21ivCycBPEyPeV7O7a5z//IYIsWRlgScbL8gX23Fku1lFKClv+LgjzN6i2fDZl/PU99RP
	HjhhipDpVcqoCu9AC+hW8tywW+eTA9vPuKMr07UUHOJvw4eMLuISBAduv37TPoFdd5X1LA5jkOzlx
	SkQJ8sXtTuefCav0DTNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmBrU-00061X-6V; Fri, 19 Jun 2020 07:54:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmBrR-00060C-NS
 for linux-mediatek@lists.infradead.org; Fri, 19 Jun 2020 07:54:55 +0000
X-UUID: c44d7d17f1354b48acf9118f03d3b220-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yCScZm5hGSqIDtxe5yip9trAR0uBsbBaiWT93V5VXyU=; 
 b=qkhCKXPXiheEJtyuaPPNXXF6mjthndGr3+RO0WCJDrr5SS+Wfg4KDbsA9dFJUC53M31oqrN0bPScqf1IxsYmtIc3JpRZVrT4QtPqn8tiq3tRuocGxLxJQ1EEjYqG2W9E3aY9/fn/soQDqsZcdOKDRgBoyuQMeHcEvr4Pko93OlQ=;
X-UUID: c44d7d17f1354b48acf9118f03d3b220-20200618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 116466795; Thu, 18 Jun 2020 23:55:05 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 00:54:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 15:54:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 19 Jun 2020 15:54:50 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v2 3/3] mt76: mt7915: directly read per-rate tx power from
 registers
Date: Fri, 19 Jun 2020 15:53:56 +0800
Message-ID: <20200619075356.21998-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200619075356.21998-1-shayne.chen@mediatek.com>
References: <20200619075356.21998-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BB28C464EF00E83DA12DC58DAD21739E824790DA141DC73D3EDFABE8294393302000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_005453_769913_0B5C888F 
X-CRM114-Status: GOOD (  14.48  )
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

In the previous version, the values of per-rate tx power are calculated
from SW side, but it may be inaccurate if additional limits are applied.
This patch adds support for getting per-rate tx power directly from
registers.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2:
 - fix reg_base and idx calculation
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 63 ++++++++++++-------
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 ++
 2 files changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 6d4fd14..92affd4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -300,8 +300,8 @@ mt7915_queues_read(struct seq_file *s, void *data)
 }
 
 static void
-mt7915_puts_rate_txpower(struct seq_file *s, s8 *delta,
-			 s8 txpower_cur, int band)
+mt7915_puts_rate_txpower(struct seq_file *s, struct mt7915_dev *dev,
+			 int band, bool ext_phy)
 {
 	static const char * const sku_group_name[] = {
 		"CCK", "OFDM", "HT20", "HT40",
@@ -309,24 +309,46 @@ mt7915_puts_rate_txpower(struct seq_file *s, s8 *delta,
 		"RU26", "RU52", "RU106", "RU242/SU20",
 		"RU484/SU40", "RU996/SU80", "RU2x996/SU160"
 	};
-	s8 txpower[MT7915_SKU_RATE_NUM];
+	u32 reg_base = MT_TMAC_FP0R0(ext_phy);
 	int i, idx = 0;
 
-	for (i = 0; i < MT7915_SKU_RATE_NUM; i++)
-		txpower[i] = DIV_ROUND_UP(txpower_cur + delta[i], 2);
+	for (i = 0; i < ARRAY_SIZE(mt7915_sku_group_len); i++) {
+		u8 cnt, mcs_num = mt7915_sku_group_len[i];
+		s8 txpower[12];
+		int j;
+
+		if (i == SKU_HT_BW20 || i == SKU_HT_BW40) {
+			mcs_num = 8;
+		} else if (i >= SKU_VHT_BW20 && i <= SKU_VHT_BW160) {
+			mcs_num = 10;
+		} else if (i == SKU_HE_RU26) {
+			reg_base = MT_TMAC_FP0R18(ext_phy);
+			idx = 0;
+		}
 
-	for (i = 0; i < MAX_SKU_RATE_GROUP_NUM; i++) {
-		const struct sku_group *sku = &mt7915_sku_groups[i];
-		u32 offset = sku->offset[band];
+		for (j = 0, cnt = 0; j < DIV_ROUND_UP(mcs_num, 4); j++) {
+			u32 val;
 
-		if (!offset) {
-			idx += sku->len;
-			continue;
+			if (i == SKU_VHT_BW160 && idx == 60) {
+				reg_base = MT_TMAC_FP0R15(ext_phy);
+				idx = 0;
+			}
+
+			val = mt76_rr(dev, reg_base + (idx / 4) * 4);
+
+			if (idx && idx % 4)
+				val >>= (idx % 4) * 8;
+
+			while (val > 0 && cnt < mcs_num) {
+				s8 pwr = FIELD_GET(MT_TMAC_FP_MASK, val);
+
+				txpower[cnt++] = pwr;
+				val >>= 8;
+				idx++;
+			}
 		}
 
-		mt76_seq_puts_array(s, sku_group_name[i],
-				    txpower + idx, sku->len);
-		idx += sku->len;
+		mt76_seq_puts_array(s, sku_group_name[i], txpower, mcs_num);
 	}
 }
 
@@ -336,21 +358,16 @@ mt7915_read_rate_txpower(struct seq_file *s, void *data)
 	struct mt7915_dev *dev = dev_get_drvdata(s->private);
 	struct mt76_phy *mphy = &dev->mphy;
 	enum nl80211_band band = mphy->chandef.chan->band;
-	s8 *delta = dev->rate_power[band];
-	s8 txpower_base = mphy->txpower_cur - delta[161];
 
-	seq_puts(s, "Band 0:\n");
-	mt7915_puts_rate_txpower(s, delta, txpower_base, band);
+	seq_puts(s, "Band 0: (unit: 0.5 dBm)\n");
+	mt7915_puts_rate_txpower(s, dev, band, false);
 
 	if (dev->mt76.phy2) {
 		mphy = dev->mt76.phy2;
 		band = mphy->chandef.chan->band;
-		delta = dev->rate_power[band];
-		txpower_base = mphy->txpower_cur -
-			       delta[161];
 
-		seq_puts(s, "Band 1:\n");
-		mt7915_puts_rate_txpower(s, delta, txpower_base, band);
+		seq_puts(s, "Band 1: (unit: 0.5 dBm)\n");
+		mt7915_puts_rate_txpower(s, dev, band, true);
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index c121715..d80ae1e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -67,6 +67,11 @@
 #define MT_TMAC_CTCR0_INS_DDLMT_EN		BIT(17)
 #define MT_TMAC_CTCR0_INS_DDLMT_VHT_SMPDU_EN	BIT(18)
 
+#define MT_TMAC_FP0R0(_band)		MT_WF_TMAC(_band, 0x020)
+#define MT_TMAC_FP0R15(_band)		MT_WF_TMAC(_band, 0x080)
+#define MT_TMAC_FP0R18(_band)		MT_WF_TMAC(_band, 0x270)
+#define MT_TMAC_FP_MASK			GENMASK(7, 0)
+
 /* DMA Band 0 */
 #define MT_WF_DMA_BASE			0x21e00
 #define MT_WF_DMA(ofs)			(MT_WF_DMA_BASE + (ofs))
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
