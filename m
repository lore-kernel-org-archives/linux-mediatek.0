From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v3 4/6] usb: dwc2: get optional clock by devm_clk_get_optional()
Date: Wed, 17 Apr 2019 16:28:19 +0800
Message-ID: <39be1493f7760c3c06858046f64d02e7cb86884e.1555488276.git.chunfeng.yun@mediatek.com>
References: <bacafa9a60c2f437e2be0ccdf504492343fc0a66.1555488276.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bacafa9a60c2f437e2be0ccdf504492343fc0a66.1555488276.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Minas Harutyunyan <hminas@synopsys.com>
List-Id: linux-mediatek@lists.infradead.org

When the driver tries to get optional clock, it ignores all errors,
but if only ignores -ENOENT, it will cover some real errors, such as
-EPROBE_DEFER, so use devm_clk_get_optional() to get optional clock.

Cc: Minas Harutyunyan <hminas@synopsys.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Minas Harutyunyan <hminas@synopsys.com>
---
v3: modify changelog comment
v2: add Acked-by Minas Harutyunyan
---
 drivers/usb/dwc2/platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c0b64d483552..9aa9682a5cd2 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -284,10 +284,10 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 	}
 
 	/* Clock */
-	hsotg->clk = devm_clk_get(hsotg->dev, "otg");
+	hsotg->clk = devm_clk_get_optional(hsotg->dev, "otg");
 	if (IS_ERR(hsotg->clk)) {
-		hsotg->clk = NULL;
-		dev_dbg(hsotg->dev, "cannot get otg clock\n");
+		dev_err(hsotg->dev, "cannot get otg clock\n");
+		return PTR_ERR(hsotg->clk);
 	}
 
 	/* Regulators */
-- 
2.21.0
