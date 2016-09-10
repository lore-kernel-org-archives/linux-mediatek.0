From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] drm/mediatek: Remove redundant dev_err call in mtk_drm_probe()
Date: Sat, 10 Sep 2016 12:33:29 +0000
Message-ID: <1473510809-26606-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

From: Wei Yongjun <weiyongjun1@huawei.com>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 72c1ae4..f4f90e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -365,12 +365,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	private->config_regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(private->config_regs)) {
-		ret = PTR_ERR(private->config_regs);
-		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(private->config_regs))
+		return PTR_ERR(private->config_regs);
 
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(dev->of_node->parent, node) {
