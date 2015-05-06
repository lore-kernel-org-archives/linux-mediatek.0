From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH v4 1/3] mfd: provide RTC resource in MT6397 MFD
Date: Wed, 6 May 2015 15:23:40 +0800
Message-ID: <1430897022-63357-2-git-send-email-eddie.huang@mediatek.com>
References: <1430897022-63357-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430897022-63357-1-git-send-email-eddie.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: srv_heupstream@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Tomasz Figa <tfiga@google.com>, Eddie Huang <eddie.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Provide MT6397 RTC interrupt, base address, and register in
MT6397 MFD.

Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6397-core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 09bc780..4027623 100644
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
+		.flags = IORESOURCE_MEM,
+	},
+	{
+		.start = MT6397_IRQ_RTC,
+		.end   = MT6397_IRQ_RTC,
+		.flags = IORESOURCE_IRQ,
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
