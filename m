From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 3/3] clocksource: mtk_timer: fix memleak in mtk_timer_init()
Date: Sun, 25 Oct 2015 23:21:24 +0000
Message-ID: <1445815284-10425-3-git-send-email-alexey.klimov@linaro.org>
References: <1445815284-10425-1-git-send-email-alexey.klimov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445815284-10425-1-git-send-email-alexey.klimov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, joe@perches.com
Cc: linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, tglx@linutronix.de, klimov.linux@gmail.com, Alexey Klimov <alexey.klimov@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

Add error path to clear evt struct allocated by kzalloc()
in the beginning of function mtk_timer_init().

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
  -- none

Changes in v2:
  -- added acked-by from Matthias

 drivers/clocksource/mtk_timer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index 4ddddf4..454c00e 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -199,7 +199,7 @@ static void __init mtk_timer_init(struct device_node *node)
 	evt->gpt_base = of_io_request_and_map(node, 0, "mtk-timer");
 	if (IS_ERR(evt->gpt_base)) {
 		pr_err("Can't get resource\n");
-		return;
+		goto err_kzalloc;
 	}
 
 	evt->dev.irq = irq_of_parse_and_map(node, 0);
@@ -254,5 +254,7 @@ err_mem:
 	iounmap(evt->gpt_base);
 	of_address_to_resource(node, 0, &res);
 	release_mem_region(res.start, resource_size(&res));
+err_kzalloc:
+	kfree(evt);
 }
 CLOCKSOURCE_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_timer_init);
-- 
2.1.4
