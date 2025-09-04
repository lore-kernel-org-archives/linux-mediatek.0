Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AAACA1014
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 03:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jO8i8kXujf744Mn62wNF2Zi3h3rmmA7bL/Jy8/gBbNU=; b=4SscK0DFkiA6IYZF1tlVJsRzgA
	0Je/j0wLphnws0GUx1zL4kvD3atqWn0mhBhk9umfG2HsiSRUUdc0ZJTLhUjMyyypJ2emqHq3B6g7W
	DNBtUM6mQV4+8VjTq/K4P8mXWNd83P1kMkmMcIxmk3OJkxNs1TnogEVAeKevzroU5b3yDBFX7Fpuv
	oNI3NMjUxDczEtEAIZ96172QaI7nrAPeIvSKpY8F792QdNgAGwpI0KS8l7rdNeXHFmpJVgOi0Tg4n
	ePBMvgbscNqgIWcSoVdntNqnO1qLTu+w/7V4EIgyQgtvGL3uj9sQg/+AUkup0FlupXT63WSafmBQ5
	F9fn1GGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Jo-00000008ZtS-3z9j;
	Thu, 04 Sep 2025 03:07:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Jn-00000008ZsH-2I9x
	for linux-mediatek@bombadil.infradead.org;
	Thu, 04 Sep 2025 03:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jO8i8kXujf744Mn62wNF2Zi3h3rmmA7bL/Jy8/gBbNU=; b=XGqCcuFcJD74ecH/N3ysjb0wOz
	RyGHeZzlkM/FyMnKJS1N81Mwqbw8XeNjkwuLsscTtlc/lszyunJrpADHBRFm8ZwP6CGQJq89O3Ede
	ngYvaJ6KtDcrLEzJYE0lrRYWhSW/ryFPBdkd4IvOuZiE3Gqt1YSGdKueuVKOBYlJ7cWUZYofgeWpb
	l0RybShA6lKy2/eTQC3SvxteByKZ/ogg40VnHsL1O6rwMDdanjL7y9AtdJDGBCxXOeWS6pXScnkLQ
	0Ul7c2amvzOWkVq8EscPuo9hicBTTE5v9mstEvRXEcX14y6yy8BST0h6W7Ih0u40FC8JxhVE6Oa/s
	4pfmRAOg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Ji-00000004Gxg-2Spw
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Sep 2025 03:07:22 +0000
X-UUID: 3dc3afb0893c11f09f706fa2197c6ceb-20250903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jO8i8kXujf744Mn62wNF2Zi3h3rmmA7bL/Jy8/gBbNU=;
	b=pqG8k13tBrkoXyqL+ghdgEWc9vYxPSP9f7ChpgbPgourcFYryk00gx4WWCPkh3x9y04uPVDdg4yMMs0RhkY0MNNbz4/px9CIX2uCBwXLXS1DPtB7iN7r7wC56MsPrw77qySHPQJGydrfNEwxha7xQhuR27ZxGjjkeI+zyDURUmo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:8b322891-fb77-40ac-8ae1-9bcaf4779744,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:b3e9ecf7-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3dc3afb0893c11f09f706fa2197c6ceb-20250903
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1975079832; Wed, 03 Sep 2025 20:07:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 4 Sep 2025 11:07:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 4 Sep 2025 11:07:03 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 1/4] wifi: mt76: mt792x: protect state->cc_* counters with cc_lock
Date: Thu, 4 Sep 2025 11:06:46 +0800
Message-ID: <20250904030649.655436-2-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250904030649.655436-1-mingyen.hsieh@mediatek.com>
References: <20250904030649.655436-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040720_392461_707081DE 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The updates to state->cc_* (cc_busy, cc_tx, etc.) lack synchronization,
risking race conditions and inconsistent statistics.

Add cc_lock protection to ensure atomic updates.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
index 3f1d9ba49076..f86e0ac91100 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
@@ -243,10 +243,14 @@ mt792x_phy_update_channel(struct mt76_phy *mphy, int idx)
 		phy->noise += nf - (phy->noise >> 4);
 
 	state = mphy->chan_state;
+
+	spin_lock_bh(&dev->mt76.cc_lock);
 	state->cc_busy += busy_time;
 	state->cc_tx += tx_time;
 	state->cc_rx += rx_time + obss_time;
 	state->cc_bss_rx += rx_time;
+	spin_unlock_bh(&dev->mt76.cc_lock);
+
 	state->noise = -(phy->noise >> 4);
 }
 
-- 
2.34.1


