Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9EDC77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 23:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwbZ1jtHL2M3/Q8IzuP1FSlh5IPZjJl2FYQVUtS7Ugo=; b=ouFdtzkntR9arllD1pOvKnx12a
	3wKj2YEgg8RkMhy9EUzqnzHixrsYJJncgx7Om9KcxvLaEOk+hYXnvRmKTi0zov/jy7KHPtjJvExZH
	fTE2B4ESPond5MjfCClXrW9J+/8QOJ3FB0ukMe+n+KfnYpvRn0gksN2LtBjrE7pmKQSk1xInOBzUQ
	v+NfpNQCePbwipc0l2fuYtGURBRBAkAJ13iSLWifgzIdjDfKOsDwMg9uYHS01NI7d/XPqE6dwUjnC
	myLgzLOhFl4vkrWCy343TkvHY/bFEx8+4ZDxN9/u6C5mIAMmJ0Cw3dydlab2WESqAhgmAP6KKrDiT
	n9jmdPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwso2-007CgK-00;
	Wed, 10 May 2023 23:01:10 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsnz-007Cfk-1a;
	Wed, 10 May 2023 23:01:08 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pwsny-0004VH-0l;
	Wed, 10 May 2023 23:01:06 +0000
Date: Thu, 11 May 2023 00:59:12 +0200
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
Subject: [PATCH net-next 6/8] net: phy: realtek: use inline functions for
 10GbE advertisement
Message-ID: <fdce4e1cfb7c975bf72257baf393b3af53266c3d.1683756691.git.daniel@makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_160107_532971_F75DC9E2 
X-CRM114-Status: GOOD (  11.63  )
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

Use existing generic inline functions to encode local advertisement
of 10GbE link modes as well as to decode link-partner advertisement.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/realtek.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index e6a46c4d97b1..cde61a30ac4c 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -68,10 +68,6 @@
 #define RTL_SUPPORTS_5000FULL			BIT(14)
 #define RTL_SUPPORTS_2500FULL			BIT(13)
 #define RTL_SUPPORTS_10000FULL			BIT(0)
-#define RTL_ADV_2500FULL			BIT(7)
-#define RTL_LPADV_10000FULL			BIT(11)
-#define RTL_LPADV_5000FULL			BIT(6)
-#define RTL_LPADV_2500FULL			BIT(5)
 
 #define RTL9000A_GINMR				0x14
 #define RTL9000A_GINMR_LINK_STATUS		BIT(4)
@@ -669,14 +665,11 @@ static int rtl822x_config_aneg(struct phy_device *phydev)
 	int val, ret = 0;
 
 	if (phydev->autoneg == AUTONEG_ENABLE) {
-		u16 adv2500 = 0;
-
-		if (linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
-				      phydev->advertising))
-			adv2500 = RTL_ADV_2500FULL;
-
 		ret = phy_modify_paged_changed(phydev, 0xa5d, 0x12,
-					       RTL_ADV_2500FULL, adv2500);
+					       MDIO_AN_10GBT_CTRL_ADV10G |
+					       MDIO_AN_10GBT_CTRL_ADV5G |
+					       MDIO_AN_10GBT_CTRL_ADV2_5G,
+			linkmode_adv_to_mii_10gbt_adv_t(phydev->advertising));
 		if (ret < 0)
 			return ret;
 	}
@@ -722,12 +715,7 @@ static int rtl822x_read_status(struct phy_device *phydev)
 		if (lpadv < 0)
 			return lpadv;
 
-		linkmode_mod_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
-			phydev->lp_advertising, lpadv & RTL_LPADV_10000FULL);
-		linkmode_mod_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT,
-			phydev->lp_advertising, lpadv & RTL_LPADV_5000FULL);
-		linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
-			phydev->lp_advertising, lpadv & RTL_LPADV_2500FULL);
+		mii_10gbt_stat_mod_linkmode_lpa_t(phydev->lp_advertising, lpadv);
 	}
 
 	ret = rtlgen_read_status(phydev);
-- 
2.40.0


