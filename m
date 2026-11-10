Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450CF606A32E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vSavuYXl;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=nGFtcw/V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IuKU3+chqCFwUQVl26cUdfzsRFANDcdm51UBlZHH+rw=; b=vSavuYXlJCvBYxdYaLSlk+cYC4
	i7V4Kupx/bwY7/2GREqyXfdYizJfZJHQbCcd9KU1Wpk3irM6FXFpm8tFWN7HsmVQP+rzvLBbRC0gw
	XD4NJrmBoMoir//BcqEH7pee4gTmveDP0vcbKdPGxJ5IgYwmipm0y4oBkeQZ1kY3hSq6oqNO/HM6u
	VZmNMaEJwtcdSxQMMAyLZZsxzIgnQFOpesWzUyKJQwkibcJ2afZlosMBawU8HGoBWduEMn+Q0UZVq
	Ex4CpX9irj1jxwwz0DLvCUF8m9cOBHaAZV2w+lAcAlkMRKdRTymdHTemlWKvvLOQYIo6fnQcQJ87u
	wQJTChMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ7-00000002FkD-1qer;
	Tue, 10 Nov 2026 03:14:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIv-00000002FN3-0t7U
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:52 +0000
X-UUID: b8c0a0d4dcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IuKU3+chqCFwUQVl26cUdfzsRFANDcdm51UBlZHH+rw=;
	b=nGFtcw/Vc5k+K4h2BItKkGCQ+0DKlnWkr+NpNXFl0pldzw5Vop1fOlu2sGF3DbR5zFY+JCaEyST17erhIPmSuTJrK/x5O5Kymyw2suU8Z2wcEazffjWLjNtYrIRoTQoWSvXgYs27Kwv61EPN2Ng43aPjt9B24yST2jeYIMiUa2Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:0d0d3133-bef1-46d4-92a2-5d77b662c87c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3f2b0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8c0a0d4dcb411f1afed4741b24580c9-20261109
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1728462606; Mon, 09 Nov 2026 20:13:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:36 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 27/28] wifi: mt76: mt7925: clear the MLD BSS tag on deactivate
Date: Tue, 10 Nov 2026 11:12:43 +0800
Message-ID: <20261110031244.369014-28-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191349_284639_EF313BE8 
X-CRM114-Status: GOOD (  11.22  )
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

Add an enable flag to mt7925_mcu_bss_mld_tlv(). On deactivate clear
the MLD fields, otherwise the firmware keeps the hybrid-MLO OM remap
and the deflink's TX OWN_MAC stays mapped to a dead MLO primary OMAC
after reconnect.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d02242870115..588328a01dc8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3263,7 +3263,7 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 
 static void
 mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
-		       struct ieee80211_bss_conf *link_conf)
+		       struct ieee80211_bss_conf *link_conf, bool enable)
 {
 	struct ieee80211_vif *vif = link_conf->vif;
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
@@ -3275,10 +3275,14 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	bool is_hybrid;
 	bool is_supported_ap = false;
 
-	is_mld = ieee80211_vif_is_mld(link_conf->vif) ||
-		 (hweight16(mvif->valid_links) > 1);
+	/* On deactivate clear the MLD classification. Otherwise the FW
+	 * keeps the hybrid-MLO OM remap and the deflink's TX OWN_MAC stays
+	 * mapped to a dead MLO primary OMAC after reconnect.
+	 */
+	is_mld = enable && (ieee80211_vif_is_mld(link_conf->vif) ||
+			    (hweight16(mvif->valid_links) > 1));
 	/* three links means hybrid MLO */
-	is_hybrid = hweight16(mvif->valid_links) >= 3 &&
+	is_hybrid = enable && hweight16(mvif->valid_links) >= 3 &&
 		    (phy->chip_cap & BIT(MT792x_CHIP_CAP_MLO_HYBRID_EN));
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_MLD, sizeof(*mld));
@@ -3450,7 +3454,7 @@ int mt7925_mcu_add_bss_info_sta(struct mt792x_phy *phy,
 	mt7925_mcu_bss_sec_tlv(skb, link_conf);
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
-	mt7925_mcu_bss_mld_tlv(skb, link_conf);
+	mt7925_mcu_bss_mld_tlv(skb, link_conf, enable);
 	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
 
 	if (link_conf->he_support) {
-- 
2.45.2


