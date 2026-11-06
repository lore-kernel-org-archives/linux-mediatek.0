Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D92C606A32C
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AYo87Fon;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=iZBI66FK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VXy+6DkRGmcAhjT8O+veT3yOTi5YNXCjc9Q6dpaN8tU=; b=AYo87FonuMH6qJCRsz3mXqd1Uf
	ntPxmiNtQV638yU/OWxMKHcdVaEKXC51+80biQ8hat7kObadhVRocrT37byvwIijBuv9zj34AmcU3
	sAmh+LxFZu9w1kKdnUrQJ6WJ8k8ajGHJ/MuHoEO+Hawh/g9EpOIyhmhB811V2Ax5Wr8RUkWdOvAkF
	9HA78tsFerrPd39ZWt/3P0eMEGRozvpsK3OA3+eLjv27BtAlSqRWBpMUCNS1Pw4pITj6EyTxprgJJ
	lqR+y+aeAkgz+WCSgioEGIpxyen+WvJARbX+N+XKSZWeO+HW+maKfS5giGKXLNEepqJvQO89h08YF
	+H1WFKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFL6-0000000BZUB-3AWP;
	Fri, 06 Nov 2026 08:30:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFL0-0000000BZLF-3f8U
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:22 +0000
X-UUID: 4876fed6d9bc11f1afed4741b24580c9-20261106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VXy+6DkRGmcAhjT8O+veT3yOTi5YNXCjc9Q6dpaN8tU=;
	b=iZBI66FK9yKn6IKNdhz5BtW2qqeHf465PHSaUIzn86y8ZOu8VBtBE0JeLNOn/r6pvYwNvbNnwvWtOzEVjdFpMhxOddUulMuQDPx767mOE+B2MRnEy4IXrjQDh/y5ikTjNlKpFFuPJ9zlFBGEx0JmLKShAcG3yjRIensfznpty7c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:6e9e522a-c99f-4d61-8056-16c0e47838c1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:ba932aee-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4876fed6d9bc11f1afed4741b24580c9-20261106
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <james-ly.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1639511385; Fri, 06 Nov 2026 01:30:11 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 6 Nov 2026 16:30:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 6 Nov 2026 16:30:09 +0800
From: James-LY Huang <james-ly.huang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<sean.wang@mediatek.com>, <jb.tsai@mediatek.com>, <kun.wu@mediatek.com>,
	<James-LY.Huang@mediatek.com>, james-ly huang <james-ly.huang@mediatek.com>
Subject: [PATCH v2 3/9] wifi: mt76: mt7925: give every P2P interface a BMC wcid of its own
Date: Fri, 6 Nov 2026 16:29:58 +0800
Message-ID: <20261106083004.3156085-4-james-ly.huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261106083004.3156085-1-james-ly.huang@mediatek.com>
References: <20261106083004.3156085-1-james-ly.huang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003018_942635_175929B8 
X-CRM114-Status: GOOD (  22.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: james-ly huang <james-ly.huang@mediatek.com>

Give every P2P interface (P2P device, GO, GC) a BMC wcid of its own,
kept for its whole interface lifetime:

- group keys are installed on the BMC wcid as well;
- add_bss_info reports the BMC wcid as the bss's basic bmc_tx_wlan_idx.

Signed-off-by: james-ly huang <james-ly.huang@mediatek.com>
---
v2: no change
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  3 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 27 +++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  4 +-
 .../net/wireless/mediatek/mt76/mt7925/p2p.c   | 66 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/p2p.h   |  6 ++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 11 ++++
 8 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 477d33a0022d..ab606e47e96f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -835,6 +835,7 @@ struct mt76_vif_link {
 	u8 basic_rates_idx;
 	u8 mcast_rates_idx;
 	u8 beacon_rates_idx;
+	u8 bmc_wcid; /* 0: bmc shares the vif wcid */
 	bool offchannel;
 	unsigned long beacon_mon_last;
 	u16 beacon_mon_interval;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index ad53bb60d5cd..f4cd42bcc80e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1240,7 +1240,8 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 			.band_idx = mvif->band_idx,
 			.wmm_idx = mvif->wmm_idx,
 			.active = enable,
-			.bmc_tx_wlan_idx = cpu_to_le16(wcid->idx),
+			.bmc_tx_wlan_idx = cpu_to_le16(mvif->bmc_wcid ?:
+						       wcid->idx),
 			.sta_idx = cpu_to_le16(wcid->idx),
 			.conn_state = 1,
 			.link_idx = mvif->link_idx,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index ffbc6b954632..3fa6c48c6549 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -8,6 +8,7 @@
 #include <linux/ctype.h>
 #include <net/ipv6.h>
 #include "mt7925.h"
+#include "p2p.h"
 #include "regd.h"
 #include "mcu.h"
 #include "mac.h"
@@ -437,10 +438,18 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], &mlink->wcid);
 
+	if (vif->p2p || vif->type == NL80211_IFTYPE_P2P_DEVICE) {
+		ret = mt7925_p2p_bmc_add(dev, mconf);
+		if (ret)
+			goto out;
+	}
+
 	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
 					  &mlink->wcid, true);
-	if (ret)
+	if (ret) {
+		mt7925_p2p_bmc_remove(dev, mconf);
 		goto out;
+	}
 
 	if (vif->txq) {
 		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
@@ -493,8 +502,13 @@ mt7925_remove_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_bss_conf *mconf;
 
+	mt792x_remove_interface(hw, vif);
+
 	mt792x_mutex_acquire(dev);
 
+	/* the p2p device owns a BMC wcid for its whole life time */
+	mt7925_p2p_bmc_remove(dev, mt792x_link_conf_to_mconf(&vif->bss_conf));
+
 	if (dev->nan_vif == vif)
 		dev->nan_vif = NULL;
 
@@ -720,6 +734,17 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	if (err)
 		goto out;
 
+	/* group keys protect the frames that now go out on the dedicated BMC
+	 * entry, so they have to be installed on that wcid as well
+	 */
+	if (!sta && mconf->bmc_valid) {
+		err = mt7925_mcu_add_key(&dev->mt76, vif, &mconf->bmc.bip,
+					 key, MCU_UNI_CMD(STA_REC_UPDATE),
+					 &mconf->bmc.wcid, cmd, msta);
+		if (err)
+			goto out;
+	}
+
 	if (key->cipher == WLAN_CIPHER_SUITE_WEP104 ||
 	    key->cipher == WLAN_CIPHER_SUITE_WEP40)
 		err = mt7925_mcu_add_key(&dev->mt76, vif, &mvif->wep_sta->deflink.bip,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 50f5f57b740e..3eadea1bb453 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3223,7 +3223,9 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	}
 
 	return mt7925_mcu_add_bss_info_sta(phy, ctx, link_conf, link_sta,
-					   mlink_bc->wcid.idx, mlink->wcid.idx, enable);
+					   mconf->bmc_valid ? mconf->bmc.wcid.idx :
+							      mlink_bc->wcid.idx,
+					   mlink->wcid.idx, enable);
 }
 
 int mt7925_mcu_set_dbdc(struct mt76_phy *phy, bool enable)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/p2p.c b/drivers/net/wireless/mediatek/mt76/mt7925/p2p.c
index 5dad902a0446..4e41ba9beca1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/p2p.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/p2p.c
@@ -361,3 +361,69 @@ mt7925_p2p_rx_drop_chan_mismatch(struct mt792x_dev *dev, struct sk_buff *skb)
 	return false;
 }
 
+/* ------------------------------------------------------------------ */
+/* BMC wcid bookkeeping                                                 */
+/* ------------------------------------------------------------------ */
+
+/* The BMC entry itself is set up by the firmware from the
+ * bmc_tx_wlan_idx of the BSS_INFO_BASIC tlv, so the driver
+ * only has to reserve the index and keep a wcid around for it.
+ */
+int mt7925_p2p_bmc_add(struct mt792x_dev *dev,
+		       struct mt792x_bss_conf *mconf)
+{
+	struct mt792x_link_sta *mbmc = &mconf->bmc;
+	int idx;
+
+	if (mconf->bmc_valid)
+		return 0;
+
+	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
+	if (idx < 0)
+		return -ENOSPC;
+
+	memset(mbmc, 0, sizeof(*mbmc));
+	INIT_LIST_HEAD(&mbmc->wcid.poll_list);
+	mbmc->wcid.idx = idx;
+	mbmc->wcid.phy_idx = 0;
+	mbmc->wcid.hw_key_idx = -1;
+	mbmc->wcid.hw_key_idx2 = -1;
+	mbmc->wcid.tx_info |= MT_WCID_TX_INFO_SET;
+	mbmc->wcid.link_id = mconf->link_id;
+	mt76_wcid_init(&mbmc->wcid, 0);
+
+	rcu_assign_pointer(dev->mt76.wcid[idx], &mbmc->wcid);
+	mt7925_mac_wtbl_update(dev, idx, MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	mconf->mt76.bmc_wcid = idx;
+	mconf->bmc_valid = true;
+
+	dev_info(dev->mt76.dev,
+		 "[James] p2p bss%d BMC wcid=%d (bss default wcid=%d)\n",
+		 mconf->mt76.idx, idx, mconf->vif->sta.deflink.wcid.idx);
+
+	return 0;
+}
+
+void mt7925_p2p_bmc_remove(struct mt792x_dev *dev,
+			   struct mt792x_bss_conf *mconf)
+{
+	struct mt76_wcid *wcid = &mconf->bmc.wcid;
+
+	if (!mconf->bmc_valid)
+		return;
+
+	mconf->bmc_valid = false;
+	mconf->mt76.bmc_wcid = 0;
+
+	mt76_connac_free_pending_tx_skbs(&dev->pm, wcid);
+	rcu_assign_pointer(dev->mt76.wcid[wcid->idx], NULL);
+
+	spin_lock_bh(&dev->mt76.sta_poll_lock);
+	if (!list_empty(&wcid->poll_list))
+		list_del_init(&wcid->poll_list);
+	spin_unlock_bh(&dev->mt76.sta_poll_lock);
+
+	mt76_wcid_cleanup(&dev->mt76, wcid);
+	mt76_wcid_mask_clear(dev->mt76.wcid_mask, wcid->idx);
+}
+
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/p2p.h b/drivers/net/wireless/mediatek/mt76/mt7925/p2p.h
index b005eebbfdca..25b6c57749a2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/p2p.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/p2p.h
@@ -38,6 +38,7 @@ static inline bool mt7925_is_p2p_go_probe_resp(struct sk_buff *skb)
 
 	return ieee80211_is_probe_resp(mgmt->frame_control);
 }
+
 /* TX/RX path overrides, BMC wcid bookkeeping and the P2P-only MCU event
  * handlers.
  */
@@ -46,4 +47,9 @@ bool mt7925_p2p_rx_drop_chan_mismatch(struct mt792x_dev *dev,
 void mt7925_p2p_txwi_override(struct mt76_dev *dev, __le32 *txwi,
 			      struct sk_buff *skb);
 
+int mt7925_p2p_bmc_add(struct mt792x_dev *dev,
+		       struct mt792x_bss_conf *mconf);
+void mt7925_p2p_bmc_remove(struct mt792x_dev *dev,
+			   struct mt792x_bss_conf *mconf);
+
 #endif /* __MT7925_P2P_H */
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index a7d71e007da0..66c8722220cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -163,6 +163,8 @@ struct mt792x_bss_conf {
 	struct ewma_rssi rssi;
 	struct ieee80211_tx_queue_params queue_params[IEEE80211_NUM_ACS];
 	unsigned int link_id;
+	struct mt792x_link_sta bmc;
+	bool bmc_valid;
 };
 
 struct mt792x_nan_conf {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index dbea3c2e626f..fa29af8fff49 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -4,6 +4,7 @@
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/slab.h>
+#include <linux/etherdevice.h>
 
 #include "mt792x.h"
 #include "dma.h"
@@ -188,10 +189,20 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	}
 
 	if (vif && !control->sta) {
+		struct mt792x_bss_conf *mconf;
 		struct mt792x_vif *mvif;
+		const u8 *da;
 
 		mvif = (struct mt792x_vif *)vif->drv_priv;
+		mconf = &mvif->bss_conf;
 		wcid = &mvif->sta.deflink.wcid;
+
+		da = (info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) ?
+		     skb->data :
+		     ((struct ieee80211_hdr *)skb->data)->addr1;
+
+		if (mconf->bmc_valid && is_multicast_ether_addr(da))
+			wcid = &mconf->bmc.wcid;
 	}
 
 	if (vif && control->sta && ieee80211_vif_is_mld(vif) &&
-- 
2.45.2


