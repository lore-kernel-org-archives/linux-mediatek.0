Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 10:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pNzyXJhMXR5y5YiBNHWhTdOlcVNsxC3HbKWmyQ91Gc4=; b=1B8rvhFu+nMGweWSaABrGjhLCj
	i174iddANuOTS5oKfi+cpwAA2un1n2TN/GHh6+MmKJ7xW+42ylC7R80/EPeLyN5mzq4Z+hLFhoaS3
	EB81HjvPbRYM0P8zj+G4E741ewuCWGdQzK1mz7Az2w46c3K9lrjjvN5UZ+bnb9GIb41ykXZ4PqXsY
	mqOYOLqkXFQlzIB2wVSw+qyCbTbAgPkbSFDnhm1pMQzr69rNPVJbJRU3v6HXvqO5gear1Tb5c9627
	tiaXuoYfrGyqTu3q//AIRt/Zb+JGbYxrKmsa+GpHYNSXbnv3da4Mb8vOUDiDcBA9OSR04zKcPw8fR
	krEkROWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6rAl-00GUKL-6Y; Thu, 30 Jun 2022 10:13:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6rAj-00GUJt-Ch
	for linux-mediatek@lists.infradead.org; Thu, 30 Jun 2022 10:13:18 +0000
X-UUID: d07c8b890b264394ade3855883632603-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:bd0a5d04-d779-4fcb-b180-250a9453f14e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:87442a2,CLOUDID:cfeb40d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d07c8b890b264394ade3855883632603-20220630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1986522657; Thu, 30 Jun 2022 03:13:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 30 Jun 2022 18:12:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 30 Jun 2022 18:12:37 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: update mpdu density in 6g capability
Date: Thu, 30 Jun 2022 18:12:33 +0800
Message-ID: <20220630101233.8415-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_031317_471162_62BE8A11 
X-CRM114-Status: UNSURE (   8.96  )
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

Set mpdu density to 2 usec in 6g capability to meet hardware
capability and also enhance throughput.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
v2: update commit message.
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 6bdbc59bea..c0f4f20537 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -980,7 +980,7 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 			u16 cap = IEEE80211_HE_6GHZ_CAP_TX_ANTPAT_CONS |
 				  IEEE80211_HE_6GHZ_CAP_RX_ANTPAT_CONS;
 
-			cap |= u16_encode_bits(IEEE80211_HT_MPDU_DENSITY_8,
+			cap |= u16_encode_bits(IEEE80211_HT_MPDU_DENSITY_2,
 					       IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START) |
 			       u16_encode_bits(IEEE80211_VHT_MAX_AMPDU_1024K,
 					       IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP) |
-- 
2.18.0


