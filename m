Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77F3C4452B
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 03:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vXAAn7AG46pDpO/9QgriNaLdYfh06COEGdalmGLYbbY=; b=E7I4rbrZRKIHk5u1Wm88Frv12p
	KmCydKhYEVBLpaGIRFmO9JKqo4ZB7lwSCqPqtjUFSCiCH+06wXIjBFIc0LvT6qdd47i5XoD89xxIy
	r3jhHoy18zzoytzRCHh/im5ik2/cYmEIlEFNFTMqvdkwAyUBWTJ3/Owf0epAS00YOntSvzz8feg6w
	S44sIc/BOoBnhh0lorXKbaStqIjeS9bW2QwTuCo2mUJW+rxQnwiDwRVNurNLEsxEt2nHzEUjmX7S/
	EimPqrESITaxOn8kebviWnDtFQ+X51sc1aF3JSKsyCrFu3nDVb8OZ35oFMIa3ip2IAedqlUQaYN6/
	iwzg96bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjqB-0000000DHbq-18Sg;
	Thu, 23 Jul 2026 03:11:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjq9-0000000DHbK-0Ju8
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 03:11:18 +0000
X-UUID: 28502b80864411f1afed4741b24580c9-20260722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vXAAn7AG46pDpO/9QgriNaLdYfh06COEGdalmGLYbbY=;
	b=kNrvTi7cvG2xobIAC+YNKXvklhQr+7K/W5GXn83/j9M/50LxAu1w8WeqLK7Aas8cNbEKWuDsWclkOZcxehCvH/RsqL3rybknAjIgJ8eaMF6NsK7nUDWNeY9OW0ot4gaIJdg9xRmXPlaeMMXfcnW4qdnv9EtsbeVGS8cCJLlFWec=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:ac011a33-6356-4b04-a956-4c01d8b10550,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:a00fcf5f-762a-4584-baab-4eebe609beea,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 28502b80864411f1afed4741b24580c9-20260722
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1474600744; Wed, 22 Jul 2026 20:11:11 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Jul 2026 11:11:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Jul 2026 11:11:09 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shengwei.Lu@mediatek.com>, <litien.chang@mediatek.com>,
	<jb.tsai@mediatek.com>, shengwei.lu <shengwei.lu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: Fix EHT Beamformee SS subfields to meet 802.11be minimum
Date: Thu, 23 Jul 2026 11:11:08 +0800
Message-ID: <20260723031108.2017653-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_201117_134275_4EA84EEA 
X-CRM114-Status: UNSURE (   8.91  )
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

From: "shengwei.lu" <shengwei.lu@mediatek.com>

Per IEEE 802.11be, the Beamformee SS <= 80/160/320 MHz 3-bit subfields
in the EHT PHY Capabilities are encoded as (Nss - 1) and are required
to be >= 3 (i.e. at least 4 SS receive capability) whenever SU
Beamformee is advertised.

MT7925 is a 2x2 STA (sts = 2), so directly filling (sts - 1) = 1
violates the spec minimum. Clamp the encoded value to 3 when sts <= 3,
otherwise use (sts - 1). This is applied consistently to the
BEAMFORMEE_SS <= 80 MHz (split across phy_cap_info[0]/[1]), <= 160 MHz
and <= 320 MHz (6 GHz only) subfields.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: shengwei.lu <shengwei.lu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index ddb637d6a3c3..dbe67ce2e4a2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -188,19 +188,21 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		eht_cap_elem->phy_cap_info[0] |=
 			IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
 
+	val = (sts > 3) ? sts - 1 : 3;
+
 	eht_cap_elem->phy_cap_info[0] |=
-		u8_encode_bits(u8_get_bits(sts - 1, BIT(0)),
+		u8_encode_bits(u8_get_bits(val, BIT(0)),
 			       IEEE80211_EHT_PHY_CAP0_BEAMFORMEE_SS_80MHZ_MASK);
 
 	eht_cap_elem->phy_cap_info[1] =
-		u8_encode_bits(u8_get_bits(sts - 1, GENMASK(2, 1)),
+		u8_encode_bits(u8_get_bits(val, GENMASK(2, 1)),
 			       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_80MHZ_MASK) |
-		u8_encode_bits(sts - 1,
+		u8_encode_bits(val,
 			       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_160MHZ_MASK);
 
 	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
 		eht_cap_elem->phy_cap_info[1] |=
-			u8_encode_bits(sts - 1,
+			u8_encode_bits(val,
 				       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK);
 
 	eht_cap_elem->phy_cap_info[2] =
-- 
2.45.2


