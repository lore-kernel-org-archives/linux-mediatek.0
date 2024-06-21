Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A27BC27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ho6xCrD2lSX/taMibZlSm4+S+GOP9pQr5GcmafIlMGw=; b=Z8GuGZg2GIordSngDuta1lcgqN
	8R384/6YPYwHjnRojwbiO3en6e1Sj2C2tWueIkDKAjwPaYwo95SSVGR1Fido1W73aYvW0Pw5UlIhK
	ZotHRCL+OsZm+UUD5x0FsCsnj9CCG8usSO25VQfT3q5gQDJ2Q+TKXL0VE9P9/QLh7D1uUpOEgogwp
	hJZyF2EeWVz05mZNW4OzijgHEG2ofFF4x10yCG4+6cTlIewSYsSycK7aUpuRLCVNbh+V7sPLYE468
	mFm1P/8Dh/FFPPvZ6yAw8UsvLb5mcStgIW+tZFFg4yxDWdMWeHFgBm/1BVjM8O8ZPpJkKHvpPMNjU
	biIdZXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdR0-000000098wk-47PI;
	Fri, 21 Jun 2024 12:32:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdQz-000000098vc-14fQ;
	Fri, 21 Jun 2024 12:32:06 +0000
X-UUID: 4211040e2fca11efb2966dae1f787272-20240621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ho6xCrD2lSX/taMibZlSm4+S+GOP9pQr5GcmafIlMGw=;
	b=D1/pLC5I2XL+Kx+gurBjUfW+wJ9Uhj3hex9JUkWMb/br5IOyTwbesHVHMjrM0HmuEC5EmtkpQzPwm6G9qoFKI7yTMy/6OPkfXAR18F+HejsouK/xBO7LP5nqleQKpdkUjiv+zjbEJfs1EEf1MWghK7hXbkef9rcGJRysubcBf74=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:307a6166-fda6-4e7c-9b6e-09171438fefd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:393d96e,CLOUDID:fcf85f85-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4211040e2fca11efb2966dae1f787272-20240621
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1282181877; Fri, 21 Jun 2024 05:32:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 21 Jun 2024 20:21:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 21 Jun 2024 20:21:58 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v8 02/13] net: phy: mediatek: Fix spelling errors and rearrange variables
Date: Fri, 21 Jun 2024 20:20:34 +0800
Message-ID: <20240621122045.30732-3-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_053205_314263_D42145C3 
X-CRM114-Status: GOOD (  14.25  )
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

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

This patch fixes spelling errors which comes from mediatek-ge-soc.c and
rearrange variables with reverse Xmas tree order.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index f4f9412..0eb5395 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -408,16 +408,17 @@ static int tx_offset_cal_efuse(struct phy_device *phydev, u32 *buf)
 
 static int tx_amp_fill_result(struct phy_device *phydev, u16 *buf)
 {
-	int i;
-	int bias[16] = {};
-	const int vals_9461[16] = { 7, 1, 4, 7,
-				    7, 1, 4, 7,
-				    7, 1, 4, 7,
-				    7, 1, 4, 7 };
 	const int vals_9481[16] = { 10, 6, 6, 10,
 				    10, 6, 6, 10,
 				    10, 6, 6, 10,
 				    10, 6, 6, 10 };
+	const int vals_9461[16] = { 7, 1, 4, 7,
+				    7, 1, 4, 7,
+				    7, 1, 4, 7,
+				    7, 1, 4, 7 };
+	int bias[16] = {};
+	int i;
+
 	switch (phydev->drv->phy_id) {
 	case MTK_GPHY_ID_MT7981:
 		/* We add some calibration to efuse values
@@ -1069,10 +1070,10 @@ static int start_cal(struct phy_device *phydev, enum CAL_ITEM cal_item,
 
 static int mt798x_phy_calibration(struct phy_device *phydev)
 {
+	struct nvmem_cell *cell;
 	int ret = 0;
-	u32 *buf;
 	size_t len;
-	struct nvmem_cell *cell;
+	u32 *buf;
 
 	cell = nvmem_cell_get(&phydev->mdio.dev, "phy-cal-data");
 	if (IS_ERR(cell)) {
@@ -1415,7 +1416,7 @@ static int mt7988_phy_probe_shared(struct phy_device *phydev)
 	 * LED_C and LED_D respectively. At the same time those pins are used to
 	 * bootstrap configuration of the reference clock source (LED_A),
 	 * DRAM DDRx16b x2/x1 (LED_B) and boot device (LED_C, LED_D).
-	 * In practise this is done using a LED and a resistor pulling the pin
+	 * In practice this is done using a LED and a resistor pulling the pin
 	 * either to GND or to VIO.
 	 * The detected value at boot time is accessible at run-time using the
 	 * TPBANK0 register located in the gpio base of the pinctrl, in order
-- 
2.34.1


