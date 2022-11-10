Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463DFC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBCva3G+06WUJe/qtm7fbPHRrGmZg1th2u2GfqaNd1E=; b=cyqAFot6f06wPahIxxvfXqwwSx
	CsVkP8t+kdlYtZ58NU3Zwpg2xmQlc32ohyUhXzkIYYdHhYtg/fDO+9bD53LeajBX4PuMTe7jVaE+2
	IqYIN9KmLdlv8b/ramoXBrPPpXv42AgUCQ3o9izv+EmC7D6aKKoZ6GcgQb5iARWEcusOizj+Hys7S
	ILdVnBS77vOlN2rSuPusCTRK7mjW+L1wz5BK71QlcuBq8lfJpGnjT/WdF3N6ZS6sg/iZwC1nzE2/P
	Sd8u5gseFCLohMC+2DYwPBz6kwzjBRB6A/XFwSsych26S2uvwZpCawjZPx6Uzly2abOfFSO10R8Ko
	T1iKDxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3zd-004gjA-Dq; Thu, 10 Nov 2022 09:37:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3za-004ggc-79
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 09:37:03 +0000
X-UUID: de1724186953483c8975904c6e9cd25f-20221110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nBCva3G+06WUJe/qtm7fbPHRrGmZg1th2u2GfqaNd1E=;
	b=OX8AD3+x/BEJMKmKSIDk1U5+jW40r4mpw9ervgzO1K02IWRICzj/xi1aMlGECmbrh5WJseDSVdgGOrdZAupqgslopqz5Wd7bwEnKrQV5DZ9fezesKeJSuDC/DJNU49i8BbzLBvRMpZnxmNB5Nv4QoC/Ag5JQ51iRka0duJR+mpU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:5e35bc36-1c30-4b33-91cd-97d6a0e5e6f3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:d652e950-b7af-492d-8b40-b1032f90ce11,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: de1724186953483c8975904c6e9cd25f-20221110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1290415164; Thu, 10 Nov 2022 02:36:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 10 Nov 2022 17:36:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 10 Nov 2022 17:36:51 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 4/9] wifi: mt76: connac: add more unified command IDs
Date: Thu, 10 Nov 2022 17:35:20 +0800
Message-ID: <20221110093525.29649-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221110093525.29649-1-shayne.chen@mediatek.com>
References: <20221110093525.29649-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_013702_588967_6A918792 
X-CRM114-Status: UNSURE (   8.56  )
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

Add more unified command IDs which will be used in new chipset.
This is the preliminary patch for mt7996 support.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 9cca73df6644..f8f974f36554 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1172,10 +1172,32 @@ enum {
 	MCU_UNI_CMD_DEV_INFO_UPDATE = 0x01,
 	MCU_UNI_CMD_BSS_INFO_UPDATE = 0x02,
 	MCU_UNI_CMD_STA_REC_UPDATE = 0x03,
+	MCU_UNI_CMD_EDCA_UPDATE = 0x04,
 	MCU_UNI_CMD_SUSPEND = 0x05,
 	MCU_UNI_CMD_OFFLOAD = 0x06,
 	MCU_UNI_CMD_HIF_CTRL = 0x07,
+	MCU_UNI_CMD_BAND_CONFIG = 0x08,
+	MCU_UNI_CMD_REPT_MUAR = 0x09,
+	MCU_UNI_CMD_WSYS_CONFIG = 0x0b,
+	MCU_UNI_CMD_REG_ACCESS = 0x0d,
+	MCU_UNI_CMD_POWER_CREL = 0x0f,
+	MCU_UNI_CMD_RX_HDR_TRANS = 0x12,
+	MCU_UNI_CMD_SER = 0x13,
+	MCU_UNI_CMD_TWT = 0x14,
+	MCU_UNI_CMD_RDD_CTRL = 0x19,
+	MCU_UNI_CMD_GET_MIB_INFO = 0x22,
 	MCU_UNI_CMD_SNIFFER = 0x24,
+	MCU_UNI_CMD_SR = 0x25,
+	MCU_UNI_CMD_TXPOWER = 0x2b,
+	MCU_UNI_CMD_EFUSE_CTRL = 0x2d,
+	MCU_UNI_CMD_RA = 0x2f,
+	MCU_UNI_CMD_MURU = 0x31,
+	MCU_UNI_CMD_BF = 0x33,
+	MCU_UNI_CMD_CHANNEL_SWITCH = 0x34,
+	MCU_UNI_CMD_THERMAL = 0x35,
+	MCU_UNI_CMD_VOW = 0x37,
+	MCU_UNI_CMD_RRO = 0x57,
+	MCU_UNI_CMD_OFFCH_SCAN_CTRL = 0x58,
 };
 
 enum {
-- 
2.25.1


