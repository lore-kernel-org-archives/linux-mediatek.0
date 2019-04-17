From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v3 6/6] usb: mtu3: get optional clock by devm_clk_get_optional()
Date: Wed, 17 Apr 2019 16:28:21 +0800
Message-ID: <80f2a1a7ff74202ab2d2af74addcf1f8551fff19.1555488276.git.chunfeng.yun@mediatek.com>
References: <bacafa9a60c2f437e2be0ccdf504492343fc0a66.1555488276.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bacafa9a60c2f437e2be0ccdf504492343fc0a66.1555488276.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Use devm_clk_get_optional() to get optional clock instead of
optional_clk_get() which uses devm_clk_get() to get clock and
checks for -EPROBE_DEFER but not -ENOENT as devm_clk_get_optional()
does, in fact, only ignoring -ENOENT will cover more errors, so
the replacement doesn't change original purpose.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
v3:
  1. modify changelog comment
  2. add Reviewed-by Matthias

v2: new patch, merged into this series from
    https://patchwork.kernel.org/patch/10878235/
---
 drivers/usb/mtu3/mtu3_plat.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index e086630e41a9..745a1da5c9c0 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -210,19 +210,6 @@ static void ssusb_ip_sw_reset(struct ssusb_mtk *ssusb)
 	mtu3_setbits(ssusb->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
 }
 
-/* ignore the error if the clock does not exist */
-static struct clk *get_optional_clk(struct device *dev, const char *id)
-{
-	struct clk *opt_clk;
-
-	opt_clk = devm_clk_get(dev, id);
-	/* ignore error number except EPROBE_DEFER */
-	if (IS_ERR(opt_clk) && (PTR_ERR(opt_clk) != -EPROBE_DEFER))
-		opt_clk = NULL;
-
-	return opt_clk;
-}
-
 static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -245,15 +232,15 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 		return PTR_ERR(ssusb->sys_clk);
 	}
 
-	ssusb->ref_clk = get_optional_clk(dev, "ref_ck");
+	ssusb->ref_clk = devm_clk_get_optional(dev, "ref_ck");
 	if (IS_ERR(ssusb->ref_clk))
 		return PTR_ERR(ssusb->ref_clk);
 
-	ssusb->mcu_clk = get_optional_clk(dev, "mcu_ck");
+	ssusb->mcu_clk = devm_clk_get_optional(dev, "mcu_ck");
 	if (IS_ERR(ssusb->mcu_clk))
 		return PTR_ERR(ssusb->mcu_clk);
 
-	ssusb->dma_clk = get_optional_clk(dev, "dma_ck");
+	ssusb->dma_clk = devm_clk_get_optional(dev, "dma_ck");
 	if (IS_ERR(ssusb->dma_clk))
 		return PTR_ERR(ssusb->dma_clk);
 
-- 
2.21.0
