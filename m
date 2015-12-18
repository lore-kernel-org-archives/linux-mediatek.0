From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 03/69] clocksource/drivers/mtk_timer: Fix memleak in mtk_timer_init()
Date: Fri, 18 Dec 2015 15:17:16 +0100
Message-ID: <1450448302-27429-3-git-send-email-daniel.lezcano@linaro.org>
References: <5672CB9E.7090707@linaro.org>
 <1450448302-27429-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450448302-27429-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mingo@kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

From: Alexey Klimov <alexey.klimov@linaro.org>

Add error path to clear evt struct allocated by kzalloc() in the beginning of
function mtk_timer_init().

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/mtk_timer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index e1e0642..d67bc35 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -205,7 +205,7 @@ static void __init mtk_timer_init(struct device_node *node)
 	evt->gpt_base = of_io_request_and_map(node, 0, "mtk-timer");
 	if (IS_ERR(evt->gpt_base)) {
 		pr_err("Can't get resource\n");
-		return;
+		goto err_kzalloc;
 	}
 
 	evt->dev.irq = irq_of_parse_and_map(node, 0);
@@ -260,5 +260,7 @@ err_mem:
 	iounmap(evt->gpt_base);
 	of_address_to_resource(node, 0, &res);
 	release_mem_region(res.start, resource_size(&res));
+err_kzalloc:
+	kfree(evt);
 }
 CLOCKSOURCE_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_timer_init);
-- 
1.9.1
