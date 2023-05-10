Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2EBC7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 22:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fX31fO+4/Oj5CsyND9+f9SOCsN9QEehIbnZaIUaOUZg=; b=a07LOqtRC0KcWqphv0dogKZUNY
	jjRRff455+93Iuu6hj9/9DN3nyRlzDna6ZntisEgNIriSohgdK29N6LFj+KLmda6R8ppVB6bJsoZE
	kGTjUOUzP6UZrrzbTFocArwBsuZQvIcNf7UnL7nevShoCWTrUDg7VijY1lOWie8G3APO59ThhQD0j
	QbN7xVRdQ2alhCNTVT91uOFyfGzKlG9LLb0dazFz7z7u1PoUQOvhyEYwYlyksHgKBSyI7c7DzxLPs
	7Um1FrP8UiFTxHkgs5JH+kbMydhZ0xMK/WhEDgA+cIuNSnCB3AJlAfzNwrlXpVNVxtuzFBwtjI/D4
	oESIweaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsiw-007Bcm-1X;
	Wed, 10 May 2023 22:55:54 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsis-007Bbe-28;
	Wed, 10 May 2023 22:55:52 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pwsir-0004Pe-1B;
	Wed, 10 May 2023 22:55:49 +0000
Date: Thu, 11 May 2023 00:53:55 +0200
From: Alexander Couzens <lynxis@fe80.eu>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH net-next 1/8] net: phy: realtek: rtl8221: allow to configure
 SERDES mode
Message-ID: <302d982c5550f10d589735fc2e46cf27386c39f4.1683756691.git.daniel@makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_155550_696391_FAF3607D 
X-CRM114-Status: GOOD (  12.82  )
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

The rtl8221 supports multiple SERDES modes:
- SGMII
- 2500base-x
- HiSGMII

Further it supports rate adaption on SERDES links to allow
slow ethernet speeds (10/100/1000mbit) to work on 2500base-x/HiSGMII
links without reducing the SERDES speed.

When operating without rate adapters the SERDES link will follow the
ethernet speed.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/net/phy/realtek.c | 55 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 3d99fd6664d7..a7dd5a075135 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -53,6 +53,15 @@
 						 RTL8201F_ISR_LINK)
 #define RTL8201F_IER				0x13
 
+#define RTL8221B_MMD_SERDES_CTRL		MDIO_MMD_VEND1
+#define RTL8221B_MMD_PHY_CTRL			MDIO_MMD_VEND2
+#define RTL8221B_SERDES_OPTION			0x697a
+#define RTL8221B_SERDES_OPTION_MODE_MASK	GENMASK(5, 0)
+#define RTL8221B_SERDES_OPTION_MODE_2500BASEX_SGMII	0
+#define RTL8221B_SERDES_OPTION_MODE_HISGMII_SGMII	1
+#define RTL8221B_SERDES_OPTION_MODE_2500BASEX		2
+#define RTL8221B_SERDES_OPTION_MODE_HISGMII		3
+
 #define RTL8366RB_POWER_SAVE			0x15
 #define RTL8366RB_POWER_SAVE_ON			BIT(12)
 
@@ -849,6 +858,48 @@ static irqreturn_t rtl9000a_handle_interrupt(struct phy_device *phydev)
 	return IRQ_HANDLED;
 }
 
+static int rtl8221b_config_init(struct phy_device *phydev)
+{
+	u16 option_mode;
+
+	switch (phydev->interface) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+		if (!phydev->is_c45) {
+			option_mode = RTL8221B_SERDES_OPTION_MODE_2500BASEX;
+			break;
+		}
+		fallthrough;
+	case PHY_INTERFACE_MODE_SGMII:
+		option_mode = RTL8221B_SERDES_OPTION_MODE_2500BASEX_SGMII;
+		break;
+	default:
+		return 0;
+	}
+
+	phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL,
+		      0x75f3, 0);
+
+	phy_modify_mmd_changed(phydev, RTL8221B_MMD_SERDES_CTRL,
+			       RTL8221B_SERDES_OPTION,
+			       RTL8221B_SERDES_OPTION_MODE_MASK, option_mode);
+	switch (option_mode) {
+	case RTL8221B_SERDES_OPTION_MODE_2500BASEX_SGMII:
+	case RTL8221B_SERDES_OPTION_MODE_2500BASEX:
+		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6a04, 0x0503);
+		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f10, 0xd455);
+		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f11, 0x8020);
+		break;
+	case RTL8221B_SERDES_OPTION_MODE_HISGMII_SGMII:
+	case RTL8221B_SERDES_OPTION_MODE_HISGMII:
+		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6a04, 0x0503);
+		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f10, 0xd433);
+		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f11, 0x8020);
+		break;
+	}
+
+	return 0;
+}
+
 static struct phy_driver realtek_drvs[] = {
 	{
 		PHY_ID_MATCH_EXACT(0x00008201),
@@ -970,6 +1021,7 @@ static struct phy_driver realtek_drvs[] = {
 		.name		= "RTL8226B_RTL8221B 2.5Gbps PHY",
 		.get_features	= rtl822x_get_features,
 		.config_aneg	= rtl822x_config_aneg,
+		.config_init	= rtl8221b_config_init,
 		.read_status	= rtl822x_read_status,
 		.suspend	= genphy_suspend,
 		.resume		= rtlgen_resume,
@@ -992,6 +1044,7 @@ static struct phy_driver realtek_drvs[] = {
 		.name           = "RTL8226B-CG_RTL8221B-CG 2.5Gbps PHY",
 		.get_features   = rtl822x_get_features,
 		.config_aneg    = rtl822x_config_aneg,
+		.config_init    = rtl8221b_config_init,
 		.read_status    = rtl822x_read_status,
 		.suspend        = genphy_suspend,
 		.resume         = rtlgen_resume,
@@ -1002,6 +1055,7 @@ static struct phy_driver realtek_drvs[] = {
 		.name           = "RTL8221B-VB-CG 2.5Gbps PHY",
 		.get_features   = rtl822x_get_features,
 		.config_aneg    = rtl822x_config_aneg,
+		.config_init    = rtl8221b_config_init,
 		.read_status    = rtl822x_read_status,
 		.suspend        = genphy_suspend,
 		.resume         = rtlgen_resume,
@@ -1012,6 +1066,7 @@ static struct phy_driver realtek_drvs[] = {
 		.name           = "RTL8221B-VM-CG 2.5Gbps PHY",
 		.get_features   = rtl822x_get_features,
 		.config_aneg    = rtl822x_config_aneg,
+		.config_init    = rtl8221b_config_init,
 		.read_status    = rtl822x_read_status,
 		.suspend        = genphy_suspend,
 		.resume         = rtlgen_resume,
-- 
2.40.0


