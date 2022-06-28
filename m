Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE74C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 06:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ctHwlI4ll4R7jGiLqeP++wn1NG99R558ZX0Jp7DLk7w=; b=e90q3DgZrBsycNTRufhpo9ruon
	A8zdm/948QdmnSgCSBySm7czCNCuCyZh3A1JQGNqNjBYTYRs1IyV/PzwWb3immyH1b3Hw+9sNaNKh
	AoB/cfXyuqRe062qvz+mZqhoH44yQ3SBDav8EN1F7Xg0xi+5or35pnCkrV77ImA0t60IDFD6nXuyg
	E3PqcpFo95QF+ztsYHL/Yj9Mriwoz+2JSuCPNrq3TgjF4psChB1C7kjbDLK71fy/TSCGbRfpBPral
	byEeajykO/KNO5nj8AjiBjyw0N2gW5dFUZEodjpO4G1dfFrrcujEz/Q7VbCzh64871zHEOU3IQSwJ
	v2DgK56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64MW-004Z5D-HO; Tue, 28 Jun 2022 06:06:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64DQ-004V0M-6B
	for linux-mediatek@lists.infradead.org; Tue, 28 Jun 2022 05:56:49 +0000
X-UUID: e78858790eb04016be8fe7bc968a6433-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:cd238f5e-6895-4c68-8ff3-8afb5469b5ce,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:676ed262-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e78858790eb04016be8fe7bc968a6433-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <meichia.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1519195022; Mon, 27 Jun 2022 22:56:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 13:55:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 28 Jun 2022 13:55:49 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, MeiChia Chiu
	<meichia.chiu@mediatek.com>, MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Subject: [PATCH] mt76: mt7915 add ht mpdu density
Date: Tue, 28 Jun 2022 13:55:28 +0800
Message-ID: <20220628055528.19804-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_225648_285377_3CCF8B2F 
X-CRM114-Status: UNSURE (   8.68  )
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

From: MeiChia Chiu <meichia.chiu@mediatek.com>

set ht mpdu density to 4 usec.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index c0f4f2053738..8521f7b2cff8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -369,15 +369,20 @@ mt7915_init_wiphy(struct ieee80211_hw *hw)
 
 	hw->max_tx_fragments = 4;
 
-	if (phy->mt76->cap.has_2ghz)
+	if (phy->mt76->cap.has_2ghz) {
 		phy->mt76->sband_2g.sband.ht_cap.cap |=
 			IEEE80211_HT_CAP_LDPC_CODING |
 			IEEE80211_HT_CAP_MAX_AMSDU;
+		phy->mt76->sband_2g.sband.ht_cap.ampdu_density =
+			IEEE80211_HT_MPDU_DENSITY_4;
+	}
 
 	if (phy->mt76->cap.has_5ghz) {
 		phy->mt76->sband_5g.sband.ht_cap.cap |=
 			IEEE80211_HT_CAP_LDPC_CODING |
 			IEEE80211_HT_CAP_MAX_AMSDU;
+		phy->mt76->sband_5g.sband.ht_cap.ampdu_density =
+			IEEE80211_HT_MPDU_DENSITY_4;
 
 		if (is_mt7915(&dev->mt76)) {
 			phy->mt76->sband_5g.sband.vht_cap.cap |=
-- 
2.36.1


