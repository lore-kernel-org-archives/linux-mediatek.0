Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6927606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B7/uG4Bw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=h1MrWpGI;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=e0JMm6o+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sCtTR44B4oTvyyoHGa5d+1537AjM+wcVembi4sOe+gg=; b=B7/uG4BwXiRiG8P8K9r9/bp/dN
	lRa0g6tKkwlb5wuFZ+9E+6PjdpJ47QIdld5zKCL8ovgkwoaz9w21hruwDeEWDVdZWr8hWe2yQkJsV
	IGKI5LrJeyU13FDD+5P3MDEH5CqzopV/91joPXBR5swUfoOqNAg+JQLNkUaSvA0Essmlcub49pPIY
	ivQGRWaHhsNrRBUspev/wwUjy0KC33wzhmlRhkvvLJz18Up+6T1PBNZvpvnSBrhesju2dwEkly+RK
	c68G/zxp+fJscXfMiIYMbxDVMWQBt0k9ePZwIVbigtyodAk/pEnasMkeW3tS9qLoQUN7pnqQcSjI6
	kbFGAvhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJM-00000002G7v-1plo;
	Tue, 10 Nov 2026 03:14:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJK-00000002G5Z-2YOg
	for linux-mediatek@bombadil.infradead.org;
	Tue, 10 Nov 2026 03:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sCtTR44B4oTvyyoHGa5d+1537AjM+wcVembi4sOe+gg=; b=h1MrWpGIWS/qcvJiBaP6/wv7nO
	ZVei5Sm6TFi3oqVO+xiMF8DNAayfi2uzNaEWMFMaw/Pg6cQEpMrvPEEv8WYq3uF3Y2n3w3Ir8uN0q
	p+UzNQPR/VlzEpYCQE7cduXFKvFLGDjzfVQSuhsLeCnAqgx3CoOg90gMoqIxjuRDmsN817IabtY2Q
	p5XuATZwd3lClxn+zK1reIB/W70k3VK59Al6VEtYOA2fOY8NaGyePc+RtGBbOdRixSN4BEinzOdt4
	uzdocDF99yKUhj8qT3JYBW65dHdAEu2POF0OlQsjBJS5m1Wu4R3HmLJ8UVCOpta9YenYyqXJ43KH2
	SRpOArHw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJA-00000007QpO-1bBU
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:14:12 +0000
X-UUID: b92e7eb0dcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sCtTR44B4oTvyyoHGa5d+1537AjM+wcVembi4sOe+gg=;
	b=e0JMm6o+t1xBgMj53JyDUwAn6Cy3+oltH6ogkHEXL6owwjf3yR/vI5yKXRfW5cfgA+hmBA6vROXLg6eStihx7N1C6cjHrI4P/Mql2bHku0Nj985O/pC+8WxKT6PUkLIaFDLzt4RpPVC3sryFRzdIcxOzaiQAJdHg7cKerfEXMqs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:a8e49a82-dd3c-4467-b573-64174c89a53a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:821ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b92e7eb0dcb411f1afed4741b24580c9-20261109
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1179748163; Mon, 09 Nov 2026 20:13:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:35 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 18/28] wifi: mt76: mt7925: split link sta add into alloc and commit phases
Date: Tue, 10 Nov 2026 11:12:34 +0800
Message-ID: <20261110031244.369014-19-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_031406_362960_60D1156B 
X-CRM114-Status: GOOD (  16.76  )
X-Spam-Score: -0.2 (/)
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

Split mt7925_mac_link_sta_add() into a host-only alloc half (allocates
and publishes the wcid) and the STAREC/BSS half. The commit half now
only raises STATE_NONE; the STATE_ASSOC transition moves to the add-links
caller. Published links are freed by the unwind path, not here.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 132 +++++++++---------
 1 file changed, 63 insertions(+), 69 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 3af433d1e608..b497e904d4b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1048,33 +1048,23 @@ static void mt7925_mac_link_sta_free_wcid(struct mt76_dev *mdev,
 	mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
 }
 
-static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
-				   struct ieee80211_vif *vif,
-				   struct ieee80211_link_sta *link_sta,
-				   struct mt792x_link_sta *mlink)
+/* Allocate and publish the wcid only; no MCU command is sent.
+ * On failure the caller unwinds with mt7925_mac_link_sta_free_wcid().
+ */
+static int mt7925_mac_link_sta_alloc(struct mt76_dev *mdev,
+				     struct ieee80211_vif *vif,
+				     struct ieee80211_link_sta *link_sta,
+				     struct mt792x_link_sta *mlink)
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct ieee80211_bss_conf *link_conf;
-	struct mt792x_bss_conf *mconf;
-	u8 link_id = link_sta->link_id;
-	bool wcid_published = false;
-	bool is_secondary_link_sta;
-	struct mt792x_sta *msta;
-	struct mt76_wcid *wcid;
-	bool pm_woken = false;
-	int ret, idx;
-
-	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-
-	if (WARN_ON_ONCE(!mlink))
-		return -EINVAL;
+	struct mt792x_sta *msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
+	struct mt76_wcid *wcid = &mlink->wcid;
+	int idx;
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
 	if (idx < 0)
 		return -ENOSPC;
 
-	mconf = mt792x_vif_to_link(mvif, link_id);
 	mt76_wcid_init(&mlink->wcid, 0);
 	mlink->wcid.sta = 1;
 	mlink->wcid.idx = idx;
@@ -1094,21 +1084,44 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	wcid = &mlink->wcid;
 	ewma_signal_init(&wcid->rssi);
 	rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
-	wcid_published = true;
 	ewma_avg_signal_init(&mlink->avg_ack_signal);
 	memset(mlink->airtime_ac, 0,
 	       sizeof(msta->deflink.airtime_ac));
 
+	return 0;
+}
+
+/* Program BSS_INFO and the STATE_NONE STAREC of one link. The wcid must
+ * already be allocated and published by mt7925_mac_link_sta_alloc().
+ * On failure the caller unwinds the published state.
+ */
+static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
+				   struct ieee80211_vif *vif,
+				   struct ieee80211_link_sta *link_sta,
+				   struct mt792x_link_sta *mlink)
+{
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct ieee80211_bss_conf *link_conf;
+	struct mt792x_bss_conf *mconf;
+	u8 link_id = link_sta->link_id;
+	bool pm_woken = false;
+	int ret;
+
+	if (WARN_ON_ONCE(!mlink))
+		return -EINVAL;
+
+	mconf = mt792x_vif_to_link(mvif, link_id);
+
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
-		goto out_wcid;
+		return ret;
 	pm_woken = true;
 
-	mt7925_mac_wtbl_update(dev, idx,
+	mt7925_mac_wtbl_update(dev, mlink->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
-	is_secondary_link_sta = ieee80211_vif_is_mld(vif) && link_sta != mlink->pri_link;
 
 	/* NAN_DATA (NDI) peers skip association - fill link_sta caps
 	 * from sband and push BSS_INFO with correct phymode + RLM.
@@ -1134,45 +1147,16 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 						  link_conf, link_sta,
 						  mconf->mt76.bmc_wcid ?: mlink_bc->wcid.idx,
 						  mlink->wcid.idx,
-						  is_secondary_link_sta);
+						  false);
 		if (ret)
 			goto out_pm;
 	}
 
-	if (!is_secondary_link_sta) {
-		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
-					    mlink, true,
-					    MT76_STA_INFO_STATE_NONE);
-		if (ret)
-			goto out_pm;
-	} else {
-		struct mt792x_link_sta *pri_mlink;
-		struct mt76_wcid *pri_wcid;
-
-		/* alternative lookup via def_wcid */
-		pri_wcid = mlink->wcid.def_wcid;
-
-		pri_mlink = pri_wcid ?
-			    container_of(pri_wcid, struct mt792x_link_sta, wcid) :
-			    NULL;
-
-		if (WARN_ON_ONCE(!pri_mlink)) {
-			ret = -EINVAL;
-			goto out_pm;
-		}
-
-		ret = mt7925_mcu_sta_update(dev, mlink->pri_link, vif,
-					    pri_mlink, true,
-					    MT76_STA_INFO_STATE_ASSOC);
-		if (ret)
-			goto out_pm;
-
-		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
-					    mlink, true,
-					    MT76_STA_INFO_STATE_ASSOC);
-		if (ret)
-			goto out_pm;
-	}
+	/* Raise this link's STAREC to STATE_NONE, after its BSS_INFO. */
+	ret = mt7925_mcu_sta_update(dev, link_sta, vif, mlink, true,
+				    MT76_STA_INFO_STATE_NONE);
+	if (ret)
+		goto out_pm;
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 
@@ -1181,9 +1165,6 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 out_pm:
 	if (pm_woken)
 		mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
-out_wcid:
-	if (wcid_published)
-		mt7925_mac_link_sta_free_wcid(mdev, mlink);
 	return ret;
 }
 
@@ -1252,20 +1233,26 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		mlink->wcid.def_wcid = &msta->deflink.wcid;
 
 		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
-		err = mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta, mlink);
+		err = mt7925_mac_link_sta_alloc(&dev->mt76, vif, link_sta,
+						mlink);
 		if (err) {
 			if (!is_deflink)
-				kfree_rcu(mlink, rcu_head);
+				kfree(mlink);
 			break;
 		}
 
-		if (is_deflink)
-			msta->deflink_id = link_id;
-
 		rcu_assign_pointer(msta->link[link_id], mlink);
 		msta->valid_links |= BIT(link_id);
+		if (is_deflink)
+			msta->deflink_id = link_id;
 
+		/* published into msta->link[]; let the unwind path free it */
 		added_links |= BIT(link_id);
+
+		err = mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta,
+					      mlink);
+		if (err)
+			break;
 	}
 
 	if (err && added_links)
@@ -1292,8 +1279,15 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 		err = mt7925_mac_sta_add_links(dev, vif, sta, sta->valid_links);
 	} else {
-		err = mt7925_mac_link_sta_add(mdev, vif, &sta->deflink,
-					      &msta->deflink);
+		err = mt7925_mac_link_sta_alloc(mdev, vif, &sta->deflink,
+						&msta->deflink);
+		if (!err) {
+			err = mt7925_mac_link_sta_add(mdev, vif, &sta->deflink,
+						      &msta->deflink);
+			if (err)
+				mt7925_mac_link_sta_free_wcid(mdev,
+							      &msta->deflink);
+		}
 	}
 
 	return err;
-- 
2.45.2


