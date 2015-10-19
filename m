From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/9] clockevents/drivers/mtk: Fix spurious interrupt leading
 to crash
Date: Mon, 19 Oct 2015 22:59:20 +0200
Message-ID: <1445288368-6440-1-git-send-email-daniel.lezcano@linaro.org>
References: <56255943.6060807@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <56255943.6060807-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "moderated list:ARM/Mediatek SoC..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

After analysis done by Yingjoe Chen, the timer appears to have a pending
interrupt when it is enabled.

Fix this by acknowledging the pending interrupt when enabling the timer
interrupt.

Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Tested-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/clocksource/mtk_timer.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index 50f0641..c8badc4 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -141,14 +141,6 @@ static irqreturn_t mtk_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void mtk_timer_global_reset(struct mtk_clock_event_device *evt)
-{
-	/* Disable all interrupts */
-	writel(0x0, evt->gpt_base + GPT_IRQ_EN_REG);
-	/* Acknowledge all interrupts */
-	writel(0x3f, evt->gpt_base + GPT_IRQ_ACK_REG);
-}
-
 static void
 mtk_timer_setup(struct mtk_clock_event_device *evt, u8 timer, u8 option)
 {
@@ -168,6 +160,12 @@ static void mtk_timer_enable_irq(struct mtk_clock_event_device *evt, u8 timer)
 {
 	u32 val;
 
+	/* Disable all interrupts */
+	writel(0x0, evt->gpt_base + GPT_IRQ_EN_REG);
+
+	/* Acknowledge all spurious pending interrupts */
+	writel(0x3f, evt->gpt_base + GPT_IRQ_ACK_REG);
+
 	val = readl(evt->gpt_base + GPT_IRQ_EN_REG);
 	writel(val | GPT_IRQ_ENABLE(timer),
 			evt->gpt_base + GPT_IRQ_EN_REG);
@@ -220,8 +218,6 @@ static void __init mtk_timer_init(struct device_node *node)
 	}
 	rate = clk_get_rate(clk);
 
-	mtk_timer_global_reset(evt);
-
 	if (request_irq(evt->dev.irq, mtk_timer_interrupt,
 			IRQF_TIMER | IRQF_IRQPOLL, "mtk_timer", evt)) {
 		pr_warn("failed to setup irq %d\n", evt->dev.irq);
-- 
1.9.1
