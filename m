From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH v3 3/3] MAINTAINERS: add Mediatek RTC driver
Date: Tue, 28 Apr 2015 15:35:56 +0800
Message-ID: <1430206556-18254-4-git-send-email-eddie.huang@mediatek.com>
References: <1430206556-18254-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430206556-18254-1-git-send-email-eddie.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Tomasz Figa <tfiga@google.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <kernel@pengutronix.de>
Cc: srv_heupstream@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Add Mediatek RTC driver to maintainer entry.

Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e5bbc0..eb80610 100644
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
+F:	drivers/rtc/rtc-mt*
+
 ARM/Mediatek SoC support
 M:	Matthias Brugger <matthias.bgg@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
1.8.1.1.dirty
