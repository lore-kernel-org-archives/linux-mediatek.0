Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D75606A330
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DuTm6u8o;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=J41PAbsw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gfBjn7V58vsH0PrcY9yeUWUQHzWPMVpSYFvaanr8Fl0=; b=DuTm6u8oCbazrM3EQowLOeuhLz
	+4u5tbHaZR5DzQgQQ5U8unIpNNIFqHZ1eNXNJVm7WHHZ4JoI2QFac79S8pkUe9U0kVRxTF5VCSt6/
	tysL7n9PlraBarRLeKPcZ06EyW6T6nIgCM6CrLTHtuly9OhGrY1mJuWFUA4w4XvVjs6NrG7lzv9ca
	w2eSjx806McFYhqysdlOyOLwThBIecBmTCqfQYXywLo6dcKKJlQodz86+cRQecD+q0jVqgMw/S8pc
	Urbd8vjYwLPBNiwdaU0klBL5hkYx6RWPYYDlK+hA+60jG28Gb9cwO8M2WQeSoOHkj0KnU4mOjnhcq
	RcA0VTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ6-00000002Fhp-2b3F;
	Tue, 10 Nov 2026 03:14:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIt-00000002F96-3dB1
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:51 +0000
X-UUID: b97e2ab4dcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gfBjn7V58vsH0PrcY9yeUWUQHzWPMVpSYFvaanr8Fl0=;
	b=J41PAbswibVST1TQ9PfjLkq8UKUklk5yq0bPCvhZgY209L5R+CKVRM00Whxt1JSS9dZvqXKi5JbOOP6IAVKeNxcZbjy3iGM6Ornk1J1FxHbeXPwlT2dS4M+Ql415dJbLT0tMKtBude+L4rcE6j8UjMIrnB/kMolVL2kOHtqh4Ds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1dd1e727-1c58-4b21-a3af-addc95bf3f2c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3f941366-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b97e2ab4dcb411f1afed4741b24580c9-20261109
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1109236786; Mon, 09 Nov 2026 20:13:38 -0700
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
Subject: [PATCH 24/28] wifi: mt76: mt7925: skip re-adding the primary MLD BSS_INFO in chanctx ops
Date: Tue, 10 Nov 2026 11:12:40 +0800
Message-ID: <20261110031244.369014-25-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191347_927743_DF72274B 
X-CRM114-Status: GOOD (  11.67  )
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

The primary link BSS_INFO is already sent from the sta add, assoc and
remove paths and from mt7925_mac_set_links(), so the chanctx ops no
longer resend it for an MLD station.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c    | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 1192a01006bd..00244a650464 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2914,7 +2914,6 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
-	struct ieee80211_bss_conf *pri_link_conf;
 	struct mt792x_bss_conf *mconf;
 	u8 band_idx;
 
@@ -2922,12 +2921,6 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 
 	if (ieee80211_vif_is_mld(vif)) {
 		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
-		pri_link_conf = mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
-
-		if (vif->type == NL80211_IFTYPE_STATION &&
-		    mconf == &mvif->bss_conf)
-			mt7925_mcu_add_bss_info(&dev->phy, NULL, pri_link_conf,
-						NULL, true);
 	} else {
 		mconf = &mvif->bss_conf;
 
@@ -2961,16 +2954,10 @@ static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
 
 	mutex_lock(&dev->mt76.mutex);
 
-	if (ieee80211_vif_is_mld(vif)) {
+	if (ieee80211_vif_is_mld(vif))
 		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
-
-		if (vif->type == NL80211_IFTYPE_STATION &&
-		    mconf == &mvif->bss_conf)
-			mt7925_mcu_add_bss_info(&dev->phy, NULL, link_conf,
-						NULL, false);
-	} else {
+	else
 		mconf = &mvif->bss_conf;
-	}
 
 	mctx->bss_conf = NULL;
 	mconf->mt76.ctx = NULL;
-- 
2.45.2


