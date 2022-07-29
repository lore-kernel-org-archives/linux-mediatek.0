Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F54C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 02:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PtXl3bAaLm+hh7qezRfzCzYhn4d1rpZoQYTgFS355TU=; b=DktCT1IRW/mhz+UgWi/w9dN6WB
	C13X/csKNLTurx+dEAqxfz5c3HUnKPb18GMqwl2zS7G3DpLpeXPfOxxJW40zkIjGtqyCPm1NfdR3a
	HgUMZZGLo4zF0x4t7BvlDgLV3fH0tMn4sWgvtXj184sQ35ytlYWFVp3KmDKuzNxYgngrOn0MLmJH1
	hR7Pu+Lbb/u+85/TCUqbFu2u1M6yEUNamdCu/7omyKmqVbKZK3KucSiN5OEcG51WcwtukI7Mhqjs2
	TYLQfhw+cbGaugj1zs1qF3PVu56e/gSWd9fUxtjtM8au89oMLns5B5i9FSfwkkdczbHDlWRvV2j8S
	sZaxXLWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHFr9-0001Vd-Ja; Fri, 29 Jul 2022 02:36:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHFr5-0001UV-Dw
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 02:36:02 +0000
X-UUID: 53190567f0c44f0fb519c14f6c908dbc-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:42613c26-8eba-44cb-a5d0-13ef94006700,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:2bbeb2cf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 53190567f0c44f0fb519c14f6c908dbc-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 749149204; Thu, 28 Jul 2022 19:35:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 10:15:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 10:15:16 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Johannes Berg <johannes.berg@intel.com>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: read ethtool's sta_stats from sinfo
Date: Fri, 29 Jul 2022 10:15:15 +0800
Message-ID: <ccfce8848c7bf7199ab90ccf3b4b14e1c7633385.1659060644.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_193559_493186_BF6E8D3D 
X-CRM114-Status: UNSURE (   8.97  )
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

Driver may update sinfo directly through .sta_statistics, so this
patch makes sure that ethool gets the correct statistics.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/mac80211/ethtool.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/ethtool.c b/net/mac80211/ethtool.c
index 31cd3c1ac07f..26d7a967f10a 100644
--- a/net/mac80211/ethtool.c
+++ b/net/mac80211/ethtool.c
@@ -83,17 +83,17 @@ static void ieee80211_get_stats(struct net_device *dev,
 
 #define ADD_STA_STATS(sta)					\
 	do {							\
-		data[i++] += sta->rx_stats.packets;		\
-		data[i++] += sta->rx_stats.bytes;		\
+		data[i++] += sinfo.rx_packets;			\
+		data[i++] += sinfo.rx_bytes;			\
 		data[i++] += sta->rx_stats.num_duplicates;	\
 		data[i++] += sta->rx_stats.fragments;		\
-		data[i++] += sta->rx_stats.dropped;		\
+		data[i++] += sinfo.rx_dropped_misc;		\
 								\
 		data[i++] += sinfo.tx_packets;			\
 		data[i++] += sinfo.tx_bytes;			\
 		data[i++] += sta->status_stats.filtered;	\
-		data[i++] += sta->status_stats.retry_failed;	\
-		data[i++] += sta->status_stats.retry_count;	\
+		data[i++] += sinfo.tx_failed;			\
+		data[i++] += sinfo.tx_retries;			\
 	} while (0)
 
 	/* For Managed stations, find the single station based on BSSID
-- 
2.36.1


