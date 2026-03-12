Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430EAFED2FD
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhFv8wOlQNn8u7Hm09A4AiE1G8Sr/2LMKSCJYaeXSgk=; b=MtaZVT8zAXronjBkwlCn+Z1aLo
	zKVmb5Jj+x/GA/Dt4GgR9ICmVgaAbP5tvaUn+s9CUZfr5SHbOD8lrx4wAfAykWDs2gUtBFaI8L8JJ
	VSn+aBJTkrlk1gF61eLL9qDxT2TZTvjJwnsxHU2w88KrLcZNHecnsDE1t9HbFD9E0VJyG0MrAeTJY
	os+/iIk4XJTIOwbvY2XNMv2Pj/AWZKm+NQZ92j7sptx5FtG+8ZWJrxF9nwxK7FrMHwlACEMIyxRng
	rGkpaJ/OezYB4ORIfd88sWatjZi+qlZCtjSshpHe6qna3MUZprFBl6PhrxPkXKyBdjFSZGeWafUBE
	0WwxWBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0coc-0000000Doas-0pWa;
	Thu, 12 Mar 2026 09:58:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0coY-0000000DoYT-01kG
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 09:58:47 +0000
X-UUID: 0ae983dc1dfa11f1a6de359d7043e138-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fhFv8wOlQNn8u7Hm09A4AiE1G8Sr/2LMKSCJYaeXSgk=;
	b=XHTajOTfpoIgBbmkdPIvm+O9nGYGE3kDYqP7rQYYBUDS5JK9363XbZTwVNeFH6JCWxNPO0CN/52b9qxibLtddvc6jTnPmrvNtxgIchxQpAVnW/zLdGweG4J+po4PrjlHaiJAHzgYakOM6K4wMjCfNMhGqzkpBI2+wNv3+VD9HNU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e914551f-2d5c-4701-8adc-8171f06ccdf4,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:846ea4d4-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:5,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0ae983dc1dfa11f1a6de359d7043e138-20260312
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1083436912; Thu, 12 Mar 2026 02:58:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Mar 2026 17:58:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Mar 2026 17:58:36 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 6/6] wifi: mt76: mt7996: fix issues with manually triggered radar detection
Date: Thu, 12 Mar 2026 17:57:24 +0800
Message-ID: <20260312095724.2117448-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260312095724.2117448-1-shayne.chen@mediatek.com>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_025846_051193_6A8F6661 
X-CRM114-Status: GOOD (  12.77  )
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

Disallow triggering radar detection on non-DFS channels to prevent paused
TX queues from failing to resume, as a channel switch is not performed in
this case.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7996/debugfs.c   | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index 76d623b2cafb..e26bed6b97e7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -226,14 +226,23 @@ mt7996_radar_trigger(void *data, u64 val)
 #define RADAR_BACKGROUND	2
 	struct mt7996_dev *dev = data;
 	struct mt7996_phy *phy = mt7996_band_phy(dev, NL80211_BAND_5GHZ);
-	int rdd_idx;
+	struct cfg80211_chan_def *chandef;
+	int rdd_idx, ret;
 
 	if (!phy || !val || val > RADAR_BACKGROUND)
 		return -EINVAL;
 
-	if (val == RADAR_BACKGROUND && !dev->rdd2_phy) {
-		dev_err(dev->mt76.dev, "Background radar is not enabled\n");
-		return -EINVAL;
+	if (test_bit(MT76_SCANNING, &phy->mt76->state))
+		return -EBUSY;
+
+	if (val == RADAR_BACKGROUND) {
+		if (!dev->rdd2_phy || !cfg80211_chandef_valid(&dev->rdd2_chandef)) {
+			dev_err(dev->mt76.dev, "Background radar is not enabled\n");
+			return -EINVAL;
+		}
+		chandef = &dev->rdd2_chandef;
+	} else {
+		chandef = &phy->mt76->chandef;
 	}
 
 	rdd_idx = mt7996_get_rdd_idx(phy, val == RADAR_BACKGROUND);
@@ -242,6 +251,11 @@ mt7996_radar_trigger(void *data, u64 val)
 		return -EINVAL;
 	}
 
+	ret = cfg80211_chandef_dfs_required(dev->mt76.hw->wiphy, chandef,
+					    NL80211_IFTYPE_AP);
+	if (ret <= 0)
+		return ret;
+
 	return mt7996_mcu_rdd_cmd(dev, RDD_RADAR_EMULATE, rdd_idx, 0);
 }
 
-- 
2.51.0


