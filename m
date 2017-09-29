From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 08/11] hack: drm/mediatek: roll back
 drm_of_find_panel_or_bridge() use
Date: Fri, 29 Sep 2017 15:09:10 +0200
Message-ID: <1506690553-27357-9-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1506690553-27357-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1506690553-27357-1-git-send-email-ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org
Cc: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Haven't looked into how to do this properly.

Fixes display initialization on the Acer Chromebook R13.

Reverts mediatek part of ebc9446135671b89c2397f438af45d9cef0d1368
("drm: convert drivers to use drm_of_find_panel_or_bridge")

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7e5e24c..fd10cc4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1093,6 +1093,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
+	struct device_node *remote_node, *endpoint;
 	struct resource *regs;
 	int irq_num;
 	int comp_id;
@@ -1105,10 +1106,22 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &dsi->panel, &dsi->bridge);
-	if (ret)
-		return ret;
+	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	if (endpoint) {
+		remote_node = of_graph_get_remote_port_parent(endpoint);
+		if (!remote_node) {
+			dev_err(dev, "No panel connected\n");
+			return -ENODEV;
+		}
+
+		dsi->bridge = of_drm_find_bridge(remote_node);
+		dsi->panel = of_drm_find_panel(remote_node);
+		of_node_put(remote_node);
+		if (!dsi->bridge && !dsi->panel) {
+			dev_info(dev, "Waiting for bridge or panel driver\n");
+			return -EPROBE_DEFER;
+		}
+	}
 
 	dsi->engine_clk = devm_clk_get(dev, "engine");
 	if (IS_ERR(dsi->engine_clk)) {
-- 
2.7.4
