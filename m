Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BB9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 01:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZFHovfi9qfBhXs78o5c9mPtAmQvJ0jVTNh4LxK9Fhyo=; b=oz1n+9gshUpc9KrQ7JF9oAoj9U
	yBbqWXZIziq16WBQaFAnCBxZP4d0gBqCudHN//d/ihdUKnyfy51wUKuporevfw+jHalBGZHrIHSLH
	NDc7VRhINUejJCy6qPSTdWcnUaUHPAOGoHzUSu9RmQNTbmmc9qjZjaXMWaGRFrbsdP06Jpg2hrDoG
	I+jiZ5CgfugH1Dx6JMBst5f9laD7jIBI1G4SrQdLMOCzUEIHPFrtIyTcHvaOBwdUH9dxYYoAZexlB
	AVsUwhyGzS0mUuGbwKhmOzYyl7BKNZLXqNBlxwzK2N9vTvRpMIS1yDSG/zVdSKGeKDcCgx9rUi7nx
	UMtD5L3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pG7-0080f9-Ns; Wed, 22 Jun 2022 01:34:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pG4-0080cb-Or
	for linux-mediatek@lists.infradead.org; Wed, 22 Jun 2022 01:34:18 +0000
X-UUID: 7e6e3898a1bb411a939aa40876974bb9-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:16cf92f5-7a25-4ec8-a264-5966217b9908,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:b838b02d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7e6e3898a1bb411a939aa40876974bb9-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1270649054; Tue, 21 Jun 2022 18:34:08 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 18:24:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 09:24:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jun 2022 09:24:49 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 1/2] mt76: mt7915: update mpdu density in 6g capability
Date: Wed, 22 Jun 2022 09:24:48 +0800
Message-ID: <20220622012449.17797-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_183416_873530_E9DF0404 
X-CRM114-Status: UNSURE (   9.55  )
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

Set mpdu density to 2 usec in 6g capability.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 2764c2217..a2bc47162 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -979,7 +979,7 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 			u16 cap = IEEE80211_HE_6GHZ_CAP_TX_ANTPAT_CONS |
 				  IEEE80211_HE_6GHZ_CAP_RX_ANTPAT_CONS;
 
-			cap |= u16_encode_bits(IEEE80211_HT_MPDU_DENSITY_8,
+			cap |= u16_encode_bits(IEEE80211_HT_MPDU_DENSITY_2,
 					       IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START) |
 			       u16_encode_bits(IEEE80211_VHT_MAX_AMPDU_1024K,
 					       IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP) |
-- 
2.18.0


