Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317E5EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 07:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGHtdpSUNUDyjMIFfafiis6/Zc8Lw3Xy/RPktQszF7A=; b=OUc3TpwzUpcROjqWBgMJIWmqlG
	qbYpH/1z+mDi+Ud5eCQ2XTYVTaHurkK1WOY9+ZUzr8mxvW6LwzoSK42b+ylE2vKbsW5Ye62JfcyRN
	DvetMFtypXY5tn1C5+V+onJEPel0Bd+Vuymv2yKiN5B2233GMLluu7zfpK59J+S++6JhWSQ64Gw4Y
	qpdnkBhNKeKpbodacFCSGnMG2HixT3ITSiq4AfgOODGwzmluu872MebDCvw11ZAvu5jlR5qzfmdaH
	UyrJUJhMSASDGItix56ZhHdCMGVl5QPQazHU0owwFRJ1GSRY+W7eYjkG/14kN8bdkB3jNGMyUeb+0
	L8Zn5k2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPH1-00F1HF-0T;
	Wed, 28 Jun 2023 07:07:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPGy-00F1Dv-0a
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 07:07:29 +0000
X-UUID: 69f02788158211ee912e1518a6540028-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DGHtdpSUNUDyjMIFfafiis6/Zc8Lw3Xy/RPktQszF7A=;
	b=ITnebdL7cmjWxDMMGkQKv/QtBbm9YyC7Gbxar6Ywf/kLFLvt6d8c4wLayvaTaV7RduCFKSpysKauuz1coCaE9QFTEzKfpyBE2JNw2GpA+wJyyWTONo6yAWeC7zQHsJICMnb7ZHyNDd3/VFmvIyikYtWTZJXNpC7XqL0P5U5LZDY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:58412fc7-8520-4f9e-bd81-c7b1ba89898b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.27,REQID:58412fc7-8520-4f9e-bd81-c7b1ba89898b,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:01c9525,CLOUDID:89694f0d-26a8-467f-b838-f99719a9c083,B
	ulkID:230628150716P39NL0UG,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 69f02788158211ee912e1518a6540028-20230628
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2003848200; Wed, 28 Jun 2023 00:07:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Jun 2023 15:07:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Jun 2023 15:07:13 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 02/16] wifi: mt76: mt7921: convert acpisar and clc pointers to void
Date: Wed, 28 Jun 2023 15:05:48 +0800
Message-ID: <57707f32913ae0c3870153110f28d01c4f28ce80.1687919628.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1687919628.git.deren.wu@mediatek.com>
References: <cover.1687919628.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_000728_222589_93F406FE 
X-CRM114-Status: GOOD (  12.40  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

Convert acpisar and clc pointers in mt7921_dev structure to void.
This is a preliminary patch to add WiFi7 chipset support

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c | 5 +++--
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h   | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c
index 48dd0decac5d..6feea2e515b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c
@@ -308,6 +308,7 @@ int mt7921_init_acpi_sar_power(struct mt7921_phy *phy, bool set_default)
 
 u8 mt7921_acpi_get_flags(struct mt7921_phy *phy)
 {
+	struct mt7921_acpi_sar *acpisar = phy->acpisar;
 	struct mt7921_asar_fg *fg;
 	struct {
 		u8 acpi_idx;
@@ -319,10 +320,10 @@ u8 mt7921_acpi_get_flags(struct mt7921_phy *phy)
 	u8 flags = BIT(0);
 	int i, j;
 
-	if (!phy->acpisar)
+	if (!acpisar)
 		return 0;
 
-	fg = phy->acpisar->fg;
+	fg = acpisar->fg;
 	if (!fg)
 		return flags;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index ec9879650174..2e29a6bda7ad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -222,10 +222,9 @@ struct mt7921_phy {
 	struct sk_buff_head scan_event_list;
 	struct delayed_work scan_work;
 #ifdef CONFIG_ACPI
-	struct mt7921_acpi_sar *acpisar;
+	void *acpisar;
 #endif
-
-	struct mt7921_clc *clc[MT7921_CLC_MAX_NUM];
+	void *clc[MT7921_CLC_MAX_NUM];
 
 	struct work_struct roc_work;
 	struct timer_list roc_timer;
-- 
2.18.0


