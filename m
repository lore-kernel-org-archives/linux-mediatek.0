From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 2/2] usb: xhci-mtk: add an optional xhci_ck clock
Date: Tue, 30 Jul 2019 15:34:16 +0800
Message-ID: <1564472056-27875-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1564472056-27875-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1564472056-27875-1-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Some SoCs may have an optional clock xhci_ck (125M or 200M), it
usually uses the same PLL as sys_ck, so support it.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2 no changes
---
 drivers/usb/host/xhci-mtk.c | 13 +++++++++++++
 drivers/usb/host/xhci-mtk.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 026fe18972d3..b18a6baef204 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -216,6 +216,10 @@ static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
 		return PTR_ERR(mtk->sys_clk);
 	}
 
+	mtk->xhci_clk = devm_clk_get_optional(dev, "xhci_ck");
+	if (IS_ERR(mtk->xhci_clk))
+		return PTR_ERR(mtk->xhci_clk);
+
 	mtk->ref_clk = devm_clk_get_optional(dev, "ref_ck");
 	if (IS_ERR(mtk->ref_clk))
 		return PTR_ERR(mtk->ref_clk);
@@ -244,6 +248,12 @@ static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
 		goto sys_clk_err;
 	}
 
+	ret = clk_prepare_enable(mtk->xhci_clk);
+	if (ret) {
+		dev_err(mtk->dev, "failed to enable xhci_clk\n");
+		goto xhci_clk_err;
+	}
+
 	ret = clk_prepare_enable(mtk->mcu_clk);
 	if (ret) {
 		dev_err(mtk->dev, "failed to enable mcu_clk\n");
@@ -261,6 +271,8 @@ static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
 dma_clk_err:
 	clk_disable_unprepare(mtk->mcu_clk);
 mcu_clk_err:
+	clk_disable_unprepare(mtk->xhci_clk);
+xhci_clk_err:
 	clk_disable_unprepare(mtk->sys_clk);
 sys_clk_err:
 	clk_disable_unprepare(mtk->ref_clk);
@@ -272,6 +284,7 @@ static void xhci_mtk_clks_disable(struct xhci_hcd_mtk *mtk)
 {
 	clk_disable_unprepare(mtk->dma_clk);
 	clk_disable_unprepare(mtk->mcu_clk);
+	clk_disable_unprepare(mtk->xhci_clk);
 	clk_disable_unprepare(mtk->sys_clk);
 	clk_disable_unprepare(mtk->ref_clk);
 }
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 8be8c5f7ff62..5ac458b7d2e0 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -139,6 +139,7 @@ struct xhci_hcd_mtk {
 	struct regulator *vusb33;
 	struct regulator *vbus;
 	struct clk *sys_clk;	/* sys and mac clock */
+	struct clk *xhci_clk;
 	struct clk *ref_clk;
 	struct clk *mcu_clk;
 	struct clk *dma_clk;
-- 
2.21.0
