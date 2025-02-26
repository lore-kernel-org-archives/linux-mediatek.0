Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54DCC19777
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAU9acRw7UU8O8CH8C3J5uw+2DS0q96HbbH+dTRr45U=; b=ltmktPhctVTx97LWKiko5tUKvr
	mcgiYphAEKfSfOeZYeoHIXwmraigamAWKl6t74gXfA/IoIGxIIad2DUH6s+ng9ZgOT5zmFhbk/n+c
	RJvxY0wFdzdr5S2K7VxXvYQ5VVEKhK51ipKxgK/wgFIDZRqgOTAgephW9LNlqBdVHrAbWmXkWWsul
	VWntCxHzGGuteiAoR2xQSgiu/+Z4IA356nX1f7nwbRJe+XK/NULWwDgYemEe5E/ePnpuUR2YswPQX
	P4rTJdi4vgDV8twIIYq7rVWL2h9WTxllD0CGgxDUOdiVWaYm8vS4+vtBHP1hLu09JiFYs2Sn5rL8f
	QMxSWF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCQ4-00000002oCW-2EHn;
	Wed, 26 Feb 2025 08:05:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCD2-00000002kk8-21uB
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 07:52:01 +0000
X-UUID: 8be14e0cf41611ef83f2a1c9db70dae0-20250226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OAU9acRw7UU8O8CH8C3J5uw+2DS0q96HbbH+dTRr45U=;
	b=d8VGNFPaRS83VAkQU8TXDFXWeYYCwsPUNYVCtJ/aGC3IHzHm1s7u2eKbUysiW70z7/UksxmSVWbIUaWyYjkRyU7rOrbn1kPtPZ9cgu+qX7bCoeQUq/lAoFIrybcu3pS4RjCrxXFRNvK4SgGfR2as946kn6/PgSFqu3bX0Yjy2ic=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:803d3252-0bf7-4f3d-a7ea-68f3a9a93904,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:967e4629-e0f8-414e-b8c3-b75c08217be8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8be14e0cf41611ef83f2a1c9db70dae0-20250226
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 101710886; Wed, 26 Feb 2025 00:51:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 26 Feb 2025 15:51:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 26 Feb 2025 15:51:52 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 2/6] wifi: mt76: mt7925: add EHT control support based on the CLC data
Date: Wed, 26 Feb 2025 15:51:19 +0800
Message-ID: <20250226075123.3981253-2-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250226075123.3981253-1-mingyen.hsieh@mediatek.com>
References: <20250226075123.3981253-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_235200_533362_38A46A60 
X-CRM114-Status: GOOD (  18.94  )
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

Some countries do not support EHT modulation for now. To prevent violating
regulations, the MT7925 chipset should control the EHT capabilities.
Therefore, when a regulatory domain change is detected during scanning,
the `mt7925_regd_be_ctrl` will process the CLC data to update the EHT
capabilities.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/init.c  | 38 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  3 ++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 10 +++--
 .../wireless/mediatek/mt76/mt7925/mt7925.h    | 27 +++++++++++--
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 5 files changed, 72 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index b40d979f1b65..94d7b762fe40 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -58,6 +58,44 @@ static int mt7925_thermal_init(struct mt792x_phy *phy)
 	return PTR_ERR_OR_ZERO(hwmon);
 }
 
+void mt7925_regd_be_ctrl(struct mt792x_dev *dev, u8 *alpha2)
+{
+	struct mt792x_phy *phy = &dev->phy;
+	struct mt7925_clc_rule_v2 *rule;
+	struct mt7925_clc *clc;
+	bool old = dev->has_eht, new = true;
+	u8 *pos;
+
+	if (!phy->clc[MT792x_CLC_BE_CTRL])
+		goto out;
+
+	clc = (struct mt7925_clc *)phy->clc[MT792x_CLC_BE_CTRL];
+	pos = clc->data;
+
+	while (1) {
+		rule = (struct mt7925_clc_rule_v2 *)pos;
+
+		if (rule->alpha2[0] == alpha2[0] &&
+		    rule->alpha2[1] == alpha2[1]) {
+			new = false;
+			break;
+		}
+
+		/* Check the last one */
+		if (rule->flag && BIT(0))
+			break;
+
+		pos += sizeof(*rule);
+	}
+
+out:
+	if (old == new)
+		return;
+
+	dev->has_eht = new;
+	mt7925_set_stream_he_eht_caps(phy);
+}
+
 void mt7925_regd_update(struct mt792x_dev *dev)
 {
 	struct mt76_dev *mdev = &dev->mt76;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index cefb9068fa72..80aa7f329cf8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1449,6 +1449,9 @@ void mt7925_scan_work(struct work_struct *work)
 				if (!is_valid_alpha2(evt->alpha2))
 					break;
 
+				if (memcmp(evt->alpha2, mdev->alpha2, 2))
+					mt7925_regd_be_ctrl(phy->dev, evt->alpha2);
+
 				if (mdev->alpha2[0] != '0' && mdev->alpha2[1] != '0')
 					break;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 505a6467f147..e73320c5d8c0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -915,7 +915,9 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 			continue;
 
 		/* header content sanity */
-		if (u8_get_bits(clc->type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
+		if ((clc->idx == MT792x_CLC_BE_CTRL &&
+		     u8_get_bits(clc->t2.type, MT_EE_HW_TYPE_ENCAP) != hw_encap) ||
+		    u8_get_bits(clc->t0.type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
 			continue;
 
 		phy->clc[clc->idx] = devm_kmemdup(mdev->dev, clc,
@@ -1024,7 +1026,6 @@ mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data)
 	mdev->phy.chainmask = mdev->phy.antenna_mask;
 	mdev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
 	mdev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
-	dev->has_eht = cap->eht;
 }
 
 static void
@@ -3427,7 +3428,7 @@ __mt7925_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 	if (!clc)
 		return 0;
 
-	pos = clc->data + sizeof(*seg) * clc->nr_seg;
+	pos = clc->data + sizeof(*seg) * clc->t0.nr_seg;
 	last_pos = clc->data + le32_to_cpu(*(__le32 *)(clc->data + 4));
 	while (pos < last_pos) {
 		struct mt7925_clc_rule *rule = (struct mt7925_clc_rule *)pos;
@@ -3473,6 +3474,9 @@ int mt7925_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 
 	/* submit all clc config */
 	for (i = 0; i < ARRAY_SIZE(phy->clc); i++) {
+		if (i == MT792x_CLC_BE_CTRL)
+			continue;
+
 		ret = __mt7925_mcu_set_clc(dev, alpha2, env_cap,
 					   phy->clc[i], i);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index abecaf897159..e6ca9021f487 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -137,6 +137,12 @@ enum {
 	MT7925_CLC_MAX_NUM,
 };
 
+struct mt7925_clc_rule_v2 {
+	u32 flag;
+	u8 alpha2[2];
+	u8 rsv[10];
+} __packed;
+
 struct mt7925_clc_rule {
 	u8 alpha2[2];
 	u8 type[2];
@@ -152,14 +158,26 @@ struct mt7925_clc_segment {
 	u8 rsv2[4];
 } __packed;
 
-struct mt7925_clc {
-	__le32 len;
-	u8 idx;
-	u8 ver;
+struct mt7925_clc_type0 {
 	u8 nr_country;
 	u8 type;
 	u8 nr_seg;
 	u8 rsv[7];
+} __packed;
+
+struct mt7925_clc_type2 {
+	u8 type;
+	u8 rsv[9];
+} __packed;
+
+struct mt7925_clc {
+	__le32 len;
+	u8 idx;
+	u8 ver;
+	union {
+		struct mt7925_clc_type0 t0;
+		struct mt7925_clc_type2 t2;
+	};
 	u8 data[];
 } __packed;
 
@@ -239,6 +257,7 @@ int mt7925_mcu_chip_configv2(struct mt792x_dev *dev, const char *cmd);
 int mt7925_mcu_set_rxfilter(struct mt792x_dev *dev, u32 fif,
 			    u8 bit_op, u32 bit_map);
 
+void mt7925_regd_be_ctrl(struct mt792x_dev *dev, u8 *alpha2);
 void mt7925_regd_update(struct mt792x_dev *dev);
 int mt7925_mac_init(struct mt792x_dev *dev);
 int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 281df43d9060..85f07f936be5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -71,6 +71,7 @@ struct mt792x_fw_features {
 enum {
 	MT792x_CLC_POWER,
 	MT792x_CLC_POWER_EXT,
+	MT792x_CLC_BE_CTRL,
 	MT792x_CLC_MAX_NUM,
 };
 
-- 
2.34.1


