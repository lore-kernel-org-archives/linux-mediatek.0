Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C6BC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 04:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CEFy1qbPMKhRCzNmvFm4G8Rvipph7pcm6woE+Ng3Gf0=; b=z3h/LkZUwSfHD5Oswq9YoDeZUI
	W3LEq6Tx6DtPA0Z177OG0QKYfEMXIJI9YuYy6ihPTue/su38doMwlVpkfROvaqMCm23fsItIrwA/u
	moBOFZtRg3ypJEGMt5U6F0wW21Ek6/iGbJOQVUbtTEhd3VYCb4rWVDoAscpbnFfIgK54eP057Zd74
	UIIvsRNPTL0KBk56YyypGiegQLqz13vWXFDH883INWURcPN+euQT9yIy+i48mIgGf5IQouAUJmbzQ
	FVUVJDMVQ4xbA5ovtZF4m0nvM7SrBM43fYjT5N3zDvLDkLCSB9jYoH9Xtx6tvJql53TKwY2ANPfXR
	G9bQYpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p62ST-00Cmhm-VE; Fri, 16 Dec 2022 04:36:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p62SR-00Cmh4-6V
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 04:36:28 +0000
X-UUID: 1dba7017480b422f91bf3f0c2e08533c-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CEFy1qbPMKhRCzNmvFm4G8Rvipph7pcm6woE+Ng3Gf0=;
	b=FTyHs8qJ0L0xP7BicEkCTXawX6AWSMhgHsapZ90AWpEhxRJav7eveI7uedhgoxhV5MsxZuoeGo7Thuu+VGC6gIGMIG7qYvDdwcMRvSwViC9hE06DwIeFUuOnw2e/1tvOpqQpTkmD1jajU6hEe8Zb+O4rWibO9z7KhsK5QzwThUU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e460eec2-c1e8-42e4-9c6e-7af5a69dcd3e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:5dbbc2b4-d2e2-434d-b6d3-aeae88dfcc78,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1dba7017480b422f91bf3f0c2e08533c-20221215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 209766818; Thu, 15 Dec 2022 21:36:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Dec 2022 12:05:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Dec 2022 12:05:47 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7915: add chip id condition in mt7915_check_eeprom()
Date: Fri, 16 Dec 2022 12:05:31 +0800
Message-ID: <20221216040531.3736-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_203627_269124_6B3D78B9 
X-CRM114-Status: GOOD (  12.87  )
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
v2:
  - use switch case and add a macro to convert return value
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 24efa280dd86..a79628933948 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -33,11 +33,14 @@ static int mt7915_check_eeprom(struct mt7915_dev *dev)
 	u8 *eeprom = dev->mt76.eeprom.data;
 	u16 val = get_unaligned_le16(eeprom);
 
+#define CHECK_EEPROM_ERR(match)	(match ? 0 : -EINVAL)
 	switch (val) {
 	case 0x7915:
+		return CHECK_EEPROM_ERR(is_mt7915(&dev->mt76));
 	case 0x7916:
+		return CHECK_EEPROM_ERR(is_mt7916(&dev->mt76));
 	case 0x7986:
-		return 0;
+		return CHECK_EEPROM_ERR(is_mt7986(&dev->mt76));
 	default:
 		return -EINVAL;
 	}
-- 
2.25.1


