Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABD3C282C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Mar 2025 06:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OtZCNNatFaOCzRGypjoy5TyhRMi0tBGfDJRVx9w0Uc=; b=u0shBhTWie5sTWgNHGrnopnlJy
	lfNu5+XTznrw4l6/TbdjouW92rEaWi2S/0GjssVN4FV5PnlWNWjchmqUYn3lXVedNmlH5y34UXqlq
	gvDvSK93pTJRh7gkgMuOo3etj/S32tQuWN2RZHbpchz4frO36XL2JZyy+6q2Jz+Sf6L3ziCRpjTfl
	bthbp2quqQzlxdVa+dBd9YbFyDDix5Hdu54niWFT3FMCPB6F0ZAIa///90l8D6m3XnJ/soQKfwRtI
	WShs/OtgcYhLwPtnu7ZXtu16fVJLElHrw9Y/P2GaUxQ+PmgXPWSAOHGl6//HofASwZhWyHfCkqVwN
	T5SVYaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM2q-00000003KpL-450D;
	Tue, 04 Mar 2025 06:46:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLmQ-00000003HKo-0bUK
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Mar 2025 06:29:27 +0000
X-UUID: 007f2464f8c211efa1e849db4cc18d44-20250303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6OtZCNNatFaOCzRGypjoy5TyhRMi0tBGfDJRVx9w0Uc=;
	b=eNa73RXXsS2rrO87CygSiGLy5D9GnfU5ncWM1naVZ1XnstKgApuSNEj9OGFwXgFPAM1JJCwt5XbEk3rpmeXFoKBU09E8OhmRyK5M7tjFV49JlgRJYEClPrPkmcy23lHvPS2LwoCUp9DoZOdYn+/OESCayeJdePRKdiKCF5hQ3a4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6c914155-82dc-4e9c-aa9c-3f3169df0d58,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:ed9bd1b5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 007f2464f8c211efa1e849db4cc18d44-20250303
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1396148251; Mon, 03 Mar 2025 23:29:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
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
Subject: [PATCH v2 5/6] wifi: mt76: mt792x: extend MTCL of APCI to version3 for EHT control
Date: Tue, 4 Mar 2025 14:28:53 +0800
Message-ID: <20250304062854.829194-5-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250304062854.829194-1-mingyen.hsieh@mediatek.com>
References: <20250304062854.829194-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222926_189404_AD03D742 
X-CRM114-Status: GOOD (  18.27  )
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

This patch introduces version 3 of the MTCL table, which provides
regulatory information for WiFi 7. It also configured by the platform
vender like the version 1 and 2.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2: mt792x_acpi_parse_mtcl_tbl_v3 should return the config of
    "depends on driver" when bios support mtcl v2 only
---
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   6 +-
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  | 101 ++++++++++++++----
 .../wireless/mediatek/mt76/mt792x_acpi_sar.h  |  40 ++++++-
 3 files changed, 120 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 85f07f936be5..d43e5d93dd85 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -525,7 +525,7 @@ int mt792xe_mcu_fw_pmctrl(struct mt792x_dev *dev);
 int mt792x_init_acpi_sar(struct mt792x_dev *dev);
 int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default);
 u8 mt792x_acpi_get_flags(struct mt792x_phy *phy);
-u8 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2);
+u32 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2);
 #else
 static inline int mt792x_init_acpi_sar(struct mt792x_dev *dev)
 {
@@ -543,9 +543,9 @@ static inline u8 mt792x_acpi_get_flags(struct mt792x_phy *phy)
 	return 0;
 }
 
-static inline u8 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2)
+static inline u32 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2)
 {
-	return 0xf;
+	return MT792X_ACPI_MTCL_INVALID;
 }
 #endif
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 9317f8ff2070..fac53e62687b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -66,13 +66,22 @@ mt792x_acpi_read(struct mt792x_dev *dev, u8 *method, u8 **tbl, u32 *len)
 }
 
 /* MTCL : Country List Table for 6G band */
+/* MTCL : Country List Table for 6G band and 11BE */
 static int
 mt792x_asar_acpi_read_mtcl(struct mt792x_dev *dev, u8 **table, u8 *version)
 {
-	int ret;
+	int len, ret;
 
-	*version = ((ret = mt792x_acpi_read(dev, MT792x_ACPI_MTCL, table, NULL)) < 0)
-		   ? 1 : 2;
+	ret = mt792x_acpi_read(dev, MT792x_ACPI_MTCL, table, &len);
+	if (ret)
+		return ret;
+
+	if (len == sizeof(struct mt792x_asar_cl))
+		*version = ((struct mt792x_asar_cl *)*table)->version;
+	else if (len == sizeof(struct mt792x_asar_cl_v3))
+		*version = ((struct mt792x_asar_cl_v3 *)*table)->version;
+	else
+		return -EINVAL;
 
 	return ret;
 }
@@ -351,10 +360,24 @@ u8 mt792x_acpi_get_flags(struct mt792x_phy *phy)
 }
 EXPORT_SYMBOL_GPL(mt792x_acpi_get_flags);
 
-static u8
+static u32
+mt792x_acpi_get_mtcl_map_v3(int row, int column, struct mt792x_asar_cl_v3 *cl)
+{
+	u32 config = 0;
+	u8 mode_be = 0;
+
+	mode_be = (cl->mode_be > 0x02) ? 0 : cl->mode_be;
+
+	if (cl->version > 2 && cl->clbe[row] & BIT(column))
+		config |= (mode_be & 0x3) << 4;
+
+	return config;
+}
+
+static u32
 mt792x_acpi_get_mtcl_map(int row, int column, struct mt792x_asar_cl *cl)
 {
-	u8 config = 0;
+	u32 config = 0;
 	u8 mode_6g, mode_5g9;
 
 	mode_6g = (cl->mode_6g > 0x02) ? 0 : cl->mode_6g;
@@ -368,30 +391,44 @@ mt792x_acpi_get_mtcl_map(int row, int column, struct mt792x_asar_cl *cl)
 	return config;
 }
 
-u8 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2)
+static u32
+mt792x_acpi_parse_mtcl_tbl_v3(struct mt792x_phy *phy, char *alpha2)
 {
-	static const char * const cc_list_all[] = {
-		"00", "EU", "AR", "AU", "AZ", "BY", "BO", "BR",
-		"CA", "CL", "CN", "ID", "JP", "MY", "MX", "ME",
-		"MA", "NZ", "NG", "PH", "RU", "RS", "SG", "KR",
-		"TW", "TH", "UA", "GB", "US", "VN", "KH", "PY",
-	};
-	static const char * const cc_list_eu[] = {
-		"AT", "BE", "BG", "CY", "CZ", "HR", "DK", "EE",
-		"FI", "FR", "DE", "GR", "HU", "IS", "IE", "IT",
-		"LV", "LI", "LT", "LU", "MT", "NL", "NO", "PL",
-		"PT", "RO", "SK", "SI", "ES", "SE", "CH",
-	};
 	struct mt792x_acpi_sar *sar = phy->acpisar;
-	struct mt792x_asar_cl *cl;
+	struct mt792x_asar_cl_v3 *cl = sar->countrylist_v3;
 	int col, row, i;
 
-	if (!sar)
-		return 0xf;
+	if (sar->ver != 3)
+		goto out;
+
+	if (!cl)
+		return MT792X_ACPI_MTCL_INVALID;
+
+	for (i = 0; i < ARRAY_SIZE(cc_list_be); i++) {
+		col = 7 - i % 8;
+		row = i / 8;
+		if (!memcmp(cc_list_be[i], alpha2, 2))
+			return mt792x_acpi_get_mtcl_map_v3(row, col, cl);
+	}
+	for (i = 0; i < ARRAY_SIZE(cc_list_eu); i++) {
+		if (!memcmp(cc_list_eu[i], alpha2, 2))
+			return mt792x_acpi_get_mtcl_map_v3(3, 7, cl);
+	}
+
+out:
+	/* Depends on driver */
+	return 0x20;
+}
+
+static u32
+mt792x_acpi_parse_mtcl_tbl(struct mt792x_phy *phy, char *alpha2)
+{
+	struct mt792x_acpi_sar *sar = phy->acpisar;
+	struct mt792x_asar_cl *cl = sar->countrylist;
+	int col, row, i;
 
-	cl = sar->countrylist;
 	if (!cl)
-		return 0xc;
+		return MT792X_ACPI_MTCL_INVALID;
 
 	for (i = 0; i < ARRAY_SIZE(cc_list_all); i++) {
 		col = 7 - i % 8;
@@ -406,4 +443,22 @@ u8 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2)
 
 	return mt792x_acpi_get_mtcl_map(0, 7, cl);
 }
+
+u32 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2)
+{
+	struct mt792x_acpi_sar *sar = phy->acpisar;
+	u32 config = 0;
+
+	if (!sar)
+		return MT792X_ACPI_MTCL_INVALID;
+
+	config = mt792x_acpi_parse_mtcl_tbl_v3(phy, alpha2);
+
+	if (config == MT792X_ACPI_MTCL_INVALID)
+		return MT792X_ACPI_MTCL_INVALID;
+
+	config |= mt792x_acpi_parse_mtcl_tbl(phy, alpha2);
+
+	return config;
+}
 EXPORT_SYMBOL_GPL(mt792x_acpi_get_mtcl_conf);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
index 2298983b6342..cf15571dcb82 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
@@ -15,6 +15,30 @@
 #define MT792x_ACPI_MTGS		"MTGS"
 #define MT792x_ACPI_MTFG		"MTFG"
 
+#define MT792X_ACPI_MTCL_INVALID	0xffffffff
+
+static const char * const cc_list_all[] = {
+	"00", "EU", "AR", "AU", "AZ", "BY", "BO", "BR",
+	"CA", "CL", "CN", "ID", "JP", "MY", "MX", "ME",
+	"MA", "NZ", "NG", "PH", "RU", "RS", "SG", "KR",
+	"TW", "TH", "UA", "GB", "US", "VN", "KH", "PY",
+};
+
+static const char * const cc_list_eu[] = {
+	"AD", "AT", "BE", "BG", "CY", "CZ", "HR", "DK",
+	"EE", "FI", "FR", "DE", "GR", "HU", "IS", "IE",
+	"IT", "LV", "LI", "LT", "LU", "MC", "MT", "NL",
+	"NO", "PL", "PT", "RO", "SK", "SI", "ES", "SE",
+	"CH",
+};
+
+static const char * const cc_list_be[] = {
+	"AR", "BR", "BY", "CL", "IQ", "MX", "OM", "RU",
+	"RW", "VN", "KR", "UA", "", "", "", "",
+	"EU", "AT", "CN", "CA", "TW", "NZ", "PH", "UK",
+	"US",
+};
+
 struct mt792x_asar_dyn_limit {
 	u8 idx;
 	u8 frp[5];
@@ -72,6 +96,17 @@ struct mt792x_asar_geo_v2 {
 	DECLARE_FLEX_ARRAY(struct mt792x_asar_geo_limit_v2, tbl);
 } __packed;
 
+struct mt792x_asar_cl_v3 {
+	u8 names[4];
+	u8 version;
+	u8 mode_6g;
+	u8 cl6g[6];
+	u8 mode_5g9;
+	u8 cl5g9[6];
+	u8 mode_be;
+	u8 clbe[6];
+} __packed;
+
 struct mt792x_asar_cl {
 	u8 names[4];
 	u8 version;
@@ -100,7 +135,10 @@ struct mt792x_acpi_sar {
 		struct mt792x_asar_geo *geo;
 		struct mt792x_asar_geo_v2 *geo_v2;
 	};
-	struct mt792x_asar_cl *countrylist;
+	union {
+		struct mt792x_asar_cl *countrylist;
+		struct mt792x_asar_cl_v3 *countrylist_v3;
+	};
 	struct mt792x_asar_fg *fg;
 };
 
-- 
2.34.1


