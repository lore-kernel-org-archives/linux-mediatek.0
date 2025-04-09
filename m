Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7326C369A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 14:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wA6tB5jf2eHCDBLI/SlO3iktMUtN5Y+F51SNFTax68w=; b=1CzOgnvAonb7pC6583Bq3s1KvE
	PGDphDWvkBO+UEph1AOp7OZMRbu/SOgvKsznfr+hVQDmAVAapg0LrSNvrpEUboOW45ARUGvcs+zKl
	PvlMgdeeUXCuBF7HKs7yqQMgonIikeN8BWr+sH4E9hryzGCBHJ1DfQXU9yU3WaOR1Qcohi8DOxvIk
	Fe2irhQbWJEHoW3dGDLxt79d9DMi4fR6iTXa5ntHooEc6RvRb7J1LrMmjmwzKSLZo0OIF7FIJk1PB
	Uboy6Qq5ZRAB4GbHoFRmQznspaB/nGgbz5AApDaatc3mXfTWNt8C8eMowS9m9O6bOHMDHWCu7Id1r
	x/aqd4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WgU-00000007WHf-1iMD;
	Wed, 09 Apr 2025 14:45:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W6f-00000007Ogm-0s64
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Apr 2025 14:08:48 +0000
X-UUID: 22cfc0a4154c11f0a1e849db4cc18d44-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wA6tB5jf2eHCDBLI/SlO3iktMUtN5Y+F51SNFTax68w=;
	b=m8xnqqaiUDa6LUl2Yd6hPI9BPSkMtRV99ELgkbPcnaAouKMO3JtzwEpc29ar06WGmXG6TJ+moQH+NkAzyCJNV/X4x2UbXLvVYXZ8t3uv7jvTAyW1cpKRjNFuYJNkO6HH//GOnGWQ9xohnotOze/KxeDonS6gL6eNSl6cPEdTM/A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b5f1d53a-7379-4370-a411-15510f686ea8,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:f557e0a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 22cfc0a4154c11f0a1e849db4cc18d44-20250409
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 31176510; Wed, 09 Apr 2025 07:08:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 9 Apr 2025 22:08:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 9 Apr 2025 22:08:37 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76-next v3 06/10] wifi: mt76: mt7996: add eeprom support for mt7990
Date: Wed, 9 Apr 2025 22:07:46 +0800
Message-ID: <20250409140750.724437-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409140750.724437-1-shayne.chen@mediatek.com>
References: <20250409140750.724437-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_070845_317273_064DB8C0 
X-CRM114-Status: GOOD (  11.43  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

Add eeprom definition and default bin file for mt7990.
This is a preliminary patch to support mt7990 chipset.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 51b09956486b..6f3eb053ef02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -17,6 +17,8 @@ static int mt7996_check_eeprom(struct mt7996_dev *dev)
 		return is_mt7996(&dev->mt76) ? 0 : -EINVAL;
 	case MT7992_DEVICE_ID:
 		return is_mt7992(&dev->mt76) ? 0 : -EINVAL;
+	case MT7990_DEVICE_ID:
+		return is_mt7990(&dev->mt76) ? 0 : -EINVAL;
 	default:
 		return -EINVAL;
 	}
@@ -39,6 +41,10 @@ static char *mt7996_eeprom_name(struct mt7996_dev *dev)
 				return MT7992_EEPROM_DEFAULT_MIX;
 			return MT7992_EEPROM_DEFAULT;
 		}
+	case MT7990_DEVICE_ID:
+		if (dev->var.fem == MT7996_FEM_INT)
+			return MT7990_EEPROM_DEFAULT_INT;
+		return MT7990_EEPROM_DEFAULT;
 	case MT7996_DEVICE_ID:
 	default:
 		switch (dev->var.type) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index f017d30e1c49..a4c2986fcffd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -943,6 +943,9 @@ static int mt7996_variant_type_init(struct mt7996_dev *dev)
 		else
 			return -EINVAL;
 		break;
+	case MT7990_DEVICE_ID:
+		var_type = MT7990_VAR_TYPE_23;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 148271fcd88f..2dd33f303a06 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -73,6 +73,9 @@
 #define MT7992_EEPROM_DEFAULT_23	"mediatek/mt7996/mt7992_eeprom_23.bin"
 #define MT7992_EEPROM_DEFAULT_23_INT	"mediatek/mt7996/mt7992_eeprom_23_2i5i.bin"
 
+#define MT7990_EEPROM_DEFAULT		"mediatek/mt7996/mt7990_eeprom.bin"
+#define MT7990_EEPROM_DEFAULT_INT	"mediatek/mt7996/mt7990_eeprom_2i5i.bin"
+
 #define MT7996_EEPROM_SIZE		7680
 #define MT7996_EEPROM_BLOCK_SIZE	16
 #define MT7996_TOKEN_SIZE		16384
@@ -143,6 +146,10 @@ enum mt7992_var_type {
 	MT7992_VAR_TYPE_23,
 };
 
+enum mt7990_var_type {
+	MT7990_VAR_TYPE_23,
+};
+
 enum mt7996_fem_type {
 	MT7996_FEM_EXT,
 	MT7996_FEM_INT,
-- 
2.39.2


