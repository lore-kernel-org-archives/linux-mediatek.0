From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH usb v5 2/6] usb: core: split usb_phy_roothub_{init,alloc}
Date: Sun,  8 Apr 2018 23:27:39 +0200
Message-ID: <20180408212743.22934-3-martin.blumenstingl@googlemail.com>
References: <20180408212743.22934-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180408212743.22934-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: d-gerlach-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, j-keerthy-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, rogerq-l0cyMroinI0@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Before this patch usb_phy_roothub_init served two purposes (from a
caller's point of view - like hcd.c):
- parsing the PHYs and allocating the list entries
- calling phy_init on each list entry

While this worked so far it has one disadvantage: if we need to call
phy_init for each PHY instance then the existing code cannot be re-used.
Solve this by splitting off usb_phy_roothub_alloc which only parses the
PHYs and allocates the list entries.
usb_phy_roothub_init then gets a struct usb_phy_roothub and only calls
phy_init on each PHY instance (along with the corresponding cleanup if
that failed somewhere).

This is a preparation step for adding proper suspend support for some
hardware that requires phy_exit to be called during suspend and phy_init
to be called during resume.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Tested-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/core/hcd.c | 10 +++++---
 drivers/usb/core/phy.c | 53 +++++++++++++++++++++---------------------
 drivers/usb/core/phy.h |  4 +++-
 3 files changed, 37 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 777036ae6367..15b0418e3b6a 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2758,12 +2758,16 @@ int usb_add_hcd(struct usb_hcd *hcd,
 	}
 
 	if (!hcd->skip_phy_initialization && usb_hcd_is_primary_hcd(hcd)) {
-		hcd->phy_roothub = usb_phy_roothub_init(hcd->self.sysdev);
+		hcd->phy_roothub = usb_phy_roothub_alloc(hcd->self.sysdev);
 		if (IS_ERR(hcd->phy_roothub)) {
 			retval = PTR_ERR(hcd->phy_roothub);
-			goto err_phy_roothub_init;
+			goto err_phy_roothub_alloc;
 		}
 
+		retval = usb_phy_roothub_init(hcd->phy_roothub);
+		if (retval)
+			goto err_phy_roothub_alloc;
+
 		retval = usb_phy_roothub_power_on(hcd->phy_roothub);
 		if (retval)
 			goto err_usb_phy_roothub_power_on;
@@ -2936,7 +2940,7 @@ int usb_add_hcd(struct usb_hcd *hcd,
 	usb_phy_roothub_power_off(hcd->phy_roothub);
 err_usb_phy_roothub_power_on:
 	usb_phy_roothub_exit(hcd->phy_roothub);
-err_phy_roothub_init:
+err_phy_roothub_alloc:
 	if (hcd->remove_phy && hcd->usb_phy) {
 		usb_phy_shutdown(hcd->usb_phy);
 		usb_put_phy(hcd->usb_phy);
diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index f19aaa3c899c..44f008cda7a8 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -19,19 +19,6 @@ struct usb_phy_roothub {
 	struct list_head	list;
 };
 
-static struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev)
-{
-	struct usb_phy_roothub *roothub_entry;
-
-	roothub_entry = devm_kzalloc(dev, sizeof(*roothub_entry), GFP_KERNEL);
-	if (!roothub_entry)
-		return ERR_PTR(-ENOMEM);
-
-	INIT_LIST_HEAD(&roothub_entry->list);
-
-	return roothub_entry;
-}
-
 static int usb_phy_roothub_add_phy(struct device *dev, int index,
 				   struct list_head *list)
 {
@@ -45,9 +32,11 @@ static int usb_phy_roothub_add_phy(struct device *dev, int index,
 			return PTR_ERR(phy);
 	}
 
-	roothub_entry = usb_phy_roothub_alloc(dev);
-	if (IS_ERR(roothub_entry))
-		return PTR_ERR(roothub_entry);
+	roothub_entry = devm_kzalloc(dev, sizeof(*roothub_entry), GFP_KERNEL);
+	if (!roothub_entry)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&roothub_entry->list);
 
 	roothub_entry->phy = phy;
 
@@ -56,11 +45,9 @@ static int usb_phy_roothub_add_phy(struct device *dev, int index,
 	return 0;
 }
 
-struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev)
+struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev)
 {
 	struct usb_phy_roothub *phy_roothub;
-	struct usb_phy_roothub *roothub_entry;
-	struct list_head *head;
 	int i, num_phys, err;
 
 	num_phys = of_count_phandle_with_args(dev->of_node, "phys",
@@ -68,16 +55,31 @@ struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev)
 	if (num_phys <= 0)
 		return NULL;
 
-	phy_roothub = usb_phy_roothub_alloc(dev);
-	if (IS_ERR(phy_roothub))
-		return phy_roothub;
+	phy_roothub = devm_kzalloc(dev, sizeof(*phy_roothub), GFP_KERNEL);
+	if (!phy_roothub)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&phy_roothub->list);
 
 	for (i = 0; i < num_phys; i++) {
 		err = usb_phy_roothub_add_phy(dev, i, &phy_roothub->list);
 		if (err)
-			goto err_out;
+			return ERR_PTR(err);
 	}
 
+	return phy_roothub;
+}
+EXPORT_SYMBOL_GPL(usb_phy_roothub_alloc);
+
+int usb_phy_roothub_init(struct usb_phy_roothub *phy_roothub)
+{
+	struct usb_phy_roothub *roothub_entry;
+	struct list_head *head;
+	int err;
+
+	if (!phy_roothub)
+		return 0;
+
 	head = &phy_roothub->list;
 
 	list_for_each_entry(roothub_entry, head, list) {
@@ -86,14 +88,13 @@ struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev)
 			goto err_exit_phys;
 	}
 
-	return phy_roothub;
+	return 0;
 
 err_exit_phys:
 	list_for_each_entry_continue_reverse(roothub_entry, head, list)
 		phy_exit(roothub_entry->phy);
 
-err_out:
-	return ERR_PTR(err);
+	return err;
 }
 EXPORT_SYMBOL_GPL(usb_phy_roothub_init);
 
diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
index 6fde59bfbff8..eb31253201ad 100644
--- a/drivers/usb/core/phy.h
+++ b/drivers/usb/core/phy.h
@@ -1,6 +1,8 @@
 struct usb_phy_roothub;
 
-struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev);
+struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev);
+
+int usb_phy_roothub_init(struct usb_phy_roothub *phy_roothub);
 int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
 
 int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
-- 
2.17.0
