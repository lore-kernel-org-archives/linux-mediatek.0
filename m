Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408D2C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 10:34:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E22F061181
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 10:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E22F061181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nGw0QYgfQZ3nr1gRvetE6XnaUgqUzx04JGeSyrae2FU=; b=qpCWfAM6p65k/m
	JZeERsn30DNjXm1KSxC1e3j7kEDLqL3/B7KSHB1QYjb8wj0oANEycRCiSrsZdPYVSR03TcQb+1nSq
	81s8kr5m5WVhMDilhEt4AJp0aBX21tnHkf++QbffLXY7CPYBJh6nQinWUJUsQWBUxMYpTBiw7Ef2N
	wE1om7xNqb+yzqcmFqOHSR5SKUl24k0GSOZSUpibxCu/5xnLyfcCXiFjsscXnGup2ZUSmUPkeM7kv
	isqHT+D8PJDjC6nDbeY56ZL3saG1sg2V1OBhe4p32o36VR3RJJu3EYP+YJ0kd+jav/P7yLsujhrKy
	e46XxRZ5Q96VVSdiq1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llUOJ-004Zyn-PB; Tue, 25 May 2021 10:34:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llUOF-004Zxa-FG
 for linux-mediatek@lists.infradead.org; Tue, 25 May 2021 10:34:26 +0000
X-UUID: 2bc34845ac8b4ca5a9a56d9fe375e6bd-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=p5sOagU7e25ttAgVN2RXgCVifv1utXCoKMU0WkhU8Yo=; 
 b=d0VCneDWSPDdy8lYQviB+d/DWlObN2ghSth1YOO2qhtrw4K+EFYztxhbD5kSxzwz/qxzfJLUZsMEaJVwU0eDgsAFFRJ9aJ3ZzkeYZ3Srjlqcbrifr55okw86HYdZQYjM4+zShFRB2RShevcC3JLXVnos1Qi7Vw1ujtHNoTdOSWQ=;
X-UUID: 2bc34845ac8b4ca5a9a56d9fe375e6bd-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2098715501; Tue, 25 May 2021 03:34:21 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 03:34:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 18:34:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 25 May 2021 18:34:18 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
 <shayne.chen@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: use mt7915_mcu_get_txpower_sku() to get
 per-rate txpower
Date: Tue, 25 May 2021 18:34:09 +0800
Message-ID: <20210525103409.1537-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_033423_555940_90698AF0 
X-CRM114-Status: GOOD (  15.96  )
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

Get per-rate txpower with mcu command. This is the preparation of
co-driver for the next chipset, which has different tmac power registers
but can share this same command.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2: - revise commit message
    - concise some local variables
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 49 ++++---------------
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 34 ++++++++++++-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  3 ++
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 --
 4 files changed, 45 insertions(+), 46 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 6a8ddee..95a6957 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -307,54 +307,23 @@ mt7915_puts_rate_txpower(struct seq_file *s, struct mt7915_phy *phy)
 		"RU26", "RU52", "RU106", "RU242/SU20",
 		"RU484/SU40", "RU996/SU80", "RU2x996/SU160"
 	};
-	struct mt7915_dev *dev = dev_get_drvdata(s->private);
-	bool ext_phy = phy != &dev->phy;
-	u32 reg_base;
-	int i, idx = 0;
+	s8 txpower[MT7915_SKU_RATE_NUM], *buf;
+	int i;
 
 	if (!phy)
 		return;
 
-	reg_base = MT_TMAC_FP0R0(ext_phy);
-	seq_printf(s, "\nBand %d\n", ext_phy);
+	seq_printf(s, "\nBand %d\n", phy != &phy->dev->phy);
 
-	for (i = 0; i < ARRAY_SIZE(mt7915_sku_group_len); i++) {
-		u8 cnt, mcs_num = mt7915_sku_group_len[i];
-		s8 txpower[12];
-		int j;
+	mt7915_mcu_get_txpower_sku(phy, txpower, sizeof(txpower));
+	for (i = 0, buf = txpower; i < ARRAY_SIZE(mt7915_sku_group_len); i++) {
+		u8 mcs_num = mt7915_sku_group_len[i];
 
-		if (i == SKU_HT_BW20 || i == SKU_HT_BW40) {
-			mcs_num = 8;
-		} else if (i >= SKU_VHT_BW20 && i <= SKU_VHT_BW160) {
+		if (i >= SKU_VHT_BW20 && i <= SKU_VHT_BW160)
 			mcs_num = 10;
-		} else if (i == SKU_HE_RU26) {
-			reg_base = MT_TMAC_FP0R18(ext_phy);
-			idx = 0;
-		}
-
-		for (j = 0, cnt = 0; j < DIV_ROUND_UP(mcs_num, 4); j++) {
-			u32 val;
-
-			if (i == SKU_VHT_BW160 && idx == 60) {
-				reg_base = MT_TMAC_FP0R15(ext_phy);
-				idx = 0;
-			}
-
-			val = mt76_rr(dev, reg_base + (idx / 4) * 4);
-
-			if (idx && idx % 4)
-				val >>= (idx % 4) * 8;
-
-			while (val > 0 && cnt < mcs_num) {
-				s8 pwr = FIELD_GET(MT_TMAC_FP_MASK, val);
-
-				txpower[cnt++] = pwr;
-				val >>= 8;
-				idx++;
-			}
-		}
 
-		mt76_seq_puts_array(s, sku_group_name[i], txpower, mcs_num);
+		mt76_seq_puts_array(s, sku_group_name[i], buf, mcs_num);
+		buf += mt7915_sku_group_len[i];
 	}
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index dcf2d4d..f4cadfc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3514,7 +3514,6 @@ int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx)
 
 int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy)
 {
-#define MT7915_SKU_RATE_NUM		161
 	struct mt7915_dev *dev = phy->dev;
 	struct mt76_phy *mphy = phy->mt76;
 	struct ieee80211_hw *hw = mphy->hw;
@@ -3564,6 +3563,39 @@ int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy)
 				 sizeof(req), true);
 }
 
+int mt7915_mcu_get_txpower_sku(struct mt7915_phy *phy, s8 *txpower, int len)
+{
+#define RATE_POWER_INFO	2
+	struct mt7915_dev *dev = phy->dev;
+	struct {
+		u8 format_id;
+		u8 category;
+		u8 band;
+		u8 _rsv;
+	} __packed req = {
+		.format_id = 7,
+		.category = RATE_POWER_INFO,
+		.band = phy != &dev->phy,
+	};
+	s8 res[MT7915_SKU_RATE_NUM][2];
+	struct sk_buff *skb;
+	int ret, i;
+
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_EXT_CMD(TX_POWER_FEATURE_CTRL),
+					&req, sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+
+	memcpy(res, skb->data + 4, sizeof(res));
+	for (i = 0; i < len; i++)
+		txpower[i] = res[i][req.band];
+
+	dev_kfree_skb(skb);
+
+	return 0;
+}
+
 int mt7915_mcu_set_test_param(struct mt7915_dev *dev, u8 param, bool test_mode,
 			      u8 en)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index c4bf8ed..1f7e57d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -38,6 +38,8 @@
 #define MT7915_5G_RATE_DEFAULT		0x4b	/* OFDM 6M */
 #define MT7915_2G_RATE_DEFAULT		0x0	/* CCK 1M */
 
+#define MT7915_SKU_RATE_NUM		161
+
 struct mt7915_vif;
 struct mt7915_sta;
 struct mt7915_dfs_pulse;
@@ -343,6 +345,7 @@ int mt7915_mcu_set_rts_thresh(struct mt7915_phy *phy, u32 val);
 int mt7915_mcu_set_pm(struct mt7915_dev *dev, int band, int enter);
 int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable);
 int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy);
+int mt7915_mcu_get_txpower_sku(struct mt7915_phy *phy, s8 *txpower, int len);
 int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev);
 int mt7915_mcu_set_txbf_module(struct mt7915_dev *dev);
 int mt7915_mcu_set_txbf_sounding(struct mt7915_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 48e4b22..ee525e7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -82,11 +82,6 @@
 #define MT_TMAC_CTCR0_INS_DDLMT_EN		BIT(17)
 #define MT_TMAC_CTCR0_INS_DDLMT_VHT_SMPDU_EN	BIT(18)
 
-#define MT_TMAC_FP0R0(_band)		MT_WF_TMAC(_band, 0x020)
-#define MT_TMAC_FP0R15(_band)		MT_WF_TMAC(_band, 0x080)
-#define MT_TMAC_FP0R18(_band)		MT_WF_TMAC(_band, 0x270)
-#define MT_TMAC_FP_MASK			GENMASK(7, 0)
-
 #define MT_TMAC_TFCR0(_band)		MT_WF_TMAC(_band, 0x1e0)
 
 #define MT_WF_DMA_BASE(_band)		((_band) ? 0xa1e00 : 0x21e00)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
