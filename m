Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FF2C7115C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D+CCFp+Wc7beQ37y1zJonANxhmhz8jMYorTeDhJV7TE=; b=2Rufsv02xQpLfw7kFyQhIz1r94
	SKr8VeBsiPStz3ouaqX2Cn/LXzdENZ674QB8/Pe4YVLY++ZNbzK8dv6tQLfTj/iVtNtFJTsuvSr8M
	YkDigrg3wY++1JzfCEU0NfM5cb0vaaj/13LagzwAEG+RkRQA6fsFTd8xRn1UJUS3kSpiuYGnFYWtQ
	ymMgVrNOG7yvMPDfbHxYW3nVA9BkI4WDv5PZJktLocGA3ywYMTKpxy7dNpgs559ErsiEOsQep23mf
	nkkZnTeEmgp7yzvUOuqTj7hC4QchbmHwRR663P+N9ghCAw+kZHpbStkJUlQoNJjCp7aFSewEZIvza
	1TS0ga1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRi-0000000DRkC-0EQI;
	Thu, 19 Jun 2025 15:44:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDJZ-0000000Cqau-1WmS
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Jun 2025 11:20:18 +0000
X-UUID: 5c50c4fa4cff11f09eb0dd999d3936bf-20250619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=D+CCFp+Wc7beQ37y1zJonANxhmhz8jMYorTeDhJV7TE=;
	b=laUZKVVvI0Q9v/dQsf3J5BQ1Rmd0oSJMY5HLOH7zjo4ILltKw0DeiGQ1YpBUe1/2g4w9odjjsdqFGTia0bJfKQAg/nEgpktRLvCcY52w81iJ9X/tciyXsMxJ383NRKAuTXcv8iZ0s9HMzUDJqQjHrm+42NgDPkxl9aZyU8SMVG4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:8678f66c-12c8-4400-8d94-1aea5209e842,IP:0,UR
	L:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-55
X-CID-META: VersionHash:09905cf,CLOUDID:7b35a328-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5c50c4fa4cff11f09eb0dd999d3936bf-20250619
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 569157024; Thu, 19 Jun 2025 04:20:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 19 Jun 2025 19:20:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 19 Jun 2025 19:20:05 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Leon Yen <leon.yen@mediatek.com>, "Ming
 Yen Hsieh" <mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: Limit the concurrent STA and SoftAP to operate on the same channel
Date: Thu, 19 Jun 2025 19:20:05 +0800
Message-ID: <20250619112005.2071110-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_042017_416525_4D384B42 
X-CRM114-Status: GOOD (  12.26  )
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

From: Leon Yen <leon.yen@mediatek.com>

Due to the lack of NoA(Notice of Absence) mechanism in SoftAP mode, it is
inappropriate to allow concurrent SoftAP and STA to operate on the
different channels.

This patch restricts the concurrent SoftAP and STA to be setup on the same
channel only.

Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 42 ++++++++++++++++---
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 7f572f8afc02..869fd90202b8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -28,7 +28,7 @@ static const struct ieee80211_iface_combination if_comb[] = {
 	},
 };
 
-static const struct ieee80211_iface_limit if_limits_chanctx[] = {
+static const struct ieee80211_iface_limit if_limits_chanctx_mcc[] = {
 	{
 		.max = 2,
 		.types = BIT(NL80211_IFTYPE_STATION) |
@@ -36,8 +36,7 @@ static const struct ieee80211_iface_limit if_limits_chanctx[] = {
 	},
 	{
 		.max = 1,
-		.types = BIT(NL80211_IFTYPE_AP) |
-			 BIT(NL80211_IFTYPE_P2P_GO)
+		.types = BIT(NL80211_IFTYPE_P2P_GO)
 	},
 	{
 		.max = 1,
@@ -45,16 +44,47 @@ static const struct ieee80211_iface_limit if_limits_chanctx[] = {
 	}
 };
 
-static const struct ieee80211_iface_combination if_comb_chanctx[] = {
+static const struct ieee80211_iface_combination if_comb_chanctx_mcc[] = {
 	{
-		.limits = if_limits_chanctx,
-		.n_limits = ARRAY_SIZE(if_limits_chanctx),
+		.limits = if_limits_chanctx_mcc,
+		.n_limits = ARRAY_SIZE(if_limits_chanctx_mcc),
 		.max_interfaces = 3,
 		.num_different_channels = 2,
 		.beacon_int_infra_match = false,
 	}
 };
 
+static const struct ieee80211_iface_limit if_limits_chanctx_scc[] = {
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_STATION) |
+			 BIT(NL80211_IFTYPE_P2P_CLIENT)
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_AP)
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_P2P_DEVICE)
+	}
+};
+
+static const struct ieee80211_iface_combination if_comb_chanctx_scc[] = {
+	{
+		.limits = if_limits_chanctx_scc,
+		.n_limits = ARRAY_SIZE(if_limits_chanctx_scc),
+		.max_interfaces = 3,
+		.num_different_channels = 1,
+		.beacon_int_infra_match = false,
+	}
+};
+
+static const struct ieee80211_iface_combination if_comb_chanctx[] = {
+		if_comb_chanctx_mcc[0],
+		if_comb_chanctx_scc[0],
+};
+
 void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	       struct sk_buff *skb)
 {
-- 
2.34.1


