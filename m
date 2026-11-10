Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FB360A2608
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xQDNV8dy;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=RH+y4yIa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p2FBISASke6tj+A+Ecr6Vf40pR1tBsOCu9ra75n8WqA=; b=xQDNV8dyl6GAsRxwrqqoU0auZC
	ZOgow8XuFZLOdZ5bnBbLDoLG5EgNj1wjVZPI0Iy7dL9U7Xhkekb1qOWxN0awAx9l4zUVG7tHct+KS
	hRFdELtDhQXl99PH/X9WxKWygGIRE+upEdC2aR0Yz+t0ToK2ELL93GIKzEWj98SYjkW1L3kbh3YOv
	h+UDZjY5So7g81/EX9lrk2VDhT7L3YtWsPhh2TvSOWc4PJGX3+Yvu9k8lqB0H+qd3VBWe5biJTOiU
	eWf2MuW/J1L1KDanM7cbCVt7dnQiUytq5YUt67FD41C5Ug5Nx5khQitLhlxCrG5/cSXqyR/Adz5kV
	jSXCAdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIy-00000002FQ1-2MTJ;
	Tue, 10 Nov 2026 03:13:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIe-00000002Evh-0nOY
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:33 +0000
X-UUID: b172e9d6dcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=p2FBISASke6tj+A+Ecr6Vf40pR1tBsOCu9ra75n8WqA=;
	b=RH+y4yIauMS4ce4h7Ne9FBc3kQtuxeFaPx7QopIXnuQp/jJLBaHBYTgUpm+q5n5vQhjWmXgwwWq7jigP6bmlxQdm9zW0YkDYnVgs7u7dOTTvQGnYuoBQlwKlgKhE0QZx9JL08IsU8QK6EWSw8d9UJeZNcSMG75dZr8Upx+Fap+s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:e5b7a3f9-d6ec-4e51-8a7d-2653cfb033a5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:bb1dc3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b172e9d6dcb411f1afed4741b24580c9-20261109
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 232247815; Mon, 09 Nov 2026 20:13:25 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:23 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:23 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH 02/28] wifi: mt76: mt7925: fix MLO sub-link memory leak on disconnect
Date: Tue, 10 Nov 2026 11:12:18 +0800
Message-ID: <20261110031244.369014-3-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191332_256541_FA534E20 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

mt7925_change_vif_links() resolved removed links through
mt792x_vif_to_link(), which falls back to the deflink after mac80211
clears vif->valid_links, so sub-link mconf/mlink were leaked.

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Cc: stable@vger.kernel.org
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 222836699d15..0a6c931843ec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2383,14 +2383,18 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mt792x_mutex_acquire(dev);
 
 	for_each_set_bit(link_id, &rem, IEEE80211_MLD_MAX_NUM_LINKS) {
-		mconf = mt792x_vif_to_link(mvif, link_id);
-		mlink = mt792x_sta_to_link(&mvif->sta, link_id);
+		mconf = rcu_access_pointer(mvif->link_conf[link_id]);
+		mlink = rcu_access_pointer(mvif->sta.link[link_id]);
 
 		if (!mconf || !mlink)
 			continue;
 
-		if (mconf != &mvif->bss_conf) {
-			mt792x_mac_link_bss_remove(dev, mconf, mlink);
+		if (link_id != mvif->deflink_id) {
+			/* STATION already deactivated the sub-link FW BSS in
+			 * mt7925_mac_sta_remove(); AP has no such path.
+			 */
+			if (vif->type != NL80211_IFTYPE_STATION)
+				mt792x_mac_link_bss_remove(dev, mconf, mlink);
 			mt7925_p2p_bmc_remove(dev, mconf);
 			devm_kfree(dev->mt76.dev, mconf);
 			devm_kfree(dev->mt76.dev, mlink);
-- 
2.45.2


