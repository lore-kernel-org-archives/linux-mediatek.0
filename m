Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153F9C27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyi0fRuKNHcwx0uipw9Xw1x1ZFruV+jFiu2FmEzSg9Q=; b=geL/WC4L6YOdOxR/yuRZJU4QzA
	I9n0yDaDuCvDnatBtI3cBNrmYT4tjZCBMNcHOpH2H4cMWKhvqwwopz3zcUsn6XpSQ2cFzvxZoIvVk
	byuql5EuuDTkA/aLYW1Peu5/lrJOTIEgJY1bI6G4M3S7Bx962QNYyDmTaWJ13VMFzVJr6J+vNIbdF
	k3hU5GtLEeECGK7a2tffSkkBve7NGzcxmTTzb5bmiD2GcrDCXy/96qfTNNAyUiwzfoduK/Pd0Tj/m
	8nYylcg82hV50ntr/XRKrZyjRLDGdNNzIH+nUTnaEDh2MIe+QdwFMr0DVADcgpO1TCyjthLRJGs45
	GMRnEqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQDi-00000006QST-26QU;
	Wed, 26 Jun 2024 10:49:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQCu-00000006Q2L-2XER;
	Wed, 26 Jun 2024 10:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fyi0fRuKNHcwx0uipw9Xw1x1ZFruV+jFiu2FmEzSg9Q=; b=B9iORFmuNmg94mgdYEhX7twp76
	H/KG+iLGLao+5O2rV7fJtIpV6VuB1qDkZzEHDI+08sr09mKlhWnbjUFGkx1chgyaQ0TbELB3aVidY
	j2NGab6rvSkP/fuXeA8TmLkKQfB9WQmLlF5OjCBqcnnocKszFHeJlTUIh6vBbsNKXAxV3PN7iBGjH
	ic2oo7ibgezEfJwbJkI8LzridbPeckQENTxrh4iOWP1itnJin1qiEdTs5fe/DGRmUlR3Tf7I8ZnPW
	xTA3G/6Vw9ksxK6N7jAnQC9Q9v0encCiTTd+cNYYzkEosbGmod3XbBuUUWZPMt7GxRpsERWGZK2gv
	JwlzanNA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQCn-00000008ZOW-0pzo;
	Wed, 26 Jun 2024 10:48:53 +0000
X-UUID: a638bd4033a911ef9daba96ee3f3cc8c-20240626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fyi0fRuKNHcwx0uipw9Xw1x1ZFruV+jFiu2FmEzSg9Q=;
	b=OMXCWjb9n5O5jIMQZHR1f4b+BDIY0d6c6+ua6YlLH1fyyoLWnmBd7HistFMsyG0w8FGhga/bPER/rBsq68Tc/j2jY70xIfI0ab5g+yqZrH1B1H9uDEet7bwWYv8LA0owzpMUZihCPOejf3Vlwtr6ea61HTU/pFbuH2vKUSL3BRU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:6effcd13-fea7-4ed1-a431-3c514e986287,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:67490c45-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a638bd4033a911ef9daba96ee3f3cc8c-20240626
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 252727106; Wed, 26 Jun 2024 03:48:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jun 2024 18:48:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jun 2024 18:48:07 +0800
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
Subject: [PATCH net-next v9 05/13] net: phy: mediatek: Integrate read/write page helper functions
Date: Wed, 26 Jun 2024 18:43:21 +0800
Message-ID: <20240626104329.11426-6-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240626104329.11426-1-SkyLake.Huang@mediatek.com>
References: <20240626104329.11426-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_114850_970095_26CE7895 
X-CRM114-Status: GOOD (  14.69  )
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

This patch integrates read/write page helper functions as MTK phy lib.
They are basically the same in mtk-ge.c & mtk-ge-soc.c.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c  | 18 ++++--------------
 drivers/net/phy/mediatek/mtk-ge.c      | 20 ++++++--------------
 drivers/net/phy/mediatek/mtk-phy-lib.c | 12 ++++++++++++
 drivers/net/phy/mediatek/mtk.h         |  3 +++
 4 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 970bf35..26c2183 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -275,16 +275,6 @@ struct mtk_socphy_shared {
 	struct mtk_socphy_priv	priv[4];
 };
 
-static int mtk_socphy_read_page(struct phy_device *phydev)
-{
-	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
-}
-
-static int mtk_socphy_write_page(struct phy_device *phydev, int page)
-{
-	return __phy_write(phydev, MTK_EXT_PAGE_ACCESS, page);
-}
-
 /* One calibration cycle consists of:
  * 1.Set DA_CALIN_FLAG high to start calibration. Keep it high
  *   until AD_CAL_COMP is ready to output calibration result.
@@ -1305,8 +1295,8 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.probe		= mt7981_phy_probe,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
-		.read_page	= mtk_socphy_read_page,
-		.write_page	= mtk_socphy_write_page,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 		.led_blink_set	= mt798x_phy_led_blink_set,
 		.led_brightness_set = mt798x_phy_led_brightness_set,
 		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
@@ -1322,8 +1312,8 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.probe		= mt7988_phy_probe,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
-		.read_page	= mtk_socphy_read_page,
-		.write_page	= mtk_socphy_write_page,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 		.led_blink_set	= mt798x_phy_led_blink_set,
 		.led_brightness_set = mt798x_phy_led_brightness_set,
 		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 54ea64a..9122899 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -3,6 +3,8 @@
 #include <linux/module.h>
 #include <linux/phy.h>
 
+#include "mtk.h"
+
 #define MTK_EXT_PAGE_ACCESS		0x1f
 #define MTK_PHY_PAGE_STANDARD		0x0000
 #define MTK_PHY_PAGE_EXTENDED		0x0001
@@ -11,16 +13,6 @@
 #define MTK_PHY_PAGE_EXTENDED_2A30	0x2a30
 #define MTK_PHY_PAGE_EXTENDED_52B5	0x52b5
 
-static int mtk_gephy_read_page(struct phy_device *phydev)
-{
-	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
-}
-
-static int mtk_gephy_write_page(struct phy_device *phydev, int page)
-{
-	return __phy_write(phydev, MTK_EXT_PAGE_ACCESS, page);
-}
-
 static void mtk_gephy_config_init(struct phy_device *phydev)
 {
 	/* Enable HW auto downshift */
@@ -77,8 +69,8 @@ static struct phy_driver mtk_gephy_driver[] = {
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
-		.read_page	= mtk_gephy_read_page,
-		.write_page	= mtk_gephy_write_page,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 	},
 	{
 		PHY_ID_MATCH_EXACT(0x03a29441),
@@ -91,8 +83,8 @@ static struct phy_driver mtk_gephy_driver[] = {
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
-		.read_page	= mtk_gephy_read_page,
-		.write_page	= mtk_gephy_write_page,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 	},
 };
 
diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 20796ae..e55a432 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -6,6 +6,18 @@
 
 #include "mtk.h"
 
+int mtk_phy_read_page(struct phy_device *phydev)
+{
+	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
+}
+EXPORT_SYMBOL_GPL(mtk_phy_read_page);
+
+int mtk_phy_write_page(struct phy_device *phydev, int page)
+{
+	return __phy_write(phydev, MTK_EXT_PAGE_ACCESS, page);
+}
+EXPORT_SYMBOL_GPL(mtk_phy_write_page);
+
 int mtk_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 				unsigned long rules,
 				unsigned long supported_triggers)
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 2fc89e3..5986aaa 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -62,6 +62,9 @@
 #define MTK_PHY_LED_STATE_FORCE_BLINK	1
 #define MTK_PHY_LED_STATE_NETDEV	2
 
+int mtk_phy_read_page(struct phy_device *phydev);
+int mtk_phy_write_page(struct phy_device *phydev, int page);
+
 int mtk_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 				unsigned long rules,
 				unsigned long supported_triggers);
-- 
2.18.0


