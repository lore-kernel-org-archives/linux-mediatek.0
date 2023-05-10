Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341FEC7EE25
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 04:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Va3ysEUmIoVWyFo600g7sh1Dh7QpOmSk6nUcgf1dMmM=; b=YMlzajJiexuNJRuOS0/UODf6cn
	j7GtVlAW9oafDgx9dsDN/lmRKlaEJHMIIfzSqI7hJWQOlRkQqHR/VYjwmUe9gmv/psNYqd58I4MBN
	xXtc//TcGvSSjsH6A+QFqnfe0x2fN2QJVJP9eL8ziqYUINmREJf+Euro/v28BZ68mZlY1qpgexdrR
	WfTgGPM//4VSS0/weV+jTf1uRRVw4tQFe+FVB+BcUaKITWIqynXYRV/LF+H+xtIVWmGRKpglFPZ/6
	/IpGl4SM4LaiLYEX8xjU/ZMVtqXG8XuYfnhTUvg85zshbN3iRMOm8QkZ8dTI94OISsvAi6TS04LBb
	O2QtBZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbpZ-0054Wa-2u;
	Wed, 10 May 2023 04:53:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbpX-0054TT-1l
	for linux-mediatek@lists.infradead.org;
	Wed, 10 May 2023 04:53:36 +0000
X-UUID: 99915742eeee11ed912e1518a6540028-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Va3ysEUmIoVWyFo600g7sh1Dh7QpOmSk6nUcgf1dMmM=;
	b=D6hvzmXudBpLjSk45AmhMFuETgtW62B6rm7KdE8aCkoHQmxuipYQsSu8w8W85OmyZ2rImuHwqMyMrzUPXRsGOSvMt0tUIbGjQvBpRWFo+I0s8Y/cCorMnQKNnJDv4hjWZ2pRoApMPxxwmLbkxFMJd0U6YTVVUlIrZci4T+qogRY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:18ad9f54-9b74-4381-9d5b-acedf50c7708,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:86a7ad3a-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 99915742eeee11ed912e1518a6540028-20230509
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 897732789; Tue, 09 May 2023 21:53:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH v3 6/6] wifi: mt76: mt7996: drop return in mt7996_sta_statistics
Date: Wed, 10 May 2023 12:53:21 +0800
Message-ID: <7fe20aedadf5ce581f6e4a8d2ef9f48e2cc87702.1683670255.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <e3cddf1cff5f060478c2de9e4e4021541549e750.1683670255.git.ryder.lee@mediatek.com>
References: <e3cddf1cff5f060478c2de9e4e4021541549e750.1683670255.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_215335_596503_23BCF4C1 
X-CRM114-Status: GOOD (  10.36  )
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
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 0975774fe244..8e1b7cc48146 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -953,18 +953,19 @@ static void mt7996_sta_statistics(struct ieee80211_hw *hw,
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 	struct rate_info *txrate = &msta->wcid.rate;
 
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
 	sinfo->txrate.flags = txrate->flags;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
-- 
2.18.0


