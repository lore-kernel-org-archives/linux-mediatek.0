Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081E9FED2FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 09:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGW1Q3DcXuGPmdrKZkdMgEGTb3Lki1aiU/Y6FbqrF6k=; b=Twyhl6I1ePzzs6ItfKyCosskDn
	aRB2Kh4jkpUrstVTNtISloAfe6TW/oXo/Fo13mPvTXqtn8a4K7lDumU/6fVCpM847jwR3ip2dvomf
	S5MhEvygeTgudItlErU7aSzGOiIGo7cERjBEqnCEbVwBeKYSsR6siEUUptb1xtgW+nV0tvmk1Ae0X
	K+dKq805iloahx/shI7u95MkaBs4NHoDGe7ciSU0nQp5tTeRYHqP4TYcqgPSVMaY5AuORFJlQ0e0x
	yNyPiSLY85M9L6GSe32Tt63lORNOj8H/yy/TaxzAWBTKffy2xsDCoK+nR/fS1NMXW3fjZa9sKCujD
	3N0KyA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cod-0000000Dobx-2dxQ;
	Thu, 12 Mar 2026 09:58:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0coY-0000000DoYV-01i8
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 09:58:47 +0000
X-UUID: 0acdad921dfa11f1a6de359d7043e138-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LGW1Q3DcXuGPmdrKZkdMgEGTb3Lki1aiU/Y6FbqrF6k=;
	b=OqefKu2jQ08eqv8/FNRQr6IQ8MHha+3xKmf92yx7vnYUS7h19kUn48Yh0WI5YJDYhdmG5C16GkD5XXt2WIm0nv5xLVmvlEX5StQk3ige1WE8IMX+DARyXLx4MGwSqp+DGh8WDr6sfvbP6S3Fzz6b5DMPck1FAQeCYpRBiuMDBaY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0df085b2-6a52-498f-a3a9-bf662361b9f7,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:679784eb-3b42-43ec-801b-62c7b12ba70e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0acdad921dfa11f1a6de359d7043e138-20260312
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1987493620; Thu, 12 Mar 2026 02:58:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Mar 2026 17:58:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Mar 2026 17:58:36 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 5/6] wifi: mt76: mt7996: fix the temporary buffer for calibration-free data
Date: Thu, 12 Mar 2026 17:57:23 +0800
Message-ID: <20260312095724.2117448-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260312095724.2117448-1-shayne.chen@mediatek.com>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_025846_083775_F64AFEED 
X-CRM114-Status: GOOD (  10.41  )
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

Move the declaration of buf[] outside the for loop.

Fixes: 224c7c2be578 ("wifi: mt76: mt7996: apply calibration-free data from OTP")
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 2a9c59d15894..4c733f51a03e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4104,6 +4104,7 @@ mt7996_mcu_get_cal_free_data(struct mt7996_dev *dev)
 	}
 
 	for (band = 0; band < __MT_MAX_BAND; band++) {
+		u8 buf[MT7996_EEPROM_BLOCK_SIZE];
 		const struct cal_free_data *cal;
 		u16 prev_block_idx = -1;
 		u16 adie_base;
@@ -4126,13 +4127,13 @@ mt7996_mcu_get_cal_free_data(struct mt7996_dev *dev)
 			u16 eep_offset = cal[i].eep_offs;
 			u16 block_idx = adie_offset / MT7996_EEPROM_BLOCK_SIZE;
 			u16 offset = adie_offset % MT7996_EEPROM_BLOCK_SIZE;
-			u8 buf[MT7996_EEPROM_BLOCK_SIZE];
 
 			if (is_mt7996(&dev->mt76) && band == MT_BAND1 &&
 			    dev->var.type == MT7996_VAR_TYPE_444)
 				eep_offset -= MT_EE_7977BN_OFFSET;
 
 			if (prev_block_idx != block_idx) {
+				memset(buf, 0, sizeof(buf));
 				ret = mt7996_mcu_get_eeprom(dev, adie_offset, buf,
 							    MT7996_EEPROM_BLOCK_SIZE,
 							    EEPROM_MODE_EFUSE);
-- 
2.51.0


