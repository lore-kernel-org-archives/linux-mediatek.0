Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC497C4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 07:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA6LYzpY1mbWRHVhVWlgLNvJwKLoJmdyJB5RWUv+vaw=; b=KkheFKTuAqfKzgepEd8Zp5kDS5
	XQhTzfZxSLPkAIUd3/cro4DPqicKeo8a/X91/VRxpBy7kDt3dRcG/MV1xDUjWyz0nWuKbzFjJM+JT
	tNDLwSgRy425gtMZTSWR44D6T8fX2L8TxHxhZjwoNrIjjh9/ychH5OwWbD7xrh9Yp1VFA58GsxggH
	94k4yYaQPxqsF4grE9tRvLXGRxVA/B4lbFQ+qEFS+TnCcWyd3F9TwUSZjMiLtZzXsGStYGisqFGaK
	OWIsRZAev55ZmcNrAxGyjHEakof5ESXXFaky/pMuou9NBYke5D/0HjzOxGzZFhAMs4d8MBtRnOscp
	JYy+wfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2R3M-00DQ0s-2x;
	Mon, 13 Nov 2023 07:08:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2R3J-00DPze-2A
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 07:08:11 +0000
X-UUID: 62e7185681f311ee86758d4a7c00f3a0-20231113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NA6LYzpY1mbWRHVhVWlgLNvJwKLoJmdyJB5RWUv+vaw=;
	b=FprsBy44mX7qlXKF/r+vxlINNZ+n+wjKfm/kBEiedgWEJihRoBYPHAoHt4uBXAnUWSBFZKB4U45iHjL2zPONXZCvUuBlp5KvQPL9opNtYWE/t0MKHOEz1bRMBz5tN4Idymc9QdQt9F2WmyZx28XpoLRom7s4zyU0lI4ATSNbfPc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:c61dfb94-fbf1-46e1-bb27-d0ec430a7375,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:364b77b,CLOUDID:0ad65295-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 62e7185681f311ee86758d4a7c00f3a0-20231113
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1204388684; Mon, 13 Nov 2023 00:08:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 13 Nov 2023 15:07:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 13 Nov 2023 15:07:27 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 5/8] wifi: mt76: mt7996: support mt7992 eeprom loading
Date: Mon, 13 Nov 2023 15:06:16 +0800
Message-ID: <20231113070619.19964-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231113070619.19964-1-shayne.chen@mediatek.com>
References: <20231113070619.19964-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_230809_717812_B79ADA83 
X-CRM114-Status: GOOD (  12.10  )
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

Add the default eeprom and 0x7992 check to mt7996_check_eeprom().
This is a preliminary patch for mt7992 chipsets support.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/eeprom.c    | 15 ++++++++++++---
 .../net/wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 9db7e531076d..9c3735bed50c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -12,9 +12,12 @@ static int mt7996_check_eeprom(struct mt7996_dev *dev)
 	u8 *eeprom = dev->mt76.eeprom.data;
 	u16 val = get_unaligned_le16(eeprom);
 
+#define CHECK_EEPROM_ERR(match)	(match ? 0 : -EINVAL)
 	switch (val) {
 	case 0x7990:
-		return 0;
+		return CHECK_EEPROM_ERR(is_mt7996(&dev->mt76));
+	case 0x7992:
+		return CHECK_EEPROM_ERR(is_mt7992(&dev->mt76));
 	default:
 		return -EINVAL;
 	}
@@ -22,8 +25,14 @@ static int mt7996_check_eeprom(struct mt7996_dev *dev)
 
 static char *mt7996_eeprom_name(struct mt7996_dev *dev)
 {
-	/* reserve for future variants */
-	return MT7996_EEPROM_DEFAULT;
+	switch (mt76_chip(&dev->mt76)) {
+	case 0x7990:
+		return MT7996_EEPROM_DEFAULT;
+	case 0x7992:
+		return MT7992_EEPROM_DEFAULT;
+	default:
+		return MT7996_EEPROM_DEFAULT;
+	}
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 87822663870f..5cdde28ce83f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -39,6 +39,7 @@
 #define MT7992_ROM_PATCH		"mediatek/mt7996/mt7992_rom_patch.bin"
 
 #define MT7996_EEPROM_DEFAULT		"mediatek/mt7996/mt7996_eeprom.bin"
+#define MT7992_EEPROM_DEFAULT		"mediatek/mt7996/mt7992_eeprom.bin"
 #define MT7996_EEPROM_SIZE		7680
 #define MT7996_EEPROM_BLOCK_SIZE	16
 #define MT7996_TOKEN_SIZE		16384
-- 
2.39.2


