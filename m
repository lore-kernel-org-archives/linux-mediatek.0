Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B3606A33A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v7778JEm;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=GoeFEuvr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GYLqRqd5EdIKO5CoJUVvcLn0FQZpHCRCgYY/nD1XTus=; b=v7778JEmWvYUgX2z08hlh6/gkF
	Bw9X9quGftYTBEpoxUq4zVpMB8AD1GzztaGsMRtobCO2F8d2493pru+PEsmPyJcShHPTlE4XjRm/B
	dY+3kGhvfzA0rfkxVtPKtrcd66mIkJ+gt51VASn1fy0OGBys2+Qpvbex0XOQ6lTqJfpslXsL0GR4W
	4O1qLapRTjdm+HUTCyXSYzYG3p/UmtlaJt9hvNe8yJ3f98gkyUlu2cmr1Wq/YFM2ajXeb0RWV7tgx
	ODccvGHwi+X3dnEIAqwZ0B/Gn/rv8zzS7L9VSpg2Y9y7CSUfL1gV15ySD7BV6s/GHWIcJKT6xFlBs
	rw8cmKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ4-00000002FcH-2eaU;
	Tue, 10 Nov 2026 03:13:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIo-00000002F93-43iR
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:46 +0000
X-UUID: b8577802dcb411f1acbe4559397dec65-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GYLqRqd5EdIKO5CoJUVvcLn0FQZpHCRCgYY/nD1XTus=;
	b=GoeFEuvrscD+cjdwoHtsSZhIPMOgXxpaOhwrbavtJHNe36m5yBRAVv2q5jT1xwCXmLI0KmbN8hoFonsThnXiJhZOt1H7vHPGtW2QDDGhAD+RvpfNvw/tF89uBzoGzGumZvzAspHVs87ImZBS4HwP3FLrsSfWjWMEq6c1SouT/QY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b6832991-7061-4863-bbbe-2ef70844c1cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:5f1ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8577802dcb411f1acbe4559397dec65-20261109
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1756503593; Mon, 09 Nov 2026 20:13:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:34 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 15/28] wifi: mt76: mt7925: assign a per-MLD firmware link index
Date: Tue, 10 Nov 2026 11:12:31 +0800
Message-ID: <20261110031244.369014-16-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191343_107389_4D12878F 
X-CRM114-Status: GOOD (  12.10  )
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

valid_links is only updated after the whole add loop, so links added in
the same batch all read hweight16(valid_links) == 0 and collided on one
firmware link index. Pass a 0-based per-MLD index from the caller in link
order instead, independent of the device-wide BSS index.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 9330fe89a4f1..f191b9e7d3f5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -378,7 +378,8 @@ static int mt7925_start(struct ieee80211_hw *hw)
 
 static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 				   struct ieee80211_bss_conf *link_conf,
-				   struct mt792x_link_sta *mlink)
+				   struct mt792x_link_sta *mlink,
+				   u8 link_idx)
 {
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct ieee80211_vif *vif = link_conf->vif;
@@ -416,7 +417,10 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 
 	mconf->mt76.wmm_idx = ieee80211_vif_is_mld(vif) ?
 			      0 : mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
-	mconf->mt76.link_idx = hweight16(mvif->valid_links);
+	/* Per-MLD 0-based link index for the firmware, independent of the
+	 * device-wide BSS index (mt76.idx).
+	 */
+	mconf->mt76.link_idx = ieee80211_vif_is_mld(vif) ? link_idx : 0;
 
 	if (mvif->phy->mt76->chandef.chan &&
 	    mvif->phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
@@ -478,7 +482,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 	mvif->mlo_pm_state = MT792x_MLO_LINK_DISASSOC;
 
-	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink);
+	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink, 0);
 	if (ret < 0)
 		goto out;
 
@@ -2444,6 +2448,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct ieee80211_bss_conf *link_conf;
+	u8 link_idx = hweight16(old_links);
 	unsigned int link_id;
 	int err;
 
@@ -2511,7 +2516,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		rcu_assign_pointer(mvif->link_conf[link_id], mconf);
 		rcu_assign_pointer(mvif->sta.link[link_id], mlink);
 
-		err = mt7925_mac_link_bss_add(dev, link_conf, mlink);
+		err = mt7925_mac_link_bss_add(dev, link_conf, mlink, link_idx++);
 		if (err < 0)
 			goto free;
 
-- 
2.45.2


