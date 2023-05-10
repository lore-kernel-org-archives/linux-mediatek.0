Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02FBC77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 04:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYwMXsbC2TORqhM+20EAcvO2mrA9AKvCBXLLqb9xS2E=; b=5GNOYPEpAQJGE9wOiN5BfvRmX6
	IK5reGhpWInCViK5GrPyztT/NHiijFKcK5AKKLibpiVW0BKRqt9Tb+um952D+0jHJTwzicdNEPB2m
	RDxoS+nTZHvEd7LBRxCAE4uXGbOpbGNxFaQbnPdiMEefSqe+4aC3xqIM93/GikTm5so7L6O9UnLo6
	UFyhv9MgCEbRKm8frM8YqrDrj0x5nxjpRE0X1vjXPqSjV0weGepIsStsZ77vvWlnl2/geFRIoRegl
	FWaXSgH6zOC69Hp2OcqVJJqo/lK5dG8/F9qOqPFbuJBIbboiNQ0dl2+e9b7TJhjE9HQnGdn4FnchN
	41gWlBfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbpT-0054TE-1P;
	Wed, 10 May 2023 04:53:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbpR-0054S5-0e
	for linux-mediatek@lists.infradead.org;
	Wed, 10 May 2023 04:53:30 +0000
X-UUID: 99293748eeee11ed83ed1395ce914268-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fYwMXsbC2TORqhM+20EAcvO2mrA9AKvCBXLLqb9xS2E=;
	b=aev8zxhIWZxbGgPaa4rTexkbmPhX8J33LL+n++NcUN73o7HEmayhqAOwK5NhLNvD/U5YSelHMb3MgvL7yUGQZWpdf4BppUWuoARYXCLR15c5lu9txxhMOurg0hJ/7R9Rlp9CnKZeOBzZYUxOzj/tveO8CPiSFWl/7CdAyFJzeKk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:c1e5c078-ae9c-458d-9ca9-1fc7a5b14d9d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:24a4526b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 99293748eeee11ed83ed1395ce914268-20230509
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1794543948; Tue, 09 May 2023 21:53:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 12:53:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 12:53:25 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v3 5/6] wifi: mt76: mt7915: drop return in mt7915_sta_statistics
Date: Wed, 10 May 2023 12:53:20 +0800
Message-ID: <cd025d5709710d0895ea62c4f1f17e99f1911a40.1683670255.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <e3cddf1cff5f060478c2de9e4e4021541549e750.1683670255.git.ryder.lee@mediatek.com>
References: <e3cddf1cff5f060478c2de9e4e4021541549e750.1683670255.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_215329_247516_759491E4 
X-CRM114-Status: GOOD (  10.74  )
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

Avoid blocking other statistics sinfo->filled when txrate is
unavailable.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 27 +++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index b306a4fae1fc..d899bc2d0a84 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1020,21 +1020,20 @@ static void mt7915_sta_statistics(struct ieee80211_hw *hw,
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_BITRATE);
 	}
 
-	if (!txrate->legacy && !txrate->flags)
-		return;
-
-	if (txrate->legacy) {
-		sinfo->txrate.legacy = txrate->legacy;
-	} else {
-		sinfo->txrate.mcs = txrate->mcs;
-		sinfo->txrate.nss = txrate->nss;
-		sinfo->txrate.bw = txrate->bw;
-		sinfo->txrate.he_gi = txrate->he_gi;
-		sinfo->txrate.he_dcm = txrate->he_dcm;
-		sinfo->txrate.he_ru_alloc = txrate->he_ru_alloc;
+	if (txrate->legacy || txrate->flags) {
+		if (txrate->legacy) {
+			sinfo->txrate.legacy = txrate->legacy;
+		} else {
+			sinfo->txrate.mcs = txrate->mcs;
+			sinfo->txrate.nss = txrate->nss;
+			sinfo->txrate.bw = txrate->bw;
+			sinfo->txrate.he_gi = txrate->he_gi;
+			sinfo->txrate.he_dcm = txrate->he_dcm;
+			sinfo->txrate.he_ru_alloc = txrate->he_ru_alloc;
+		}
+		sinfo->txrate.flags = txrate->flags;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 	}
-	sinfo->txrate.flags = txrate->flags;
-	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 
 	/* offloading flows bypass networking stack, so driver counts and
 	 * reports sta statistics via NL80211_STA_INFO when WED is active.
-- 
2.18.0


