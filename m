Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E3BC83F04
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bEVziZ0eHEerI8E7lOtKLbZkM3NzOCChhELV4G+dw0E=; b=PArNSts7E0cGVPUF76ZnUZYQiq
	yyC27KRHMPjc4GhamCDJIuVLKvq0o9ODBTsJGhHIRrWcxWCOBxCXgqArcWUIOljVtqJSV2j2HL1Rd
	/JLk9Q9xCd1XhlqXDsqJlUKUGRpzlAh5ewnJQ+6a+v+qr26QtJU4/7jOdW8DeBk/X+bgaaphcsOB3
	S+a7F4h5Nwn8nc+nE15sdmPR55ht5qFj8VSnb1CEK5UUXHt/M3VCySBBCSJxoGBsfZnY85QjjDGPA
	mEQF2NUA8PUVviL+brEEnskrz8K6t7u4XwWAxOYcdkBLeYrHOD5vvDajJB97Qkq+eKcKR5dIQZUGs
	mbxinNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvg8-000000088kA-0xcr;
	Wed, 02 Jul 2025 11:31:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuwq-00000007zNI-1Cdh
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Jul 2025 10:44:17 +0000
X-UUID: 7d9c3432573111f09f706fa2197c6ceb-20250702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bEVziZ0eHEerI8E7lOtKLbZkM3NzOCChhELV4G+dw0E=;
	b=mvqlbPMloW/QWGrxntG7SanN1gxOl1wKCB5/qv4Ft9bF97Dflh5CuS7ZNt7pB+7+OoDWE+tdp3pBPtHuK5VXPjC06cYVE3dA0/9HnXW33+btfNRq9jn+o3aZz0z5PiiALBbyO9CrIIdIoCaPsuB40XNVn8L0kLWPD+bEgXh6NgI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:03bd2f68-71e7-4c16-b641-c008f0d4695d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:4b4fa49c-b8a9-480a-b7e5-687022facff7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7d9c3432573111f09f706fa2197c6ceb-20250702
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 693189425; Wed, 02 Jul 2025 03:44:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Jul 2025 18:44:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 2 Jul 2025 18:44:09 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: determine missing link_id in ieee80211_rx_for_interface() based on band
Date: Wed, 2 Jul 2025 18:44:03 +0800
Message-ID: <20250702104403.2738634-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_034416_344488_E594EAFA 
X-CRM114-Status: GOOD (  13.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For broadcast frames, every interface might have to process it and
therefore the link_id cannot be determined in the driver.

When the frame is about to be forwarded to each interface, we can
use the member "band" in struct ieee80211_rx_status to determine the
"link_id" for each interface.

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
Reviewed-by: Money Wang <money.wang@mediatek.com>
---
 net/mac80211/rx.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 09beb65d6108..7671fd39a60e 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5115,8 +5115,28 @@ static bool ieee80211_rx_for_interface(struct ieee80211_rx_data *rx,
 		struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 
 		sta = sta_info_get_bss(rx->sdata, hdr->addr2);
-		if (status->link_valid)
+		if (status->link_valid) {
 			link_id = status->link_id;
+		} else if (ieee80211_vif_is_mld(&rx->sdata->vif)) {
+			struct ieee80211_supported_band *sband;
+			struct ieee80211_link_data *link;
+			int i;
+
+			for_each_valid_link(&rx->sdata->wdev, i) {
+				link = rcu_dereference(rx->sdata->link[i]);
+				if (!link)
+					continue;
+
+				sband = ieee80211_get_link_sband(link);
+				if (!sband)
+					continue;
+
+				if (status->band == sband->band) {
+					link_id = i;
+					break;
+				}
+			}
+		}
 	}
 
 	if (!ieee80211_rx_data_set_sta(rx, sta, link_id))
-- 
2.25.1


