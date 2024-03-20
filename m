Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5D0C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOrIZkIrcVV+GEoWV1OmKv6z/f07V5RnvOpBqKJxDOw=; b=xQpOlFWS/qvFm6tNZg1zSQUKxB
	FFCIGF629ToxcPomlHJijMf3FIprdDtD4yNieJtHFDg+RUJM8QIBLMLT0dWu0DaT4zuGO85/vF2jh
	zGSqJ1RjcoS3qSq7X19gVCHnr86oMZgdGBGyU2mYRoJpWlv0UMBu7NFaWkIU10ubHWPnnneQ+2LOh
	Wn5B8U1BqR2jz4QLAVtuA2gBPIm8I2WgfLkMzlPgTRQcLJp2G/CBn8JATtkjEuljMWWPAr4h43tTe
	ZtlR+XKaudXjeKqg8c/ANeIZr0MyX5vvI/FDhcW1TS7w1rl7pmLk1x04jMKI77sVFf7eP1h4+At4Q
	TvRL+znw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpD-0000000GtlC-0lzM;
	Wed, 20 Mar 2024 11:09:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtp6-0000000Gtgf-1ihX
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 11:09:34 +0000
X-UUID: 50534540e6aa11eeacdb61a41848c7d2-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gOrIZkIrcVV+GEoWV1OmKv6z/f07V5RnvOpBqKJxDOw=;
	b=Q1aALXCSvHu8+5CtOqR2lc6W2QCol0v7aHB3jaWo57YbwYiIVnRNwwY+/K+MabC1ctHr1aon9w+QfFHpJn5f2zQ2HYhPNIkbmr0uKwkuJxJtG0wh/qPEOuFmOAJGmcGOrkTm07Y4ny5wtg7r8GLEpfVP5Ganrl0EHSfbFD8+nIw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:8e5bc701-68ac-43f0-bd79-4d3d4680cd27,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:97d81d00-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 50534540e6aa11eeacdb61a41848c7d2-20240320
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 595876509; Wed, 20 Mar 2024 04:09:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 19:09:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 19:09:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 08/10] wifi: mt76: mt7996: add sanity checks for background radar trigger
Date: Wed, 20 Mar 2024 19:09:16 +0800
Message-ID: <20240320110918.3488-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320110918.3488-1-shayne.chen@mediatek.com>
References: <20240320110918.3488-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_040932_490826_FE9777CF 
X-CRM114-Status: GOOD (  12.00  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

Check if background radar is enabled or not before manually triggering it,
and also add more checks in radar detected event.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c     | 5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index 9bd953586b04..62c03d088925 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -225,6 +225,11 @@ mt7996_radar_trigger(void *data, u64 val)
 	if (val > MT_RX_SEL2)
 		return -EINVAL;
 
+	if (val == MT_RX_SEL2 && !dev->rdd2_phy) {
+		dev_err(dev->mt76.dev, "Background radar is not enabled\n");
+		return -EINVAL;
+	}
+
 	return mt7996_mcu_rdd_cmd(dev, RDD_RADAR_EMULATE,
 				  val, 0, 0);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index ccae954a22f8..c024f138f1ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -355,7 +355,10 @@ mt7996_mcu_rx_radar_detected(struct mt7996_dev *dev, struct sk_buff *skb)
 	if (r->band_idx >= ARRAY_SIZE(dev->mt76.phys))
 		return;
 
-	if (dev->rdd2_phy && r->band_idx == MT_RX_SEL2)
+	if (r->band_idx == MT_RX_SEL2 && !dev->rdd2_phy)
+		return;
+
+	if (r->band_idx == MT_RX_SEL2)
 		mphy = dev->rdd2_phy->mt76;
 	else
 		mphy = dev->mt76.phys[r->band_idx];
-- 
2.39.2


