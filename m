Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1169BC77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 23:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gkjpn6qo8GKo/OFPTXVmWj0Oe/mJ+FnTJe60gvg7hU=; b=WUty3ypsEHQmhTC74zA2Zaztyk
	4vz6AxWpBzPB+caa/ndjfvK0Rzn51Bl2FI/sR1/gn+v9dlz+r9m03eEhu7SsyWsWcJ0icbF/7TCb4
	dr0uvMOpanQb/v6GN+ipUU/rO6RVUjyIlweDw49+NHI/zmpoJ/8z3G55Hofx7WJcr08YXOJvn7hCV
	0eN0hfF0DKV5JcD/d5yoCWRmdn0NkjTTHjfRt08Mdkb+BItPXR6YtuLk0VPbgcLuNKEvX0TQMCNWF
	PA5Tj6hzRkDhCm4y7fr2J4g51KFIxupJSWcUVATkVx1JkVZXeycBGtaZUh9ZN6TLXD2F/kpHPQtmm
	f6RMKL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwspI-007CxV-2S;
	Wed, 10 May 2023 23:02:28 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwspG-007Cwr-0k;
	Wed, 10 May 2023 23:02:27 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pwspE-0004Wg-2T;
	Wed, 10 May 2023 23:02:25 +0000
Date: Thu, 11 May 2023 01:00:21 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH net-next 8/8] net: phy: realtek: setup ALDPS on RTL8221B
Message-ID: <701034ea45c08db557af926a5a44113e4e45c634.1683756691.git.daniel@makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_160226_274901_F23ED4B7 
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

Setup Link Down Power Saving Mode according the DTS property
just like for RTL821x 1GE PHYs.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/realtek.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 29168f98f451..b5d7208004d8 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -62,6 +62,10 @@
 #define RTL8221B_SERDES_OPTION_MODE_2500BASEX		2
 #define RTL8221B_SERDES_OPTION_MODE_HISGMII		3
 
+#define RTL8221B_PHYCR1				0xa430
+#define RTL8221B_PHYCR1_ALDPS_EN		BIT(2)
+#define RTL8221B_PHYCR1_ALDPS_XTAL_OFF_EN	BIT(12)
+
 #define RTL8366RB_POWER_SAVE			0x15
 #define RTL8366RB_POWER_SAVE_ON			BIT(12)
 
@@ -757,6 +761,25 @@ static int rtl8226_match_phy_device(struct phy_device *phydev)
 	       rtlgen_supports_2_5gbps(phydev);
 }
 
+static int rtl822x_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	int val;
+
+	val = phy_read_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, RTL8221B_PHYCR1);
+	if (val < 0)
+		return val;
+
+	if (of_property_read_bool(dev->of_node, "realtek,aldps-enable"))
+		val |= RTL8221B_PHYCR1_ALDPS_EN | RTL8221B_PHYCR1_ALDPS_XTAL_OFF_EN;
+	else
+		val &= ~(RTL8221B_PHYCR1_ALDPS_EN | RTL8221B_PHYCR1_ALDPS_XTAL_OFF_EN);
+
+	phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, RTL8221B_PHYCR1, val);
+
+	return 0;
+}
+
 static int rtlgen_resume(struct phy_device *phydev)
 {
 	int ret = genphy_resume(phydev);
@@ -1034,6 +1057,7 @@ static struct phy_driver realtek_drvs[] = {
 		.match_phy_device = rtl8226_match_phy_device,
 		.get_features	= rtl822x_get_features,
 		.config_aneg	= rtl822x_config_aneg,
+		.probe          = rtl822x_probe,
 		.read_status	= rtl822x_read_status,
 		.suspend	= genphy_suspend,
 		.resume		= rtlgen_resume,
@@ -1048,6 +1072,7 @@ static struct phy_driver realtek_drvs[] = {
 		.get_features	= rtl822x_get_features,
 		.config_aneg	= rtl822x_config_aneg,
 		.config_init	= rtl8221b_config_init,
+		.probe          = rtl822x_probe,
 		.read_status	= rtl822x_read_status,
 		.suspend	= genphy_suspend,
 		.resume		= rtlgen_resume,
@@ -1061,6 +1086,7 @@ static struct phy_driver realtek_drvs[] = {
 		.name           = "RTL8226-CG 2.5Gbps PHY",
 		.get_features   = rtl822x_get_features,
 		.config_aneg    = rtl822x_config_aneg,
+		.probe          = rtl822x_probe,
 		.read_status    = rtl822x_read_status,
 		.suspend        = genphy_suspend,
 		.resume         = rtlgen_resume,
@@ -1073,6 +1099,7 @@ static struct phy_driver realtek_drvs[] = {
 		.get_features   = rtl822x_get_features,
 		.config_aneg    = rtl822x_config_aneg,
 		.config_init    = rtl8221b_config_init,
+		.probe          = rtl822x_probe,
 		.read_status    = rtl822x_read_status,
 		.suspend        = genphy_suspend,
 		.resume         = rtlgen_resume,
@@ -1085,6 +1112,7 @@ static struct phy_driver realtek_drvs[] = {
 		.get_features   = rtl822x_get_features,
 		.config_aneg    = rtl822x_config_aneg,
 		.config_init    = rtl8221b_config_init,
+		.probe          = rtl822x_probe,
 		.read_status    = rtl822x_read_status,
 		.suspend        = genphy_suspend,
 		.resume         = rtlgen_resume,
@@ -1097,6 +1125,7 @@ static struct phy_driver realtek_drvs[] = {
 		.get_features   = rtl822x_get_features,
 		.config_aneg    = rtl822x_config_aneg,
 		.config_init    = rtl8221b_config_init,
+		.probe          = rtl822x_probe,
 		.read_status    = rtl822x_read_status,
 		.suspend        = genphy_suspend,
 		.resume         = rtlgen_resume,
-- 
2.40.0


