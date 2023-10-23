Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18CCC004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo1ZLoUpetLasN/IqT4qd9RHhgoLLC4Adom0injoWVI=; b=PGS+Us2VUjoBrQ2Pd6vUGrPCpU
	wwq0K+Zf/jwUpaDr0acX3Kw1dJ+x3VNyb5rDINu95kQ9NhmpEqQ7KQEsaGsf1Pdo9v2vYg8ALz4UA
	01laThAILEBGz/wOyo6UTqxzC8vjmDN/lXOxQo4F4HUS5rFcIun6+R97fO80wN5l63aHlwd2G6/++
	Ric8uW1imgEnSOiR4jwdwHr2jbQitghvTXxqO5mkVcY4/RQtsPFYRxBuRxSB3sRtWKhbg+3AtEB49
	5etqh1IrN2/oOZeu2i7wHVBPh1E2YIOpChMgRyQp2CemP1kAzSX1bUHkhLEzrfEhWAmbEBQdsG/rr
	5ZNqhmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quxDr-007ksW-1K;
	Mon, 23 Oct 2023 15:52:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quxDo-007krR-28
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 15:52:06 +0000
X-UUID: 1aaa181471bc11ee86758d4a7c00f3a0-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Eo1ZLoUpetLasN/IqT4qd9RHhgoLLC4Adom0injoWVI=;
	b=ricfbY1hh9B4yL/VrkDN6lWks+8chVn4P/MsXOik/8P1CLKaYrYJmIKIyuOpFn8Ai1cgsY4IH2a4w2eyA7u+j9xvElq5EKfDzKub0aLHCdAULhetKF2obBCViHct58pWon8D0XR5HUjc1Lf09WeZdVDlmr81hCSm0JBkKzGpsd0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:3447cf5d-08ef-43a9-92c8-d666da1cb1c2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:32a4abfb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1aaa181471bc11ee86758d4a7c00f3a0-20231023
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1616156270; Mon, 23 Oct 2023 08:52:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 23:41:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 23:41:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 02/11] wifi: mt76: mt7996: add TX statistics for EHT mode in debugfs
Date: Mon, 23 Oct 2023 23:38:45 +0800
Message-ID: <20231023153854.10708-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023153854.10708-1-shayne.chen@mediatek.com>
References: <20231023153854.10708-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_085204_712559_87F4CCB8 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

Add EHT statistics of beamforming feedback and BW320 in debugfs tx_stats
command.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index 4d40ec7ff57f..9bd953586b04 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -476,7 +476,7 @@ mt7996_txbf_stat_read_phy(struct mt7996_phy *phy, struct seq_file *s)
 {
 	struct mt76_mib_stats *mib = &phy->mib;
 	static const char * const bw[] = {
-		"BW20", "BW40", "BW80", "BW160"
+		"BW20", "BW40", "BW80", "BW160", "BW320"
 	};
 
 	/* Tx Beamformer monitor */
@@ -489,8 +489,9 @@ mt7996_txbf_stat_read_phy(struct mt7996_phy *phy, struct seq_file *s)
 	/* Tx Beamformer Rx feedback monitor */
 	seq_puts(s, "Tx Beamformer Rx feedback statistics: ");
 
-	seq_printf(s, "All: %d, HE: %d, VHT: %d, HT: %d, ",
+	seq_printf(s, "All: %d, EHT: %d, HE: %d, VHT: %d, HT: %d, ",
 		   mib->tx_bf_rx_fb_all_cnt,
+		   mib->tx_bf_rx_fb_eht_cnt,
 		   mib->tx_bf_rx_fb_he_cnt,
 		   mib->tx_bf_rx_fb_vht_cnt,
 		   mib->tx_bf_rx_fb_ht_cnt);
-- 
2.39.2


