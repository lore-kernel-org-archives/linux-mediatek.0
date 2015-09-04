From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [RFC PATCH 1/3] clocksource: mtk_timer: add pr_fmt define
Date: Fri,  4 Sep 2015 06:21:38 +0300
Message-ID: <1441336900-15095-1-git-send-email-alexey.klimov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Cc: yingjoe.chen@mediatek.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, klimov.linux@gmail.com, Alexey Klimov <alexey.klimov@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

It's a bit uncler what subsystem/driver emits some messages
to dmesg in function mtk_init_timer().
Use pr_fmt to auto-prefix the messages appropriately.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clocksource/mtk_timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index 50f0641..ca5ea9e 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -16,6 +16,8 @@
  * GNU General Public License for more details.
  */
 
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/interrupt.h>
-- 
2.1.4
