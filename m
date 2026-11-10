Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B32606A335
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OXAecXqz;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lsluEGbj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mOclOdLtwD0RZuWcwJURIXNVb1vabSOVh2+DSfAelBQ=; b=OXAecXqza4hZ71ojh7tepijZ0Y
	3hbtKdfSkLvzDho+Jvy2DTgIBJxLeQNZVjvhhQv7JjUAMj+jSF5CrNLKTBjo1TFX05hGSDV7hVtPv
	KWasbLCUw/nPjK9APTrd+wS5Yw6VjORUCgvmAj99XpxEBx7YEnvNn42QJAqI/Kfn7jNSbmthig1MV
	qrwQy6yLmGs+hsopQsG5kY1vzcqoKIWmWlbpXwd6TLg9BbheTsuETHi1bQOnW1KB7RQSOIB9ZkYh4
	DhZhwqNlQPIRVhGh93qYop8VKd/iyBKHKKsoMiya/1SEOzGbdqSUm/FTtASdZsat/n7AikK4257CZ
	1lo1OoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ6-00000002FiH-30mU;
	Tue, 10 Nov 2026 03:14:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIu-00000002FLp-0n38
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:51 +0000
X-UUID: b8deeabcdcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mOclOdLtwD0RZuWcwJURIXNVb1vabSOVh2+DSfAelBQ=;
	b=lsluEGbj0SHQUXwhj1tXbiFcLJNceqIiPEG9qnFw2G9SM9kARTeyBT0q99kPjPop3N31dJsVjZ0lKfkvjdcbltNW+1SaHryq5yJssgr+hZPdjknQ8iewFcFV13fc8WyUtQO20p5ceB8VVPqqPbYdHJHd8yh41rzzcH/nRziSPVs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:c8ba53d7-2ab6-4a4a-9799-f460055f3db1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:7e1ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8deeabcdcb411f1afed4741b24580c9-20261109
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1510080782; Mon, 09 Nov 2026 20:13:37 -0700
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
Subject: [PATCH 17/28] wifi: mt76: mt7925: carry the STA decap offload to later links
Date: Tue, 10 Nov 2026 11:12:33 +0800
Message-ID: <20261110031244.369014-18-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191348_243990_F7CD4639 
X-CRM114-Status: GOOD (  14.12  )
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

.sta_set_decap_offload() runs once with only the first link present.
Remember the setting on the sta and iterate msta->valid_links so a link
added later inherits it. Iterating the sta's links also avoids a NULL
deref: a vif link may exist before its per-sta link_sta is set up.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 12 ++++++++++--
 drivers/net/wireless/mediatek/mt76/mt792x.h      |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 01d7526dbfa9..3af433d1e608 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1087,6 +1087,10 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	if (link_sta->sta->tdls)
 		set_bit(MT_WCID_FLAG_TDLS_PEER, &mlink->wcid.flags);
 
+	/* links added later inherit the sta decap offload setting */
+	if (msta->decap_offload)
+		set_bit(MT_WCID_FLAG_HDR_TRANS, &mlink->wcid.flags);
+
 	wcid = &mlink->wcid;
 	ewma_signal_init(&wcid->rssi);
 	rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
@@ -1932,7 +1936,7 @@ static void mt7925_sta_set_decap_offload(struct ieee80211_hw *hw,
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
-	unsigned long valid = mvif->valid_links;
+	unsigned long valid;
 	u8 i;
 
 	if (!msta->vif)
@@ -1940,7 +1944,11 @@ static void mt7925_sta_set_decap_offload(struct ieee80211_hw *hw,
 
 	mt792x_mutex_acquire(dev);
 
-	valid = ieee80211_vif_is_mld(vif) ? mvif->valid_links : BIT(0);
+	/* remember the setting, links added later inherit it */
+	msta->decap_offload = enabled;
+
+	/* iterate the sta's links, a vif link may not have a link_sta yet */
+	valid = ieee80211_vif_is_mld(vif) ? msta->valid_links : BIT(0);
 
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct mt792x_bss_conf *mconf;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 458f6f1fd6cd..96d4dfe8ee45 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -167,6 +167,7 @@ struct mt792x_sta {
 
 	/* NAN peer schedule */
 	struct mt792x_sta_nan_sched nan_sched;
+	bool decap_offload; /* remembered, applied to links added later */
 };
 
 DECLARE_EWMA(rssi, 10, 8);
-- 
2.45.2


