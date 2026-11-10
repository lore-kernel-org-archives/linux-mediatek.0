Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4002A606A330
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YpIf42s7;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=FYFhM1zh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hGlaYzw+shYeBVv7YF+UseNrEEYGqB5adTNhGNtKdWM=; b=YpIf42s7LYO8Hy4neH/Oxs9lRo
	0hR7Q4ahpLh3MBC5WzHsSXx6UIxkeHiVUYJyM/pL7cj80cpefsiQogmz6/yl/rcQU2G3Z3kg8BWN4
	wF3JsPFwLXrEP0p3hOQaxoCD9yEJHTqWA4c6heB1Py7OqgrGDMQVKKWhzTpUNpYS0O1aoIudI05D2
	bg96w1b8VDBZKgonbpipW8sQWI9Nk2us/nJy0dBVc8MJyWOTufkwUO4ouysmpnbdjh90NbiqLcEMD
	kF2TX1s1JNF3xKVRWwDiht9tOP7TVmGcqcVA3QT07WlsxEeT+1S/kWQV4Zvg2V5knSSelSoDBESiZ
	0qT3klAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcXg-00000002ILW-2fLT;
	Tue, 10 Nov 2026 03:29:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcXb-00000002IHp-1F46
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:29:00 +0000
X-UUID: b871196adcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hGlaYzw+shYeBVv7YF+UseNrEEYGqB5adTNhGNtKdWM=;
	b=FYFhM1zhRW66eGfF89D/9W2dOJOEwiYkN7NHLXbkOXceP2iRphB+4TEYjl9VChxf58e1E+isXfDPObXQ+8JAoTolrQ9+Iug1QKsqcMoXOeK9KVrZN6QLaXEA20wC1srlkXHGzVtymXusWwz9Jw9MPWwX/cPe9rJFdYTBnXN9Kj4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1ffedbb9-e75b-410e-898b-0e7f187ffe7c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:e4af878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b871196adcb411f1afed4741b24580c9-20261109
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 35419663; Mon, 09 Nov 2026 20:13:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [PATCH 16/28] wifi: mt76: mt7925: share the primary OMAC across MLO links
Date: Tue, 10 Nov 2026 11:12:32 +0800
Message-ID: <20261110031244.369014-17-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_192859_350032_93551C51 
X-CRM114-Status: GOOD (  11.31  )
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

Previously every MLD link used OMAC 0, which can clash with another
interface. Make each link reuse the primary link OMAC instead; only a
3-link hybrid MLD gives every link its own OMAC so each band's own MAC
is programmed independently.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f191b9e7d3f5..01d7526dbfa9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -379,7 +379,7 @@ static int mt7925_start(struct ieee80211_hw *hw)
 static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 				   struct ieee80211_bss_conf *link_conf,
 				   struct mt792x_link_sta *mlink,
-				   u8 link_idx)
+				   bool share_omac, u8 link_idx)
 {
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct ieee80211_vif *vif = link_conf->vif;
@@ -398,8 +398,11 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 		}
 	}
 
-	mconf->mt76.omac_idx = ieee80211_vif_is_mld(vif) ?
-			       0 : mconf->mt76.idx;
+	/* Links share the primary OMAC except in 3-link hybrid mode. */
+	if (share_omac)
+		mconf->mt76.omac_idx = mvif->bss_conf.mt76.idx;
+	else
+		mconf->mt76.omac_idx = mconf->mt76.idx;
 	mconf->mt76.band_idx = MT792x_BAND_AUTO;
 
 	mconf->absent = false;
@@ -482,7 +485,8 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 	mvif->mlo_pm_state = MT792x_MLO_LINK_DISASSOC;
 
-	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink, 0);
+	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink,
+				      true, 0);
 	if (ret < 0)
 		goto out;
 
@@ -2516,7 +2520,9 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		rcu_assign_pointer(mvif->link_conf[link_id], mconf);
 		rcu_assign_pointer(mvif->sta.link[link_id], mlink);
 
-		err = mt7925_mac_link_bss_add(dev, link_conf, mlink, link_idx++);
+		err = mt7925_mac_link_bss_add(dev, link_conf, mlink,
+					      hweight16(new_links) != 3,
+					      link_idx++);
 		if (err < 0)
 			goto free;
 
-- 
2.45.2


