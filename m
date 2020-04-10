Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E2BC2D0EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 23:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70222087E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 23:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AGXGxIj4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gvpRPSci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70222087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rljUJVoh99ta777ZebR+UYhBlXpv5EhnhryNSK9b2sc=; b=AGXGxIj4GSIATc
	LISfMH1Q52stfpiL4zbDb5t6tjlUmSstZn01xuJzOMW9FEBjMXYAclfcmv1P9JN5nVxXjLw/lLVIR
	tdYkTkVbuR35GWRqa8VgsZlfRmi1WrojzgtyWRyruBqqg4GV0K4rALlV3UjiBJ5M3spyEm5wDekS9
	ngnoZalhfi7ORDEhz/dtEAgA9iWS+gILctii2k90RKfbfTvP4HGrx64IPSnyuUbweatfqABOfb00Q
	31/dqyC0n6LV7EDvZMWrp2oLMy40w0VHxFLmx//MVAIt2GWajyDXnDGUbyiehMBa0ykF8c20Ms/OV
	Xa5rGUtxKD9EeJfUCyIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jN2f8-0000aQ-Bs; Fri, 10 Apr 2020 23:02:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jN2ez-0000Cc-5B
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 23:02:07 +0000
X-UUID: 9fec5768b2f04505a6fdd8aae90ea987-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ufvewpS7ceVAwF6OMVoL1ERRAtr7P1iR2Z4WpCjrR7k=; 
 b=gvpRPSci3Ft7uHTmEhBAdHwvj0fydfAXOV+u32dQxgxbJPmKk6IqrzzJ6Od2TfaZvMxtplDvqlTeIJxPo5Vle5fgr3GYttD/EMGB5RadG0nKLLm7GEH6MSn71OI2+iANZoMPrD10qYHwUP8h7+MQanB2BK6+YeTfQC9qEl78nfM=;
X-UUID: 9fec5768b2f04505a6fdd8aae90ea987-20200410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 591043026; Fri, 10 Apr 2020 15:01:58 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:51:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 06:51:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Apr 2020 06:51:46 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 08/16] mt76: mt7915: add offloading Tx AMSDU support
Date: Sat, 11 Apr 2020 06:51:23 +0800
Message-ID: <668c94040bd2e7ec0fb166b6b2ad548da21b7bd1.1586558901.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586558901.git.ryder.lee@mediatek.com>
References: <cover.1586558901.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7FBEB1D4E1DD72381369EE894C11405AD255479EFB6238CFD93947A7A70F9C1D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_160205_263886_6A78951F 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add module parameter to enable hw_tx_amsdu.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Tested-by: Chih-Min Chen <chih-min.chen@mediatek.com>
Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Suggested-by: Yiwei Chung <yiwei.chung@mediatek.com>
Suggested-by: YF Luo <yf.luo@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  5 ++-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  4 ++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 34 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 20 +++++++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  8 +++++
 6 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 2e10064cccc1..649ba9d55d99 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -236,7 +236,10 @@ mt7915_init_wiphy(struct ieee80211_hw *hw)
 
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
 
-	hw->max_tx_fragments = 4;
+	if (phy->dev->hw_tx_amsdu)
+		hw->max_tx_fragments = 1;
+	else
+		hw->max_tx_fragments = 4;
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 511a6d2e8dd1..a9efee42dce2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -525,7 +525,9 @@ void mt7915_mac_write_txwi(struct mt7915_dev *dev, __le32 *txwi,
 	txwi[7] = cpu_to_le32(val);
 
 	val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, tx_count);
-	if (ieee80211_is_data_qos(fc)) {
+	if (dev->hw_tx_amsdu && ieee80211_is_data_qos(fc)) {
+		txwi[7] |= MT_TXD7_HW_AMSDU;
+	} else if (ieee80211_is_data_qos(fc)) {
 		seqno = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
 		val |= MT_TXD3_SN_VALID;
 	} else if (ieee80211_is_back_req(fc)) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 59cd50db2ecf..a6b9d1a95f04 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -85,6 +85,8 @@ struct mt7915_fw_region {
 #define to_wcid_lo(id)			FIELD_GET(GENMASK(7, 0), (u16)id)
 #define to_wcid_hi(id)			FIELD_GET(GENMASK(9, 8), (u16)id)
 
+#define HW_TX_AMSDU_MAX_NUM		8
+
 static enum mt7915_cipher_type
 mt7915_mcu_get_cipher(int cipher)
 {
@@ -786,6 +788,23 @@ mt7915_mcu_bss_ra_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	ra->fast_interval = cpu_to_le32(100);
 }
 
+static void
+mt7915_mcu_bss_hw_amsdu_tlv(struct sk_buff *skb)
+{
+#define TXD_CMP_MAP1		GENMASK(15, 0)
+#define TXD_CMP_MAP2		(GENMASK(31, 0) & ~BIT(23))
+	struct bss_info_hw_amsdu *amsdu;
+	struct tlv *tlv;
+
+	tlv = mt7915_mcu_add_tlv(skb, BSS_INFO_HW_AMSDU, sizeof(*amsdu));
+
+	amsdu = (struct bss_info_hw_amsdu *)tlv;
+	amsdu->cmp_bitmap_0 = cpu_to_le32(TXD_CMP_MAP1);
+	amsdu->cmp_bitmap_1 = cpu_to_le32(TXD_CMP_MAP2);
+	amsdu->trig_thres = cpu_to_le16(2);
+	amsdu->enable = true;
+}
+
 static void
 mt7915_mcu_bss_ext_tlv(struct sk_buff *skb, struct mt7915_vif *mvif)
 {
@@ -861,6 +880,9 @@ int mt7915_mcu_add_bss_info(struct mt7915_phy *phy,
 		mt7915_mcu_bss_bmc_tlv(skb, phy);
 		mt7915_mcu_bss_ra_tlv(skb, vif, phy);
 
+		if (phy->dev->hw_tx_amsdu)
+			mt7915_mcu_bss_hw_amsdu_tlv(skb);
+
 		if (mvif->omac_idx > HW_BSSID_MAX)
 			mt7915_mcu_bss_ext_tlv(skb, mvif);
 		else
@@ -1145,6 +1167,18 @@ mt7915_mcu_sta_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 		tlv = mt7915_mcu_add_tlv(skb, STA_REC_HT, sizeof(*ht));
 		ht = (struct sta_rec_ht *)tlv;
 		ht->ht_cap = cpu_to_le16(sta->ht_cap.cap);
+
+		/* starec hw amsdu */
+		if (dev->hw_tx_amsdu) {
+			struct sta_rec_amsdu *amsdu;
+
+			tlv = mt7915_mcu_add_tlv(skb, STA_REC_HW_AMSDU,
+						 sizeof(*amsdu));
+			amsdu = (struct sta_rec_amsdu *)tlv;
+			amsdu->max_amsdu_num = HW_TX_AMSDU_MAX_NUM;
+			amsdu->amsdu_en = true;
+			amsdu->max_mpdu_size = sta->max_amsdu_len;
+		}
 	}
 
 	/* starec vht */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index d9c9aab7e6dc..867cab7cf145 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -396,6 +396,16 @@ struct bss_info_ra {
 	__le32 fast_interval;
 } __packed;
 
+struct bss_info_hw_amsdu {
+	__le16 tag;
+	__le16 len;
+	__le32 cmp_bitmap_0;
+	__le32 cmp_bitmap_1;
+	__le16 trig_thres;
+	u8 enable;
+	u8 rsv;
+} __packed;
+
 struct bss_info_bcn {
 	__le16 tag;
 	__le16 len;
@@ -659,6 +669,15 @@ struct sta_rec_ba {
 	__le16 winsize;
 } __packed;
 
+struct sta_rec_amsdu {
+	__le16 tag;
+	__le16 len;
+	u8 max_amsdu_num;
+	u8 max_mpdu_size;
+	u8 amsdu_en;
+	u8 rsv;
+} __packed;
+
 struct sec_key {
 	u8 cipher_id;
 	u8 cipher_len;
@@ -796,6 +815,7 @@ enum {
 					 sizeof(struct sta_rec_ba) +	\
 					 sizeof(struct sta_rec_vht) +	\
 					 sizeof(struct tlv) +		\
+					 sizeof(struct sta_rec_amsdu) +	\
 					 sizeof(struct sta_rec_sec) +	\
 					 sizeof(struct sta_rec_ra) +	\
 					 MT7915_WTBL_UPDATE_MAX_SIZE)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index b502bcc985ec..7f569a7a0c9b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -167,6 +167,7 @@ struct mt7915_dev {
 
 	u8 mac_work_count;
 	bool fw_debug;
+	bool hw_tx_amsdu;
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index e1bf71b15810..a98e91163971 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -12,6 +12,10 @@
 #include "mac.h"
 #include "../trace.h"
 
+static bool hw_tx_amsdu;
+module_param_named(enable_hw_tx_amsdu, hw_tx_amsdu, bool, 0644);
+MODULE_PARM_DESC(enable_hw_tx_amsdu, "enable Hardware Tx AMSDU");
+
 static const struct pci_device_id mt7915_pci_device_table[] = {
 	{ PCI_DEVICE(0x14c3, 0x7915) },
 	{ },
@@ -150,6 +154,10 @@ static int mt7915_pci_probe(struct pci_dev *pdev,
 		    (mt7915_l1_rr(dev, MT_HW_REV) & 0xff);
 	dev_dbg(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
 
+	/* TODO: more hw capabilities */
+	if (hw_tx_amsdu)
+		dev->hw_tx_amsdu = true;
+
 	/* master switch of PCIe tnterrupt enable */
 	mt7915_l1_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
