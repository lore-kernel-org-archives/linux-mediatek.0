From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] xhci: mediatek: Move PM functions inside #idef CONFIG_PM_SLEEP
Date: Fri, 15 Jan 2016 14:42:10 +0100
Message-ID: <1452865330-32383-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-mediatek@lists.infradead.org

If CONFIG_PM_SLEEP=3Dn:

    drivers/usb/host/xhci-mtk.c:136: warning: =E2=80=98xhci_mtk_host_di=
sable=E2=80=99 defined but not used
    drivers/usb/host/xhci-mtk.c:314: warning: =E2=80=98usb_wakeup_enabl=
e=E2=80=99 defined but not used
    drivers/usb/host/xhci-mtk.c:322: warning: =E2=80=98usb_wakeup_disab=
le=E2=80=99 defined but not used

Move all functions related to power management into the existing sectio=
n
protected by #ifdef CONFIG_PM_SLEEP section to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/usb/host/xhci-mtk.c | 242 ++++++++++++++++++++++--------------=
--------
 1 file changed, 121 insertions(+), 121 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index c9ab6a44c34aef05..43a1ae0fc0a9911e 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -132,42 +132,6 @@ static int xhci_mtk_host_enable(struct xhci_hcd_mt=
k *mtk)
 	return 0;
 }
=20
-static int xhci_mtk_host_disable(struct xhci_hcd_mtk *mtk)
-{
-	struct mu3c_ippc_regs __iomem *ippc =3D mtk->ippc_regs;
-	u32 value;
-	int ret;
-	int i;
-
-	/* power down all u3 ports */
-	for (i =3D 0; i < mtk->num_u3_ports; i++) {
-		value =3D readl(&ippc->u3_ctrl_p[i]);
-		value |=3D CTRL_U3_PORT_PDN;
-		writel(value, &ippc->u3_ctrl_p[i]);
-	}
-
-	/* power down all u2 ports */
-	for (i =3D 0; i < mtk->num_u2_ports; i++) {
-		value =3D readl(&ippc->u2_ctrl_p[i]);
-		value |=3D CTRL_U2_PORT_PDN;
-		writel(value, &ippc->u2_ctrl_p[i]);
-	}
-
-	/* power down host ip */
-	value =3D readl(&ippc->ip_pw_ctr1);
-	value |=3D CTRL1_IP_HOST_PDN;
-	writel(value, &ippc->ip_pw_ctr1);
-
-	/* wait for host ip to sleep */
-	ret =3D readl_poll_timeout(&ippc->ip_pw_sts1, value,
-			  (value & STS1_IP_SLEEP_STS), 100, 100000);
-	if (ret) {
-		dev_err(mtk->dev, "ip sleep failed!!!\n");
-		return ret;
-	}
-	return 0;
-}
-
 static int xhci_mtk_ssusb_config(struct xhci_hcd_mtk *mtk)
 {
 	struct mu3c_ippc_regs __iomem *ippc =3D mtk->ippc_regs;
@@ -241,91 +205,6 @@ static void xhci_mtk_clks_disable(struct xhci_hcd_=
mtk *mtk)
 	clk_disable_unprepare(mtk->sys_clk);
 }
=20
-/* only clocks can be turn off for ip-sleep wakeup mode */
-static void usb_wakeup_ip_sleep_en(struct xhci_hcd_mtk *mtk)
-{
-	u32 tmp;
-	struct regmap *pericfg =3D mtk->pericfg;
-
-	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
-	tmp &=3D ~UWK_CTL1_IS_P;
-	tmp &=3D ~(UWK_CTL1_IS_C(0xf));
-	tmp |=3D UWK_CTL1_IS_C(0x8);
-	regmap_write(pericfg, PERI_WK_CTRL1, tmp);
-	regmap_write(pericfg, PERI_WK_CTRL1, tmp | UWK_CTL1_IS_E);
-
-	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
-	dev_dbg(mtk->dev, "%s(): WK_CTRL1[P6,E25,C26:29]=3D%#x\n",
-		__func__, tmp);
-}
-
-static void usb_wakeup_ip_sleep_dis(struct xhci_hcd_mtk *mtk)
-{
-	u32 tmp;
-
-	regmap_read(mtk->pericfg, PERI_WK_CTRL1, &tmp);
-	tmp &=3D ~UWK_CTL1_IS_E;
-	regmap_write(mtk->pericfg, PERI_WK_CTRL1, tmp);
-}
-
-/*
-* for line-state wakeup mode, phy's power should not power-down
-* and only support cable plug in/out
-*/
-static void usb_wakeup_line_state_en(struct xhci_hcd_mtk *mtk)
-{
-	u32 tmp;
-	struct regmap *pericfg =3D mtk->pericfg;
-
-	/* line-state of u2-port0 */
-	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
-	tmp &=3D ~UWK_CTL1_0P_LS_P;
-	tmp &=3D ~(UWK_CTL1_0P_LS_C(0xf));
-	tmp |=3D UWK_CTL1_0P_LS_C(0x8);
-	regmap_write(pericfg, PERI_WK_CTRL1, tmp);
-	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
-	regmap_write(pericfg, PERI_WK_CTRL1, tmp | UWK_CTL1_0P_LS_E);
-
-	/* line-state of u2-port1 */
-	regmap_read(pericfg, PERI_WK_CTRL0, &tmp);
-	tmp &=3D ~(UWK_CTL1_1P_LS_C(0xf));
-	tmp |=3D UWK_CTL1_1P_LS_C(0x8);
-	regmap_write(pericfg, PERI_WK_CTRL0, tmp);
-	regmap_write(pericfg, PERI_WK_CTRL0, tmp | UWK_CTL1_1P_LS_E);
-}
-
-static void usb_wakeup_line_state_dis(struct xhci_hcd_mtk *mtk)
-{
-	u32 tmp;
-	struct regmap *pericfg =3D mtk->pericfg;
-
-	/* line-state of u2-port0 */
-	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
-	tmp &=3D ~UWK_CTL1_0P_LS_E;
-	regmap_write(pericfg, PERI_WK_CTRL1, tmp);
-
-	/* line-state of u2-port1 */
-	regmap_read(pericfg, PERI_WK_CTRL0, &tmp);
-	tmp &=3D ~UWK_CTL1_1P_LS_E;
-	regmap_write(pericfg, PERI_WK_CTRL0, tmp);
-}
-
-static void usb_wakeup_enable(struct xhci_hcd_mtk *mtk)
-{
-	if (mtk->wakeup_src =3D=3D SSUSB_WK_IP_SLEEP)
-		usb_wakeup_ip_sleep_en(mtk);
-	else if (mtk->wakeup_src =3D=3D SSUSB_WK_LINE_STATE)
-		usb_wakeup_line_state_en(mtk);
-}
-
-static void usb_wakeup_disable(struct xhci_hcd_mtk *mtk)
-{
-	if (mtk->wakeup_src =3D=3D SSUSB_WK_IP_SLEEP)
-		usb_wakeup_ip_sleep_dis(mtk);
-	else if (mtk->wakeup_src =3D=3D SSUSB_WK_LINE_STATE)
-		usb_wakeup_line_state_dis(mtk);
-}
-
 static int usb_wakeup_of_property_parse(struct xhci_hcd_mtk *mtk,
 				struct device_node *dn)
 {
@@ -696,6 +575,127 @@ static int xhci_mtk_remove(struct platform_device=
 *dev)
 }
=20
 #ifdef CONFIG_PM_SLEEP
+static int xhci_mtk_host_disable(struct xhci_hcd_mtk *mtk)
+{
+	struct mu3c_ippc_regs __iomem *ippc =3D mtk->ippc_regs;
+	u32 value;
+	int ret;
+	int i;
+
+	/* power down all u3 ports */
+	for (i =3D 0; i < mtk->num_u3_ports; i++) {
+		value =3D readl(&ippc->u3_ctrl_p[i]);
+		value |=3D CTRL_U3_PORT_PDN;
+		writel(value, &ippc->u3_ctrl_p[i]);
+	}
+
+	/* power down all u2 ports */
+	for (i =3D 0; i < mtk->num_u2_ports; i++) {
+		value =3D readl(&ippc->u2_ctrl_p[i]);
+		value |=3D CTRL_U2_PORT_PDN;
+		writel(value, &ippc->u2_ctrl_p[i]);
+	}
+
+	/* power down host ip */
+	value =3D readl(&ippc->ip_pw_ctr1);
+	value |=3D CTRL1_IP_HOST_PDN;
+	writel(value, &ippc->ip_pw_ctr1);
+
+	/* wait for host ip to sleep */
+	ret =3D readl_poll_timeout(&ippc->ip_pw_sts1, value,
+			  (value & STS1_IP_SLEEP_STS), 100, 100000);
+	if (ret) {
+		dev_err(mtk->dev, "ip sleep failed!!!\n");
+		return ret;
+	}
+	return 0;
+}
+
+/* only clocks can be turn off for ip-sleep wakeup mode */
+static void usb_wakeup_ip_sleep_en(struct xhci_hcd_mtk *mtk)
+{
+	u32 tmp;
+	struct regmap *pericfg =3D mtk->pericfg;
+
+	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
+	tmp &=3D ~UWK_CTL1_IS_P;
+	tmp &=3D ~(UWK_CTL1_IS_C(0xf));
+	tmp |=3D UWK_CTL1_IS_C(0x8);
+	regmap_write(pericfg, PERI_WK_CTRL1, tmp);
+	regmap_write(pericfg, PERI_WK_CTRL1, tmp | UWK_CTL1_IS_E);
+
+	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
+	dev_dbg(mtk->dev, "%s(): WK_CTRL1[P6,E25,C26:29]=3D%#x\n",
+		__func__, tmp);
+}
+
+static void usb_wakeup_ip_sleep_dis(struct xhci_hcd_mtk *mtk)
+{
+	u32 tmp;
+
+	regmap_read(mtk->pericfg, PERI_WK_CTRL1, &tmp);
+	tmp &=3D ~UWK_CTL1_IS_E;
+	regmap_write(mtk->pericfg, PERI_WK_CTRL1, tmp);
+}
+
+/*
+* for line-state wakeup mode, phy's power should not power-down
+* and only support cable plug in/out
+*/
+static void usb_wakeup_line_state_en(struct xhci_hcd_mtk *mtk)
+{
+	u32 tmp;
+	struct regmap *pericfg =3D mtk->pericfg;
+
+	/* line-state of u2-port0 */
+	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
+	tmp &=3D ~UWK_CTL1_0P_LS_P;
+	tmp &=3D ~(UWK_CTL1_0P_LS_C(0xf));
+	tmp |=3D UWK_CTL1_0P_LS_C(0x8);
+	regmap_write(pericfg, PERI_WK_CTRL1, tmp);
+	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
+	regmap_write(pericfg, PERI_WK_CTRL1, tmp | UWK_CTL1_0P_LS_E);
+
+	/* line-state of u2-port1 */
+	regmap_read(pericfg, PERI_WK_CTRL0, &tmp);
+	tmp &=3D ~(UWK_CTL1_1P_LS_C(0xf));
+	tmp |=3D UWK_CTL1_1P_LS_C(0x8);
+	regmap_write(pericfg, PERI_WK_CTRL0, tmp);
+	regmap_write(pericfg, PERI_WK_CTRL0, tmp | UWK_CTL1_1P_LS_E);
+}
+
+static void usb_wakeup_line_state_dis(struct xhci_hcd_mtk *mtk)
+{
+	u32 tmp;
+	struct regmap *pericfg =3D mtk->pericfg;
+
+	/* line-state of u2-port0 */
+	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
+	tmp &=3D ~UWK_CTL1_0P_LS_E;
+	regmap_write(pericfg, PERI_WK_CTRL1, tmp);
+
+	/* line-state of u2-port1 */
+	regmap_read(pericfg, PERI_WK_CTRL0, &tmp);
+	tmp &=3D ~UWK_CTL1_1P_LS_E;
+	regmap_write(pericfg, PERI_WK_CTRL0, tmp);
+}
+
+static void usb_wakeup_enable(struct xhci_hcd_mtk *mtk)
+{
+	if (mtk->wakeup_src =3D=3D SSUSB_WK_IP_SLEEP)
+		usb_wakeup_ip_sleep_en(mtk);
+	else if (mtk->wakeup_src =3D=3D SSUSB_WK_LINE_STATE)
+		usb_wakeup_line_state_en(mtk);
+}
+
+static void usb_wakeup_disable(struct xhci_hcd_mtk *mtk)
+{
+	if (mtk->wakeup_src =3D=3D SSUSB_WK_IP_SLEEP)
+		usb_wakeup_ip_sleep_dis(mtk);
+	else if (mtk->wakeup_src =3D=3D SSUSB_WK_LINE_STATE)
+		usb_wakeup_line_state_dis(mtk);
+}
+
 static int xhci_mtk_suspend(struct device *dev)
 {
 	struct xhci_hcd_mtk *mtk =3D dev_get_drvdata(dev);
--=20
1.9.1
