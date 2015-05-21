From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] irqchip: irq-mtk-sysirq: Make mtk_sysirq_of_init return
 error if ioremap fails
Date: Thu, 21 May 2015 22:57:34 +0800
Message-ID: <1432220254.29544.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

PTR_ERR(NULL) returns 0 so current code returns 0 if ioremap fails, fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/irqchip/irq-mtk-sysirq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 04de2d4..15c1303 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -144,7 +144,7 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 	chip_data->intpol_base = ioremap(res.start, size);
 	if (!chip_data->intpol_base) {
 		pr_err("mtk_sysirq: unable to map sysirq register\n");
-		ret = PTR_ERR(chip_data->intpol_base);
+		ret = -ENXIO;
 		goto out_free;
 	}
 
-- 
2.1.0
