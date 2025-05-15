Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36185C3ABC9
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 03:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ck8E0kmNPsQLnL9s9n5lfaUDgq87CH2pQ5H2DVdTpco=; b=yaf4hx3aGCFxnXADGqJtnk6OoU
	3vZjE8lAYqKRFk7CBdIi3beGHkNe19Ho9hx8UnFJf/9QXLbPxX15kOHwD1pp/dLfsNuDbfTHYuG/U
	GT1IuV4ojrqZ1gVvsucFd1o39NXObHG1RsJj6sP52tNBumCLzvefuGrYzkJ5WXoxuJmyYPm8XUUTL
	lq3hfvn9xNxUbh+iJFNRaoSNLrf4k191PQI9ecWsrUWJTRLzZevROIk90MTOs0SvA8BrPSgCam2JL
	TCnG6AcpiqsOPQrx6DRr57pKUq6I4xkCXFhM8XYhdUkRrHfUnsmuS8PM7KWw+N/cR/LiX6g1F+9hB
	DCI+TCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPKd-0000000GwJe-0T6t;
	Thu, 15 May 2025 03:32:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPKa-0000000GwJI-2dwf
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 03:32:25 +0000
X-UUID: 343001f8313d11f0bed96b30c12bc3d6-20250514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ck8E0kmNPsQLnL9s9n5lfaUDgq87CH2pQ5H2DVdTpco=;
	b=ROzWTW4RzrTP8Ip5r6VhAd7RE/27ib5WqaXo+C6xDOBcFaBFWjvg2TRsxJo6R8vvDCOGtbQ0UPpn0HHR3QQpsqFIOfL4Vq8V+Khi3g+RbRdzUT3iFfYf5Cr3Ej0HzD7ite7cdfqlpHtZq9MIWhKVP/GYaPb7GuwsjTp4j2ycxhs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4573b99c-c7c7-4dcd-800e-867746a6caf8,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:deaac773-805e-40ad-809d-9cec088f3bd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 343001f8313d11f0bed96b30c12bc3d6-20250514
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 994645849; Wed, 14 May 2025 20:32:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 11:32:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 11:32:15 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76-next 1/9] wifi: mt76: remove capability of partial bandwidth UL MU-MIMO
Date: Thu, 15 May 2025 11:29:44 +0800
Message-ID: <20250515032952.1653494-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_203224_677537_C06D1431 
X-CRM114-Status: UNSURE (   8.65  )
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

The firmware only supports full bandwidth UL MU-MIMO, so remove the
partial bandwidth capability from HE PHY CAP.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 3 +--
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 57d5be94624b..be9527dd0269 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -925,8 +925,7 @@ mt7915_set_stream_he_txbf_caps(struct mt7915_phy *phy,
 
 	c = IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US;
 	if (!is_mt7915(&dev->mt76))
-		c |= IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
-		     IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
+		c |= IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO;
 	elem->phy_cap_info[2] |= c;
 
 	c = IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE |
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index ff835a6f77ce..b77fa94df8c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1116,8 +1116,7 @@ mt7996_set_stream_he_txbf_caps(struct mt7996_phy *phy,
 	elem->phy_cap_info[7] &= ~IEEE80211_HE_PHY_CAP7_MAX_NC_MASK;
 
 	c = IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
-	    IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
-	    IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
+	    IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO;
 	elem->phy_cap_info[2] |= c;
 
 	c = IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE;
-- 
2.39.2


