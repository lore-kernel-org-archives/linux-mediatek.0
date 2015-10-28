From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] phy: core: Get a refcount to phy in devm_of_phy_get_by_index()
Date: Wed, 28 Oct 2015 11:28:45 +0800
Message-ID: <1446002925-6149-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, Arun Ramamurthy <arun.ramamurthy@broadcom.com>
List-Id: linux-mediatek@lists.infradead.org

On driver detach, devm_phy_release() will put a refcount to
the phy, so gets a refconut to it before return.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/phy-core.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index fc48fac..8c7f27d 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -636,8 +636,9 @@ EXPORT_SYMBOL_GPL(devm_of_phy_get);
  * @np: node containing the phy
  * @index: index of the phy
  *
- * Gets the phy using _of_phy_get(), and associates a device with it using
- * devres. On driver detach, release function is invoked on the devres data,
+ * Gets the phy using _of_phy_get(), then gets a refcount to it,
+ * and associates a device with it using devres. On driver detach,
+ * release function is invoked on the devres data,
  * then, devres data is freed.
  *
  */
@@ -651,13 +652,21 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 		return ERR_PTR(-ENOMEM);
 
 	phy = _of_phy_get(np, index);
-	if (!IS_ERR(phy)) {
-		*ptr = phy;
-		devres_add(dev, ptr);
-	} else {
+	if (IS_ERR(phy)) {
 		devres_free(ptr);
+		return phy;
 	}
 
+	if (!try_module_get(phy->ops->owner)) {
+		devres_free(ptr);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	get_device(&phy->dev);
+
+	*ptr = phy;
+	devres_add(dev, ptr);
+
 	return phy;
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
-- 
1.8.1.1.dirty
