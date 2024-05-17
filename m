Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDF0C04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 10:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zotP/X0kJr5B6g+bKMaXNDskzCSlvgU0qbm1yBlS+94=; b=vAZCFSib4LipXx3lkiSzfQet4Y
	jg52Y+c4BNehenZicU8cih6Jok8IPqLQgnWYv7EBTN83u4U76zilwH2+uN9XS1Yn2fszj+371y5ex
	OA6QRKgGk+5NvgBoWtsNkkbDEv65eFbssA2Ok2GV5jPIpuxXBgnZc2H2LfuzRNSnKtJ7AnHewkPYx
	qaMM1K1RBj7UeLfqoJ/0w7057qNPv2aiidwTqeNW34cQ3N1zSrwoaC7+2AG9h56oMBhUuK/NrePDs
	7JJtzAcSpgSpYwBirmD5pMaps3N6nilhJI/erWuMNIfeaggBPgleRyFqtHGH/KiEY2s/FQmGSsqrO
	15pIaW/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7vBl-00000007ZNi-1Q2E;
	Fri, 17 May 2024 10:51:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7vBi-00000007ZMy-1KqP;
	Fri, 17 May 2024 10:51:47 +0000
X-UUID: 70d98018143b11efa8f1cd58ee6c2400-20240517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zotP/X0kJr5B6g+bKMaXNDskzCSlvgU0qbm1yBlS+94=;
	b=SF2xGnzm6UZjk4Yyt95CdUFt8lxdjilELwPFzyzZef6sdnkR+KRQpIuzPhLo74EmvatTOe2quZOk0nWl3zUM7eZvYnjc7ZEUjM3Gme7P04zYbjyXt4AC6RclqX3gwC5aBSoXhxce2q7miFEjlHQv+5qkXHT/XatVxJBRK1rmiKI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:58d5414a-0dd3-4853-904d-5fd17e5d0a86,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:85c9e292-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 70d98018143b11efa8f1cd58ee6c2400-20240517
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1613101396; Fri, 17 May 2024 03:51:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 17 May 2024 18:30:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 17 May 2024 18:30:39 +0800
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
Subject: [PATCH net-next v2 4/5] net: phy: mediatek: Extend 1G TX/RX link pulse time
Date: Fri, 17 May 2024 18:29:07 +0800
Message-ID: <20240517102908.12079-5-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240517102908.12079-1-SkyLake.Huang@mediatek.com>
References: <20240517102908.12079-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_035146_466384_F0726136 
X-CRM114-Status: GOOD (  22.47  )
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
 drivers/net/phy/mediatek/mtk-ge.c      |  1 +
 drivers/net/phy/mediatek/mtk-phy-lib.c | 90 ++++++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk.h         | 16 +++++
 4 files changed, 109 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 8f23137..62424d4 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1339,6 +1339,7 @@ static struct phy_driver mtk_socphy_driver[] = {
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981),
 		.name		= "MediaTek MT7981 PHY",
 		.config_init	= mt798x_phy_config_init,
+		.read_status	= mtk_gphy_cl22_read_status,
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
 		.probe		= mt7981_phy_probe,
@@ -1356,6 +1357,7 @@ static struct phy_driver mtk_socphy_driver[] = {
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988),
 		.name		= "MediaTek MT7988 PHY",
 		.config_init	= mt798x_phy_config_init,
+		.read_status	= mtk_gphy_cl22_read_status,
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
 		.probe		= mt7988_phy_probe,
diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 5c0226d..c832c90 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -211,6 +211,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 		.name		= "MediaTek MT7531 PHY",
 		.probe		= mt7531_phy_probe,
 		.config_init	= mt7531_phy_config_init,
+		.read_status	= mtk_gphy_cl22_read_status,
 		/* Interrupts are handled by the switch, not the PHY
 		 * itself.
 		 */
diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 39bfefe..9e302c5 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -106,6 +106,96 @@ int mtk_phy_write_page(struct phy_device *phydev, int page)
 }
 EXPORT_SYMBOL_GPL(mtk_phy_write_page);
 
+static void extend_an_new_lp_cnt_limit(struct phy_device *phydev)
+{
+	int mmd_read_ret;
+	int ret;
+	u32 reg_val;
+
+	ret = read_poll_timeout(mmd_read_ret = phy_read_mmd, reg_val,
+				(mmd_read_ret < 0) || reg_val & MTK_PHY_FINAL_SPEED_1000,
+				10000, 1000000, false, phydev,
+				MDIO_MMD_VEND1, MTK_PHY_LINK_STATUS_MISC);
+	if (mmd_read_ret < 0)
+		ret = mmd_read_ret;
+	/* If final_speed_1000 is raised, try to extend timeout period
+	 * of auto downshift.
+	 */
+	if (!ret) {
+		tr_modify(phydev, 0x0, 0xf, 0x3c, AN_NEW_LP_CNT_LIMIT_MASK,
+			  FIELD_PREP(AN_NEW_LP_CNT_LIMIT_MASK, 0xf));
+		mdelay(1500);
+
+		ret = read_poll_timeout(mmd_read_ret = tr_read, reg_val,
+					(mmd_read_ret < 0) ||
+					(reg_val & AN_STATE_MASK) !=
+					(AN_STATE_TX_DISABLE << AN_STATE_SHIFT),
+					10000, 1000000, false, phydev,
+					0x0, 0xf, 0x2);
+
+		if (mmd_read_ret < 0)
+			ret = mmd_read_ret;
+
+		if (!ret) {
+			mdelay(625);
+			tr_modify(phydev, 0x0, 0xf, 0x3c, AN_NEW_LP_CNT_LIMIT_MASK,
+				  FIELD_PREP(AN_NEW_LP_CNT_LIMIT_MASK, 0x8));
+			mdelay(500);
+			tr_modify(phydev, 0x0, 0xf, 0x3c, AN_NEW_LP_CNT_LIMIT_MASK,
+				  FIELD_PREP(AN_NEW_LP_CNT_LIMIT_MASK, 0xf));
+		}
+	}
+}
+
+int mtk_gphy_cl22_read_status(struct phy_device *phydev)
+{
+	int err, old_link = phydev->link;
+	int mii_ctrl;
+
+	/* Update the link, but return if there was an error */
+	err = genphy_update_link(phydev);
+	if (err)
+		return err;
+
+	/* why bother the PHY if nothing can have changed */
+	if (phydev->autoneg == AUTONEG_ENABLE && old_link && phydev->link)
+		return 0;
+
+	phydev->master_slave_get = MASTER_SLAVE_CFG_UNSUPPORTED;
+	phydev->master_slave_state = MASTER_SLAVE_STATE_UNSUPPORTED;
+	phydev->speed = SPEED_UNKNOWN;
+	phydev->duplex = DUPLEX_UNKNOWN;
+	phydev->pause = 0;
+	phydev->asym_pause = 0;
+
+	if (phydev->is_gigabit_capable) {
+		err = genphy_read_master_slave(phydev);
+		if (err < 0)
+			return err;
+	}
+
+	err = genphy_read_lpa(phydev);
+	if (err < 0)
+		return err;
+
+	if (phydev->autoneg == AUTONEG_ENABLE) {
+		if (phydev->autoneg_complete) {
+			phy_resolve_aneg_linkmode(phydev);
+		} else {
+			mii_ctrl = phy_read(phydev, MII_CTRL1000);
+			if ((mii_ctrl & ADVERTISE_1000FULL) || (mii_ctrl & ADVERTISE_1000HALF))
+				extend_an_new_lp_cnt_limit(phydev);
+		}
+	} else if (phydev->autoneg == AUTONEG_DISABLE) {
+		err = genphy_read_status_fixed(phydev);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_gphy_cl22_read_status);
+
 int mtk_phy_led_hw_is_supported(struct phy_device *phydev, u8 index, unsigned long rules,
 				unsigned long supported_triggers)
 {
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 10ee9be..32fa3f1 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -12,6 +12,20 @@
 #define MTK_PHY_PAGE_STANDARD			0x0000
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
@@ -75,6 +89,8 @@ void __tr_clr_bits(struct phy_device *phydev, u8 ch_addr, u8 node_addr, u8 data_
 int mtk_phy_read_page(struct phy_device *phydev);
 int mtk_phy_write_page(struct phy_device *phydev, int page);
 
+int mtk_gphy_cl22_read_status(struct phy_device *phydev);
+
 int mtk_phy_led_hw_is_supported(struct phy_device *phydev, u8 index, unsigned long rules,
 				unsigned long supported_triggers);
 int mtk_phy_led_hw_ctrl_set(struct phy_device *phydev, u8 index, unsigned long rules,
-- 
2.18.0


