Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAF3C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 20:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/bGL7NeH7E4fkHcQ5YBrB8gRbZfK+h45aAwfGCIDyJQ=; b=E+SGwiwhcwEg8JszU9a11JPXGP
	fyxrkvo17oEHmQgWlT2qmut+VmW5puVVf5bZjmZWRVD+5tMSI96Q+OSUeqzuWbnDcLg2vf9yDqruG
	/j71mrlUaAyw8bJs7s7i5/tq7IWfaVJcPbWmvGRQHE34zzOoHm7tfqu7vGW7Ib3NbpETC/ym3b0Wn
	ukX1Ds6h6MS8gOHzlumY8SsFmi9mCW6m/d6JlwPor5OVdVvmdrjt1N5osoVwmdqvXiGgY/XBfUULG
	4OE3OxvkunZ7tZsOCHPfQPJRRduQ/zgZf6F6RZzRaoefCjeV29OFSsfagNs1gRlkPvU5KTkPc4DKS
	3I1XRCLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxw6M-002A8g-Sv; Wed, 23 Nov 2022 20:12:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxw6K-002A5u-5A
	for linux-mediatek@lists.infradead.org; Wed, 23 Nov 2022 20:12:09 +0000
X-UUID: 1f018e33fcd14f1a964d6047baa75600-20221123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/bGL7NeH7E4fkHcQ5YBrB8gRbZfK+h45aAwfGCIDyJQ=;
	b=GrMuM1JCzeJMYddEW/2WVbeNRp+uj10sS4m6zxo7FA8w59VCHKxnJHInOGxUB8jFBVql5wA1c6Ag+VF9XjH3CNWURwEMnGuljEHqffVsS5IDqToqwZFhx6V+65MudZbODDxTPtT7l76uvkLtsM30pReFZPh1yFh94ixbS+KdxLI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:caf53fa1-5634-4c35-a828-2d00b5cbafe7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:95691ff9-3a34-4838-abcf-dfedf9dd068e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1f018e33fcd14f1a964d6047baa75600-20221123
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1731589023; Wed, 23 Nov 2022 13:08:22 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 03:37:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 24 Nov 2022 03:37:48 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt7915: introduce mt7915_get_power_bound()
Date: Thu, 24 Nov 2022 03:37:17 +0800
Message-ID: <9a67f1617249be2c73bb5900d2df971b682f8772.1669229848.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_121208_228416_A5E006DA 
X-CRM114-Status: UNSURE (   9.85  )
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

Add a helper for common boundary check. This is a preliminary patch
to add per bandwidth power control.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 12 +++++-------
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h | 12 ++++++++++++
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index f329705c4fa1..8a2546699c3b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3122,14 +3122,14 @@ int mt7915_mcu_set_txpower_frame(struct mt7915_phy *phy,
 		.txpower_max = DIV_ROUND_UP(mphy->txpower_cur, 2),
 		.wcid = cpu_to_le16(msta->wcid.idx),
 	};
-	int ret, n_chains = hweight8(mphy->antenna_mask);
+	int ret;
 	s8 txpower_sku[MT7915_SKU_RATE_NUM];
 
 	ret = mt7915_mcu_get_txpower_sku(phy, txpower_sku, sizeof(txpower_sku));
 	if (ret)
 		return ret;
 
-	txpower = txpower * 2 - mt76_tx_power_nss_delta(n_chains);
+	txpower = mt7915_get_power_bound(phy, txpower);
 	if (txpower > mphy->txpower_cur || txpower < 0)
 		return -EINVAL;
 
@@ -3181,12 +3181,10 @@ int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy)
 	};
 	struct mt76_power_limits limits_array;
 	s8 *la = (s8 *)&limits_array;
-	int i, idx, n_chains = hweight8(mphy->antenna_mask);
-	int tx_power = hw->conf.power_level * 2;
+	int i, idx;
+	int tx_power;
 
-	tx_power = mt76_get_sar_power(mphy, mphy->chandef.chan,
-				      tx_power);
-	tx_power -= mt76_tx_power_nss_delta(n_chains);
+	tx_power = mt7915_get_power_bound(phy, hw->conf.power_level);
 	tx_power = mt76_get_rate_power_limits(mphy, mphy->chandef.chan,
 					      &limits_array, tx_power);
 	mphy->txpower_cur = tx_power;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 46c517e50ae4..382dcbda50bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -509,4 +509,16 @@ enum {
 					 sizeof(struct bss_info_bcn_cont) + \
 					 sizeof(struct bss_info_inband_discovery))
 
+static inline s8
+mt7915_get_power_bound(struct mt7915_phy *phy, s8 txpower)
+{
+	struct mt76_phy *mphy = phy->mt76;
+	int n_chains = hweight8(mphy->antenna_mask);
+
+	txpower = mt76_get_sar_power(mphy, mphy->chandef.chan, txpower * 2);
+	txpower -= mt76_tx_power_nss_delta(n_chains);
+
+	return txpower;
+}
+
 #endif
-- 
2.36.1


