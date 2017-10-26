From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 1/3] phy: phy-mtk-tphy: use auto instead of force to bypass
 utmi signals
Date: Thu, 26 Oct 2017 20:50:26 +0800
Message-ID: <f08880e993f05761f0171b83812e940d30a54b05.1509022149.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

When system is running, if usb2 phy is forced to bypass utmi signals,
all PLL will be turned off, and it can't detect device connection
anymore, so replace force mode with auto mode which can bypass utmi
signals automatically if no device attached for normal flow.
But keep the force mode to fix RX sensitivity degradation issue.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c |   19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 402385f..54cc44b 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -440,9 +440,9 @@ static void u2_phy_instance_init(struct mtk_tphy *tphy,
 	u32 index = instance->index;
 	u32 tmp;
 
-	/* switch to USB function. (system register, force ip into usb mode) */
+	/* switch to USB function, and enable usb pll */
 	tmp = readl(com + U3P_U2PHYDTM0);
-	tmp &= ~P2C_FORCE_UART_EN;
+	tmp &= ~(P2C_FORCE_UART_EN | P2C_FORCE_SUSPENDM);
 	tmp |= P2C_RG_XCVRSEL_VAL(1) | P2C_RG_DATAIN_VAL(0);
 	writel(tmp, com + U3P_U2PHYDTM0);
 
@@ -502,10 +502,8 @@ static void u2_phy_instance_power_on(struct mtk_tphy *tphy,
 	u32 index = instance->index;
 	u32 tmp;
 
-	/* (force_suspendm=0) (let suspendm=1, enable usb 480MHz pll) */
 	tmp = readl(com + U3P_U2PHYDTM0);
-	tmp &= ~(P2C_FORCE_SUSPENDM | P2C_RG_XCVRSEL);
-	tmp &= ~(P2C_RG_DATAIN | P2C_DTM0_PART_MASK);
+	tmp &= ~(P2C_RG_XCVRSEL | P2C_RG_DATAIN | P2C_DTM0_PART_MASK);
 	writel(tmp, com + U3P_U2PHYDTM0);
 
 	/* OTG Enable */
@@ -540,7 +538,6 @@ static void u2_phy_instance_power_off(struct mtk_tphy *tphy,
 
 	tmp = readl(com + U3P_U2PHYDTM0);
 	tmp &= ~(P2C_RG_XCVRSEL | P2C_RG_DATAIN);
-	tmp |= P2C_FORCE_SUSPENDM;
 	writel(tmp, com + U3P_U2PHYDTM0);
 
 	/* OTG Disable */
@@ -548,18 +545,16 @@ static void u2_phy_instance_power_off(struct mtk_tphy *tphy,
 	tmp &= ~PA6_RG_U2_OTG_VBUSCMP_EN;
 	writel(tmp, com + U3P_USBPHYACR6);
 
-	/* let suspendm=0, set utmi into analog power down */
-	tmp = readl(com + U3P_U2PHYDTM0);
-	tmp &= ~P2C_RG_SUSPENDM;
-	writel(tmp, com + U3P_U2PHYDTM0);
-	udelay(1);
-
 	tmp = readl(com + U3P_U2PHYDTM1);
 	tmp &= ~(P2C_RG_VBUSVALID | P2C_RG_AVALID);
 	tmp |= P2C_RG_SESSEND;
 	writel(tmp, com + U3P_U2PHYDTM1);
 
 	if (tphy->pdata->avoid_rx_sen_degradation && index) {
+		tmp = readl(com + U3P_U2PHYDTM0);
+		tmp &= ~(P2C_RG_SUSPENDM | P2C_FORCE_SUSPENDM);
+		writel(tmp, com + U3P_U2PHYDTM0);
+
 		tmp = readl(com + U3D_U2PHYDCR0);
 		tmp &= ~P2C_RG_SIF_U2PLL_FORCE_ON;
 		writel(tmp, com + U3D_U2PHYDCR0);
-- 
1.7.9.5
