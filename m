Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A215606A33A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m+Ydljp+;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=aNEbTMCr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XpAG/1GWqKqseMJF4zj6loGxwhUwKcG8xjC+I5oQI0A=; b=m+Ydljp+gnowNEzym7s8aWJzoU
	TUgKliG+TQ0btJj/BqX6jXPcjg+mgwq9FB4PGK2O9rAC6hXwAjJ5uPnWFcJncBlGW5swPnt2Jny8o
	pGJEaeRZ5DynY71nse7tpv1UyRgo5hlUEmTQu93dje1vnfQEKxotJcvMSmSE+RlmZcRjGGf2HWC+U
	PgIUv42fIP8FDpX5OCY3iXeSU3Qe2o2f776goew3X1wJAm+5ob0awOx9/ON/XT4KU8Usd36ZS//m/
	3VgUTa3s1XB6ySrcZYTW1S5KYOu+qQgwuEutyei1fLFQUIQmmGayqqRrwrHA+6dR0He1dfSLRC6uM
	QfQhd9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ5-00000002Fef-2XAW;
	Tue, 10 Nov 2026 03:13:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIr-00000002FGo-0VjE
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:49 +0000
X-UUID: b7f7fd32dcb411f1acbe4559397dec65-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XpAG/1GWqKqseMJF4zj6loGxwhUwKcG8xjC+I5oQI0A=;
	b=aNEbTMCrnGTjxfyQRhTwbRuV9bkT7YZewbZqbQ/tlLWPKTC6v8GEmFE6v6iSVS3PrLAXdKIqvZt7qfJ12az+HsRmB2vSKQjT9L4G9GWpLtMjXV86YVkHP8Ee3MPMP4ZpSUj5bVqeHODNddSohziDPjAlototq+5sIkbZzjd7MRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:92793889-7a42-4838-87fc-ea3f9adbfd18,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:631ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7f7fd32dcb411f1acbe4559397dec65-20261109
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 328847518; Mon, 09 Nov 2026 20:13:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:34 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>,
	Jacobs Wu <jacobs.wu@mediatek.com>
Subject: [PATCH 10/28] wifi: mt76: mt7925: reactivate the DEV before (re)connect, scan and off-channel
Date: Tue, 10 Nov 2026 11:12:26 +0800
Message-ID: <20261110031244.369014-11-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191345_241082_BDC6E93B 
X-CRM114-Status: GOOD (  18.26  )
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

On disconnect the DEV is deactivated and firmware then drops the BSS
management frames, so a legacy reconnect, a scan or an off-channel
operation fails. Reactivate the DEV first through the gated helper.

The MLO to legacy switch fixed by commit 8f9e5807671e ("wifi: mt76:
mt7925: restore the legacy BSS after MLO teardown") is now covered by
this and the previous patch. Keep only a DEV deactivate on teardown for
a failed connection setup, and restore the legacy WMM index.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 42 +++++++++++++------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 4889d3bfe08d..702e4f01b0ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -699,6 +699,8 @@ static int mt7925_remain_on_channel(struct ieee80211_hw *hw,
 	int err;
 
 	mt792x_mutex_acquire(phy->dev);
+	mt792x_mcu_set_dev_active(phy->dev, &vif->bss_conf, &mvif->bss_conf,
+				  &mvif->sta.deflink.wcid, true);
 	err = mt7925_set_roc(phy, &mvif->bss_conf,
 			     chan, duration, MT7925_ROC_REQ_ROC);
 	mt792x_mutex_release(phy->dev);
@@ -1408,16 +1410,20 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 
 		/* reset to auto band so the deactivate drops the band binding */
 		mconf->mt76.band_idx = MT792x_BAND_AUTO;
+		/* back to the legacy WMM index, MLO uses 0 */
+		mconf->mt76.wmm_idx = mconf->mt76.idx %
+				      MT76_CONNAC_MAX_WMM_SETS;
 
 		if (ieee80211_vif_is_mld(vif)) {
 			/* Sub-links are removed. The primary link is kept for
 			 * reconnect but deactivated in firmware.
 			 */
-			if (mconf != &mvif->bss_conf)
+			if (mconf != &mvif->bss_conf) {
 				mt792x_mac_link_bss_remove(dev, mconf, mlink);
-			else
+			} else {
 				mt792x_mcu_set_dev_active(dev, link_conf, mconf,
 							  &mlink->wcid, false);
+			}
 		} else {
 			/* deactivate DEV and BSS, re-activated on the next connect */
 			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
@@ -1732,10 +1738,13 @@ mt7925_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	       struct ieee80211_scan_request *req)
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt76_phy *mphy = hw->priv;
 	int err;
 
 	mt792x_mutex_acquire(dev);
+	mt792x_mcu_set_dev_active(dev, &vif->bss_conf, &mvif->bss_conf,
+				  &mvif->sta.deflink.wcid, true);
 	err = mt7925_mcu_hw_scan(mphy, vif, req);
 	mt792x_mutex_release(dev);
 
@@ -1759,11 +1768,15 @@ mt7925_start_sched_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			struct ieee80211_scan_ies *ies)
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt76_phy *mphy = hw->priv;
 	int err;
 
 	mt792x_mutex_acquire(dev);
 
+	mt792x_mcu_set_dev_active(dev, &vif->bss_conf, &mvif->bss_conf,
+				  &mvif->sta.deflink.wcid, true);
+
 	err = mt7925_mcu_sched_scan_req(mphy, vif, req, ies);
 	if (err < 0)
 		goto out;
@@ -2471,16 +2484,18 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	mvif->valid_links = new_links;
 
-	/* Restore the legacy BSS after disabling MLO */
-	if (old_links && !new_links) {
-		mt792x_mac_link_bss_remove(dev, &mvif->bss_conf,
-					   &mvif->sta.deflink);
-		err = mt7925_mac_link_bss_add(dev, &vif->bss_conf,
-					      &mvif->sta.deflink);
-		if (err < 0) {
-			mt792x_mutex_release(dev);
-			return err;
-		}
+	/* The normal MLO to legacy switch is handled on the sta_remove path,
+	 * which deactivates the DEV and restores the legacy WMM index; the
+	 * next connect, scan or off-channel reactivates the DEV with the
+	 * legacy address. This only covers a failed connection setup in
+	 * ieee80211_prep_connection(), where the links are torn down without
+	 * a station removal.
+	 */
+	if (!new_links) {
+		mvif->bss_conf.mt76.wmm_idx = mvif->bss_conf.mt76.idx %
+					      MT76_CONNAC_MAX_WMM_SETS;
+		mt792x_mcu_set_dev_active(dev, &vif->bss_conf, &mvif->bss_conf,
+					  &mvif->sta.deflink.wcid, false);
 	}
 
 	mt792x_mutex_release(dev);
@@ -2579,6 +2594,9 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 	} else {
 		mconf = &mvif->bss_conf;
 
+		mt792x_mcu_set_dev_active(dev, link_conf, mconf,
+					  &mvif->sta.deflink.wcid, true);
+
 		if (is_mt7927(&dev->mt76)) {
 			band_idx = mt7927_band_idx(ctx->def.chan->band);
 
-- 
2.45.2


