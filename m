Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4EEC30659
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phTI1cend3i/PpdMndi4FJcefhQ2y/eLmgoM58F1GfY=; b=xLz2lcbQRFpgTDgJw2DxeWSoFu
	DoOBR1gJ6yQVGP4CVhOFJUEXMDUXbxvJ9Y7OpW//GHfXcWl71Jd9FHQO5/e9ITjRFKRh9hf7k6/NK
	rkIBql6tpkdBT5xYQOzpQX3nY/X1rAlBUgg3NMXf5j8WY8tWEuK2d36mE/wehchSyfw5TLjEKOXAN
	vaaPYa8dMipEuiCOEzOZB6g5hD0KfkO03TZjiCsN4v8NIdgkOw05bUJpcGuxUwJrCpM2J3XZhmFu3
	6linUeEu+17riOlOJCSvYuBBF+VzsWM1FlLREKe74TCLgJkBgcKlRTGRxsmqg4o4Ro+hClWpVGfjM
	vsxD9HVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQFg-00000006RQh-1jCL;
	Wed, 26 Jun 2024 10:51:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQFM-00000006RLd-0ynd;
	Wed, 26 Jun 2024 10:51:29 +0000
X-UUID: 071cf23e33aa11ef9daba96ee3f3cc8c-20240626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=phTI1cend3i/PpdMndi4FJcefhQ2y/eLmgoM58F1GfY=;
	b=rEsJvITWvCGAzUGDF5z1TZUQAQfOgzuWJJE82A85L7GRY7+qPRfUitWZdjK6Dk4Opi7s/TuEF3ncUhNCWo5FpGBwlJtgXnTKWViUpAJV7sNUsJTEphGgBPBf/+JduApMTcqkO7ll2EHXvZ96IVbph9vbDv9KLj4AGELFuyMa86c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:ef77cf60-2bbe-4d8f-a37b-8e89230162ee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:5e168f85-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 071cf23e33aa11ef9daba96ee3f3cc8c-20240626
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1729540213; Wed, 26 Jun 2024 03:51:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jun 2024 18:50:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jun 2024 18:50:49 +0800
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
Subject: [PATCH net-next v9 10/13] net: phy: mediatek: Extend 1G TX/RX link pulse time
Date: Wed, 26 Jun 2024 18:43:26 +0800
Message-ID: <20240626104329.11426-11-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240626104329.11426-1-SkyLake.Huang@mediatek.com>
References: <20240626104329.11426-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_035128_334083_6520BEFF 
X-CRM114-Status: GOOD (  20.71  )
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

We observe that some 10G devices' (mostly Marvell's chips inside) 1G
training time violates specification, which may last 2230ms and affect
later TX/RX link pulse time. This will invalidate MediaTek series
gigabit Ethernet PHYs' hardware auto downshift mechanism.

Without this patch, if someone is trying to use "4-wire" cable to
connect above devices, MediaTek' gigabit Ethernet PHYs may fail
to downshift to 100Mbps. (If partner 10G devices' downshift mechanism
stops at 1G)

This patch extends our 1G TX/RX link pulse time so that we can still
link up with those 10G devices.

Tested device:
- Netgear GS110EMX's 10G port (Marvell 88X3340P)
- QNAP QSW-M408-4C

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c  |  2 +
 drivers/net/phy/mediatek/mtk-ge.c      |  5 +-
 drivers/net/phy/mediatek/mtk-phy-lib.c | 92 ++++++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk.h         | 21 ++++++
 4 files changed, 116 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 71d29de..5b2c7a0 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1396,6 +1396,7 @@ static struct phy_driver mtk_socphy_driver[] = {
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981),
 		.name		= "MediaTek MT7981 PHY",
 		.config_init	= mt798x_phy_config_init,
+		.read_status	= mtk_gphy_cl22_read_status,
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
 		.probe		= mt7981_phy_probe,
@@ -1413,6 +1414,7 @@ static struct phy_driver mtk_socphy_driver[] = {
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988),
 		.name		= "MediaTek MT7988 PHY",
 		.config_init	= mt798x_phy_config_init,
+		.read_status	= mtk_gphy_cl22_read_status,
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
 		.probe		= mt7988_phy_probe,
diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 8532f75..3bd8664 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -8,10 +8,6 @@
 #define MTK_GPHY_ID_MT7530		0x03a29412
 #define MTK_GPHY_ID_MT7531		0x03a29441
 
-#define MTK_PHY_PAGE_EXTENDED_1			0x0001
-#define MTK_PHY_AUX_CTRL_AND_STATUS		0x14
-#define   MTK_PHY_ENABLE_DOWNSHIFT		BIT(4)
-
 #define MTK_PHY_PAGE_EXTENDED_2			0x0002
 #define MTK_PHY_PAGE_EXTENDED_3			0x0003
 #define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG11	0x11
@@ -214,6 +210,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 		.name		= "MediaTek MT7531 PHY",
 		.probe		= mt7531_phy_probe,
 		.config_init	= mt7531_phy_config_init,
+		.read_status	= mtk_gphy_cl22_read_status,
 		/* Interrupts are handled by the switch, not the PHY
 		 * itself.
 		 */
diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 32520af..6bd12fd 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -109,6 +109,98 @@ int mtk_phy_write_page(struct phy_device *phydev, int page)
 }
 EXPORT_SYMBOL_GPL(mtk_phy_write_page);
 
+/* This function deals with the case that 1G AN starts but isn't completed. We
+ * set AN_NEW_LP_CNT_LIMIT with different values time after time to let our
+ * 1G->100Mbps hardware automatic downshift to fit more partner devices.
+ */
+static int extend_an_new_lp_cnt_limit(struct phy_device *phydev)
+{
+	int mmd_read_ret;
+	u32 reg_val;
+	int timeout;
+
+	/* According to table 28-9 & Figure 28-18 in IEEE 802.3,
+	 * link_fail_inhibit_timer of 10/100/1000 Mbps devices ranges from 750
+	 * to "1000ms". Once MTK_PHY_FINAL_SPEED_1000 is set, it means that we
+	 * enter "FLP LINK GOOD CHECK" state, link_fail_inhibit_timer starts and
+	 * this PHY's 1G training starts. If 1G training never starts, we do
+	 * nothing but leave.
+	 */
+	timeout = read_poll_timeout(mmd_read_ret = phy_read_mmd, reg_val,
+				    (mmd_read_ret < 0) ||
+				    reg_val & MTK_PHY_FINAL_SPEED_1000,
+				    10000, 1000000, false, phydev,
+				    MDIO_MMD_VEND1, MTK_PHY_LINK_STATUS_MISC);
+	if (mmd_read_ret < 0)
+		return mmd_read_ret;
+
+	if (!timeout) {
+		/* Once we found MTK_PHY_FINAL_SPEED_1000 is set, no matter 1G
+		 * AN is completed or not, we'll set AN_NEW_LP_CNT_LIMIT again
+		 * and again.
+		 */
+		mtk_tr_modify(phydev, 0x0, 0xf, 0x3c, AN_NEW_LP_CNT_LIMIT_MASK,
+			      FIELD_PREP(AN_NEW_LP_CNT_LIMIT_MASK, 0xf));
+		mdelay(1500);
+
+		timeout = read_poll_timeout(mtk_tr_read, reg_val,
+					    (reg_val & AN_STATE_MASK) !=
+					    (AN_STATE_TX_DISABLE <<
+					     AN_STATE_SHIFT),
+					    10000, 1000000, false, phydev,
+					    0x0, 0xf, 0x2);
+		if (!timeout) {
+			mdelay(625);
+			mtk_tr_modify(phydev, 0x0, 0xf, 0x3c,
+				      AN_NEW_LP_CNT_LIMIT_MASK,
+				      FIELD_PREP(AN_NEW_LP_CNT_LIMIT_MASK,
+						 0x8));
+			mdelay(500);
+			mtk_tr_modify(phydev, 0x0, 0xf, 0x3c,
+				      AN_NEW_LP_CNT_LIMIT_MASK,
+				      FIELD_PREP(AN_NEW_LP_CNT_LIMIT_MASK,
+						 0xf));
+		} else {
+			return -ETIMEDOUT;
+		}
+	}
+
+	return 0;
+}
+
+int mtk_gphy_cl22_read_status(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = genphy_read_status(phydev);
+	if (ret)
+		return ret;
+
+	if (phydev->autoneg == AUTONEG_ENABLE && !phydev->autoneg_complete) {
+		ret = phy_read_paged(phydev, MTK_PHY_PAGE_EXTENDED_1,
+				     MTK_PHY_AUX_CTRL_AND_STATUS);
+		if (ret < 0)
+			return ret;
+
+		/* Once LP_DETECTED is set, it means that"ability_match" in
+		 * IEEE 802.3 Figure 28-18 is set. This happens after we plug in
+		 * cable. Also, LP_DETECTED will be cleared after AN complete.
+		 */
+		if (!FIELD_GET(MTK_PHY_LP_DETECTED_MASK, ret))
+			return 0;
+
+		ret = phy_read(phydev, MII_CTRL1000);
+		if (ret & (ADVERTISE_1000FULL | ADVERTISE_1000HALF)) {
+			ret = extend_an_new_lp_cnt_limit(phydev);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_gphy_cl22_read_status);
+
 int mtk_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 				unsigned long rules,
 				unsigned long supported_triggers)
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 8c0acea..7bcb137 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -10,8 +10,28 @@
 
 #define MTK_EXT_PAGE_ACCESS			0x1f
 #define MTK_PHY_PAGE_STANDARD			0x0000
+#define MTK_PHY_PAGE_EXTENDED_1			0x0001
+#define MTK_PHY_AUX_CTRL_AND_STATUS		0x14
+/* suprv_media_select_RefClk */
+#define   MTK_PHY_LP_DETECTED_MASK		GENMASK(7, 6)
+#define   MTK_PHY_ENABLE_DOWNSHIFT		BIT(4)
+
 #define MTK_PHY_PAGE_EXTENDED_52B5		0x52b5
 
+/* Registers on Token Ring debug nodes */
+/* ch_addr = 0x0, node_addr = 0xf, data_addr = 0x2 */
+#define   AN_STATE_MASK			GENMASK(22, 19)
+#define   AN_STATE_SHIFT		19
+#define   AN_STATE_TX_DISABLE		1
+
+/* ch_addr = 0x0, node_addr = 0xf, data_addr = 0x3c */
+#define AN_NEW_LP_CNT_LIMIT_MASK		GENMASK(23, 20)
+#define AUTO_NP_10XEN				BIT(6)
+
+/* Registers on MDIO_MMD_VEND1 */
+#define MTK_PHY_LINK_STATUS_MISC	(0xa2)
+#define   MTK_PHY_FINAL_SPEED_1000	BIT(3)
+
 /* Registers on MDIO_MMD_VEND2 */
 #define MTK_PHY_LED0_ON_CTRL			0x24
 #define MTK_PHY_LED1_ON_CTRL			0x26
@@ -78,6 +98,7 @@ void __mtk_tr_clr_bits(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 int mtk_phy_read_page(struct phy_device *phydev);
 int mtk_phy_write_page(struct phy_device *phydev, int page);
 
+int mtk_gphy_cl22_read_status(struct phy_device *phydev);
 int mtk_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 				unsigned long rules,
 				unsigned long supported_triggers);
-- 
2.18.0


