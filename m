Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD409C2BB85
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:12:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FF002076B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lgd38hS0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H7305qo/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FF002076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YI0fzxISeycUqtipdFSUm+KzUnHhLSjpAxuzd061eYw=; b=Lgd38hS0N0LBdC
	2XrWW4Lom6H74xtD9H6Z9P6tOrQD50XHnAaoUsDLUQJw9XSMdxhmH/XC3bGNAlE2tUO1jZ4DMAqwr
	X0FyPeiyNLfkDhJ66FATcGak/vxhn34T46nQzOVAw8uGnzt/y+Cm2+6U5B4vPEagGXe6LYDjW1fBr
	sVsiso83NXDwfdjG9vQ/p4in851UuoGPExDQ/AwOWoIzhzi4X8FQRmgblIc3ZOsB5BpI/cr2DflYf
	GilHp2fK+POs3eEWW1coZCcLZpfV6br8seN7pet03kOCbKcyzarqhS8sPpFJ1dTNgPyJp0KOSoxsy
	I9dLhpGGuQ3bPJLJVeiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOSqa-0005dT-AA; Tue, 14 Apr 2020 21:11:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOSqR-0005Gb-Do
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 21:11:49 +0000
X-UUID: 256f0696a02644deb0fc1e4b719b0645-20200414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gtRFmRdqSCji8Utk9Fs/rTsemujaNrMM0YbB10ECirI=; 
 b=H7305qo/eM3fOqR/txj/ieeFCkMpschnR7vja92aYDLhG6LfbzBlU/NuiWf+CLscXyhnpm5A2r8cu+qTuONQoGyGnZSKP1Hs+5TTALttxecHBBM6WqAyjcQ9XivJIECETlrbyKiOtEWRGtSYnuNkZl53XsR6J+c8MgWVugjAK64=;
X-UUID: 256f0696a02644deb0fc1e4b719b0645-20200414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2133217414; Tue, 14 Apr 2020 13:11:40 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 14:01:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Apr 2020 05:01:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Apr 2020 05:01:35 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 15/18] mt76: mt7915: set peer Tx fixed rate through debugfs
Date: Wed, 15 Apr 2020 05:01:13 +0800
Message-ID: <e05ade2c9eebaf360d3066812771e89132359170.1586895593.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586895593.git.ryder.lee@mediatek.com>
References: <cover.1586895593.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_141147_477017_D9301F5A 
X-CRM114-Status: GOOD (  10.39  )
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

Driver can manually set fixed rate for each peer through debugfs.

May use .set_bitrate_mask callback and iterate stations under the
current vif to achieve the aim once it supports HE rate.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 13 ++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 46 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 28 +++++++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 +
 4 files changed, 89 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 7f67a1a8013b..cf3b60ded6ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -305,6 +305,18 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 
 /** per-station debugfs **/
 
+/* usage: <tx mode> <ldpc> <stbc> <bw> <gi> <nss> <mcs> */
+static int mt7915_sta_fixed_rate_set(void *data, u64 rate)
+{
+	struct ieee80211_sta *sta = data;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+
+	return mt7915_mcu_set_fixed_rate(msta->vif->dev, sta, rate);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_fixed_rate, NULL,
+			 mt7915_sta_fixed_rate_set, "%llx\n");
+
 static int
 mt7915_sta_stats_read(struct seq_file *s, void *data)
 {
@@ -365,5 +377,6 @@ static const struct file_operations fops_sta_stats = {
 void mt7915_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir)
 {
+	debugfs_create_file("fixed_rate", 0600, dir, sta, &fops_fixed_rate);
 	debugfs_create_file("stats", 0400, dir, sta, &fops_sta_stats);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index e191c79c250e..32bd9e2c73e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1741,6 +1741,52 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	return 0;
 }
 
+int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
+			      struct ieee80211_sta *sta, u32 rate)
+{
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct mt7915_vif *mvif = msta->vif;
+	struct sta_rec_ra_fixed *ra;
+	struct sk_buff *skb;
+	struct tlv *tlv;
+
+	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
+				       MT7915_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	tlv = mt7915_mcu_add_tlv(skb, STA_REC_RA_UPDATE, sizeof(*ra));
+	ra = (struct sta_rec_ra_fixed *)tlv;
+
+	if (!rate) {
+		ra->field = cpu_to_le32(RATE_PARAM_AUTO);
+		goto out;
+	} else {
+		ra->field = cpu_to_le32(RATE_PARAM_FIXED);
+	}
+
+	ra->phy.type = FIELD_GET(RATE_CFG_PHY_TYPE, rate);
+	ra->phy.bw = FIELD_GET(RATE_CFG_BW, rate);
+	ra->phy.nss = FIELD_GET(RATE_CFG_NSS, rate);
+	ra->phy.mcs = FIELD_GET(RATE_CFG_MCS, rate);
+	ra->phy.stbc = FIELD_GET(RATE_CFG_STBC, rate);
+
+	if (ra->phy.bw)
+		ra->phy.ldpc = 7;
+	else
+		ra->phy.ldpc = FIELD_GET(RATE_CFG_LDPC, rate) * 7;
+
+	/* HT/VHT - SGI: 1, LGI: 0; HE - SGI: 0, MGI: 1, LGI: 2 */
+	if (ra->phy.type > MT_PHY_TYPE_VHT)
+		ra->phy.sgi = ra->phy.mcs * 85;
+	else
+		ra->phy.sgi = ra->phy.mcs * 15;
+
+out:
+	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				       MCU_EXT_CMD_STA_REC_UPDATE, true);
+}
+
 int mt7915_mcu_add_dev_info(struct mt7915_dev *dev,
 			    struct ieee80211_vif *vif, bool enable)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index cc0e27730aab..b8d28d971974 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -803,6 +803,34 @@ struct sta_rec_ra {
 	struct ra_phy phy;
 } __packed;
 
+struct sta_rec_ra_fixed {
+	__le16 tag;
+	__le16 len;
+
+	__le32 field;
+	u8 op_mode;
+	u8 op_vht_chan_width;
+	u8 op_vht_rx_nss;
+	u8 op_vht_rx_nss_type;
+
+	struct ra_phy phy;
+
+	u8 spe_en;
+	u8 short_preamble;
+	u8 is_5g;
+	u8 mmps_mode;
+} __packed;
+
+#define RATE_PARAM_FIXED		3
+#define RATE_PARAM_AUTO			20
+#define RATE_CFG_MCS			GENMASK(3, 0)
+#define RATE_CFG_NSS			GENMASK(7, 4)
+#define RATE_CFG_GI			GENMASK(11, 8)
+#define RATE_CFG_BW			GENMASK(15, 12)
+#define RATE_CFG_STBC			GENMASK(19, 16)
+#define RATE_CFG_LDPC			GENMASK(23, 20)
+#define RATE_CFG_PHY_TYPE		GENMASK(27, 24)
+
 enum {
 	STA_REC_BASIC,
 	STA_REC_RA,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 35e34d270c15..e5821d144c85 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -303,6 +303,8 @@ int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta);
 int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd);
 int mt7915_mcu_set_tx(struct mt7915_dev *dev, struct ieee80211_vif *vif);
+int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
+			      struct ieee80211_sta *sta, u32 rate);
 int mt7915_mcu_set_eeprom(struct mt7915_dev *dev);
 int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset);
 int mt7915_mcu_set_mac(struct mt7915_dev *dev, int band, bool enable,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
