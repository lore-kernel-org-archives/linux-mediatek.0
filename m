Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84901606E637
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dJhM5di9;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=eQmH04e5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tAFaxHtSbT4bSy+q2NlH+YnpZpv8H4T8vLXMWYMG+aQ=; b=dJhM5di9tID3IjdNf4EIqMbAB1
	IhLcuTU3pUcPvFacoBVNccPp0mEvT1jvg3eEdL2F8TJjB7GbQsbAw3eKdXqPkwaq4j4SBdhN3tQcH
	gLR2ZqV0oDicJxRs993nJnUYcLkryg4fQU+lJmz8BbDzHt/qqUviuamh3Y7pnyfO+HA3G4BV06X4F
	yNE1BoMeJko1PQGcIfuCn0X8osdepWER/V90b+Wg6BztNbvUpdSFryTRusu4/02s2AcgrlKYRvZgS
	xnT9sN3xAqtKbwQTGElEOJjfftanmdGfviNxuwV62CSZVVIFWrSWZJFb31DMjwZe+WmqVvG9emdtE
	8MYlM7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ5-00000002Fg6-40G5;
	Tue, 10 Nov 2026 03:13:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIs-00000002FIT-0TIy
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:49 +0000
X-UUID: b92b2e68dcb411f1acbe4559397dec65-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tAFaxHtSbT4bSy+q2NlH+YnpZpv8H4T8vLXMWYMG+aQ=;
	b=eQmH04e5ZSCjefpVG51GsS8lzT5zUxxgMr8CLM5aoudRUSakYOe5zvi2jXtgJPh37KMPM+YCCbqpPysSj8g9r2rhIHTKE8Xc6BEcPTJsUBcdXVCc8pPOSzgWsLYkRZvQb80lBNUVV6i8inVMz0qpzzmJKiDWlilHh9XsAfMd/XA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f42c0423-a863-4859-88ea-fd57af325d84,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:611ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b92b2e68dcb411f1acbe4559397dec65-20261109
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1623335654; Mon, 09 Nov 2026 20:13:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:36 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 26/28] wifi: mt76: mt7925: remap hybrid-MLO TX to the primary link OMAC
Date: Tue, 10 Nov 2026 11:12:42 +0800
Message-ID: <20261110031244.369014-27-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191346_207969_14BCAF2C 
X-CRM114-Status: GOOD (  19.03  )
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

In 3-link hybrid MLO the firmware aggregates all links under the primary
link OMAC. Derive the TX OM-remap index from the current valid_links when
the BSS MLD TLV is built, set it there and in the TXD with OM_MAP (BIT(9)
on MT7925 and MT7928, BIT(8) otherwise). Without hybrid MLO the TXD is
unchanged.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  | 13 ++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |  7 +++++++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 15 ++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt792x.h      |  4 ++++
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 20acfcb9d1b9..6668a0c9a28d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -761,6 +761,7 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 	bool inband_disc = !!(changed & (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
 					 BSS_CHANGED_FILS_DISCOVERY));
 	struct mt792x_bss_conf *mconf;
+	u32 om_map = 0;
 
 	mconf = vif ? mt792x_vif_to_link((struct mt792x_vif *)vif->drv_priv,
 					 wcid->link_id) : NULL;
@@ -772,6 +773,16 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		band_idx = mvif->band_idx;
 	}
 
+	/* hybrid MLO: send every link under the primary OMAC via the OM remap
+	 * table
+	 */
+	if (mconf && mconf->om_remap_idx != MT792x_OM_REMAP_IDX_NONE) {
+		omac_idx = mconf->om_remap_idx;
+		/* OM_MAP is BIT(9) on MT7925/MT7928, BIT(8) on other chips */
+		om_map = is_mt7925(dev) || is_mt7928(dev) ?
+			 MT_TXD2_OWN_MAC_MAP_V2 : MT_TXD2_OWN_MAC_MAP;
+	}
+
 	if (inband_disc) {
 		p_fmt = MT_TX_TYPE_FW;
 		q_idx = MT_LMAC_ALTX0;
@@ -804,7 +815,7 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		val |= FIELD_PREP(MT_TXD1_TGID, band_idx);
 
 	txwi[1] = cpu_to_le32(val);
-	txwi[2] = 0;
+	txwi[2] = cpu_to_le32(om_map);
 
 	val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 15);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 2b1346044c5a..d272c06df254 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -403,6 +403,11 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 		mconf->mt76.omac_idx = mvif->bss_conf.mt76.idx;
 	else
 		mconf->mt76.omac_idx = mconf->mt76.idx;
+	/* The hybrid-MLO TX OM remap index is derived per BSS_INFO from the
+	 * current valid_links in mt7925_mcu_bss_mld_tlv(), not here: the deflink
+	 * is added before the MLD exists.
+	 */
+	mconf->om_remap_idx = MT792x_OM_REMAP_IDX_NONE;
 	mconf->mt76.band_idx = MT792x_BAND_AUTO;
 
 	mconf->absent = false;
@@ -1538,6 +1543,7 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 
 		/* reset to auto band so the deactivate drops the band binding */
 		mconf->mt76.band_idx = MT792x_BAND_AUTO;
+		mconf->om_remap_idx = MT792x_OM_REMAP_IDX_NONE;
 		/* back to the legacy WMM index, MLO uses 0 */
 		mconf->mt76.wmm_idx = mconf->mt76.idx %
 				      MT76_CONNAC_MAX_WMM_SETS;
@@ -1608,6 +1614,7 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 
 		/* reset to auto band before the disconnect command */
 		mconf->mt76.band_idx = MT792x_BAND_AUTO;
+		mconf->om_remap_idx = MT792x_OM_REMAP_IDX_NONE;
 
 		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
 					link_sta, false);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 2c2ab85180c4..d02242870115 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3272,10 +3272,14 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	struct bss_mld_tlv *mld;
 	struct tlv *tlv;
 	bool is_mld;
+	bool is_hybrid;
 	bool is_supported_ap = false;
 
 	is_mld = ieee80211_vif_is_mld(link_conf->vif) ||
 		 (hweight16(mvif->valid_links) > 1);
+	/* three links means hybrid MLO */
+	is_hybrid = hweight16(mvif->valid_links) >= 3 &&
+		    (phy->chip_cap & BIT(MT792x_CHIP_CAP_MLO_HYBRID_EN));
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_MLD, sizeof(*mld));
 	mld = (struct bss_mld_tlv *)tlv;
@@ -3284,7 +3288,16 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	/* apply the index of the primary link */
 	mld->group_mld_id = is_mld ? mvif->bss_conf.mt76.idx : 0xff;
 	mld->own_mld_id = mconf->mt76.idx + 32;
-	mld->remap_idx = 0xff;
+	/* Hybrid MLO remaps every link's TX OWN_MAC to the primary link OMAC;
+	 * derive it here from the current valid_links so the deflink (added
+	 * before the MLD existed) is covered too, and cache it for the TX path.
+	 */
+	mld->remap_idx = is_hybrid ? mvif->bss_conf.mt76.omac_idx :
+				     MT792x_OM_REMAP_IDX_NONE;
+	mconf->om_remap_idx = mld->remap_idx;
+
+	/* enable hybrid MLO in firmware */
+	mld->hybrid_mode = is_hybrid;
 
 	/* single active link, STR is not supported */
 	mld->max_link_num = 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index f1a0a296ae0f..7d5ef7d785a2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -176,6 +176,9 @@ struct mt792x_chanctx {
 	struct mt792x_bss_conf *bss_conf;
 };
 
+/* no OM remap */
+#define MT792x_OM_REMAP_IDX_NONE	0xff
+
 struct mt792x_bss_conf {
 	struct mt76_vif_link mt76; /* must be first */
 	struct mt792x_vif *vif;
@@ -189,6 +192,7 @@ struct mt792x_bss_conf {
 	/* For group-addressed frames that are sent outside a TXQ */
 	struct mt792x_link_sta bmc;
 	bool bmc_valid;
+	u8 om_remap_idx; /* TX OM remap index, 0xff if none */
 };
 
 struct mt792x_nan_conf {
-- 
2.45.2


