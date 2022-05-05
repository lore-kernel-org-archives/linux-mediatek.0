Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E56CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kcxOcS0Yb7wAxqQ9i6JkqqXMauyMPRXoY8DmzFgtelI=; b=aIorJbFE9guVn4
	eKG/Zq0mcHVCSqAnvWe4GOEG95z3I2o9gjGrfsrhNv0vOatuoepolU381QMVAiz3XUhimVMU/2QMf
	K5xWIqLiwrOMF5Mz5c4mVvlFHOUfp++b8RKiKCZIbiWWGyCAKm6KHtqazQ/p1D6foZiblFJxyOHgD
	8g4Kx2dwHpxzk/32pQj4DhzgSN8OJNMp6mB6rl8XRkWPvoB461OV1iVLXPm6zGaBFvVCE7uFO84cx
	wmul/TKZHuKo2kMj9xF/E8PaJMz3D/rWKvCj50st8CiqGzHTYwnADAnRe7189mqnNV2JdPhGOgSRt
	nkNNN/X/4e/R1itt2ISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWtc-00EiZY-6m; Thu, 05 May 2022 08:31:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWtZ-00EiWL-RZ
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 08:31:35 +0000
X-UUID: 88a2a7e1835d4d18ad1ba80fa6ce80f2-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8c1f1652-e149-4216-af6a-7334939ac934, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:7950abb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 88a2a7e1835d4d18ad1ba80fa6ce80f2-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chui-hao.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 409063777; Thu, 05 May 2022 01:31:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 01:25:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 5 May 2022 16:25:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 May 2022 16:25:56 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 1/4] mt76: mt7915: update mt7986 patch in
 mt7986_wmac_adie_patch_7976()
Date: Thu, 5 May 2022 16:25:51 +0800
Message-ID: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_013133_949107_43683EFD 
X-CRM114-Status: GOOD (  11.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update mt7976 adie patch for different adie version.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7915/soc.c   | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index bac76bc2770f..338dfbee0f93 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -797,6 +797,7 @@ enum offs_rev {
 
 /* ADIE */
 #define MT_ADIE_CHIP_ID			0x02c
+#define MT_ADIE_VERSION_MASK		GENMASK(15, 0)
 #define MT_ADIE_CHIP_ID_MASK		GENMASK(31, 16)
 #define MT_ADIE_IDX0			GENMASK(15, 0)
 #define MT_ADIE_IDX1			GENMASK(31, 16)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index 04e62d569599..c418b5dfda7f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -470,17 +470,32 @@ static int mt7986_wmac_adie_xtal_trim_7976(struct mt7915_dev *dev, u8 adie)
 
 static int mt7986_wmac_adie_patch_7976(struct mt7915_dev *dev, u8 adie)
 {
+	u32 id, version, rg_xo_01, rg_xo_03;
 	int ret;
 
+	ret = mt76_wmac_spi_read(dev, adie, MT_ADIE_CHIP_ID, &id);
+	if (ret)
+		return ret;
+
+	version = FIELD_GET(MT_ADIE_VERSION_MASK, id);
+
 	ret = mt76_wmac_spi_write(dev, adie, MT_ADIE_RG_TOP_THADC, 0x4a563b00);
 	if (ret)
 		return ret;
 
-	ret = mt76_wmac_spi_write(dev, adie, MT_ADIE_RG_XO_01, 0x1d59080f);
+	if (version == 0x8a00 || version == 0x8a10 || version == 0x8b00) {
+		rg_xo_01 = 0x1d59080f;
+		rg_xo_03 = 0x34c00fe0;
+	} else {
+		rg_xo_01 = 0x1959f80f;
+		rg_xo_03 = 0x34d00fe0;
+	}
+
+	ret = mt76_wmac_spi_write(dev, adie, MT_ADIE_RG_XO_01, rg_xo_01);
 	if (ret)
 		return ret;
 
-	return mt76_wmac_spi_write(dev, adie, MT_ADIE_RG_XO_03, 0x34c00fe0);
+	return mt76_wmac_spi_write(dev, adie, MT_ADIE_RG_XO_03, rg_xo_03);
 }
 
 static int
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
