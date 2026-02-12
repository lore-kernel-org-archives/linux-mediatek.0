Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D562EB48EC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Feb 2026 09:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZ3uOaMaLdzHzN8G3oXEtJI9llm/fFxrp6KV8BGLatU=; b=ngR3BZ+rEyRz9ssg3MLXMtBdYY
	oaiD4yiNMxCGRsVWHGbfjVFmK0g5dPGdwT8v/ms3qRDGHgxnGGuO7KMMLRKhSQCNGoX106zLP14yt
	ozSBgQLejNO3ikNAWdR4DfTlwtwBtBB9T5PqddNrSoY4fND9rxXyM7pN4udLixVgM2sTN2FL1Yxb9
	uLSX1N9lICmTky531O5puuHDHM6JSaVZgK86wXLO0gUCVyYQrvApK4ssiAE0lqBqvSDmFnZpIJDNI
	WY254vVp1Bt6OL15JCmmcWT5fXkH0wB8t7PVcOqDWVZUBgsBhvrlfgockhHhp1sNXLqGIi88vxTTY
	eSycfQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSdh-00000001oFH-3gRz;
	Thu, 12 Feb 2026 09:05:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSdf-00000001oE5-1O1M
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Feb 2026 09:05:32 +0000
X-UUID: f89a9a2207f111f1a16f0188aa809bee-20260212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TZ3uOaMaLdzHzN8G3oXEtJI9llm/fFxrp6KV8BGLatU=;
	b=nKfE0bY+WLmRbRVfRFggJPfuuv+guqCTQQEH+uRSAL5/9sGJcEyIKcacJiFoh3bEJ+6TeJRb5e0Xxl4x/C46e47FLVmeeZq6tZfuTFe0rspNJ922i66uVeNFIklBXgYZjeJNyuEup+pxJJfzQrrIF++TLEvf5cNwXbGxdQSEgXA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f9b39b88-413b-4faf-af1e-f37152494eee,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:527be17a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f89a9a2207f111f1a16f0188aa809bee-20260212
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1200536542; Thu, 12 Feb 2026 02:05:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Feb 2026 17:05:24 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Feb 2026 17:05:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
	<shayne.chen@mediatek.com>
Subject: [PATCH mt76 2/3] wifi: mt76: mt7996: add variant for MT7992 chipsets
Date: Thu, 12 Feb 2026 17:03:09 +0800
Message-ID: <20260212090310.3335392-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260212090310.3335392-1-shayne.chen@mediatek.com>
References: <20260212090310.3335392-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_010531_384777_4003F467 
X-CRM114-Status: GOOD (  12.03  )
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

Introduce VAR_TYPE_24 for the MT7992 chipsets, a dual-band variant
supporting 3T3R/2SS on the 2 GHz band and 5T5R/4SS on the 5GHz band.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c | 5 ++++-
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 7 +++++++
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 00c72be8498f..ac05f7d75d63 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -33,6 +33,8 @@ static char *mt7996_eeprom_name(struct mt7996_dev *dev)
 			if (dev->var.fem == MT7996_FEM_INT)
 				return MT7992_EEPROM_DEFAULT_23_INT;
 			return MT7992_EEPROM_DEFAULT_23;
+		case MT7992_VAR_TYPE_24:
+			return MT7992_EEPROM_DEFAULT_24;
 		case MT7992_VAR_TYPE_44:
 		default:
 			if (dev->var.fem == MT7996_FEM_INT)
@@ -392,7 +394,8 @@ bool mt7996_eeprom_has_background_radar(struct mt7996_dev *dev)
 			return false;
 		break;
 	case MT7992_DEVICE_ID:
-		if (dev->var.type == MT7992_VAR_TYPE_23)
+		if (dev->var.type == MT7992_VAR_TYPE_23 ||
+		    dev->var.type == MT7992_VAR_TYPE_24)
 			return false;
 		break;
 	case MT7990_DEVICE_ID: {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 1fab04909831..3b4f808b968c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1173,7 +1173,7 @@ static int mt7996_variant_type_init(struct mt7996_dev *dev)
 		else if (u32_get_bits(val, MT_PAD_GPIO_ADIE_COMB_7992))
 			var_type = MT7992_VAR_TYPE_44;
 		else
-			return -EINVAL;
+			var_type = MT7992_VAR_TYPE_24;
 		break;
 	case MT7990_DEVICE_ID:
 		var_type = MT7990_VAR_TYPE_23;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 46099486ec09..98db3bcf76f0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -18,6 +18,9 @@
 		case MT7992_VAR_TYPE_23:			\
 			_fw = MT7992_##name##_23;		\
 			break;					\
+		case MT7992_VAR_TYPE_24:			\
+			_fw = MT7992_##name##_24;		\
+			break;					\
 		default:					\
 			_fw = MT7992_##name;			\
 		}						\
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index ea1f656a9334..d36fb5396141 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -64,6 +64,11 @@
 #define MT7992_FIRMWARE_DSP_23		"mediatek/mt7996/mt7992_dsp_23.bin"
 #define MT7992_ROM_PATCH_23		"mediatek/mt7996/mt7992_rom_patch_23.bin"
 
+#define MT7992_FIRMWARE_WA_24		"mediatek/mt7996/mt7992_wa_24.bin"
+#define MT7992_FIRMWARE_WM_24		"mediatek/mt7996/mt7992_wm_24.bin"
+#define MT7992_FIRMWARE_DSP_24		"mediatek/mt7996/mt7992_dsp_24.bin"
+#define MT7992_ROM_PATCH_24		"mediatek/mt7996/mt7992_rom_patch_24.bin"
+
 #define MT7990_FIRMWARE_WA		""
 #define MT7990_FIRMWARE_WM		"mediatek/mt7996/mt7990_wm.bin"
 #define MT7990_FIRMWARE_DSP		""
@@ -79,6 +84,7 @@
 #define MT7992_EEPROM_DEFAULT_MIX	"mediatek/mt7996/mt7992_eeprom_2i5e.bin"
 #define MT7992_EEPROM_DEFAULT_23	"mediatek/mt7996/mt7992_eeprom_23.bin"
 #define MT7992_EEPROM_DEFAULT_23_INT	"mediatek/mt7996/mt7992_eeprom_23_2i5i.bin"
+#define MT7992_EEPROM_DEFAULT_24	"mediatek/mt7996/mt7992_eeprom_24_2i5i.bin"
 
 #define MT7990_EEPROM_DEFAULT		"mediatek/mt7996/mt7990_eeprom.bin"
 #define MT7990_EEPROM_DEFAULT_INT	"mediatek/mt7996/mt7990_eeprom_2i5i.bin"
@@ -158,6 +164,7 @@ enum mt7996_var_type {
 enum mt7992_var_type {
 	MT7992_VAR_TYPE_44,
 	MT7992_VAR_TYPE_23,
+	MT7992_VAR_TYPE_24,
 };
 
 enum mt7990_var_type {
-- 
2.51.0


