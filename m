Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C768FA3743
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kn5ON56E+2GGeTfZAHdKpdblBG6mvoErQSTcFC+fO0g=; b=oa8nuMDBERotoH4ZQ7bOpwtO0M
	w4/2hqoWqipu6Ivjk4AuFlBRLzr+XSRZVcnuNb+smuRP4oyFo8mn8RGXzp+oCNDBnJPRD5GrwBnZJ
	YUoYUcDi2uB7a+gLvnHD6ma80pk6EYP3/WeVUCfF2oKdrcjl8Qkhcs/2IhuKeE+l2A/QlBP1aMg/R
	HDd6QiPDhZ8xYAMvGsc8J3DwOx958Wl97cSND/92Ym0WboY7I6XCX+eVdb25tOQRgVJnGO+En3vsf
	d2wiUymayC41kc+buvLmnQQkmHt19Jz987WbZVvMpdD6xpo3FKb17WNTa1oY4UZwa9Ik/JM2DhlwJ
	JpGqAQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXpr-00D3Ga-09; Mon, 31 Oct 2022 16:40:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXpo-00D3CZ-1m
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 16:40:25 +0000
X-UUID: b00aee851c824528a2f81734dc6620d9-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Kn5ON56E+2GGeTfZAHdKpdblBG6mvoErQSTcFC+fO0g=;
	b=irmIwhzlSIuDPdSt7VnuNfjqJjNm1KDtqxQc3PVAOCahaNKlwmaXKq90uYWjEruSVRZfpGYwPK201ZmPelSOPnznHjaDXBFAVhqO7T/GlX2/Ara0PRLqf/J3zVhBATkagDUxc6PHaz5QWcJXrQYMiaJXzD2sGE/VQD/IguH39LU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:907e0245-cff9-419f-885a-6e9cdc21d790,IP:0,U
	RL:0,TC:0,Content:26,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:26
X-CID-META: VersionHash:62cd327,CLOUDID:2c152d81-3116-4fbc-b86b-83475c3df513,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b00aee851c824528a2f81734dc6620d9-20221031
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1908662261; Mon, 31 Oct 2022 09:40:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 1 Nov 2022 00:40:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 00:40:12 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 07/10] wifi: mt76: connac: add more bss info command tags
Date: Tue, 1 Nov 2022 00:39:57 +0800
Message-ID: <20221031164000.17063-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221031164000.17063-1-shayne.chen@mediatek.com>
References: <20221031164000.17063-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_094024_157300_B1CE622E 
X-CRM114-Status: UNSURE (   8.53  )
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

Add bss info tags which will be used in new chipset.
This is a preliminary patch to add mt7996 chipset support.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 909b2ba67c11..ed1d24822c37 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1255,14 +1255,23 @@ enum {
 
 enum {
 	UNI_BSS_INFO_BASIC = 0,
+	UNI_BSS_INFO_RA = 1,
 	UNI_BSS_INFO_RLM = 2,
 	UNI_BSS_INFO_BSS_COLOR = 4,
 	UNI_BSS_INFO_HE_BASIC = 5,
 	UNI_BSS_INFO_BCN_CONTENT = 7,
+	UNI_BSS_INFO_BCN_CSA = 8,
+	UNI_BSS_INFO_BCN_BCC = 9,
+	UNI_BSS_INFO_BCN_MBSSID = 10,
+	UNI_BSS_INFO_RATE = 11,
 	UNI_BSS_INFO_QBSS = 15,
+	UNI_BSS_INFO_SEC = 16,
+	UNI_BSS_INFO_TXCMD = 18,
 	UNI_BSS_INFO_UAPSD = 19,
 	UNI_BSS_INFO_PS = 21,
 	UNI_BSS_INFO_BCNFT = 22,
+	UNI_BSS_INFO_OFFLOAD = 25,
+	UNI_BSS_INFO_MLD = 26,
 };
 
 enum {
-- 
2.25.1


