From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [RFC PATCH 2/3] clocksource: mtk_timer: change pr_warn()s to pr_err()s in mtk_timer_init
Date: Fri,  4 Sep 2015 06:21:39 +0300
Message-ID: <1441336900-15095-2-git-send-email-alexey.klimov@linaro.org>
References: <1441336900-15095-1-git-send-email-alexey.klimov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441336900-15095-1-git-send-email-alexey.klimov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Cc: yingjoe.chen@mediatek.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, klimov.linux@gmail.com, Alexey Klimov <alexey.klimov@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

These messages are actually errors and not warnings.
Use pr_err() macro for them and add missing \n.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clocksource/mtk_timer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index ca5ea9e..fbaacbf 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -184,7 +184,7 @@ static void __init mtk_timer_init(struct device_node *node)
 
 	evt = kzalloc(sizeof(*evt), GFP_KERNEL);
 	if (!evt) {
-		pr_warn("Can't allocate mtk clock event driver struct");
+		pr_err("Can't allocate mtk clock event driver struct\n");
 		return;
 	}
 
@@ -200,24 +200,24 @@ static void __init mtk_timer_init(struct device_node *node)
 
 	evt->gpt_base = of_io_request_and_map(node, 0, "mtk-timer");
 	if (IS_ERR(evt->gpt_base)) {
-		pr_warn("Can't get resource\n");
+		pr_err("Can't get resource\n");
 		return;
 	}
 
 	evt->dev.irq = irq_of_parse_and_map(node, 0);
 	if (evt->dev.irq <= 0) {
-		pr_warn("Can't parse IRQ");
+		pr_err("Can't parse IRQ\n");
 		goto err_mem;
 	}
 
 	clk = of_clk_get(node, 0);
 	if (IS_ERR(clk)) {
-		pr_warn("Can't get timer clock");
+		pr_err("Can't get timer clock\n");
 		goto err_irq;
 	}
 
 	if (clk_prepare_enable(clk)) {
-		pr_warn("Can't prepare clock");
+		pr_err("Can't prepare clock\n");
 		goto err_clk_put;
 	}
 	rate = clk_get_rate(clk);
@@ -226,7 +226,7 @@ static void __init mtk_timer_init(struct device_node *node)
 
 	if (request_irq(evt->dev.irq, mtk_timer_interrupt,
 			IRQF_TIMER | IRQF_IRQPOLL, "mtk_timer", evt)) {
-		pr_warn("failed to setup irq %d\n", evt->dev.irq);
+		pr_err("failed to setup irq %d\n", evt->dev.irq);
 		goto err_clk_disable;
 	}
 
-- 
2.1.4
