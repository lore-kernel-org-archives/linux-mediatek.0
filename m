Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B77C282D3
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQMFjcm4VUhiP4hXC2Yuyp97jklP/ngPF9YTygdOBvE=; b=yo54EGHc/cmgwA/CWrp4/hAbam
	8mS4ejIUYGr3MYrGqziZUfFLscyBxlK+FDlsm1ZwuhU5lFcUPgcmKNV+9NRt3ffam0J9ODwQqSDub
	NyMCfff7cSTuaNDhkGf+S1EwbUhJpQz2g1w4snakIuMRqpkNHNh+FwPTkwh7uOHzbLlqyJizm+84Z
	num6kEKunkQ/2BAf51dBDagmmf7Xht7Lz24RHEmVDwblvYbUnnrKprTgNe40RvtkVIIHuFlB4/HMc
	aIc881lnlHd9PXm36rqzrY75bwb0fhJpPVg66RyrKM7FzAa8Ru+R2qBHdPfFYGaSfpAA+5VLi9gHs
	2HivwRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6I-00000004YvS-2tJV;
	Tue, 04 Mar 2025 12:10:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQa5-00000004QdQ-2Mks
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Mar 2025 11:37:02 +0000
X-UUID: fa0b03fcf8ec11efa1e849db4cc18d44-20250304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NQMFjcm4VUhiP4hXC2Yuyp97jklP/ngPF9YTygdOBvE=;
	b=AIRequDjYxSE742p5ztywZwrI86e246LeEh989REdEwEmT+ABuZgBW+pvmcQG3Yf8x8cmBDIOIHGfFbtuwDfJhfsaW29mv50Yt78gXfGNwI7L2e1TkokYUSxyYbxRc1hRlFxhzS9653m/DAd7hpd10/tq77lA9BpTt/w8q7eFdU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:9857580f-c47d-4f21-abf8-5f2acbb44689,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:51cd8229-e0f8-414e-b8c3-b75c08217be8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fa0b03fcf8ec11efa1e849db4cc18d44-20250304
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 904349881; Tue, 04 Mar 2025 04:36:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 4 Mar 2025 19:36:53 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 4 Mar 2025 19:36:53 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH v3 6/6] wifi: mt76: mt7925: add MTCL support to enhance the reulatory compliance
Date: Tue, 4 Mar 2025 19:36:49 +0800
Message-ID: <20250304113649.867387-6-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250304113649.867387-1-mingyen.hsieh@mediatek.com>
References: <20250304113649.867387-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_033701_625162_2A602107 
X-CRM114-Status: GOOD (  10.38  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Apply the MTCL configuration to improving channel availability and
regulatory compliance if MTCL table is supported.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2-v3: no change
---
 .../net/wireless/mediatek/mt76/mt7925/init.c    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index fa8d051a66d7..6ca3bde01f46 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -64,8 +64,15 @@ void mt7925_regd_be_ctrl(struct mt792x_dev *dev, u8 *alpha2)
 	struct mt7925_clc_rule_v2 *rule;
 	struct mt7925_clc *clc;
 	bool old = dev->has_eht, new = true;
+	u32 mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2);
 	u8 *pos;
 
+	if (mtcl_conf != MT792X_ACPI_MTCL_INVALID &&
+	    (((mtcl_conf >> 4) & 0x3) == 0)) {
+		new = false;
+		goto out;
+	}
+
 	if (!phy->clc[MT792x_CLC_BE_CTRL])
 		goto out;
 
@@ -101,11 +108,21 @@ mt7925_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 {
 #define IS_UNII_INVALID(idx, sfreq, efreq, cfreq) \
 	(!(dev->phy.clc_chan_conf & BIT(idx)) && (cfreq) >= (sfreq) && (cfreq) <= (efreq))
+#define MT7925_UNII_59G_IS_VALID	0x1
+#define MT7925_UNII_6G_IS_VALID	0x1e
 	struct ieee80211_supported_band *sband;
 	struct mt76_dev *mdev = &dev->mt76;
 	struct ieee80211_channel *ch;
+	u32 mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, mdev->alpha2);
 	int i;
 
+	if (mtcl_conf != MT792X_ACPI_MTCL_INVALID) {
+		if ((mtcl_conf & 0x3) == 0)
+			dev->phy.clc_chan_conf &= ~MT7925_UNII_59G_IS_VALID;
+		if (((mtcl_conf >> 2) & 0x3) == 0)
+			dev->phy.clc_chan_conf &= ~MT7925_UNII_6G_IS_VALID;
+	}
+
 	sband = wiphy->bands[NL80211_BAND_5GHZ];
 	if (!sband)
 		return;
-- 
2.34.1


