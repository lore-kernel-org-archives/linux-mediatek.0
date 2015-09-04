From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [RFC PATCH 3/3] clocksource: mtk_timer: fix memleak in mtk_timer_init()
Date: Fri,  4 Sep 2015 06:21:40 +0300
Message-ID: <1441336900-15095-3-git-send-email-alexey.klimov@linaro.org>
References: <1441336900-15095-1-git-send-email-alexey.klimov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441336900-15095-1-git-send-email-alexey.klimov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Cc: yingjoe.chen@mediatek.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, klimov.linux@gmail.com, Alexey Klimov <alexey.klimov@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

Add error path to clear evt struct allocated by kzalloc()
in the beginning of function mtk_timer_init().

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clocksource/mtk_timer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index fbaacbf..9c5a2cc 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -201,7 +201,7 @@ static void __init mtk_timer_init(struct device_node *node)
 	evt->gpt_base = of_io_request_and_map(node, 0, "mtk-timer");
 	if (IS_ERR(evt->gpt_base)) {
 		pr_err("Can't get resource\n");
-		return;
+		goto err_kzalloc;
 	}
 
 	evt->dev.irq = irq_of_parse_and_map(node, 0);
@@ -256,5 +256,7 @@ err_mem:
 	iounmap(evt->gpt_base);
 	of_address_to_resource(node, 0, &res);
 	release_mem_region(res.start, resource_size(&res));
+err_kzalloc:
+	kfree(evt);
 }
 CLOCKSOURCE_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_timer_init);
-- 
2.1.4
