Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB97C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 02:33:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9023260FC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 02:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9023260FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snSw3MVIiydgcd1cyWKM7qUhhHetoQ96gCTgVjh8888=; b=hthF7zAXKGgMWa
	98nXgx/pTtqSAhtWmDaXUi1yfEuxxn9CZbaFHriC+th0+zoWvko075ZRNX2ZYQ3hzD3eI2BMy2FqX
	fQFjgU0xA5d/DjNY4yXMaOAP3qdeTi/DkKEfmlUeJWBttSy24eFq7p9Ow7YiCZpam1S1fq6fJUKAL
	m4PQyP4/xvvTAbr4+MRRyy+4D28s51XgGdj9+jCkbrIvDZvAiO4AYpPFvthJtKsBqrejXk2Rv70wv
	Cx00ALNuMciHClHkRzQWowEIZHvODE32p54d5MI8rLVeGreevPFgqP5lVlRDhI10wGT+/rT9rs0KE
	NX0bhymiwsu+F8QeDJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEN07-00Balv-1P; Fri, 13 Aug 2021 02:32:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEN00-00Bajp-TL
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 02:32:49 +0000
X-UUID: e7340af4db2441ada13b817dd576134e-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+ykAYTs7jec1lxs0t+VWbeu1clHm5UsXPycUBFqYZZg=; 
 b=GBzDAdJthDf3+K8T6cpgq206igMS2dWubWA7GFVATwgW5RgpN2Ca0UarMtiVZH5WnqjMxP8IWG35I+3FHyS7IfxtAUM8cc5u0x8QGX38HEy72F6ARu5dQY1GHOAeS8WyZsPKD4/voFPkcYb9hbh69ERZTSEw0iJ7eFfprGP7KxM=;
X-UUID: e7340af4db2441ada13b817dd576134e-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1556174305; Thu, 12 Aug 2021 19:32:37 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 19:32:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 10:32:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 13 Aug 2021 10:32:34 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2 3/3] mt76: mt7915: rework debugfs fixed-rate knob
Date: Fri, 13 Aug 2021 10:32:33 +0800
Message-ID: <dfc47f04c82dae6df42398dc691f8a5dfa04f0c1.1628821139.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1c3fc7ff6d5ab129a58160cd878787d9fbeba9c2.1628821139.git.ryder.lee@mediatek.com>
References: <1c3fc7ff6d5ab129a58160cd878787d9fbeba9c2.1628821139.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_193244_980513_F4A01B6C 
X-CRM114-Status: GOOD (  16.54  )
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

Switch to use new mt7915_mcu_set_fixed_rate_ctrl().

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
@Felix, please ignore the following one 
https://patchwork.kernel.org/project/linux-wireless/patch/c3fd9c4ea692f28e2eb78073fd8da7753199ba60.1628301616.git.ryder.lee@mediatek.com/
[3/4] mt76: mt7915: add HE-LTF into fixed rate command
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 68 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 48 +------------
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 -
 3 files changed, 61 insertions(+), 57 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index d9d18f662039..e1cdfbe52199 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -365,19 +365,71 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 #ifdef CONFIG_MAC80211_DEBUGFS
 /** per-station debugfs **/
 
-static int mt7915_sta_fixed_rate_set(void *data, u64 rate)
+static ssize_t mt7915_sta_fixed_rate_set(struct file *file,
+					 const char __user *user_buf,
+					 size_t count, loff_t *ppos)
 {
-	struct ieee80211_sta *sta = data;
+	struct ieee80211_sta *sta = file->private_data;
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-
-	/* usage: <he ltf> <tx mode> <ldpc> <stbc> <bw> <gi> <nss> <mcs>
-	 * <tx mode>: see enum mt76_phy_type
+	struct mt7915_dev *dev = msta->vif->phy->dev;
+	struct ieee80211_vif *vif;
+	struct sta_phy phy = {};
+	char buf[100];
+	int ret;
+	u32 field;
+	u8 i, gi, he_ltf;
+
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+
+	if (count && buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+	else
+		buf[count] = '\0';
+
+	/* Mode: CCK:0, OFDM:1, HT:2, GF:3, VHT:4, HE_SU:8, HE_ER:9
+	 * BW: BW20:0, BW40:1, BW80:2, BW160:3
+	 * NSS: VHT:1~4, HE:1~4, Others:Ignore
+	 * MCS: CCK:0~4, OFDM:0~7, HT:0~32, VHT:0~9, HE_SU:0~11, HE_ER:0~2
+	 * GI: (HT/VHT) LGI:0, SGI:1; (HE) 0.8us:0, 1.6us:1, 3.2us:2
+	 * LDPC: Off:0, On:1
+	 * STBC: Off:0, On:1
+	 * HE_LTF: 1xLTF:0, 2xLTF:1, 4xLTF:2
 	 */
-	return mt7915_mcu_set_fixed_rate(msta->vif->phy->dev, sta, rate);
+	if (sscanf(buf, "%hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu",
+		   &phy.type, &phy.bw, &phy.nss, &phy.mcs, &gi,
+		   &phy.ldpc, &phy.stbc, &he_ltf) != 8) {
+		dev_warn(dev->mt76.dev,
+			 "format: Mode BW NSS MCS (HE)GI LDPC STBC HE_LTF\n");
+		field = RATE_PARAM_AUTO;
+		goto out;
+	}
+
+	phy.ldpc = (phy.bw || phy.ldpc) * GENMASK(2, 0);
+	for (i = 0; i <= phy.bw; i++) {
+		phy.sgi |= gi << (i << sta->he_cap.has_he);
+		phy.he_ltf |= he_ltf << (i << sta->he_cap.has_he);
+	}
+	field = RATE_PARAM_FIXED;
+
+out:
+	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+	ret = mt7915_mcu_set_fixed_rate_ctrl(dev, vif, sta, &phy, field);
+	if (ret)
+		return -EFAULT;
+
+	return count;
 }
 
-DEFINE_DEBUGFS_ATTRIBUTE(fops_fixed_rate, NULL,
-			 mt7915_sta_fixed_rate_set, "%llx\n");
+static const struct file_operations fops_fixed_rate = {
+	.write = mt7915_sta_fixed_rate_set,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
 
 void mt7915_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 74f08e1c2f55..a21a3760c4fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2065,6 +2065,7 @@ int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 	switch (field) {
 	case RATE_PARAM_AUTO:
 		break;
+	case RATE_PARAM_FIXED:
 	case RATE_PARAM_FIXED_MCS:
 	case RATE_PARAM_FIXED_GI:
 	case RATE_PARAM_FIXED_HE_LTF:
@@ -2416,53 +2417,6 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 				     MCU_EXT_CMD(STA_REC_UPDATE), true);
 }
 
-int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
-			      struct ieee80211_sta *sta, u32 rate)
-{
-	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-	struct mt7915_vif *mvif = msta->vif;
-	struct sta_rec_ra_fixed *ra;
-	struct sk_buff *skb;
-	struct tlv *tlv;
-	int len = sizeof(struct sta_req_hdr) + sizeof(*ra);
-
-	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
-	if (IS_ERR(skb))
-		return PTR_ERR(skb);
-
-	tlv = mt7915_mcu_add_tlv(skb, STA_REC_RA_UPDATE, sizeof(*ra));
-	ra = (struct sta_rec_ra_fixed *)tlv;
-
-	if (!rate) {
-		ra->field = cpu_to_le32(RATE_PARAM_AUTO);
-		goto out;
-	}
-
-	ra->field = cpu_to_le32(RATE_PARAM_FIXED);
-	ra->phy.type = FIELD_GET(RATE_CFG_PHY_TYPE, rate);
-	ra->phy.bw = FIELD_GET(RATE_CFG_BW, rate);
-	ra->phy.nss = FIELD_GET(RATE_CFG_NSS, rate);
-	ra->phy.mcs = FIELD_GET(RATE_CFG_MCS, rate);
-	ra->phy.stbc = FIELD_GET(RATE_CFG_STBC, rate);
-
-	if (ra->phy.bw)
-		ra->phy.ldpc = 7;
-	else
-		ra->phy.ldpc = FIELD_GET(RATE_CFG_LDPC, rate) * 7;
-
-	/* HT/VHT - SGI: 1, LGI: 0; HE - SGI: 0, MGI: 1, LGI: 2 */
-	if (ra->phy.type > MT_PHY_TYPE_VHT) {
-		ra->phy.he_ltf = FIELD_GET(RATE_CFG_HE_LTF, rate) * 85;
-		ra->phy.sgi = FIELD_GET(RATE_CFG_GI, rate) * 85;
-	} else {
-		ra->phy.sgi = FIELD_GET(RATE_CFG_GI, rate) * 15;
-	}
-
-out:
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				     MCU_EXT_CMD(STA_REC_UPDATE), true);
-}
-
 int mt7915_mcu_add_dev_info(struct mt7915_phy *phy,
 			    struct ieee80211_vif *vif, bool enable)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 477a8621550a..c0da97f2774c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -331,8 +331,6 @@ int mt7915_set_channel(struct mt7915_phy *phy);
 int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd);
 int mt7915_mcu_set_tx(struct mt7915_dev *dev, struct ieee80211_vif *vif);
 int mt7915_mcu_update_edca(struct mt7915_dev *dev, void *req);
-int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
-			      struct ieee80211_sta *sta, u32 rate);
 int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
