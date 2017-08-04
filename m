From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 2/2] MAINTAINERS: add entry for mediatek usb3 DRD IP driver
Date: Fri, 4 Aug 2017 10:32:47 +0800
Message-ID: <1501813967-21868-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1501813967-21868-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501813967-21868-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Add myself as maintainer of MediaTek USB3 DRD IP driver

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 MAINTAINERS |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 205d397..0cf5e31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8472,6 +8472,14 @@ M:      Sean Wang <sean.wang@mediatek.com>
 S:      Maintained
 F:      drivers/char/hw_random/mtk-rng.c
 
+MEDIATEK USB3 DRD IP DRIVER
+M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
+L:	linux-usb@vger.kernel.org (moderated for non-subscribers)
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	drivers/usb/mtu3/
+
 MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES
 M:	Peter Senna Tschudin <peter.senna@collabora.com>
 M:	Martin Donnelly <martin.donnelly@ge.com>
-- 
1.7.9.5
