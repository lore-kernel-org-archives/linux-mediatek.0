Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F491C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RZXEZCw31FaBhMKsyB3zJ9VlZt6/IvYCVkFUTILKzDs=; b=FTz5fy766s5cN63lAFDjY8y2GX
	BY7B83qDqBxoDP2KBY1srl/AzfMWnhC6vsCoXIqCuC5Leipz44GoId6S4M5DhP9za2bHkitpWjDeN
	+afvBZIYSmxgozSFQMEfnCsfwANzx//otn3SdszvRBbd5o7t3HZdgu18/fqGysu3Onjkodevd4K9k
	TRGTSdTQKWjxjW8VtvLLnJ1NPyk5JEQ3m1xPD1EvqTe5oMrdHPAxNqH3L245FCs61uNEGNjSHoR3h
	SAlzCcR8Cx8g2Vu45Sn+qyu8sHbU1D7YTyyT05sWL+IsTTlsYkPU/oXqpwfbnRuPTaxTO/MjqAR6e
	uGQfs5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CBZ-00FxYf-2b;
	Mon, 05 Jun 2023 15:31:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CBX-00FxXs-2S
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 15:31:57 +0000
X-UUID: 1686821403b611ee83ed1395ce914268-20230605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RZXEZCw31FaBhMKsyB3zJ9VlZt6/IvYCVkFUTILKzDs=;
	b=t0Sa3C7SGqyBdlY2fdTUz0LPKktB5QCwGRNUue2MMiqGjgd/gQrP4XdBn1XWC250x1JcOAM6UekbtSI0nKQ8vTlmQPZS9XkJhFd/oA0NhAOD8YzgNotbCFWnk6shfTJkliGrfe4U4anK6joxZ8EY3AW19SNH6o6KUkoM9TD4PUA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:dd5bd5bd-ed97-4b81-a092-6a1031690bcf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:4537a23d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 1686821403b611ee83ed1395ce914268-20230605
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 434405008; Mon, 05 Jun 2023 08:31:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 5 Jun 2023 23:21:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Jun 2023 23:21:46 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v3 01/10] wifi: mt76: mt7996: move radio ctrl commands to proper functions
Date: Mon, 5 Jun 2023 23:21:32 +0800
Message-ID: <20230605152141.17434-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_083155_808216_8696603A 
X-CRM114-Status: UNSURE (   9.54  )
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


