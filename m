Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4989C001E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ybu9C7FLKv1YFdvWsjqZeEsvZBRRJlTzLuHC2rmE1vA=; b=ZsJknYu949NQe4HHG0Yjcp3a8b
	967FQsl8uv6WLMVaLQCQKUnZwjBKJWqrM+Zt3A3TIrIC6Y03OUUSSQaAHAd5unuE2Z3de47wTkmTV
	n9Qhg+QXJUfWvHpfdOtLcy3N5CR1qXw97DSCPm14eLoyc/mNHaJfPb8W9HbZHECJGSqQdv8bBQ91Q
	Acv/a4Hjg+dL6ZLoU5xxdiQtjCj73ekIxVM60JUkXNKMR84VcVORO+2/4rusyK2y3mn4A6fSs+ZER
	Cjjh4JZ0ebtP+GG0bawtbAKYaTubYhqjTWm6hunJSPFklTqCdfWW0sgtjMlijJX0EkBotr1Z6Duzu
	R8lcrOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRq-002bdZ-35;
	Tue, 01 Aug 2023 14:34:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRl-002bY6-2Z
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:34:04 +0000
X-UUID: 70dc6348307811ee83ed1395ce914268-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ybu9C7FLKv1YFdvWsjqZeEsvZBRRJlTzLuHC2rmE1vA=;
	b=uw34l8rTyuAOVp0gtaW9e+YTFsHzJELInnmH3oXKFvOcQRi97fOafN8W2QvjuOfi7Usdeq28OiceyQ5Z3K0Um7hqSpW5DNeWw5BpHox3DWlN86x4wtUPzFVWDVYFb7FpLiP8hOW0kmtg+Glk7kNgDprsksMeUa3F04ZrQcxnKs0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:a363f082-1e5a-4476-9170-841930239036,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:628c91d2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 70dc6348307811ee83ed1395ce914268-20230801
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1069052618; Tue, 01 Aug 2023 07:33:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 22:33:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 22:33:52 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 7/8] wifi: mt76: connac: add more unified command IDs
Date: Tue, 1 Aug 2023 22:30:31 +0800
Message-ID: <1945af12c3c1c6077e29f47879d5bc7c672e8134.1690863143.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1690863143.git.deren.wu@mediatek.com>
References: <cover.1690863143.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073401_879105_D6B410A1 
X-CRM114-Status: UNSURE (   9.42  )
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

This is the preliminary patch for mt7925 support.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index ed70bde1428b..6ab86b1925f5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -796,6 +796,7 @@ enum {
 	STA_REC_PHY = 0x15,
 	STA_REC_HE_6G = 0x17,
 	STA_REC_HE_V2 = 0x19,
+	STA_REC_MLD = 0x20,
 	STA_REC_EHT = 0x22,
 	STA_REC_HDRT = 0x28,
 	STA_REC_HDR_TRANS = 0x2B,
@@ -1212,12 +1213,17 @@ enum {
 	MCU_UNI_CMD_RX_HDR_TRANS = 0x12,
 	MCU_UNI_CMD_SER = 0x13,
 	MCU_UNI_CMD_TWT = 0x14,
+	MCU_UNI_CMD_SET_DOMAIN_INFO = 0x15,
+	MCU_UNI_CMD_SCAN_REQ = 0x16,
 	MCU_UNI_CMD_RDD_CTRL = 0x19,
 	MCU_UNI_CMD_GET_MIB_INFO = 0x22,
+	MCU_UNI_CMD_GET_STAT_INFO = 0x23,
 	MCU_UNI_CMD_SNIFFER = 0x24,
 	MCU_UNI_CMD_SR = 0x25,
 	MCU_UNI_CMD_ROC = 0x27,
+	MCU_UNI_CMD_SET_DBDC_PARMS = 0x28,
 	MCU_UNI_CMD_TXPOWER = 0x2b,
+	MCU_UNI_CMD_SET_POWER_LIMIT = 0x2c,
 	MCU_UNI_CMD_EFUSE_CTRL = 0x2d,
 	MCU_UNI_CMD_RA = 0x2f,
 	MCU_UNI_CMD_MURU = 0x31,
@@ -1296,6 +1302,7 @@ enum {
 	UNI_BSS_INFO_IFS_TIME = 23,
 	UNI_BSS_INFO_OFFLOAD = 25,
 	UNI_BSS_INFO_MLD = 26,
+	UNI_BSS_INFO_PM_DISABLE = 27,
 };
 
 enum {
-- 
2.18.0


