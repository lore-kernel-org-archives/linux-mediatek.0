Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A980C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 04:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pdn4ilndUShBfEwJMZoAT9iAd2cV94PGdSIcoqPHRE4=; b=cg89Hdx8kUvAV67ULKBRFSgEYx
	kxQ7SrxK4BqelSwqdRSLpCfC5uXjED9K3GizS3n9yRd7NvE+NO8RLF0R+A4I2LUq38rQSuzzy9Vj2
	ojSoE/FNnBPH4SNy7hP7oqDk8Zwqyuqr3/sLxeOh4m22YRKbJVPDRTx/2fhShbFFZn2dUwB/WqJS/
	Wx4dQVJS0vKK3QoM+k/wOdrJu7eIJx5OPQBsR0sSM1CnG7d0xXbFJNf8u8WJ2cj696ZsE0iU1e5pt
	koaGRHfkJPxy0EB5W17KHUckzlM6x9HClqntetAN4igsvdC+q3x57iNjLcUxmrAF8+atcj+T7bJyl
	cUp/QiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0b8a-004XwM-Uy; Thu, 01 Dec 2022 04:25:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0b8Y-004XvC-Fo
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 04:25:27 +0000
X-UUID: 941e195f75ad49e281a75a486a5d369b-20221130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pdn4ilndUShBfEwJMZoAT9iAd2cV94PGdSIcoqPHRE4=;
	b=recSrXoG8HhQNWeTqz8JSf2no+oYqsNzFH7Zz64zWHemfgDDV6X+j+2ETqHmdWvSM2/Gdy3XPZxnOa2hxJr9s3E8DfJ6oDc0zUNh7e/huFYhM5dTCTU3I55M0os5ctA49acGHmoyBX9TZnK9BwHJ4ok6BcmOAZMV1YlyHz1Sop4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:4a76e28b-42e8-41f6-ba70-3039b7c2b602,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:533e5630-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 941e195f75ad49e281a75a486a5d369b-20221130
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1021845911; Wed, 30 Nov 2022 21:25:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 1 Dec 2022 11:44:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Dec 2022 11:44:45 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/5] wifi: mt76: mt7915: fix scene detection flow of spatial reuse
Date: Thu, 1 Dec 2022 11:44:40 +0800
Message-ID: <d1c11adff6b57c9104bb16df19f62700e2505473.1669861862.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_202526_566080_F9CFF5FA 
X-CRM114-Status: GOOD (  11.02  )
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

Firmware is in the driving seat while sr_scene_detect is enabled,
so driver needs to skip operation to avoid mangling scene detection
algorithm.

Fixes: a633503 ("wifi: mt76: mt7915: add support to configure spatial reuse parameter set")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 9e479d41eab5..718e52744994 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3535,22 +3535,22 @@ int mt7915_mcu_add_obss_spr(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 	if (ret)
 		return ret;
 
+	/* firmware dynamically adjusts PD threshold so skip manual control */
+	if (sr_scene_detect && !he_obss_pd->enable)
+		return 0;
+
 	/* enable spatial reuse */
 	ret = mt7915_mcu_enable_obss_spr(phy, SPR_ENABLE, he_obss_pd->enable);
 	if (ret)
 		return ret;
 
-	if (!he_obss_pd->enable)
+	if (sr_scene_detect || !he_obss_pd->enable)
 		return 0;
 
 	ret = mt7915_mcu_enable_obss_spr(phy, SPR_ENABLE_TX, true);
 	if (ret)
 		return ret;
 
-	/* firmware dynamically adjusts PD threshold so skip manual control */
-	if (sr_scene_detect)
-		return 0;
-
 	/* set SRG/non-SRG OBSS PD threshold */
 	ret = mt7915_mcu_set_obss_spr_pd(phy, he_obss_pd);
 	if (ret)
-- 
2.18.0


