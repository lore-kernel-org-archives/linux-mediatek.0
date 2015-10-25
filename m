From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 2/3] clocksource: mtk_timer: fix pr_warn() messages in mtk_timer_init
Date: Sun, 25 Oct 2015 23:21:23 +0000
Message-ID: <1445815284-10425-2-git-send-email-alexey.klimov@linaro.org>
References: <1445815284-10425-1-git-send-email-alexey.klimov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445815284-10425-1-git-send-email-alexey.klimov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, joe@perches.com
Cc: linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, tglx@linutronix.de, klimov.linux@gmail.com, Alexey Klimov <alexey.klimov@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

1) Change pr_warn()s to pr_err()s. These messages are actually
errors and not warnings.
2) Add missing \n.
3) Error message for kzalloc() failure is removed per suggestion
by Joe Perches. There is generic stack_dump() for allocation issues.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
  -- small cleanup

Changes in v2:
  -- remove message on allocation failure

 drivers/clocksource/mtk_timer.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index ca5ea9e..4ddddf4 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -183,10 +183,8 @@ static void __init mtk_timer_init(struct device_node *node)
 	struct clk *clk;
 
 	evt = kzalloc(sizeof(*evt), GFP_KERNEL);
-	if (!evt) {
-		pr_warn("Can't allocate mtk clock event driver struct");
+	if (!evt)
 		return;
-	}
 
 	evt->dev.name = "mtk_tick";
 	evt->dev.rating = 300;
@@ -200,24 +198,24 @@ static void __init mtk_timer_init(struct device_node *node)
 
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
@@ -226,7 +224,7 @@ static void __init mtk_timer_init(struct device_node *node)
 
 	if (request_irq(evt->dev.irq, mtk_timer_interrupt,
 			IRQF_TIMER | IRQF_IRQPOLL, "mtk_timer", evt)) {
-		pr_warn("failed to setup irq %d\n", evt->dev.irq);
+		pr_err("failed to setup irq %d\n", evt->dev.irq);
 		goto err_clk_disable;
 	}
 
-- 
2.1.4
