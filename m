Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D65606A32A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LMqU/PEx;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=uflqXTR3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7H5UtNcHviCYGBonP2azZWOv9srx2QTyPR2V3JVqJtg=; b=LMqU/PExo0yjiTt4tIGfiJ9XvE
	fAcdYtbexE+yiNvj3n6M90hTSK8YxZx7n7Z+QutzG2Ydg/Z89z2vUQH9EEupJMux6ZdICrm7DcFd6
	VppL/0BLG0qoUzEz50E11nUdBHtLCmyk/J6Z/Rz5HaF+TXw2sEtEnruZE6qiDN+xmckGFSNJ3Jh/Y
	C91x++dspPX5A4/wnlzC5c6aCBGBJiQ1rRtJcnh9/EEy7qAtKt7Jp+xgncMgLTVW/dmsPuP+bqpG/
	3JaL4kkM6g7Jql2tlVpZiHpa6mlNVYlu5u+M51EuML3DyrKYgrxRFNpCz8/RzMJK8/B898P4P898Z
	fHAiK6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIz-00000002FSO-2BGF;
	Tue, 10 Nov 2026 03:13:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIj-00000002F1W-3GGC
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:39 +0000
X-UUID: b53e6522dcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7H5UtNcHviCYGBonP2azZWOv9srx2QTyPR2V3JVqJtg=;
	b=uflqXTR3we7eErw9ff9T9CrQ0OrjKVwvdNYQYzMB7DTPYWnWz66PiWq+vCW5QIgbNUElwvAQYfQGZrqml2mCX9q0DjMKWrdfoCeQnMwkrzU48Fq16PqgX1ZmcbgkWzadrAtWGVHROV7pgQBt3JqUfHU+O8PRdUr5L+d64ZzfJA8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:8a622a1e-f47d-44d9-9bcc-cc9db0f48608,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:181ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b53e6522dcb411f1afed4741b24580c9-20261109
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 29956655; Mon, 09 Nov 2026 20:13:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:29 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:29 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>,
	Allen Chien <yung-lun.chien@mediatek.com>
Subject: [PATCH 06/28] wifi: mt76: mt7925: factor out mt7925_mac_link_sta_free_wcid()
Date: Tue, 10 Nov 2026 11:12:22 +0800
Message-ID: <20261110031244.369014-7-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191337_837336_BA6C5968 
X-CRM114-Status: GOOD (  11.00  )
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

The host-side wcid unwind (clear the rcu wcid pointer, run
mt76_wcid_cleanup() and release the wcid mask bit) was open-coded in three
places. Pull it into a single helper and call it from all of them.

No functional change.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Co-developed-by: Allen Chien <yung-lun.chien@mediatek.com>
Signed-off-by: Allen Chien <yung-lun.chien@mediatek.com>
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 4d593291a23a..a39ebc55afbc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1001,6 +1001,17 @@ mt7925_get_rates_table(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return mvif->basic_rates_idx;
 }
 
+/* Undo the host-side wcid publish done by mt7925_mac_link_sta_alloc(). */
+static void mt7925_mac_link_sta_free_wcid(struct mt76_dev *mdev,
+					  struct mt792x_link_sta *mlink)
+{
+	struct mt76_wcid *wcid = &mlink->wcid;
+
+	rcu_assign_pointer(mdev->wcid[wcid->idx], NULL);
+	mt76_wcid_cleanup(mdev, wcid);
+	mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
+}
+
 static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_link_sta *link_sta,
@@ -1131,13 +1142,8 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	if (pm_woken)
 		mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 out_wcid:
-	if (wcid_published) {
-		u16 idx = wcid->idx;
-
-		rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
-		mt76_wcid_cleanup(mdev, wcid);
-		mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
-	}
+	if (wcid_published)
+		mt7925_mac_link_sta_free_wcid(mdev, mlink);
 	return ret;
 }
 
@@ -1159,7 +1165,6 @@ mt7925_mac_sta_unwind_links_host(struct mt792x_dev *dev,
 
 	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct mt792x_link_sta *mlink;
-		u16 idx;
 
 		mlink = rcu_replace_pointer(msta->link[link_id], NULL,
 					    lockdep_is_held(&dev->mt76.mutex));
@@ -1170,10 +1175,7 @@ mt7925_mac_sta_unwind_links_host(struct mt792x_dev *dev,
 		if (msta->deflink_id == link_id)
 			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 
-		idx = mlink->wcid.idx;
-		rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
-		mt76_wcid_cleanup(&dev->mt76, &mlink->wcid);
-		mt76_wcid_mask_clear(dev->mt76.wcid_mask, idx);
+		mt7925_mac_link_sta_free_wcid(&dev->mt76, mlink);
 
 		if (mlink != &msta->deflink)
 			kfree_rcu(mlink, rcu_head);
@@ -1385,7 +1387,6 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	struct mt76_wcid *wcid = &mlink->wcid;
 	struct ieee80211_bss_conf *link_conf;
 	u8 link_id = link_sta->link_id;
-	u16 idx = wcid->idx;
 
 	mt7925_roc_abort_sync(dev);
 
@@ -1416,9 +1417,7 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 		list_del_init(&mlink->wcid.poll_list);
 	spin_unlock_bh(&mdev->sta_poll_lock);
 
-	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
-	mt76_wcid_cleanup(mdev, wcid);
-	mt76_wcid_mask_clear(mdev->wcid_mask, idx);
+	mt7925_mac_link_sta_free_wcid(mdev, mlink);
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
-- 
2.45.2


