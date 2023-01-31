Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C24C636D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31KkzywwTmUQf0/Odsorzo/YRX0yoJi5ZUuJlSr+odE=; b=LPU/yMIiQqXpnOrTLLC8PNF2id
	21uhRawwFdM7Bcq8g37alJ5mGiKAsN9QOPCNf39pdtOyR/2gWPnZjTIbOphlUEFcf+uph5bKxqFbr
	kEqhhD3XQwhN1NhwtI4ibPSgVOBHKTL5WsoN6SXUCyF1zoNdiMAyjLFMx9/IQj8Zp7OLhccpa5YKT
	f9xUBon8R15+W4QHXF6ojRGW9YtUIHlfD8ilKCzGyhiDYqVmHTnQVsvBu8K/evlMn7J3TTp68PPXG
	eOd8itDDy4vK47jeJz36980QylRiRyVKbmtWfPAKFreCmkhKUgvwBRcG7QL/QPRMANbRMDWWGXDPD
	uSqW/H+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnsO-007PEI-D2; Tue, 31 Jan 2023 10:28:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnDo-0077WH-KP
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 09:46:40 +0000
X-UUID: 242d2a16a14c11edbbe3f76fe852e059-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=31KkzywwTmUQf0/Odsorzo/YRX0yoJi5ZUuJlSr+odE=;
	b=gWwKQUURspsfjsrnnz47qFLQTlRfQA8hCeIBohxMV+jsSuJUD4c6bkxSBMvr4p4npzoUYviuufUEBXcbiFXWUYjvetlOjIUb6mXI5Z1XQEa8XHWlcqV9VHHIAzMYhFGGFsAuzEpGyqDQ0KmdX24Lpr2EYE//iGgjl9l8s2BCTLg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:6f5d298c-29e2-4d5d-8d99-451ff61baad8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:5e75758d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 242d2a16a14c11edbbe3f76fe852e059-20230131
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 514886889; Tue, 31 Jan 2023 02:46:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 31 Jan 2023 17:36:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 17:36:28 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 01/13] wifi: mt76: add EHT phy type
Date: Tue, 31 Jan 2023 17:35:59 +0800
Message-ID: <20230131093611.30914-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230131093611.30914-1-shayne.chen@mediatek.com>
References: <20230131093611.30914-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_014636_736586_0AA1B2B2 
X-CRM114-Status: GOOD (  11.16  )
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

Extend phy type and phymode bitfields for EHT support.
This is the preliminary patch to add EHT support for mt7996.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h            | 7 +++++--
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 4 ++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 48dc4236f8f8..8d05eee92099 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -264,11 +264,14 @@ enum mt76_phy_type {
 	MT_PHY_TYPE_HE_EXT_SU,
 	MT_PHY_TYPE_HE_TB,
 	MT_PHY_TYPE_HE_MU,
-	__MT_PHY_TYPE_HE_MAX,
+	MT_PHY_TYPE_EHT_SU = 13,
+	MT_PHY_TYPE_EHT_TRIG,
+	MT_PHY_TYPE_EHT_MU,
+	__MT_PHY_TYPE_MAX,
 };
 
 struct mt76_sta_stats {
-	u64 tx_mode[__MT_PHY_TYPE_HE_MAX];
+	u64 tx_mode[__MT_PHY_TYPE_MAX];
 	u64 tx_bw[4];		/* 20, 40, 80, 160 */
 	u64 tx_nss[4];		/* 1, 2, 3, 4 */
 	u64 tx_mcs[16];		/* mcs idx */
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index bb92216741a3..ebd64bec9f68 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -882,12 +882,16 @@ enum {
 #define PHY_MODE_AX_5G				BIT(7)
 
 #define PHY_MODE_AX_6G				BIT(0) /* phymode_ext */
+#define PHY_MODE_BE_24G				BIT(1)
+#define PHY_MODE_BE_5G				BIT(2)
+#define PHY_MODE_BE_6G				BIT(3)
 
 #define MODE_CCK				BIT(0)
 #define MODE_OFDM				BIT(1)
 #define MODE_HT					BIT(2)
 #define MODE_VHT				BIT(3)
 #define MODE_HE					BIT(4)
+#define MODE_EHT				BIT(5)
 
 #define STA_CAP_WMM				BIT(0)
 #define STA_CAP_SGI_20				BIT(4)
-- 
2.25.1


