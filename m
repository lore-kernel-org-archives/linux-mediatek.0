From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] [media] media: mtk-mdp: fix reference count on old device tree
Date: Fri, 21 Jun 2019 13:32:50 +0200
Message-ID: <20190621113250.4946-1-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org, djkurtz@chromium.org
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

of_get_next_child() increments the reference count of the returning
device_node. Decrement it in the check if we are using the old or the
new DTB.

Fixes: ba1f1f70c2c0 ("[media] media: mtk-mdp: Fix mdp device tree")
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index bbb24fb95b95..bafe53c5d54a 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -118,7 +118,9 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	mutex_init(&mdp->vpulock);
 
 	/* Old dts had the components as child nodes */
-	if (of_get_next_child(dev->of_node, NULL)) {
+	parent = of_get_next_child(dev->of_node, NULL);
+	if (parent) {
+		of_node_put(parent);
 		parent = dev->of_node;
 		dev_warn(dev, "device tree is out of date\n");
 	} else {
-- 
2.21.0
