Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB43FFA3741
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af5/29UjuXFBRrxbph+wfriLW8Dqa9ZpqbKZqMmMSHA=; b=Fh0+V26CQ1Uuh2fms3MLZHQiPs
	99jHTMag4OMMiuNSOckrBMTf84IDYB34Q8CWdjfPyRGshQkwDyPuL9fTPFtDv3jrBsg6zWMf98v3W
	c6fg2KHXopWsMWA9fmVG7Z0yMgqhIAURk1kafqo0GRMd9LYAWrIMdZUzAqfUgq2Vznuv4w185sD4b
	CbkGsvfHxPW65BlYml36+H6NcVE59iJMr2xYx0sZjaisJYhtVKmUPk2VHHP79BIdZEHNXQKCxjpWv
	SaiySQLdQbs3iWFr+c+LU49Nxb9SZVYoU332vXTneiMzhneZmzWx31Q1guIZzI26lLV3kecHTAHAs
	TZnTXvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXqL-00D3cR-Gr; Mon, 31 Oct 2022 16:40:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXqG-00D3YL-Tb
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 16:40:54 +0000
X-UUID: f9edd47fefe14d6b9cec5d8426a7b67e-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=af5/29UjuXFBRrxbph+wfriLW8Dqa9ZpqbKZqMmMSHA=;
	b=AgRHPnSTzCDHhJY6sBGOxRV8LarFyUW74sqBYZjC/N34teiz7ZDEItqpoDOxkoEVEuiQKeIk/CqGhA2PWmgjq8SEf8ufiuMQO4rawjI7llZbShaAVEjJ1t5rE3pT9uJpOnQcaByo9sZsXKfLb+PEjQIRx3aVnKh1bZcV0oi9+4c=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:363b2762-c0d5-4705-902f-35754c449744,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.12,REQID:363b2762-c0d5-4705-902f-35754c449744,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:62cd327,CLOUDID:c2a4fcea-84ac-4628-a416-bc50d5503da6,B
	ulkID:221101004015Q38M80XZ,BulkQuantity:3,Recheck:0,SF:28|16|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: f9edd47fefe14d6b9cec5d8426a7b67e-20221031
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1054746137; Mon, 31 Oct 2022 09:40:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 1 Nov 2022 00:40:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 00:40:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>
Subject: [PATCH 04/10] wifi: mt76: connac: rework fields for larger bandwidth support in sta_rec_bf
Date: Tue, 1 Nov 2022 00:39:54 +0800
Message-ID: <20221031164000.17063-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221031164000.17063-1-shayne.chen@mediatek.com>
References: <20221031164000.17063-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_094052_981399_A142CCBC 
X-CRM114-Status: UNSURE (   9.98  )
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

Rename nrow_bw160 and ncol_bw160 since channel width 320 MHz will share
the same field.
This is a preliminary patch to add mt7996 chipset support.

Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c      | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 87c27a836e2b..9cca73df6644 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -463,8 +463,8 @@ struct sta_rec_bf {
 	u8 ibf_dbw;
 	u8 ibf_ncol;
 	u8 ibf_nrow;
-	u8 nrow_bw160;
-	u8 ncol_bw160;
+	u8 nrow_gt_bw80;
+	u8 ncol_gt_bw80;
 	u8 ru_start_idx;
 	u8 ru_end_idx;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 65ae959859e7..f3ba98746d44 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1131,7 +1131,7 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 		mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_160);
 		nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
 
-		bf->ncol_bw160 = nss_mcs;
+		bf->ncol_gt_bw80 = nss_mcs;
 	}
 
 	if (pe->phy_cap_info[0] &
@@ -1139,10 +1139,10 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 		mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_80p80);
 		nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
 
-		if (bf->ncol_bw160)
-			bf->ncol_bw160 = min_t(u8, bf->ncol_bw160, nss_mcs);
+		if (bf->ncol_gt_bw80)
+			bf->ncol_gt_bw80 = min_t(u8, bf->ncol_gt_bw80, nss_mcs);
 		else
-			bf->ncol_bw160 = nss_mcs;
+			bf->ncol_gt_bw80 = nss_mcs;
 	}
 
 	snd_dim = HE_PHY(CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK,
@@ -1150,7 +1150,7 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	sts = HE_PHY(CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_MASK,
 		     pe->phy_cap_info[4]);
 
-	bf->nrow_bw160 = min_t(int, snd_dim, sts);
+	bf->nrow_gt_bw80 = min_t(int, snd_dim, sts);
 }
 
 static void
-- 
2.25.1


