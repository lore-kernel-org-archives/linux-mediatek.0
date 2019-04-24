From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V5 2/9] usb: roles: add API to get usb_role_switch by node
Date: Wed, 24 Apr 2019 10:22:16 +0100
Message-ID: <1556097743-12717-3-git-send-email-biju.das@bp.renesas.com>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Simon Horman <horms@verge.net.au>, linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org, Jun Li <jun.li@nxp.com>
List-Id: linux-mediatek@lists.infradead.org

From: Chunfeng Yun <chunfeng.yun@mediatek.com>

Add fwnode_usb_role_switch_get() to make easier to get
usb_role_switch by fwnode which register it.
It's useful when there is not device_connection registered
between two drivers and only knows the fwnode which register
usb_role_switch.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 * Rebased on top of patch1 in this series. Incorporated Heikki's review comments
   (https://patchwork.kernel.org/patch/10882555/)

 Note:- This patch is added to this series to avoid compilation issues.
---
 drivers/usb/roles/class.c | 25 +++++++++++++++++++++++++
 include/linux/usb/role.h  |  8 ++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index f45d8df..a0847a8 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -136,6 +136,31 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 EXPORT_SYMBOL_GPL(usb_role_switch_get);
 
 /**
+ * fwnode_usb_role_switch_get - Find USB role switch by it's parent fwnode
+ * @fwnode: The fwnode that register USB role switch
+ *
+ * Finds and returns role switch registered by @fwnode. The reference count
+ * for the found switch is incremented.
+ */
+struct usb_role_switch *
+fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
+{
+	struct usb_role_switch *sw;
+	struct device *dev;
+
+	dev = class_find_device(role_class, NULL, fwnode,
+				switch_fwnode_match);
+	if (!dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	sw = to_role_switch(dev);
+	WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+
+	return sw;
+}
+EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
+
+/**
  * usb_role_switch_put - Release handle to a switch
  * @sw: USB Role Switch
  *
diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index da2b964..0f6e2829 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -47,6 +47,8 @@ struct usb_role_switch_desc {
 int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
 enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
 struct usb_role_switch *usb_role_switch_get(struct device *dev);
+struct usb_role_switch *
+fwnode_usb_role_switch_get(struct fwnode_handle *fwnode);
 void usb_role_switch_put(struct usb_role_switch *sw);
 
 struct usb_role_switch *
@@ -70,6 +72,12 @@ static inline struct usb_role_switch *usb_role_switch_get(struct device *dev)
 	return ERR_PTR(-ENODEV);
 }
 
+struct usb_role_switch *
+fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void usb_role_switch_put(struct usb_role_switch *sw) { }
 
 static inline struct usb_role_switch *
-- 
2.7.4
