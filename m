Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBA0C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 12:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BArojeuc6ZABXT8GU1gmnCESjUrYq5AJBYqSnPQMpiU=; b=t0zXSs8lNXvveXi97beCyyBeDQ
	nRSF58tygBVMwh2xeJvpRKtLhZHmrmLaFM9xjEA877lNwDSrdyhOK3ZQl+vqloaMXB6g/6n3aMDHz
	ZVIs0085GXoPpOlVcX0qbiPkoRjMSbXvkiqQMW/3xK857lyy90IHhLWfd8dOm8UyyfM3p70szbApI
	vQQQLgeDMKsBpkEcKJNFUz8l/PgTW2PA8Bjt6EvCJ38atEeixetJOYDpPQyekVlSI98+arIWOwnOm
	HH9ftdK5t05evnu+vKwyLQYkzFIhdtKPv9XKH/qDjzXN2nuVu0HV9pp/dC+5oa2J4J35Iu4GooADt
	F0FnDPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdNx-000000098Eb-21g1;
	Fri, 21 Jun 2024 12:28:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdNt-000000098Cm-3JvD;
	Fri, 21 Jun 2024 12:28:55 +0000
X-UUID: d03ae6d82fc911ef9daba96ee3f3cc8c-20240621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BArojeuc6ZABXT8GU1gmnCESjUrYq5AJBYqSnPQMpiU=;
	b=u8Xj0vQze0+7w0pbGRU4ArMwwVMyM358Zuf2I678yoCw5VugpC/GxLgOksybCpYYc/w4QSN6llQdzW9WXD+9rvm/Hz+CpW7ow7EQ6SltzWrYAgBRmHbN4ZlUMMYMP4jUiT1NyTwZEV3MP4+F/D4r7SmREFBebaqPefUVp7/nVNg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:02c7830a-3733-4093-a103-af145e26d375,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:fff35f85-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d03ae6d82fc911ef9daba96ee3f3cc8c-20240621
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1828595165; Fri, 21 Jun 2024 05:28:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 21 Jun 2024 20:28:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 21 Jun 2024 20:28:46 +0800
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
Subject: [PATCH net-next v8 12/13] net: phy: mediatek: Fix alignment in callback functions' hook
Date: Fri, 21 Jun 2024 20:20:44 +0800
Message-ID: <20240621122045.30732-13-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.513200-8.000000
X-TMASE-MatchedRID: SboKb0hq3KSfB+yEZJpNeG3NvezwBrVm9QWksVxouuavloAnGr4qhimL
	DHOqINZ3GqTtGcghBlUSn72ENNjlb3rAhMQyuycqA9lly13c/gHt/okBLaEo+H5h6y4KCSJcmDU
	U4w5Ch9Hpu8xihWWE0fRfF4y0FsYkCNWeV68n9OieAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8ifEz
	J5hPndGcgvr6cKs+ZUzYvO7ppst7zlWKhjQXUfw49NbtbzzqIBRCrET9ptiJdg/VpGjlIE0HVP2
	nJe0qPuUKzouUUgHsABCcd6HX1EVXmVKZusLp922v9OjYWA2uMMswg45VMfPadst5iAforfVlxr
	1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.513200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 527E7227CF591BD178886F3154AA1E9D2B2E5AF2556E1342B673C971633338322000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_052853_867081_0710EDF7 
X-CRM114-Status: GOOD (  11.26  )
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

Align declarations in mtk_gephy_driver(mtk-ge.c) and
mtk_socphy_driver(mtk-ge-soc.c). At first, some of them are
".foo<tab>= method_foo", and others are ".bar<space>= method_bar".
Use space instead for all of them here in case line is longer than
80 chars.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 40 +++++++++++++--------------
 drivers/net/phy/mediatek/mtk-ge.c     | 34 +++++++++++------------
 2 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 59c815e..fc33729 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1399,17 +1399,17 @@ static int mt7981_phy_probe(struct phy_device *phydev)
 static struct phy_driver mtk_socphy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981),
-		.name		= "MediaTek MT7981 PHY",
-		.config_init	= mt798x_phy_config_init,
-		.read_status	= mtk_gphy_cl22_read_status,
-		.config_intr	= genphy_no_config_intr,
+		.name = "MediaTek MT7981 PHY",
+		.config_init = mt798x_phy_config_init,
+		.read_status = mtk_gphy_cl22_read_status,
+		.config_intr = genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
-		.probe		= mt7981_phy_probe,
-		.suspend	= genphy_suspend,
-		.resume		= genphy_resume,
-		.read_page	= mtk_phy_read_page,
-		.write_page	= mtk_phy_write_page,
-		.led_blink_set	= mt798x_phy_led_blink_set,
+		.probe = mt7981_phy_probe,
+		.suspend = genphy_suspend,
+		.resume = genphy_resume,
+		.read_page = mtk_phy_read_page,
+		.write_page = mtk_phy_write_page,
+		.led_blink_set = mt798x_phy_led_blink_set,
 		.led_brightness_set = mt798x_phy_led_brightness_set,
 		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
 		.led_hw_control_set = mt798x_phy_led_hw_control_set,
@@ -1417,17 +1417,17 @@ static struct phy_driver mtk_socphy_driver[] = {
 	},
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988),
-		.name		= "MediaTek MT7988 PHY",
-		.config_init	= mt798x_phy_config_init,
-		.read_status	= mtk_gphy_cl22_read_status,
-		.config_intr	= genphy_no_config_intr,
+		.name = "MediaTek MT7988 PHY",
+		.config_init = mt798x_phy_config_init,
+		.read_status = mtk_gphy_cl22_read_status,
+		.config_intr = genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
-		.probe		= mt7988_phy_probe,
-		.suspend	= genphy_suspend,
-		.resume		= genphy_resume,
-		.read_page	= mtk_phy_read_page,
-		.write_page	= mtk_phy_write_page,
-		.led_blink_set	= mt798x_phy_led_blink_set,
+		.probe = mt7988_phy_probe,
+		.suspend = genphy_suspend,
+		.resume = genphy_resume,
+		.read_page = mtk_phy_read_page,
+		.write_page = mtk_phy_write_page,
+		.led_blink_set = mt798x_phy_led_blink_set,
 		.led_brightness_set = mt798x_phy_led_brightness_set,
 		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
 		.led_hw_control_set = mt798x_phy_led_hw_control_set,
diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index ea85c94..07b5b22 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -198,35 +198,35 @@ static int mt753x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 static struct phy_driver mtk_gephy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
-		.name		= "MediaTek MT7530 PHY",
-		.config_init	= mt7530_phy_config_init,
+		.name = "MediaTek MT7530 PHY",
+		.config_init = mt7530_phy_config_init,
 		/* Interrupts are handled by the switch, not the PHY
 		 * itself.
 		 */
-		.config_intr	= genphy_no_config_intr,
+		.config_intr = genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
-		.suspend	= genphy_suspend,
-		.resume		= genphy_resume,
-		.read_page	= mtk_phy_read_page,
-		.write_page	= mtk_phy_write_page,
+		.suspend = genphy_suspend,
+		.resume = genphy_resume,
+		.read_page = mtk_phy_read_page,
+		.write_page = mtk_phy_write_page,
 		.led_hw_is_supported = mt753x_phy_led_hw_is_supported,
 	},
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7531),
-		.name		= "MediaTek MT7531 PHY",
-		.probe		= mt7531_phy_probe,
-		.config_init	= mt7531_phy_config_init,
-		.read_status	= mtk_gphy_cl22_read_status,
+		.name = "MediaTek MT7531 PHY",
+		.probe = mt7531_phy_probe,
+		.config_init = mt7531_phy_config_init,
+		.read_status = mtk_gphy_cl22_read_status,
 		/* Interrupts are handled by the switch, not the PHY
 		 * itself.
 		 */
-		.config_intr	= genphy_no_config_intr,
+		.config_intr = genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
-		.suspend	= genphy_suspend,
-		.resume		= genphy_resume,
-		.read_page	= mtk_phy_read_page,
-		.write_page	= mtk_phy_write_page,
-		.led_blink_set	= mt753x_phy_led_blink_set,
+		.suspend = genphy_suspend,
+		.resume = genphy_resume,
+		.read_page = mtk_phy_read_page,
+		.write_page = mtk_phy_write_page,
+		.led_blink_set = mt753x_phy_led_blink_set,
 		.led_brightness_set = mt753x_phy_led_brightness_set,
 		.led_hw_is_supported = mt753x_phy_led_hw_is_supported,
 		.led_hw_control_set = mt753x_phy_led_hw_control_set,
-- 
2.34.1


