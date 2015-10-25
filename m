From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 1/3] clocksource: mtk_timer: add pr_fmt define
Date: Sun, 25 Oct 2015 23:21:22 +0000
Message-ID: <1445815284-10425-1-git-send-email-alexey.klimov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, joe@perches.com
Cc: linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, tglx@linutronix.de, klimov.linux@gmail.com, Alexey Klimov <alexey.klimov@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

It's a bit unclear what subsystem/driver emits some messages
to dmesg in function mtk_init_timer().
Use pr_fmt to auto-prefix the messages appropriately.

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
  -- none

Changes in v2:
  -- added acked-by from Matthias

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
