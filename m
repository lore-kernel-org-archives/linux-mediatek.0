Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135C3C79FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R1y+GM/mCucEyMK20un1qpMmaGRve3ZYZM7wCNj6itM=; b=sGPGIOKTFoxkvXdYLo3GruBUH5
	WBFmcgmS1VqMYnS0gpB4JaswhdOfdccU9oJftopIcJGsJWOrRBhW1kMgZd/DHm3Fea7SB+WqsVk0t
	8dOqVPiBmBETXuAP5wPLgAgDcCA5YMq42JaUA0o1d+HwVynJTYyaovrtv1psRBdOoiPWjgtL1gT48
	JW7n5O66/XMoD6Rf7otl1Xaw+rGhfaQcl1v5rv7WJ7ExPQOLMtRoXu5hfFWe4+2YfPOQNdKPVHWpR
	ax1paaklTI5msMXDJvhxTE01J8Wt0jjOtmzJJEG8NE1HlNBjWX1/jNcNPuspErgfbSMRwN7pTYP9G
	zQgypL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b5p-0000000DswN-0EhD;
	Thu, 10 Sep 2026 09:29:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b5n-0000000DsvV-40eT
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 09:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=R1y+GM/mCucEyMK20un1qpMmaGRve3ZYZM7wCNj6itM=; b=UU6aZnEndlVCNmOqzuu/D9mfJh
	lqw4rWKQ78H7FRk03Dy+te0fYN5Ky1dApRCM+H7ceQcTKV0Cl3FOQX84DiNCf8VQQujwInJocSh5M
	IkW+raJ60905eZL9IY+HVYHW7jIIAOk5W6FYXNZebJ2bt0Cu7hNfip/oFvIzB7Eq/F+lqI47n6td4
	S5/9GRK6s+Eesd7woddrbiviKT5mgVRGr0sMAkKYejGaJWp5zNmXuvyYvWi7UXj1wsJzvURhYNQz0
	FoDhx3MN4aAc8Z8++ahgP5z4Hg7aTZHrk/5MNaK1YG2hEkrh/0zTjB13m3PsRMjLquHZE9FAifK6V
	5JS9vNfw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4b5j-00000002GKc-3Vzb
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 09:29:14 +0000
X-UUID: 0d4447b8acfa11f1acbe4559397dec65-20260910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=R1y+GM/mCucEyMK20un1qpMmaGRve3ZYZM7wCNj6itM=;
	b=S4m9vfegu4EB3JvdiAcwqxgYOMliqybDRAKUEpOS1BrKwCt2n2NuJXGHTrN2j81W1GNNlC93fgs073xHgBYcn+uqXyvTBRlOpw3WeG1yWKH314KQnpuqS8MAivdNeZRjjvPw0UU5ZN9oYtWpreWNdVNoZy63WnAFFmVMPXCGihI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:475993ba-0d84-4f2e-a639-d36d56779a43,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:c444a8e2-72a5-4ba1-af40-18bbd6ea8ffd,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0d4447b8acfa11f1acbe4559397dec65-20260910
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1899451627; Thu, 10 Sep 2026 02:28:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 10 Sep 2026 17:28:56 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 10 Sep 2026 17:28:56 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7922: only check CLC hw encap type on MT7922
Date: Thu, 10 Sep 2026 17:28:55 +0800
Message-ID: <20260910092855.1689679-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_102912_668028_B3CB550C 
X-CRM114-Status: GOOD (  11.90  )
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

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

The hw type encap field in the CLC header is only populated on MT7922.
On other chips the EEPROM MT_EE_HW_TYPE read is skipped, leaving
hw_encap as 0, so the POWER and REGD entries are compared against a
bogus value and dropped, leaving those CLC tables empty.

Read MT_EE_HW_TYPE and run the header sanity check only on MT7922, and
accept the CLC entries as-is on the other chips.

Fixes: 31bc74e462b1 ("wifi: mt76: mt7921: add CLC regulatory domain support")

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/mcu.c    | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index c6af7f00ca59..0092a90eb7fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -423,7 +423,7 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	if (!mt7921_regd_clc_supported(dev))
 		return 0;
 
-	if (mt76_is_mmio(&dev->mt76)) {
+	if (is_mt7922(&dev->mt76) && mt76_is_mmio(&dev->mt76)) {
 		ret = mt7921_mcu_read_eeprom(dev, MT_EE_HW_TYPE, &hw_encap);
 		if (ret)
 			return ret;
@@ -471,14 +471,16 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 		if (phy->clc[clc->idx])
 			continue;
 
-		/* header content sanity */
-		if (clc->idx == MT7921_CLC_POWER &&
-		    u8_get_bits(clc->type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
-			continue;
+		/* header content sanity, only MT7922 encodes hw type in CLC */
+		if (is_mt7922(&dev->mt76)) {
+			if (clc->idx == MT7921_CLC_POWER &&
+			    u8_get_bits(clc->type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
+				continue;
 
-		if (clc->idx == MT7921_CLC_REGD &&
-		    u8_get_bits(clc->type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
-			continue;
+			if (clc->idx == MT7921_CLC_REGD &&
+			    u8_get_bits(clc->type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
+				continue;
+		}
 
 		phy->clc[clc->idx] = devm_kmemdup(mdev->dev, clc,
 						  le32_to_cpu(clc->len),
-- 
2.18.0


