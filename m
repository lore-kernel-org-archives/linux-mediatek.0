From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/5] phy: core: rework phy_set_mode to accept phy mode and
 submode
Date: Wed, 7 Nov 2018 18:36:13 -0600
Message-ID: <20181108003617.10334-2-grygorii.strashko@ti.com>
References: <20181108003617.10334-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181108003617.10334-1-grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Quentin Schulz <quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Manu Gautam <mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Currently the attempt to add support for Ethernet interface mode PHY
(MII/GMII/RGMII) will lead to the necessity of extending enum phy_mode and
duplicate there values from phy_interface_t enum (or introduce more PHY
callbacks) [1]. Both approaches are ineffective and would lead to fast
bloating of enum phy_mode or struct phy_ops in the process of adding more
PHYs for different subsystems which will make them unmaintainable.

As discussed in [1] the solution could be to introduce dual level PHYs mode
configuration - PHY mode and PHY submode. The PHY mode will define generic
PHY type (subsystem - PCIE/ETHERNET/USB_) while the PHY submode - subsystem
specific interface mode. The last is usually already defined in
corresponding subsystem headers (phy_interface_t for Ethernet, enum
usb_device_speed for USB).

This patch is cumulative change which refactors PHY framework code to
support dual level PHYs mode configuration - PHY mode and PHY submode. It
extends .set_mode() callback to support additional parameter "int submode"
and converts all corresponding PHY drivers to support new .set_mode()
callback declaration.
The new extended PHY API
 int phy_set_mode_ext(struct phy *phy, enum phy_mode mode, int submode)
is introduced to support dual level PHYs mode configuration and existing
phy_set_mode() API is converted to macros, so PHY framework consumers do
not need to be changed (~21 matches).

[1] https://lkml.org/lkml/2018/10/25/366
Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 drivers/phy/allwinner/phy-sun4i-usb.c        |  3 ++-
 drivers/phy/amlogic/phy-meson-gxl-usb2.c     |  5 +++--
 drivers/phy/amlogic/phy-meson-gxl-usb3.c     |  5 +++--
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c |  3 ++-
 drivers/phy/mediatek/phy-mtk-tphy.c          |  2 +-
 drivers/phy/mediatek/phy-mtk-xsphy.c         |  2 +-
 drivers/phy/mscc/phy-ocelot-serdes.c         |  2 +-
 drivers/phy/phy-core.c                       |  6 +++---
 drivers/phy/qualcomm/phy-qcom-qmp.c          |  3 ++-
 drivers/phy/qualcomm/phy-qcom-qusb2.c        |  3 ++-
 drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c |  3 ++-
 drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c |  3 ++-
 drivers/phy/qualcomm/phy-qcom-usb-hs.c       |  3 ++-
 drivers/phy/ti/phy-da8xx-usb.c               |  3 ++-
 drivers/phy/ti/phy-tusb1210.c                |  2 +-
 include/linux/phy/phy.h                      | 13 ++++++++++---
 16 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index d4dcd39..1acdd73 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -474,7 +474,8 @@ static int sun4i_usb_phy_power_off(struct phy *_phy)
 	return 0;
 }
 
-static int sun4i_usb_phy_set_mode(struct phy *_phy, enum phy_mode mode)
+static int sun4i_usb_phy_set_mode(struct phy *_phy,
+				  enum phy_mode mode, int submode)
 {
 	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 9f9b541..148ef0b 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -152,7 +152,8 @@ static int phy_meson_gxl_usb2_reset(struct phy *phy)
 	return 0;
 }
 
-static int phy_meson_gxl_usb2_set_mode(struct phy *phy, enum phy_mode mode)
+static int phy_meson_gxl_usb2_set_mode(struct phy *phy,
+				       enum phy_mode mode, int submode)
 {
 	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
 
@@ -209,7 +210,7 @@ static int phy_meson_gxl_usb2_power_on(struct phy *phy)
 	/* power on the PHY by taking it out of reset mode */
 	regmap_update_bits(priv->regmap, U2P_R0, U2P_R0_POWER_ON_RESET, 0);
 
-	ret = phy_meson_gxl_usb2_set_mode(phy, priv->mode);
+	ret = phy_meson_gxl_usb2_set_mode(phy, priv->mode, 0);
 	if (ret) {
 		phy_meson_gxl_usb2_power_off(phy);
 
diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb3.c b/drivers/phy/amlogic/phy-meson-gxl-usb3.c
index d37d94d..c0e9e4c 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb3.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb3.c
@@ -119,7 +119,8 @@ static int phy_meson_gxl_usb3_power_off(struct phy *phy)
 	return 0;
 }
 
-static int phy_meson_gxl_usb3_set_mode(struct phy *phy, enum phy_mode mode)
+static int phy_meson_gxl_usb3_set_mode(struct phy *phy,
+				       enum phy_mode mode, int submode)
 {
 	struct phy_meson_gxl_usb3_priv *priv = phy_get_drvdata(phy);
 
@@ -164,7 +165,7 @@ static int phy_meson_gxl_usb3_init(struct phy *phy)
 	if (ret)
 		goto err_disable_clk_phy;
 
-	ret = phy_meson_gxl_usb3_set_mode(phy, priv->mode);
+	ret = phy_meson_gxl_usb3_set_mode(phy, priv->mode, 0);
 	if (ret)
 		goto err_disable_clk_peripheral;
 
diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 86a5f7b..79b52c3 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -512,7 +512,8 @@ static int mvebu_comphy_power_on(struct phy *phy)
 	return ret;
 }
 
-static int mvebu_comphy_set_mode(struct phy *phy, enum phy_mode mode)
+static int mvebu_comphy_set_mode(struct phy *phy,
+				 enum phy_mode mode, int submode)
 {
 	struct mvebu_comphy_lane *lane = phy_get_drvdata(phy);
 
diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 3eb8e1b..5b6a470 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -971,7 +971,7 @@ static int mtk_phy_exit(struct phy *phy)
 	return 0;
 }
 
-static int mtk_phy_set_mode(struct phy *phy, enum phy_mode mode)
+static int mtk_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct mtk_phy_instance *instance = phy_get_drvdata(phy);
 	struct mtk_tphy *tphy = dev_get_drvdata(phy->dev.parent);
diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index 020cd02..8c51131 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -426,7 +426,7 @@ static int mtk_phy_exit(struct phy *phy)
 	return 0;
 }
 
-static int mtk_phy_set_mode(struct phy *phy, enum phy_mode mode)
+static int mtk_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct xsphy_instance *inst = phy_get_drvdata(phy);
 	struct mtk_xsphy *xsphy = dev_get_drvdata(phy->dev.parent);
diff --git a/drivers/phy/mscc/phy-ocelot-serdes.c b/drivers/phy/mscc/phy-ocelot-serdes.c
index cbb49d9..c61a9890 100644
--- a/drivers/phy/mscc/phy-ocelot-serdes.c
+++ b/drivers/phy/mscc/phy-ocelot-serdes.c
@@ -158,7 +158,7 @@ static const struct serdes_mux ocelot_serdes_muxes[] = {
 		   HSIO_HW_CFG_PCIE_ENA),
 };
 
-static int serdes_set_mode(struct phy *phy, enum phy_mode mode)
+static int serdes_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct serdes_macro *macro = phy_get_drvdata(phy);
 	unsigned int i;
diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 35fd38c..df3d4ba 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -360,7 +360,7 @@ int phy_power_off(struct phy *phy)
 }
 EXPORT_SYMBOL_GPL(phy_power_off);
 
-int phy_set_mode(struct phy *phy, enum phy_mode mode)
+int phy_set_mode_ext(struct phy *phy, enum phy_mode mode, int submode)
 {
 	int ret;
 
@@ -368,14 +368,14 @@ int phy_set_mode(struct phy *phy, enum phy_mode mode)
 		return 0;
 
 	mutex_lock(&phy->mutex);
-	ret = phy->ops->set_mode(phy, mode);
+	ret = phy->ops->set_mode(phy, mode, submode);
 	if (!ret)
 		phy->attrs.mode = mode;
 	mutex_unlock(&phy->mutex);
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(phy_set_mode);
+EXPORT_SYMBOL_GPL(phy_set_mode_ext);
 
 int phy_reset(struct phy *phy)
 {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index a833324..514db72 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1365,7 +1365,8 @@ static int qcom_qmp_phy_poweron(struct phy *phy)
 	return ret;
 }
 
-static int qcom_qmp_phy_set_mode(struct phy *phy, enum phy_mode mode)
+static int qcom_qmp_phy_set_mode(struct phy *phy,
+				 enum phy_mode mode, int submode)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 9ce5311..098d793 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -423,7 +423,8 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
 
 }
 
-static int qusb2_phy_set_mode(struct phy *phy, enum phy_mode mode)
+static int qusb2_phy_set_mode(struct phy *phy,
+			      enum phy_mode mode, int submode)
 {
 	struct qusb2_phy *qphy = phy_get_drvdata(phy);
 
diff --git a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c b/drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c
index ba1895b..1e0d4f2 100644
--- a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c
@@ -65,7 +65,8 @@ static int ufs_qcom_phy_qmp_14nm_exit(struct phy *generic_phy)
 }
 
 static
-int ufs_qcom_phy_qmp_14nm_set_mode(struct phy *generic_phy, enum phy_mode mode)
+int ufs_qcom_phy_qmp_14nm_set_mode(struct phy *generic_phy,
+				   enum phy_mode mode, int submode)
 {
 	struct ufs_qcom_phy *phy_common = get_ufs_qcom_phy(generic_phy);
 
diff --git a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c b/drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c
index 49f435c..aef40f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c
@@ -84,7 +84,8 @@ static int ufs_qcom_phy_qmp_20nm_exit(struct phy *generic_phy)
 }
 
 static
-int ufs_qcom_phy_qmp_20nm_set_mode(struct phy *generic_phy, enum phy_mode mode)
+int ufs_qcom_phy_qmp_20nm_set_mode(struct phy *generic_phy,
+				   enum phy_mode mode, int submode)
 {
 	struct ufs_qcom_phy *phy_common = get_ufs_qcom_phy(generic_phy);
 
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
index abbbe75..04934f8 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
@@ -42,7 +42,8 @@ struct qcom_usb_hs_phy {
 	struct notifier_block vbus_notify;
 };
 
-static int qcom_usb_hs_phy_set_mode(struct phy *phy, enum phy_mode mode)
+static int qcom_usb_hs_phy_set_mode(struct phy *phy,
+				    enum phy_mode mode, int submode)
 {
 	struct qcom_usb_hs_phy *uphy = phy_get_drvdata(phy);
 	u8 addr;
diff --git a/drivers/phy/ti/phy-da8xx-usb.c b/drivers/phy/ti/phy-da8xx-usb.c
index befb886..d5f4fbc 100644
--- a/drivers/phy/ti/phy-da8xx-usb.c
+++ b/drivers/phy/ti/phy-da8xx-usb.c
@@ -93,7 +93,8 @@ static int da8xx_usb20_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int da8xx_usb20_phy_set_mode(struct phy *phy, enum phy_mode mode)
+static int da8xx_usb20_phy_set_mode(struct phy *phy,
+				    enum phy_mode mode, int submode)
 {
 	struct da8xx_usb_phy *d_phy = phy_get_drvdata(phy);
 	u32 val;
diff --git a/drivers/phy/ti/phy-tusb1210.c b/drivers/phy/ti/phy-tusb1210.c
index b8ec39a..329fb93 100644
--- a/drivers/phy/ti/phy-tusb1210.c
+++ b/drivers/phy/ti/phy-tusb1210.c
@@ -53,7 +53,7 @@ static int tusb1210_power_off(struct phy *phy)
 	return 0;
 }
 
-static int tusb1210_set_mode(struct phy *phy, enum phy_mode mode)
+static int tusb1210_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct tusb1210 *tusb = phy_get_drvdata(phy);
 	int ret;
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 03b319f..b17e770 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -60,7 +60,7 @@ struct phy_ops {
 	int	(*exit)(struct phy *phy);
 	int	(*power_on)(struct phy *phy);
 	int	(*power_off)(struct phy *phy);
-	int	(*set_mode)(struct phy *phy, enum phy_mode mode);
+	int	(*set_mode)(struct phy *phy, enum phy_mode mode, int submode);
 	int	(*reset)(struct phy *phy);
 	int	(*calibrate)(struct phy *phy);
 	struct module *owner;
@@ -164,7 +164,10 @@ int phy_init(struct phy *phy);
 int phy_exit(struct phy *phy);
 int phy_power_on(struct phy *phy);
 int phy_power_off(struct phy *phy);
-int phy_set_mode(struct phy *phy, enum phy_mode mode);
+int phy_set_mode_ext(struct phy *phy, enum phy_mode mode, int submode);
+#define phy_set_mode(phy, mode) \
+	phy_set_mode_ext(phy, mode, 0)
+
 static inline enum phy_mode phy_get_mode(struct phy *phy)
 {
 	return phy->attrs.mode;
@@ -278,13 +281,17 @@ static inline int phy_power_off(struct phy *phy)
 	return -ENOSYS;
 }
 
-static inline int phy_set_mode(struct phy *phy, enum phy_mode mode)
+static inline int phy_set_mode_ext(struct phy *phy, enum phy_mode mode,
+				   int submode)
 {
 	if (!phy)
 		return 0;
 	return -ENOSYS;
 }
 
+#define phy_set_mode(phy, mode) \
+	phy_set_mode_ext(phy, mode, 0)
+
 static inline enum phy_mode phy_get_mode(struct phy *phy)
 {
 	return PHY_MODE_INVALID;
-- 
2.10.5
