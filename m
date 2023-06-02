Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E2AC7EE24
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 15:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RZXEZCw31FaBhMKsyB3zJ9VlZt6/IvYCVkFUTILKzDs=; b=YmsSnhJ/jGBD7Lv8PvPPeyuQhk
	H2NeHPA3sVO8f/GpZx2kK+Z/uuA88KRE9I2gHBkIauaSJ6e4T32T3H51i3IKP9LnQP79FP0lGbvCG
	2LWw26f1SNNR+KydBG4MkVpdthd6qg9BZHoyp7gBpc4qZB7AtD+w3iAS1JqghXacXyRGaij1tOQ2F
	MVSwz+ToyLn41dVtmuPRkNozaMth6HYr2ddV+1Fcbqq3hMF9fPEzKFACWD1wy3qA9BM7Tl3d6Nc0d
	CIkqZY+zC6AJLoivh/nT9b7JW1wyhQnyWCh2edmel7pfhgRKjMlXqHTJWabAg2gCWm0+vyG9RZWR+
	c9JXQCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q56b5-007F0t-2g;
	Fri, 02 Jun 2023 15:21:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q56b1-007Ezf-2z
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 15:21:45 +0000
X-UUID: 2905cef4015911ee83ed1395ce914268-20230602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RZXEZCw31FaBhMKsyB3zJ9VlZt6/IvYCVkFUTILKzDs=;
	b=L98F6NxX1wBCwh4Dq4iasl/BC2wlVWSD1b0PMLvCEldS2tSH6m3BBBnmvYFsIlFJQfHd1w0kjtp9NveCybu5qwrjpycRTzgzmO3+9+uNRYcDY1XFKt1JQ+11t1pf38ExAai98593j9mxtx660HDh28twmRIiOJJDTSS8vJcVGT8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:9caa7cee-fc37-4f7a-8162-210ed92be4eb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:131b363d-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 2905cef4015911ee83ed1395ce914268-20230602
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1596158799; Fri, 02 Jun 2023 08:21:34 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 2 Jun 2023 23:21:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 23:21:32 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 01/12] wifi: mt76: mt7996: move radio ctrl commands to proper functions
Date: Fri, 2 Jun 2023 23:20:57 +0800
Message-ID: <20230602152108.26860-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_082143_970979_8C952AD2 
X-CRM114-Status: GOOD (  10.35  )
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

Move radio enable/disable commands into functions for configuring
per-phy radio.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 0975774fe244..8a1edc5c1288 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -43,6 +43,10 @@ int mt7996_run(struct ieee80211_hw *hw)
 	if (ret)
 		goto out;
 
+	ret = mt7996_mcu_set_radio_en(phy, true);
+	if (ret)
+		goto out;
+
 	ret = mt7996_mcu_set_chan_info(phy, UNI_CHANNEL_RX_PATH);
 	if (ret)
 		goto out;
@@ -82,6 +86,8 @@ static void mt7996_stop(struct ieee80211_hw *hw)
 
 	mutex_lock(&dev->mt76.mutex);
 
+	mt7996_mcu_set_radio_en(phy, false);
+
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
 	mutex_unlock(&dev->mt76.mutex);
@@ -190,10 +196,6 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 	if (ret)
 		goto out;
 
-	ret = mt7996_mcu_set_radio_en(phy, true);
-	if (ret)
-		goto out;
-
 	dev->mt76.vif_mask |= BIT_ULL(mvif->mt76.idx);
 	phy->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
 
@@ -253,7 +255,6 @@ static void mt7996_remove_interface(struct ieee80211_hw *hw,
 		phy->monitor_vif = NULL;
 
 	mt7996_mcu_add_dev_info(phy, vif, false);
-	mt7996_mcu_set_radio_en(phy, false);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-- 
2.39.2


