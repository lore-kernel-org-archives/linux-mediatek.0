Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DCFC282D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Mar 2025 06:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL63nKQ5zhGPJAzD3ldqXor2EXRLJquzuUF6q4duBX0=; b=MwH2YOfj9wqWCqaTSL6TFa6YAt
	J2QI+sduRJDyCQcfyzNOxAdj/oqMsISOWd2vK577A74vJ3mE9eZDelI0d45Q40FmeBb3+wKED000W
	Ohb/XQ+3HG2jaOJfxgghpjviLCx+6HvQkid+aQsdQOAo3w2rhejYpR9+xgiJoDXYhAn42VyYmlWfu
	esvtmKEnOZkolz1QQ7sq8xTfT9oMxs/VyOowCjy0V8t8sYl9bpXhp1cs8LhIUjmsTI2ChAJKz0+nu
	e3jTGzqd0+CNEqPWSgLJHKMY/HjNO2jUGEqGLGAgmtqmtbvAdslXbvbVMEva2eustKny/vrJe/ClQ
	Nn7pzUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM2s-00000003Kqw-01QP;
	Tue, 04 Mar 2025 06:46:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLmQ-00000003HKt-34lf
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Mar 2025 06:29:28 +0000
X-UUID: 009f7a48f8c211ef83f2a1c9db70dae0-20250303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QL63nKQ5zhGPJAzD3ldqXor2EXRLJquzuUF6q4duBX0=;
	b=Vrc+E5ANc2K/IEW4qtvKqNs7xHVRBaw0caeLynstjmezrArivF3yHcHv2+ikyMelT3DUcIJLn7DPSO5Qzuicb4/qRjvv2aE8cPl47AU68pvqMhBeBPpuRrYX3NrSMe9fYPmtxgM2Slp/HKQ4OdhFbZNs7UjCqjjxHW7Ens/Fym4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7aecc143-190d-4fc6-8baa-69de6e0ffc9e,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:ea9bd1b5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 009f7a48f8c211ef83f2a1c9db70dae0-20250303
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 802305463; Mon, 03 Mar 2025 23:29:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 4 Mar 2025 14:29:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 4 Mar 2025 14:29:16 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH v2 6/6] wifi: mt76: mt7925: add MTCL support to enhance the reulatory compliance
Date: Tue, 4 Mar 2025 14:28:54 +0800
Message-ID: <20250304062854.829194-6-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250304062854.829194-1-mingyen.hsieh@mediatek.com>
References: <20250304062854.829194-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222926_810217_72B0EF2D 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Apply the MTCL configuration to improving channel availability and
regulatory compliance if MTCL table is supported.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2: no change
---
 .../net/wireless/mediatek/mt76/mt7925/init.c    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 8561ab310f16..1bd30a857be5 100644
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
 #define IS_UNII_INVALID(idx, sfreq, efreq) \
 	(!(dev->phy.clc_chan_conf & BIT(idx)) && (cfreq) >= (sfreq) && (cfreq) <= (efreq))
+#define MT7925_UNII_59G_IS_VALID	0x1
+#define MT7925_UNII_6G_IS_VALID	0x1e
 	struct ieee80211_supported_band *sband;
 	struct mt76_dev *mdev = &dev->mt76;
 	struct ieee80211_channel *ch;
+	u32 mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, mdev->alpha2);
 	int i, cfreq;
 
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


