From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v3 5/5] phy: core: clean up unused ethernet specific phy modes
Date: Mon, 19 Nov 2018 19:24:24 -0600
Message-ID: <20181120012424.11802-6-grygorii.strashko@ti.com>
References: <20181120012424.11802-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120012424.11802-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Kishon Vijay Abraham I <kishon@ti.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Quentin Schulz <quentin.schulz@bootlin.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Carlo Caione <carlo@caione.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Manu Gautam <mgautam@codeaurora.org>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-mediatek@lists.infradead.org

After recent changes PHY_MODE_SGMII, PHY_MODE_2500SGMII, PHY_MODE_QSGMII,
PHY_MODE_10GKR are not used any more and can be removed. Hence - remove
them.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 include/linux/phy/phy.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 02c9ef0..79da05a 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -35,10 +35,6 @@ enum phy_mode {
 	PHY_MODE_USB_DEVICE_HS,
 	PHY_MODE_USB_DEVICE_SS,
 	PHY_MODE_USB_OTG,
-	PHY_MODE_SGMII,
-	PHY_MODE_2500SGMII,
-	PHY_MODE_QSGMII,
-	PHY_MODE_10GKR,
 	PHY_MODE_UFS_HS_A,
 	PHY_MODE_UFS_HS_B,
 	PHY_MODE_PCIE,
-- 
2.10.5
