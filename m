Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6A8C7EE24
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 23:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2l9h8ojR3yYSLsGeKUCE1lyRpBTvO/ed7Mich777Tpw=; b=lM10yb2iYVzdHmWdgYJXDPTQVd
	G6XcAk2bnDokooV9reJyL2WmR4irDrdMYCWwVTY1CEXRoVwFHYflh4SLbJIImOxHOIR4lVb+58J9n
	GhL/UCk1zCcfNOr/OpxxMxqStthxl/BpUOBgjVgs8+TMKdXFf6SjaQZiiYeCrFqCNrUsqxBcbtb+B
	EJCUZ0qchmk9K7k4jTwmwkg29ZQg6VUMWxnWX5EVKiyKlpxNRB8C/O4tVAq24YIaKoJVvAMArkLNa
	QZ4Sbmph4ApjAFglwAVkJskARHOpEP5dBhglZ9sKKEz8Bnee9/mT0OAolVY5Tp/V7I66+IA8jyXzR
	tVPbI/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsn1-007CR0-1U;
	Wed, 10 May 2023 23:00:07 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsmz-007CQK-1w;
	Wed, 10 May 2023 23:00:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pwsmy-0004U1-1A;
	Wed, 10 May 2023 23:00:04 +0000
Date: Thu, 11 May 2023 00:58:10 +0200
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
Subject: [PATCH net-next 4/8] net: phy: realtek: disable SGMII in-band AN for
 2.5G PHYs
Message-ID: <574c9703523af5643af0623144db3aa385635e84.1683756691.git.daniel@makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_160005_642542_05C6EC4A 
X-CRM114-Status: GOOD (  13.34  )
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

MAC drivers don't use SGMII in-band autonegotiation unless told to do so
in device tree using 'managed = "in-band-status"'. When using MDIO to
access a PHY, in-band-status is unneeded as we have link-status via
MDIO. Switch off SGMII in-band autonegotiation using magic values.

Reported-by: Chen Minqiang <ptpt52@gmail.com>
Reported-by: Chukun Pan <amadeus@jmu.edu.cn>
Reported-by: Yevhen Kolomeiko <jarvis2709@gmail.com>
Tested-by: Yevhen Kolomeiko <jarvis2709@gmail.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/realtek.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 0cf7846c9812..acadb6f0057b 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -666,7 +666,7 @@ static int rtl822x_get_features(struct phy_device *phydev)
 
 static int rtl822x_config_aneg(struct phy_device *phydev)
 {
-	int ret = 0;
+	int val, ret = 0;
 
 	if (phydev->autoneg == AUTONEG_ENABLE) {
 		u16 adv2500 = 0;
@@ -681,6 +681,19 @@ static int rtl822x_config_aneg(struct phy_device *phydev)
 			return ret;
 	}
 
+	/* MACs using phylink assume SGMII in-band status is not used.
+	 * Keep things as they are for MACs not using phylink such as
+	 * RealTek PCIe chips which come with built-in PHYs
+	 */
+	if (phydev->phylink) {
+		/* Disable SGMII AN */
+		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x7588, 0x2);
+		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x7589, 0x71d0);
+		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x7587, 0x3);
+		phy_read_mmd_poll_timeout(phydev, RTL8221B_MMD_SERDES_CTRL, 0x7587,
+					  val, !(val & BIT(0)), 500, 100000, false);
+	}
+
 	return __genphy_config_aneg(phydev, ret);
 }
 
-- 
2.40.0


