Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777FEC3ABC9
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 03:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K/f5mhODlHnxjiEqczjt+u+aWnUiRKgE22cEWh8NEA=; b=oEUYYWIk7XLsyiibczYu1OphYg
	FDLuhwBXy/w3pnQAy2LzPAsLw0CKWJtQXjTX/xJ5VmAKNKSAQwK5wAg5Imkem4IljaIgVJoeWF4oR
	lv9fAExclepnMbfaVNaEDgcB/XP/J54NA6uW3baIHNpU3j+MF7Y+Ohzd0KRw8jEWwcjpp3Awn8WzW
	z7KcQG8+6G213OFjYM7nBGNM6oQbKxJlZ635Cix5bG+Ngj27rhUjBlodKse75R9INzz5B2sH9+USN
	lX/M0cwo560cudHtF4iI2XR2O8lDQVw3KkWsrFRezqlqM8y0vUbc1BL8JmW/U6lGbrrHLACLdbx82
	/HMUQuCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPKl-0000000GwL7-1jgk;
	Thu, 15 May 2025 03:32:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPKj-0000000GwKg-3vF6
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 03:32:34 +0000
X-UUID: 397383ec313d11f08d385d50fb11b32d-20250514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3K/f5mhODlHnxjiEqczjt+u+aWnUiRKgE22cEWh8NEA=;
	b=r4cROpUffZLMYXfAupD1VDgIYW9pnsdoaotLYhMmIFsFWSmrRSyuVSvs+CMISWa7cjZLdf6mtaIsBYQrRjopZgXRW+FV6El2HFMpcYQwx4723lcuxB9/SnE3PrN+lodWmNp9TRunf0SlPgU/YAs+1DtHfQSQw0oO+kG30Q7UvUw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:19336a53-2c1d-47d6-a6c1-d6fc8d62b55d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:59ef053e-da74-431d-a7be-5e6761de3b64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 397383ec313d11f08d385d50fb11b32d-20250514
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1863161861; Wed, 14 May 2025 20:32:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 11:32:24 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 11:32:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76-next 2/9] wifi: mt76: mt7996: fix beamformee SS field
Date: Thu, 15 May 2025 11:29:45 +0800
Message-ID: <20250515032952.1653494-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515032952.1653494-1-shayne.chen@mediatek.com>
References: <20250515032952.1653494-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_203233_980229_A5C65561 
X-CRM114-Status: UNSURE (   8.88  )
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

Fix the beamformee SS field for the mt7996, mt7992 and mt7990 chipsets.
For the mt7992, this value shall be set to 0x4, while the others shall
be set to 0x3.

Fixes: 5b20557593d4 ("wifi: mt76: connac: adjust phy capabilities based on band constraints")
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index b77fa94df8c7..5c545293f294 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1121,12 +1121,12 @@ mt7996_set_stream_he_txbf_caps(struct mt7996_phy *phy,
 
 	c = IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE;
 
-	if (is_mt7996(phy->mt76->dev))
-		c |= IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_4 |
-		     (IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_4 * non_2g);
-	else
+	if (is_mt7992(phy->mt76->dev))
 		c |= IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_5 |
 		     (IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_5 * non_2g);
+	else
+		c |= IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_4 |
+		     (IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_4 * non_2g);
 
 	elem->phy_cap_info[4] |= c;
 
-- 
2.39.2


