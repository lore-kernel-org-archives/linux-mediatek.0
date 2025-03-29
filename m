Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A7EC36016
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Mar 2025 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+fL1ilVxm4dyNoa1NaBE6Dc7bEVWGR1AuCK9fl1KVU=; b=0NUbrheKxN0KPXSU9lC0M+8dbt
	hQbFefLU7HDN+ioJsAVENvOtmK21zGeKC/hG8GCFs2Z69cI1ZpHgsTpMyJwq9yPDcRuC7XmZKXU2F
	fHfIW5jPMPl17Vo5m6D9DvBosaoR583MiKly4/eemJOIQVYGRkJ5z+RzixPzVIxFXJYRo7NcCwWyn
	XjdS8nHdcsRn6m7JCR04vL1ccsZBM/Mo/lFfux07NfMc6u22fLJp5Kiz4nG+EIGT1EtjAUqn34tkO
	Ur8A2B0UOFgWJJcKwz5o841IHyLa0TRiu3b8Gt70A2XQTOIal/K6N4VyU6DbH3C08EiOsb5uZcPb0
	wgKN5mhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyYPX-0000000FHje-2WGm;
	Sat, 29 Mar 2025 15:47:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyYPT-0000000FHdW-0u1f
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Mar 2025 15:47:49 +0000
X-UUID: 2529b9bc0cb511f083f2a1c9db70dae0-20250329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O+fL1ilVxm4dyNoa1NaBE6Dc7bEVWGR1AuCK9fl1KVU=;
	b=CljryTMT/btDZcteo3BVLVZmMU2Ybh6lXsKWP7Tw9lscEEGtSo06HJi/LzvKwe5K0OS9EiJM1kDOsA2PfZJGOUDlmNSfhVOhxnUDfaVJ8wSqXajyLCOap4BjuZgo5oz++YQ/WkU97uaTwzgFlv0wp4gaT51f3glqaDzRN/V2klo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:1f919ebd-a3a7-402e-b460-987116fb5eb6,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:88ecfa8c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2529b9bc0cb511f083f2a1c9db70dae0-20250329
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 416759831; Sat, 29 Mar 2025 08:47:40 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 29 Mar 2025 23:47:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 29 Mar 2025 23:47:37 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76-next v2 03/10] wifi: mt76: mt7996: rework WA mcu command for mt7990
Date: Sat, 29 Mar 2025 23:47:23 +0800
Message-ID: <20250329154731.2113551-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250329154731.2113551-1-shayne.chen@mediatek.com>
References: <20250329154731.2113551-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_084747_299656_012AE204 
X-CRM114-Status: GOOD (  13.65  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Since mt7990 lacks WA firmware, some WA commands are not supported or
need to be refactored to use the SDO command.
This is a preliminary patch to support mt7990 chipset.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  2 +
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 50 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  6 +++
 3 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 43237e518373..8226b975f7e6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1065,6 +1065,7 @@ enum {
 	MCU_UNI_EVENT_WED_RRO = 0x57,
 	MCU_UNI_EVENT_PER_STA_INFO = 0x6d,
 	MCU_UNI_EVENT_ALL_STA_INFO = 0x6e,
+	MCU_UNI_EVENT_SDO = 0x83,
 };
 
 #define MCU_UNI_CMD_EVENT			BIT(1)
@@ -1297,6 +1298,7 @@ enum {
 	MCU_UNI_CMD_PER_STA_INFO = 0x6d,
 	MCU_UNI_CMD_ALL_STA_INFO = 0x6e,
 	MCU_UNI_CMD_ASSERT_DUMP = 0x6f,
+	MCU_UNI_CMD_SDO = 0x88,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 1d12ccbacbcf..8f97315ef0ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -338,8 +338,12 @@ mt7996_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 int mt7996_mcu_wa_cmd(struct mt7996_dev *dev, int cmd, u32 a1, u32 a2, u32 a3)
 {
 	struct {
+		u8 _rsv[4];
+
+		__le16 tag;
+		__le16 len;
 		__le32 args[3];
-	} req = {
+	} __packed req = {
 		.args = {
 			cpu_to_le32(a1),
 			cpu_to_le32(a2),
@@ -347,7 +351,16 @@ int mt7996_mcu_wa_cmd(struct mt7996_dev *dev, int cmd, u32 a1, u32 a2, u32 a3)
 		},
 	};
 
-	return mt76_mcu_send_msg(&dev->mt76, cmd, &req, sizeof(req), false);
+	if (mt7996_has_wa(dev))
+		return mt76_mcu_send_msg(&dev->mt76, cmd, &req.args,
+					 sizeof(req.args), false);
+
+	req.tag = cpu_to_le16(cmd == MCU_WA_PARAM_CMD(QUERY) ? UNI_CMD_SDO_QUERY :
+							       UNI_CMD_SDO_SET);
+	req.len = cpu_to_le16(sizeof(req) - 4);
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_WA_UNI_CMD(SDO), &req,
+				 sizeof(req), true);
 }
 
 static void
@@ -3223,13 +3236,15 @@ int mt7996_mcu_init_firmware(struct mt7996_dev *dev)
 	if (ret)
 		return ret;
 
-	ret = mt7996_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, 0);
-	if (ret)
-		return ret;
+	if (mt7996_has_wa(dev)) {
+		ret = mt7996_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, 0);
+		if (ret)
+			return ret;
 
-	ret = mt7996_mcu_set_mwds(dev, 1);
-	if (ret)
-		return ret;
+		ret = mt7996_mcu_set_mwds(dev, 1);
+		if (ret)
+			return ret;
+	}
 
 	ret = mt7996_mcu_init_rx_airtime(dev);
 	if (ret)
@@ -4749,7 +4764,26 @@ int mt7996_mcu_cp_support(struct mt7996_dev *dev, u8 mode)
 	    mode > mt76_connac_lmac_mapping(IEEE80211_AC_VO))
 		return -EINVAL;
 
+	if (!mt7996_has_wa(dev)) {
+		struct {
+			u8 _rsv[4];
+
+			__le16 tag;
+			__le16 len;
+			u8 cp_mode;
+			u8 rsv[3];
+		} __packed req = {
+			.tag = cpu_to_le16(UNI_CMD_SDO_CP_MODE),
+			.len = cpu_to_le16(sizeof(req) - 4),
+			.cp_mode = mode,
+		};
+
+		return mt76_mcu_send_msg(&dev->mt76, MCU_WA_UNI_CMD(SDO),
+					 &req, sizeof(req), true);
+	}
+
 	cp_mode = cpu_to_le32(mode);
+
 	return mt76_mcu_send_msg(&dev->mt76, MCU_WA_EXT_CMD(CP_SUPPORT),
 				 &cp_mode, sizeof(cp_mode), true);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 2ab6a53bee86..8ef7d4baee90 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -937,6 +937,12 @@ enum {
 	UNI_CMD_SER_TRIGGER
 };
 
+enum {
+	UNI_CMD_SDO_SET = 1,
+	UNI_CMD_SDO_QUERY,
+	UNI_CMD_SDO_CP_MODE = 6,
+};
+
 enum {
 	MT7996_SEC_MODE_PLAIN,
 	MT7996_SEC_MODE_AES,
-- 
2.39.2


