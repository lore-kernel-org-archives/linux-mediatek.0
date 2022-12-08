Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D463DC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+76gdjb4ml67Jkqt4RrOnjZf/kZrAJbshFGU/r7BGa0=; b=bx6faYuazL3RsS8YNkJ5sHBpMn
	JrNAiCFBgNP3uRQwyRa8aG/Rd+gek3LiNMnHoT5TIXxrmnchZJ+WntAPVcRvyYNbslNR+YKPpekmx
	TQuLq4R+7FcAgINWUx6Hz316N4omDeFtLgtBshHcRtb4U5fRH9qzrGnOW0DwMk/iGYmvEp1ajRWkr
	GgF1t8uS1Knkux5+PZ59KGrIv4OTHsXViTI3xuD2Mc2rZbmGD9ZLnxlYtCKx2QP6ubuFmsdUab8fR
	o5TGtl+G6M81V50zp9N5hbh+fNAbTMsxua61s25tKgxJ9PDSdGTLhMtR9lBTCeiv1vBR2DSV9QaLz
	6Fpb8L1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3JfY-0055n2-HL; Thu, 08 Dec 2022 16:22:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3JfV-0055l6-Ol
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 16:22:43 +0000
X-UUID: 72e9771ea9954e8f828f6dd3704b9341-20221208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+76gdjb4ml67Jkqt4RrOnjZf/kZrAJbshFGU/r7BGa0=;
	b=PpvkmZRXeSXSTMf7x0jMxeHBnL8ac7yUvzIs1cOHRNZ9f2Tn285LIbSceWp9PoBDyWjN/b6v+1Q35peSxSIS+snKH5ovp+PwW9At7MT1i5abzypSUjavFDa3H8Jte02ArsY373U0HD3Y1vHaBOXDKMt2JlnkRAv5kzBulIH6yyw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:8349ac99-96fb-4d80-81e7-76df3e7c5b30,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:3840b624-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 72e9771ea9954e8f828f6dd3704b9341-20221208
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1689756105; Thu, 08 Dec 2022 09:22:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 9 Dec 2022 00:01:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 9 Dec 2022 00:01:52 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: add chip id condition in mt7915_check_eeprom()
Date: Fri, 9 Dec 2022 00:01:37 +0800
Message-ID: <20221208160137.3855-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_082241_836170_DE6E60E3 
X-CRM114-Status: GOOD (  10.58  )
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

When flash mode is enabled, and the eeprom data in the flash is not for
the current chipset, it'll still be checked valid, and the default
eeprom bin won't be loaded.
(e.g., mt7915 NIC inserted with mt7916 eeprom data in the flash.)

Fix this kind of case by adding chip id into consideration in
mt7915_check_eeprom().

Reported-by: Cheng-Ji Li <cheng-ji.li@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 59069fb86414..e21aa03c85b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -33,14 +33,12 @@ static int mt7915_check_eeprom(struct mt7915_dev *dev)
 	u8 *eeprom = dev->mt76.eeprom.data;
 	u16 val = get_unaligned_le16(eeprom);
 
-	switch (val) {
-	case 0x7915:
-	case 0x7916:
-	case 0x7986:
+	if ((is_mt7915(&dev->mt76) && val == 0x7915) ||
+	    (is_mt7916(&dev->mt76) && val == 0x7916) ||
+	    (is_mt7986(&dev->mt76) && val == 0x7986))
 		return 0;
-	default:
-		return -EINVAL;
-	}
+
+	return -EINVAL;
 }
 
 static char *mt7915_eeprom_name(struct mt7915_dev *dev)
-- 
2.25.1


