From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH v4 3/3] MAINTAINERS: add Mediatek RTC driver
Date: Wed, 6 May 2015 15:23:42 +0800
Message-ID: <1430897022-63357-4-git-send-email-eddie.huang@mediatek.com>
References: <1430897022-63357-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430897022-63357-1-git-send-email-eddie.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: srv_heupstream@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Tomasz Figa <tfiga@google.com>, Eddie Huang <eddie.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Add Mediatek RTC driver to maintainer entry.

Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e5bbc0..b36a86e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1223,6 +1223,13 @@ W:	http://www.digriz.org.uk/ts78xx/kernel
 S:	Maintained
 F:	arch/arm/mach-orion5x/ts78xx-*
 
+ARM/Mediatek RTC DRIVER
+M:	Eddie Huang <eddie.huang@mediatek.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	drivers/rtc/rtc-mt6397.c
+
 ARM/Mediatek SoC support
 M:	Matthias Brugger <matthias.bgg@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
1.8.1.1.dirty
