From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 22/74] clockevents/drivers/mtk: Migrate to new 'set-state'
 interface
Date: Mon, 10 Aug 2015 11:51:39 +0200
Message-ID: <1439200352-26767-22-git-send-email-daniel.lezcano@linaro.org>
References: <55C87382.4070309@linaro.org>
 <1439200352-26767-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1439200352-26767-1-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, "moderated list:ARM/Mediatek SoC..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Migrate mtk driver to the new 'set-state' interface provided by
clockevents core, the earlier 'set-mode' interface is marked obsolete
now.

This also enables us to implement callbacks for new states of clockevent
devices, for example: ONESHOT_STOPPED.

Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clocksource/mtk_timer.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index 68ab423..50f0641 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -102,27 +102,20 @@ static void mtk_clkevt_time_start(struct mtk_clock_event_device *evt,
 	       evt->gpt_base + TIMER_CTRL_REG(timer));
 }
 
-static void mtk_clkevt_mode(enum clock_event_mode mode,
-				struct clock_event_device *clk)
+static int mtk_clkevt_shutdown(struct clock_event_device *clk)
+{
+	mtk_clkevt_time_stop(to_mtk_clk(clk), GPT_CLK_EVT);
+	return 0;
+}
+
+static int mtk_clkevt_set_periodic(struct clock_event_device *clk)
 {
 	struct mtk_clock_event_device *evt = to_mtk_clk(clk);
 
 	mtk_clkevt_time_stop(evt, GPT_CLK_EVT);
-
-	switch (mode) {
-	case CLOCK_EVT_MODE_PERIODIC:
-		mtk_clkevt_time_setup(evt, evt->ticks_per_jiffy, GPT_CLK_EVT);
-		mtk_clkevt_time_start(evt, true, GPT_CLK_EVT);
-		break;
-	case CLOCK_EVT_MODE_ONESHOT:
-		/* Timer is enabled in set_next_event */
-		break;
-	case CLOCK_EVT_MODE_UNUSED:
-	case CLOCK_EVT_MODE_SHUTDOWN:
-	default:
-		/* No more interrupts will occur as source is disabled */
-		break;
-	}
+	mtk_clkevt_time_setup(evt, evt->ticks_per_jiffy, GPT_CLK_EVT);
+	mtk_clkevt_time_start(evt, true, GPT_CLK_EVT);
+	return 0;
 }
 
 static int mtk_clkevt_next_event(unsigned long event,
@@ -196,7 +189,10 @@ static void __init mtk_timer_init(struct device_node *node)
 	evt->dev.name = "mtk_tick";
 	evt->dev.rating = 300;
 	evt->dev.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
-	evt->dev.set_mode = mtk_clkevt_mode;
+	evt->dev.set_state_shutdown = mtk_clkevt_shutdown;
+	evt->dev.set_state_periodic = mtk_clkevt_set_periodic;
+	evt->dev.set_state_oneshot = mtk_clkevt_shutdown;
+	evt->dev.tick_resume = mtk_clkevt_shutdown;
 	evt->dev.set_next_event = mtk_clkevt_next_event;
 	evt->dev.cpumask = cpu_possible_mask;
 
-- 
1.9.1
