Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64307CFD37B
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 03:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KDwG6fc75Su8TgSqt1191uvzmrNQSqxaj1ulrwzJEA=; b=VkBtDt957r3B47EMCMMytFn1RG
	2NwsVMc+0N7GbuvvcGgZjqzMBfuJuzGgRkDp6OSu66uatQuf7oO8doputgGIOBRTlVxv3zKzBeZ71
	SISjuNhrHl1i/tscTkVCA1YUzEXgyGwcBf0yVfs2Qg68TOxkCZAq+KiXvIRua5RmwPd9RSgz4WAog
	nTjxx0Pj5IN6YDg3RXJHqUBSok9OTXJqM93vA6fyWSdQK44l0Mj9p8jhO/9Aot9XYdwfmvr1lOAsD
	HuSh8WR1/acDYSWE18MFj4t9k2vHZE31k+aJnw7Hk5LXblYgKh6TjU6v3VjsaB2ziwYkrWKGNo1pc
	udH71DMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNk1f-0000000CheG-1Ukv;
	Tue, 25 Nov 2025 03:47:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNk1c-0000000ChY8-03oi
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Nov 2025 03:47:33 +0000
X-UUID: 75d7d650c9b111f09f706fa2197c6ceb-20251124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1KDwG6fc75Su8TgSqt1191uvzmrNQSqxaj1ulrwzJEA=;
	b=LyMvSIM6Hk3i91p5Tk+jtR67RT8RP/jCxeDFHg7YqOwg6pwldq5yEYf6OlJBIFQkltpD5zzmOBjXoUB/2AR9oSzhZXaWdnO11ZFhsQLpNwT6kDaPJEUaVYkJI1gei1PJK0WA+lhoRiNGCPPookSswQgIxJhIWzxs3bB9fXsIYDA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:da6c8e13-ddb4-4f1c-a5f9-c7976833f661,IP:0,UR
	L:0,TC:0,Content:-25,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-45
X-CID-META: VersionHash:a9d874c,CLOUDID:74152abb-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:1|19,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75d7d650c9b111f09f706fa2197c6ceb-20251124
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1767636225; Mon, 24 Nov 2025 20:47:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 25 Nov 2025 11:47:24 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 25 Nov 2025 11:47:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 7/7] wifi: mt76: mt7996: fix iface combination for different chipsets
Date: Tue, 25 Nov 2025 11:46:39 +0800
Message-ID: <20251125034639.1416214-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251125034639.1416214-1-shayne.chen@mediatek.com>
References: <20251125034639.1416214-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_194732_094761_31D99601 
X-CRM114-Status: GOOD (  10.47  )
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

MT7992 and MT7990 support up to 19 interfaces per band and 32 in total.

Fixes: 8df63a4bbe3d ("wifi: mt76: mt7996: adjust interface num and wtbl size for mt7992")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c    | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 7e8bd3b142e7..2e439f0815d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -34,6 +34,20 @@ static const struct ieee80211_iface_combination if_comb_global = {
 			       BIT(NL80211_CHAN_WIDTH_40) |
 			       BIT(NL80211_CHAN_WIDTH_80) |
 			       BIT(NL80211_CHAN_WIDTH_160),
+	.beacon_int_min_gcd = 100,
+};
+
+static const struct ieee80211_iface_combination if_comb_global_7992 = {
+	.limits = &if_limits_global,
+	.n_limits = 1,
+	.max_interfaces = 32,
+	.num_different_channels = MT7996_MAX_RADIOS - 1,
+	.radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
+			       BIT(NL80211_CHAN_WIDTH_20) |
+			       BIT(NL80211_CHAN_WIDTH_40) |
+			       BIT(NL80211_CHAN_WIDTH_80) |
+			       BIT(NL80211_CHAN_WIDTH_160),
+	.beacon_int_min_gcd = 100,
 };
 
 static const struct ieee80211_iface_limit if_limits[] = {
@@ -485,7 +499,8 @@ mt7996_init_wiphy(struct ieee80211_hw *hw, struct mtk_wed_device *wed)
 	hw->vif_data_size = sizeof(struct mt7996_vif);
 	hw->chanctx_data_size = sizeof(struct mt76_chanctx);
 
-	wiphy->iface_combinations = &if_comb_global;
+	wiphy->iface_combinations = is_mt7996(&dev->mt76) ? &if_comb_global :
+							    &if_comb_global_7992;
 	wiphy->n_iface_combinations = 1;
 
 	wiphy->radio = dev->radios;
-- 
2.51.0


