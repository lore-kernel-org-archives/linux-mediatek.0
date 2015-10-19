From: Alexey Klimov <alexey.klimov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/3] clocksource: mtk_timer: fix memleak in mtk_timer_init()
Date: Mon, 19 Oct 2015 03:09:25 +0300
Message-ID: <1445213365-24530-3-git-send-email-alexey.klimov@linaro.org>
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

Add error path to clear evt struct allocated by kzalloc()
in the beginning of function mtk_timer_init().

Acked-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Alexey Klimov <alexey.klimov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clocksource/mtk_timer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index ac92ca2..a811e7c 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -200,7 +200,7 @@ static void __init mtk_timer_init(struct device_node *node)
 	evt->gpt_base = of_io_request_and_map(node, 0, "mtk-timer");
 	if (IS_ERR(evt->gpt_base)) {
 		pr_err("Can't get resource\n");
-		return;
+		goto err_kzalloc;
 	}
 
 	evt->dev.irq = irq_of_parse_and_map(node, 0);
@@ -255,5 +255,7 @@ err_mem:
 	iounmap(evt->gpt_base);
 	of_address_to_resource(node, 0, &res);
 	release_mem_region(res.start, resource_size(&res));
+err_kzalloc:
+	kfree(evt);
 }
 CLOCKSOURCE_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_timer_init);
-- 
2.1.4
