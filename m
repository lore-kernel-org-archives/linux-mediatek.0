Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF114CE7A81
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4y942v5Xke8ZdpPa0qtvdnzBVnL/b1FMqVN4uXyWPE=; b=nDOQPue5AM/RE7FX0W/itEUj6L
	pkrfJ4I9zN3JIP41U72DAY/L4REHJ4SuPAv4k9fYBLgntQeDO4ZGM2YieVcLQ1hbbgRUfBSp0Ux+e
	/REh1Fx5BCDNxBWrMHoOccicYqSHcrSTe3YrfL3+/RJGxy4DDJqgmp5sd2rzvtjSuswFSLqNrXdw9
	GWXW0YyTKuOopEY2REfPeGfQ6z13A2yA9TwGD4Ze40yTf8+gTRQVukeh/QQ5g5geqb4GFY2NnxOMq
	CogBrY0gNTtiNANoVyD48I5GK50o68tZZ2/Lp5qnfxvjFtN4W7NgMN8bhtkemWGO+Pfw+Gjm6ZOLM
	BqPq2s6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkggR-00Dhfa-1F;
	Mon, 25 Sep 2023 08:11:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkggN-00DhcV-0d
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 08:11:10 +0000
X-UUID: 0e766c7a5b7b11ee9b7791016c24628a-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=v4y942v5Xke8ZdpPa0qtvdnzBVnL/b1FMqVN4uXyWPE=;
	b=qaU4xHF+IPzk7SoE7RV6038IOGvoYajUT4/1E20+CdeZcOXuDcxba75U7b2BNEkBbBiBp4ML+1uoO3+HKvd3fp0pzjY3AouzGAaKJX7/9GFFAkvIBmXaFvwfgh+MjLIPd1uJ5lh86P0VihRf7Jts+Ejx/c4zhycirNbqdUqXgbA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:12767f28-aad5-4a83-9d8a-cb888f21eef2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:a67719f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0e766c7a5b7b11ee9b7791016c24628a-20230925
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 472250748; Mon, 25 Sep 2023 01:10:57 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 16:10:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 16:10:55 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, rong.yan <rong.yan@mediatek.com>, Deren
 Wu <deren.wu@mediatek.com>
Subject: [PATCH 6/6] wifi: mt76: mt7921: support 5.9/6GHz channel config in acpi
Date: Mon, 25 Sep 2023 16:10:38 +0800
Message-ID: <7828e97c80e6818170d71ae231af4d36b08ff8bd.1695627867.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1695627867.git.deren.wu@mediatek.com>
References: <cover.1695627867.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_011107_242053_AAFFFE48 
X-CRM114-Status: GOOD (  15.68  )
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

From: "rong.yan" <rong.yan@mediatek.com>

The mtcl table, configured by platform vendor, provides regulatory
information for 5.9/6 GHz channels. mt792x should work on
corresponding channels supported by mtcl. This patch would parse
the settings in mtcl table and apply the result into chip side.

Signed-off-by: rong.yan <rong.yan@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  4 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  6 +++
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  | 53 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt792x_acpi_sar.h  |  2 +
 4 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 63f3d4a5c9aa..94fc3eb40234 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1260,12 +1260,14 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 		u8 alpha2[2];
 		u8 type[2];
 		u8 env_6g;
-		u8 rsvd[63];
+		u8 mtcl_conf;
+		u8 rsvd[62];
 	} __packed req = {
 		.idx = idx,
 		.env = env_cap,
 		.env_6g = dev->phy.power_type,
 		.acpi_conf = mt792x_acpi_get_flags(&dev->phy),
+		.mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2),
 	};
 	int ret, valid_cnt = 0;
 	u8 i, *pos;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 34380d1eb9f4..5b2b97762d01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -364,6 +364,7 @@ int mt792xe_mcu_fw_pmctrl(struct mt792x_dev *dev);
 int mt792x_init_acpi_sar(struct mt792x_dev *dev);
 int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default);
 u8 mt792x_acpi_get_flags(struct mt792x_phy *phy);
+u8 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2);
 #else
 static inline int mt792x_init_acpi_sar(struct mt792x_dev *dev)
 {
@@ -380,6 +381,11 @@ static inline u8 mt792x_acpi_get_flags(struct mt792x_phy *phy)
 {
 	return 0;
 }
+
+static inline u8 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2)
+{
+	return 0xf;
+}
 #endif
 
 #endif /* __MT7925_H */
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 303c0f5c9c66..e7afea87e82e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -348,3 +348,56 @@ u8 mt792x_acpi_get_flags(struct mt792x_phy *phy)
 	return flags;
 }
 EXPORT_SYMBOL_GPL(mt792x_acpi_get_flags);
+
+static u8
+mt792x_acpi_get_mtcl_map(int row, int column, struct mt792x_asar_cl *cl)
+{
+	u8 config = 0;
+
+	if (cl->cl6g[row] & BIT(column))
+		config |= (cl->mode_6g & 0x3) << 2;
+	if (cl->version > 1 && cl->cl5g9[row] & BIT(column))
+		config |= (cl->mode_5g9 & 0x3);
+
+	return config;
+}
+
+u8 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2)
+{
+	static const char * const cc_list_all[] = {
+		"00", "EU", "AR", "AU", "AZ", "BY", "BO", "BR",
+		"CA", "CL", "CN", "ID", "JP", "MY", "MX", "ME",
+		"MA", "NZ", "NG", "PH", "RU", "RS", "SG", "KR",
+		"TW", "TH", "UA", "GB", "US", "VN", "KH", "PY",
+	};
+	static const char * const cc_list_eu[] = {
+		"AT", "BE", "BG", "CY", "CZ", "HR", "DK", "EE",
+		"FI", "FR", "DE", "GR", "HU", "IS", "IE", "IT",
+		"LV", "LI", "LT", "LU", "MT", "NL", "NO", "PL",
+		"PT", "RO", "MT", "SK", "SI", "ES", "CH",
+	};
+	struct mt792x_acpi_sar *sar = phy->acpisar;
+	struct mt792x_asar_cl *cl;
+	int col, row, i;
+
+	if (!sar)
+		return 0xf;
+
+	cl = sar->countrylist;
+	if (!cl)
+		return 0xc;
+
+	for (i = 0; i < ARRAY_SIZE(cc_list_all); i++) {
+		col = 7 - i % 8;
+		row = i / 8;
+		if (!memcmp(cc_list_all[i], alpha2, 2))
+			return mt792x_acpi_get_mtcl_map(row, col, cl);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cc_list_eu); i++)
+		if (!memcmp(cc_list_eu[i], alpha2, 2))
+			return mt792x_acpi_get_mtcl_map(0, 6, cl);
+
+	return mt792x_acpi_get_mtcl_map(0, 7, cl);
+}
+EXPORT_SYMBOL_GPL(mt792x_acpi_get_mtcl_conf);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
index d6d332e863ba..2298983b6342 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
@@ -77,6 +77,8 @@ struct mt792x_asar_cl {
 	u8 version;
 	u8 mode_6g;
 	u8 cl6g[6];
+	u8 mode_5g9;
+	u8 cl5g9[6];
 } __packed;
 
 struct mt792x_asar_fg {
-- 
2.18.0


