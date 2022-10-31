Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79E2FA3741
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5Y/njI4qNgjO+Lt3Iai2beqZSAc9SoasK098zh6e4Q=; b=nhSgUW2hWQltaBDDDbPz5MIhSi
	lNafewXkAMR6wp7bdPvQ8F6r0q/thTnUkVrrm9nEJ8A+hGLdvUAzmO9LgEeeI92RDHtw8WPadlZ9a
	+z3m8IrmPmkWSWKXS786xChF70VMp6vvqnbAst2PFd1P6bzvkr9MjXe/oHpVPvVaX94/sFsig2F5c
	kQP/weeH439dbg3eORuN75uTZwBNhIg+PDRATSzYXOVwC2iovsRk2t1HMCvNVrheU8mhdArcB+h+W
	mrTTCJwkTKmqco9nSPdoXiXeTHMyWBBthUFixGuRhuUb/qHWcuJKOLByOKdvQHk7o6Olf3UxUByI+
	WPYGU9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opYIo-00DCL4-Q2; Mon, 31 Oct 2022 17:10:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opYIm-00DCIn-7C
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 17:10:21 +0000
X-UUID: 80d2ca53c09e4a8ca9ac4497c2c9cbf7-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f5Y/njI4qNgjO+Lt3Iai2beqZSAc9SoasK098zh6e4Q=;
	b=V5+FVVNisGzXtMTO8N3MQcMMtmgQUJnAx7pRgbuqdGFBjelzpK0S8FpcD3duO2PGbL6uCeZzbIqxjlwaQa0+2HZ3s9mRFmGtUJiOwL7+Av2HVhHxBmksV9ctQnWHxaJgqtPe5G+3RKPFooVPJwdp1myMLmNaNfbGlbttQ6DhfKU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:d901da00-4998-430e-83a5-80bf565b9a40,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:3d782d81-3116-4fbc-b86b-83475c3df513,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 80d2ca53c09e4a8ca9ac4497c2c9cbf7-20221031
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1171069813; Mon, 31 Oct 2022 10:10:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 1 Nov 2022 00:40:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 00:40:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 02/10] wifi: mt76: connac: rework macros for unified command
Date: Tue, 1 Nov 2022 00:39:52 +0800
Message-ID: <20221031164000.17063-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221031164000.17063-1-shayne.chen@mediatek.com>
References: <20221031164000.17063-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_101020_284132_8FBC1C97 
X-CRM114-Status: UNSURE (   9.64  )
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

Rework some macros for connac3 unified command.
This is a preliminary patch to add mt7996 chipset support.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h   | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 8166722d4717..d3d5ba2d47ad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -63,7 +63,7 @@ struct mt76_connac2_mcu_txd {
 } __packed __aligned(4);
 
 /**
- * struct mt76_connac2_mcu_uni_txd - mcu command descriptor for firmware v3
+ * struct mt76_connac2_mcu_uni_txd - mcu command descriptor for connac2 and connac3
  * @txd: hardware descriptor
  * @len: total length not including txd
  * @cid: command identifier
@@ -1074,10 +1074,11 @@ enum {
 
 #define MCU_CMD_ACK				BIT(0)
 #define MCU_CMD_UNI				BIT(1)
-#define MCU_CMD_QUERY				BIT(2)
+#define MCU_CMD_SET				BIT(2)
 
 #define MCU_CMD_UNI_EXT_ACK			(MCU_CMD_ACK | MCU_CMD_UNI | \
-						 MCU_CMD_QUERY)
+						 MCU_CMD_SET)
+#define MCU_CMD_UNI_QUERY_ACK			(MCU_CMD_ACK | MCU_CMD_UNI)
 
 #define __MCU_CMD_FIELD_ID			GENMASK(7, 0)
 #define __MCU_CMD_FIELD_EXT_ID			GENMASK(15, 8)
@@ -1085,6 +1086,7 @@ enum {
 #define __MCU_CMD_FIELD_UNI			BIT(17)
 #define __MCU_CMD_FIELD_CE			BIT(18)
 #define __MCU_CMD_FIELD_WA			BIT(19)
+#define __MCU_CMD_FIELD_WM			BIT(20)
 
 #define MCU_CMD(_t)				FIELD_PREP(__MCU_CMD_FIELD_ID,		\
 							   MCU_CMD_##_t)
@@ -1106,6 +1108,16 @@ enum {
 						 FIELD_PREP(__MCU_CMD_FIELD_EXT_ID, \
 							    MCU_WA_PARAM_CMD_##_t))
 
+#define MCU_WM_UNI_CMD(_t)			(MCU_UNI_CMD(_t) |		\
+						 __MCU_CMD_FIELD_WM)
+#define MCU_WM_UNI_CMD_QUERY(_t)		(MCU_UNI_CMD(_t) |		\
+						 __MCU_CMD_FIELD_QUERY |	\
+						 __MCU_CMD_FIELD_WM)
+#define MCU_WA_UNI_CMD(_t)			(MCU_UNI_CMD(_t) |		\
+						 __MCU_CMD_FIELD_WA)
+#define MCU_WMWA_UNI_CMD(_t)			(MCU_WM_UNI_CMD(_t) |		\
+						 __MCU_CMD_FIELD_WA)
+
 enum {
 	MCU_EXT_CMD_EFUSE_ACCESS = 0x01,
 	MCU_EXT_CMD_RF_REG_ACCESS = 0x02,
-- 
2.25.1


