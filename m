Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74B1606E637
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tqD6R0E/;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=JFk5jPm9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QMpe5yWmpSaSNuYnQpbGsjVQh3Tp5TaRc/PEmWywBiI=; b=tqD6R0E/LgQZ/bx+ZFUWCZbV62
	/3f7ls450NA3MMcjK+3aCBN54iLvnrMatkbkPoyUe3i3WVEHdbbpuP60r9PYevxM48CiGCHOOVIIo
	h5MomP769qXwQcpPPA7YP+yZzB252LXRUtWHeYE1ikwMp+LC4jM4px+61OqQl/NBKJQha4M2EVIWg
	cl2DebVmR0xYD/uNksD1jU82iLTc2W1LX0ZUrAcQoLGF9r54sPDSx4NIV4q9/n7CrLnw2PiJOE2hd
	LVKINVtpV1+ufU1t2cgqSFucU0m6q0QV2g9ceFrAXsglE3h+0cCYbFI793bWYb1PvHpOwJbp9SWbW
	E2onIZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ4-00000002Fbq-1qaj;
	Tue, 10 Nov 2026 03:13:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIn-00000002F96-1X5v
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:43 +0000
X-UUID: b7ca1138dcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QMpe5yWmpSaSNuYnQpbGsjVQh3Tp5TaRc/PEmWywBiI=;
	b=JFk5jPm9GV377l1HOVd1Y6vYG0NOIbOg9mTE+lSnMW2iDUN95qJmZsbsaUdjPrOkeNmMVaztwLeeFdvziZwxcE608dFgR0GwhAZsrZJ2UOUeapO9QThtGKrFYybcWYf45cIyUhSlhri3sYGXoKEDogKNd5lRObfAQVU91XLYgnA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7579bdab-18c4-4e06-b9f7-f5e5db50926e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:e3af878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7ca1138dcb411f1afed4741b24580c9-20261109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1900289064; Mon, 09 Nov 2026 20:13:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:33 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:33 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 08/28] wifi: mt76: mt792x: route DEV (de)activation through mt792x_mcu_set_dev_active()
Date: Tue, 10 Nov 2026 11:12:24 +0800
Message-ID: <20261110031244.369014-9-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191341_452892_8DFEA753 
X-CRM114-Status: GOOD (  11.49  )
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

Convert the mt7921 and mt7925 DEV (de)activation call sites, including
mt792x_mac_link_bss_remove(), to the gated helper so the per-link
dev_active flag stays in sync. The firmware-reset reconnect paths clear
the flag first to force the reactivation. No functional change.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c  |  7 ++++---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c |  5 ++---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |  6 ++++--
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 14 ++++++--------
 drivers/net/wireless/mediatek/mt76/mt792x_core.c |  3 +--
 5 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 6f5e31489e2d..b9532e441928 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -632,9 +632,10 @@ mt7921_vif_connect_iter(void *priv, u8 *mac,
 	if (vif->type == NL80211_IFTYPE_STATION)
 		ieee80211_disconnect(vif, true);
 
-	mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
-				    &mvif->bss_conf.mt76,
-				    &mvif->sta.deflink.wcid, true);
+	/* firmware was reset: force the DEV reactivation */
+	mvif->bss_conf.dev_active = false;
+	mt792x_mcu_set_dev_active(dev, &vif->bss_conf, &mvif->bss_conf,
+				  &mvif->sta.deflink.wcid, true);
 	mt7921_mcu_set_tx(dev, vif);
 
 	if (vif->type == NL80211_IFTYPE_AP) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 9caf6547062f..47755901f636 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -320,9 +320,8 @@ mt7921_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->bss_conf.mt76.band_idx = 0;
 	mvif->bss_conf.mt76.wmm_idx = mvif->bss_conf.mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
 
-	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
-					  &mvif->bss_conf.mt76,
-					  &mvif->sta.deflink.wcid, true);
+	ret = mt792x_mcu_set_dev_active(dev, &vif->bss_conf, &mvif->bss_conf,
+					&mvif->sta.deflink.wcid, true);
 	if (ret)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 66d962bcba85..cbe62db21bbf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1506,8 +1506,10 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 		mconf = mt792x_vif_to_link(mvif, i);
 		mconf->absent = false;
 
-		mt76_connac_mcu_uni_add_dev(&dev->mphy, bss_conf, &mconf->mt76,
-					    &mvif->sta.deflink.wcid, true);
+		/* firmware was reset: force the DEV reactivation */
+		mconf->dev_active = false;
+		mt792x_mcu_set_dev_active(dev, bss_conf, mconf,
+					  &mvif->sta.deflink.wcid, true);
 		mt7925_mcu_set_tx(dev, bss_conf);
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a39ebc55afbc..62018d17745c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -446,8 +446,8 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], &mlink->wcid);
 
-	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
-					  &mlink->wcid, true);
+	ret = mt792x_mcu_set_dev_active(dev, link_conf, mconf,
+					&mlink->wcid, true);
 	if (ret) {
 		mt7925_p2p_bmc_remove(dev, mconf);
 		goto out;
@@ -2526,17 +2526,15 @@ mt7927_reconfig_band(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 	struct mt792x_link_sta *mlink = &mvif->sta.deflink;
 	int ret;
 
-	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf,
-					  &mconf->mt76, &mlink->wcid,
-					  false);
+	ret = mt792x_mcu_set_dev_active(dev, link_conf, mconf,
+					&mlink->wcid, false);
 	if (ret)
 		return ret;
 
 	mconf->mt76.band_idx = band_idx;
 
-	return mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf,
-					   &mconf->mt76, &mlink->wcid,
-					   true);
+	return mt792x_mcu_set_dev_active(dev, link_conf, mconf,
+					 &mlink->wcid, true);
 }
 
 static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 420aba8519e2..9e54d900727d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -285,8 +285,7 @@ void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 	link_conf = mt792x_vif_to_bss_conf(vif, mconf->link_id);
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
-	mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
-				    &mlink->wcid, false);
+	mt792x_mcu_set_dev_active(dev, link_conf, mconf, &mlink->wcid, false);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-- 
2.45.2


