Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142E606A330
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1MG6geI8;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MujpjhV5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z4meNRwPR0gTIqxKvnxR0qV693IFvMZkroR4/E2fqMk=; b=1MG6geI8YgvuXh3MkBkR17xEOc
	f9vBzXApwLzmylW8ZyDtZZstfwE48ZKPHL8GN8y4biDan7BXqPGEAJSL68kALeu49marPTNKupk8N
	/Xr+7eGrgEHKim81DqFUUNQ2bQQYDe708Yp1BzEy4Mf6vj19bhdNLYa/TT+ry1NQLPg8K8iy2eELF
	30n6sl2fN4A2LYV/2FdJ++B8z/xyI3/h/5U9rG0cbcUAg0i/wK+IS5JPT9/y6VqXNcZ/WaqCnzS8b
	YpLYNOO/9554HLA0O/fVB4pZzuJIa8/7bI3vt9GqHItAMH4FZ2cECtRbItVfhBas/CGLKMhZYlKMr
	0S5xbbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ4-00000002Fcm-3ICB;
	Tue, 10 Nov 2026 03:13:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIp-00000002FCp-1iVH
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:47 +0000
X-UUID: b8a6a512dcb411f1acbe4559397dec65-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=z4meNRwPR0gTIqxKvnxR0qV693IFvMZkroR4/E2fqMk=;
	b=MujpjhV5/lxN1FsadIm+N1ZYp+kb+NkbzwrU5lAzMY0XgmtBjC/ud8XAnJqGNKGK/7SJl7JCGnTHTsWvaKLAIjxUgcKuKwiWOD1Mp9/G3l9hbP6ZTZleT/ruoFoN9OJiZSRbGxsQiiD3TrvlAs6thz+Man2eUV0jZ8NlaVqrntc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5a23de53-0e5c-4684-80c0-d9e5097cc534,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:621ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8a6a512dcb411f1acbe4559397dec65-20261109
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 878805865; Mon, 09 Nov 2026 20:13:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH 19/28] wifi: mt76: mt7925: publish every link before sending any STA_REC
Date: Tue, 10 Nov 2026 11:12:35 +0800
Message-ID: <20261110031244.369014-20-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191343_577111_BFC78F8F 
X-CRM114-Status: GOOD (  17.75  )
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

The MLD setup TLV is built from msta->link[], so a STA_REC sent while
later links are missing carries a partial MLD. Publish every link first,
then program them primary first. A single link to MLD upgrade re-adds the
primary with a new wcid on the reused deflink storage.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 60 +++++++++++++++++--
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index b497e904d4b5..a93df77da269 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1212,6 +1212,9 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 	unsigned int link_id;
 	int err = 0;
 
+	/* Publish every link before sending any STAREC, so the MLD setup TLV
+	 * describes the whole MLD.
+	 */
 	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct ieee80211_link_sta *link_sta;
 		struct mt792x_link_sta *mlink;
@@ -1220,6 +1223,26 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		if (msta->deflink_id == IEEE80211_LINK_UNSPECIFIED) {
 			mlink = &msta->deflink;
 			is_deflink = true;
+		} else if (link_id == msta->deflink_id &&
+			   rcu_access_pointer(msta->link[link_id]) ==
+			   &msta->deflink) {
+			/* Single link to MLD upgrade: re-add the primary with
+			 * a new wcid so it binds to the granted band. This runs
+			 * from the AUTHORIZE transition before mac80211 sets
+			 * WLAN_STA_AUTHORIZED, so no data is being sent on this
+			 * sta and reusing the deflink storage is safe.
+			 */
+			link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+			if (mt7925_mcu_sta_update(dev, link_sta, vif,
+						  &msta->deflink, false,
+						  MT76_STA_INFO_STATE_NONE))
+				dev_dbg(dev->mt76.dev,
+					"failed to tear down the old STA_REC\n");
+			mt7925_mac_link_sta_free_wcid(&dev->mt76,
+						      &msta->deflink);
+			synchronize_rcu();
+			mlink = &msta->deflink;
+			is_deflink = true;
 		} else {
 			mlink = kzalloc_obj(*mlink);
 			if (!mlink) {
@@ -1236,8 +1259,17 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		err = mt7925_mac_link_sta_alloc(&dev->mt76, vif, link_sta,
 						mlink);
 		if (err) {
-			if (!is_deflink)
+			if (!is_deflink) {
 				kfree(mlink);
+			} else if (link_id == msta->deflink_id) {
+				/* the upgrade path above already freed the
+				 * deflink wcid, so unpublish it here instead
+				 * of freeing the shared wcid a second time
+				 */
+				rcu_assign_pointer(msta->link[link_id], NULL);
+				msta->valid_links &= ~BIT(link_id);
+				msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+			}
 			break;
 		}
 
@@ -1246,13 +1278,33 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		if (is_deflink)
 			msta->deflink_id = link_id;
 
-		/* published into msta->link[]; let the unwind path free it */
 		added_links |= BIT(link_id);
+	}
+
+	/* Configure the primary link first, it anchors the MLD. */
+	if (!err && msta->deflink_id != IEEE80211_LINK_UNSPECIFIED &&
+	    (added_links & BIT(msta->deflink_id))) {
+		struct mt792x_link_sta *mlink =
+			mt792x_sta_to_link(msta, msta->deflink_id);
+		struct ieee80211_link_sta *link_sta =
+			mt792x_sta_to_link_sta(vif, sta, msta->deflink_id);
+
+		err = mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta, mlink);
+	}
+	for_each_set_bit(link_id, &added_links,
+			 IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_link_sta *link_sta;
+		struct mt792x_link_sta *mlink;
 
-		err = mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta,
-					      mlink);
 		if (err)
 			break;
+		if (link_id == msta->deflink_id)
+			continue;
+
+		mlink = mt792x_sta_to_link(msta, link_id);
+		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+		err = mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta,
+					      mlink);
 	}
 
 	if (err && added_links)
-- 
2.45.2


