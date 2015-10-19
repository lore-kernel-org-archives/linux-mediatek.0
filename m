From: Alexey Klimov <alexey.klimov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/3] clocksource: mtk_timer: fix pr_warn() messages in
 mtk_timer_init
Date: Mon, 19 Oct 2015 03:09:24 +0300
Message-ID: <1445213365-24530-2-git-send-email-alexey.klimov@linaro.org>
References: <1445213365-24530-1-git-send-email-alexey.klimov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1445213365-24530-1-git-send-email-alexey.klimov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Alexey Klimov <alexey.klimov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

1) Change pr_warn()s to pr_err()s. These messages are actually
errors and not warnings.
2) Add missing \n.
3) Error message for kzalloc() failure is removed per suggestion
by Joe Perches. There is generic stack_dump() for allocation issues.

Signed-off-by: Alexey Klimov <alexey.klimov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clocksource/mtk_timer.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index ca5ea9e..ac92ca2 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -184,7 +184,6 @@ static void __init mtk_timer_init(struct device_node *node)
 
 	evt = kzalloc(sizeof(*evt), GFP_KERNEL);
 	if (!evt) {
-		pr_warn("Can't allocate mtk clock event driver struct");
 		return;
 	}
 
@@ -200,24 +199,24 @@ static void __init mtk_timer_init(struct device_node *node)
 
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
@@ -226,7 +225,7 @@ static void __init mtk_timer_init(struct device_node *node)
 
 	if (request_irq(evt->dev.irq, mtk_timer_interrupt,
 			IRQF_TIMER | IRQF_IRQPOLL, "mtk_timer", evt)) {
-		pr_warn("failed to setup irq %d\n", evt->dev.irq);
+		pr_err("failed to setup irq %d\n", evt->dev.irq);
 		goto err_clk_disable;
 	}
 
-- 
2.1.4
