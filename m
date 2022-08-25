Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21491ECAAA2
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 22:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t2alrwEYy46XNmgg17O9/mwJMo7NuDF98DRafstob3Y=; b=wZ0GRPS8W4zR3ZnYba8ZPtlHhi
	JdecVr1XqSEzy0Wq8xMh0CTIBcsag2CRM6AeTTAeG/CSXxVuffKLsSN0PNLnIoshVl57UUUqDTbt6
	aJ9vWl9zg0aG5RIyoCRRBB+Cbau0pY8RjRGYolGtCfcKB9ed+R+2EtEtIDGo3/7Gd8LxG+YgM5JB4
	RLaOQhaxmFTkqOwQxDvSNMBSvJTT7KO5qip6V7vP0rjsr7QpFfNQ8P+VbYJP/x0KqrOiUrLCttM0c
	8KylJkG8KHPKmn037qzfb1WHVzam/7nz0IQG1YJw+/vbS6+40rFAaP5I4gxtvWdIVromwp5mbFyhC
	uoJOjV5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRLjp-003xS3-4G; Thu, 25 Aug 2022 22:54:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRLjm-003xNx-4j
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 22:54:11 +0000
X-UUID: 1a7810a484a34f45814385c6e68b1c9a-20220825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=t2alrwEYy46XNmgg17O9/mwJMo7NuDF98DRafstob3Y=;
	b=NBUSoEXAFYg7ZNSZtf5wuku9xZCsoCpaiPv9p7I0y3topSiQ15tbUw1C0k5hOuj74ZJ37aP2RMTo7i3fwoX+iqDmB7jRie3Yb5XGIzGQA56g2EMPr0j10gvqt8jewMETzD3KIHYU8P3xwihfqQ/w5dysKjSvxrcMvoTKcQQ63i8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:4d98918a-b003-4553-b30e-7ca58350a732,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:be2ca2cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1a7810a484a34f45814385c6e68b1c9a-20220825
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 18646464; Thu, 25 Aug 2022 15:53:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 26 Aug 2022 06:33:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 26 Aug 2022 06:33:17 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Johannes Berg <johannes.berg@intel.com>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2] wifi: mac80211: read ethtool's sta_stats from sinfo
Date: Fri, 26 Aug 2022 06:33:16 +0800
Message-ID: <f9edff14dd7f5205acf1c21bae8e9d8f9802dd88.1661466499.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_155410_360108_4BA4123F 
X-CRM114-Status: UNSURE (   9.95  )
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
change since v2 - rebase on wireless-next
---
 net/mac80211/ethtool.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/ethtool.c b/net/mac80211/ethtool.c
index c2b38370bfb1..a3830d925cc2 100644
--- a/net/mac80211/ethtool.c
+++ b/net/mac80211/ethtool.c
@@ -83,17 +83,17 @@ static void ieee80211_get_stats(struct net_device *dev,
 
 #define ADD_STA_STATS(sta)					\
 	do {							\
-		data[i++] += (sta)->rx_stats.packets;		\
-		data[i++] += (sta)->rx_stats.bytes;		\
+		data[i++] += sinfo.rx_packets;			\
+		data[i++] += sinfo.rx_bytes;			\
 		data[i++] += (sta)->rx_stats.num_duplicates;	\
 		data[i++] += (sta)->rx_stats.fragments;		\
-		data[i++] += (sta)->rx_stats.dropped;		\
+		data[i++] += sinfo.rx_dropped_misc;		\
 								\
 		data[i++] += sinfo.tx_packets;			\
 		data[i++] += sinfo.tx_bytes;			\
 		data[i++] += (sta)->status_stats.filtered;	\
-		data[i++] += (sta)->status_stats.retry_failed;	\
-		data[i++] += (sta)->status_stats.retry_count;	\
+		data[i++] += sinfo.tx_failed;			\
+		data[i++] += sinfo.tx_retries;			\
 	} while (0)
 
 	/* For Managed stations, find the single station based on BSSID
-- 
2.36.1


