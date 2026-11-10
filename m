Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADA8606A908
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uNBTyFek;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=CIt98AuJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CUbhWIBW6/Te9hvZwpZcIzzgttBQgh/qmqRi+xQc6Gw=; b=uNBTyFekS9ixLGelhNdaw+G/U4
	icIfFaotLxkeFhlCDUJojjCeHZv3DjyDLNhK2Inr2OlmgiNlTFTPe/K9XXyKQALNERi6amaLJGkrz
	pDGRpJN0jSnyVSM+YEU2yLjdp5sH6BVI8Df65jRQYVVSJIBYREj9Ju25JRlmKNoB8y+aUIeihD7iT
	Y1mmb+idSfzi88DJGe1FJVruvpqBMJEW1qelUZVIPVjywm85Httg21H3oeKmjO8jp6r8zTbeXAw0C
	pP6mkJYGiDUMOQabiALCBiX/+ewsRjP313dOQRQ1jOskEXiscekQvatEP+GfvmGOFsn/6ZzRC+ZwN
	cOv8SxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIy-00000002FPx-21tI;
	Tue, 10 Nov 2026 03:13:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIb-00000002Enj-2gie
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:30 +0000
X-UUID: b1236d7adcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CUbhWIBW6/Te9hvZwpZcIzzgttBQgh/qmqRi+xQc6Gw=;
	b=CIt98AuJ5d6t7HpwVTSLsoHQXVkW+9acI7+r9PweiIJ19t5hmjlZzNlP0xbOXMedeivd3EYA8+XvNNvYq3r5k3ouHtcKmuoMShU09HU7GzHY/GlxF6LE/vJqj7dA8DxYUpHiCVgKfs2IA/j7J1obRPzFcIpHu478KF9PHhsb6bw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:a9a93b30-5bcc-4cb3-864b-a4d9312de7a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:552a0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b1236d7adcb411f1afed4741b24580c9-20261109
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 874213844; Mon, 09 Nov 2026 20:13:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:22 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 01/28] wifi: mt76: mt7925: fix the basic rate sent in the STA phy TLV
Date: Tue, 10 Nov 2026 11:12:17 +0800
Message-ID: <20261110031244.369014-2-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191329_700152_7FAF340C 
X-CRM114-Status: GOOD (  10.48  )
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

phy->basic_rate was set from link_conf->basic_rates, a mac80211
band-relative index, but the firmware reads it as an absolute HW rate-set
and pinned the MMPDU rate to CCK 1M (illegal on 5/6 GHz). Send the band's
HW basic-rate set instead, like the BMC path.

Fixes: e7a9853e6b8a ("wifi: mt76: mt7925: extend mt7925_mcu_sta_phy_tlv for per-link STA")
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index f45b0d81fd08..de4c95006c4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2059,7 +2059,9 @@ mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
 							    link_sta);
 	}
 
-	phy->basic_rate = cpu_to_le16((u16)link_conf->basic_rates);
+	/* Firmware expects the HW basic-rate bitmap, not mac80211's band-relative one. */
+	phy->basic_rate = cpu_to_le16(chandef->chan->band == NL80211_BAND_2GHZ ?
+			      HR_DSSS_ERP_BASIC_RATE : OFDM_BASIC_RATE);
 	if (link_sta->ht_cap.ht_supported) {
 		af = link_sta->ht_cap.ampdu_factor;
 		mm = link_sta->ht_cap.ampdu_density;
-- 
2.45.2


