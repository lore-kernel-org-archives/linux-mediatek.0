Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2562CCD6E5D
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2026 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVfZZFzUPlA1ML0K+6cPCDB3mhjRNDsilzZV8Yr+ce4=; b=jkZYp0w10BWnrrMwRooispxvHT
	chqT6Wga+ZEq7gJ2dkaB7AhtNJIfUOo26Sy6xlDMEUTsZ9Ry0sf3idYP2oNN5EhuCwuIyN6On+9B8
	ygCkpoIVrkKtDcEIA5Ikz/ge2vSL/uNfYEg2/pGudk2UE43RHPosN+wN4rNi8mKZPca3+2KDhogO2
	mozJ7cirPpYoOa6eY0oRDsAGLiMbncLy6pwwXjPx0le5hifmrZVxKvBujM3vZ9Auud+zWfRmCw522
	aEsXQY/AOGU1Lucf2VtO4TkSDVakhK1bjzGsHWyO2yvmXl1wYiyduMMemlv4L5mFYFzwFwckWkT6v
	vFOWNXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSnn-00000000Xfd-06xG;
	Fri, 05 Jun 2026 11:33:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSnl-00000000Xef-0dIq
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jun 2026 11:33:26 +0000
X-UUID: 5b14cc3e60d211f1acbe4559397dec65-20260605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kVfZZFzUPlA1ML0K+6cPCDB3mhjRNDsilzZV8Yr+ce4=;
	b=QGF03WSZFAazQUTw3JTAhLCfSIUQkS+uE6bFabL7oBZH0ufvPWHOg+7xF1GPssWFD08wLZFqY7J2/20xns1v/bPTjv2dJRXur0/UtXw8IuxUrARPPxbr8mJ+O74dt3ezNPZhKKMK1Uz0nigQex4XPRyH2yAL5cPybXQct7hRIVY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:8561ae48-a8cd-4c2d-ac7d-b8192d2404c8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:3a116820-87a8-421b-982c-f5939dba7cba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5b14cc3e60d211f1acbe4559397dec65-20260605
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 377787554; Fri, 05 Jun 2026 04:33:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 19:33:18 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 19:33:17 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-mediatek@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	Shayne Chen <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 4/4] wifi: mt76: mt7996: fix potential tx_retries underflow
Date: Fri, 5 Jun 2026 04:33:06 -0700
Message-ID: <20260605113306.3485554-4-ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260605113306.3485554-1-ryder.lee@mediatek.com>
References: <20260605113306.3485554-1-ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043325_197415_189662FB 
X-CRM114-Status: GOOD (  10.31  )
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

When FIELD_GET returns 0 for the retry count, subtracting 1 causes
an unsigned integer underflow, resulting in tx_retries becoming a
very large value (0xFFFFFFFF for u32).

Fix by checking if count is non-zero before subtracting 1.

Fixes: 2461599f835e ("wifi: mt76: mt7996: get tx_retries and tx_failed from txfree")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index a59c14c8f..3fad977ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1361,13 +1361,13 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 				cur_info++;
 			continue;
 		} else if (info & MT_TXFREE_INFO_HEADER) {
-			u32 tx_retries = 0, tx_failed = 0;
+			u32 tx_retries = 0, tx_failed = 0, count;
 
 			if (!wcid)
 				continue;
 
-			tx_retries =
-				FIELD_GET(MT_TXFREE_INFO_COUNT, info) - 1;
+			count = FIELD_GET(MT_TXFREE_INFO_COUNT, info);
+			tx_retries = count ? count - 1 : 0;
 			tx_failed = tx_retries +
 				!!FIELD_GET(MT_TXFREE_INFO_STAT, info);
 
-- 
2.45.2


