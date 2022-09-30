Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71146C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAcWbFOXDxoISljdIrQLvVsaajg+seadsVMOrc7A3+U=; b=PICWdVdA0qjryAPzACH11w3m4B
	Wd9tS7OEkiRWEeKBQhF5HGJ9HBGLbt3jg4IAHj04PZkCtK9rvJTP+0DbImLYrfId9DOZ4oiGfKzCB
	9jbw9n15uGX6a87HEUFIe2glcaWQbawiPa2+Y6xcdIYK0rng7x/oRwSqokgDS3//wVjDeqwdsTzRs
	BNtFbrz456F6kkTgHl6PbpuKlmiGUdce4BRLaSjjd7ph7zN6FXcQrrzEUsz9laM70TTxu3i/F4etU
	9Y3ekp9MMfPIRKayw/ltqS5tCaBxrO9bF7ZuMuevAwKeLjB6CAm3pz4y7AUr0BJZQh888AJR5UalX
	acyNGvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHjB-00A5mY-R8; Fri, 30 Sep 2022 15:15:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHiO-00A5LD-0B
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 15:14:14 +0000
X-UUID: b876d3d05fb047578e39fa8bbc23808c-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VAcWbFOXDxoISljdIrQLvVsaajg+seadsVMOrc7A3+U=;
	b=pDvIHLCcfGOPExLXETcM6kAHYt9cqptGcAOvywl2iu05COg6dHUE0IMr2lpVTsDDIhYvql78lQx4hz2EnALPZmCl4DBaaG0zyYVF7vLye5t6H341RqifeNGwPDNBZrtWfFjL6ppFxuMk1vxxeYNX1k08UgYNA+yI5ffR+gTduQ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:ad1fd359-9163-4854-963d-123e47269897,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:1351cde4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b876d3d05fb047578e39fa8bbc23808c-20220930
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 715491041; Fri, 30 Sep 2022 08:14:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 30 Sep 2022 23:13:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 23:13:45 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 6/6] wifi: mt76: mt7915: set correct antenna for radar detection on MT7915D
Date: Fri, 30 Sep 2022 23:13:15 +0800
Message-ID: <20220930151315.19012-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220930151315.19012-1-shayne.chen@mediatek.com>
References: <20220930151315.19012-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_081412_089724_5772682A 
X-CRM114-Status: GOOD (  11.05  )
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

For MT7915D, correct antenna index should be set to let DFS radar
detection work on the 5 GHz band.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c   | 15 +++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index be97dede2634..43a7a639cc88 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1814,6 +1814,13 @@ static int mt7915_dfs_start_rdd(struct mt7915_dev *dev, int chain)
 	if (err < 0)
 		return err;
 
+	if (is_mt7915(&dev->mt76)) {
+		err = mt76_connac_mcu_rdd_cmd(&dev->mt76, RDD_SET_WF_ANT, chain,
+					      0, dev->dbdc_support ? 2 : 0);
+		if (err < 0)
+			return err;
+	}
+
 	return mt76_connac_mcu_rdd_cmd(&dev->mt76, RDD_DET_MODE, chain,
 				       MT_RX_SEL0, 1);
 }
@@ -1934,6 +1941,14 @@ int mt7915_dfs_init_radar_detector(struct mt7915_phy *phy)
 	if (err < 0)
 		return err;
 
+	if (is_mt7915(&dev->mt76)) {
+		err = mt76_connac_mcu_rdd_cmd(&dev->mt76, RDD_SET_WF_ANT,
+					      phy->band_idx, 0,
+					      dev->dbdc_support ? 2 : 0);
+		if (err < 0)
+			return err;
+	}
+
 	mt7915_dfs_stop_radar_detector(phy);
 	phy->mt76->dfs_state = MT_DFS_STATE_DISABLED;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 1eb11617a625..c90a148d6239 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -357,6 +357,7 @@ enum mt7915_rdd_cmd {
 	RDD_DET_MODE,
 	RDD_RADAR_EMULATE,
 	RDD_START_TXQ = 20,
+	RDD_SET_WF_ANT = 30,
 	RDD_CAC_START = 50,
 	RDD_CAC_END,
 	RDD_NORMAL_START,
-- 
2.25.1


