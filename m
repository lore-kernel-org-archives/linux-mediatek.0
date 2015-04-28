From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH v3 1/3] mfd: provide RTC resource in MT6397 MFD
Date: Tue, 28 Apr 2015 15:35:54 +0800
Message-ID: <1430206556-18254-2-git-send-email-eddie.huang@mediatek.com>
References: <1430206556-18254-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430206556-18254-1-git-send-email-eddie.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Tomasz Figa <tfiga@google.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <kernel@pengutronix.de>
Cc: srv_heupstream@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Provide MT6397 RTC interrupt, base address, and register in
MT6397 MFD.

Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
---
 drivers/mfd/mt6397-core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 09bc780..08cfbd1 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -21,9 +21,27 @@
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 
+#define MT6397_RTC_BASE		0xe000
+#define MT6397_RTC_SIZE		0x3e
+
+static const struct resource mt6397_rtc_resources[] = {
+	{
+		.start = MT6397_RTC_BASE,
+		.end   = MT6397_RTC_BASE + MT6397_RTC_SIZE,
+		.flags  = IORESOURCE_MEM,
+	},
+	{
+		.start = MT6397_IRQ_RTC,
+		.end   = MT6397_IRQ_RTC,
+		.flags  = IORESOURCE_IRQ,
+	},
+};
+
 static const struct mfd_cell mt6397_devs[] = {
 	{
 		.name = "mt6397-rtc",
+		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
+		.resources = mt6397_rtc_resources,
 		.of_compatible = "mediatek,mt6397-rtc",
 	}, {
 		.name = "mt6397-regulator",
-- 
1.8.1.1.dirty
