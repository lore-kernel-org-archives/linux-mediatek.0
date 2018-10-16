From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] MAINTAINERS: mediatek: Update SoC entry
Date: Tue, 16 Oct 2018 16:57:58 +0200
Message-ID: <20181016145758.12995-1-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, davem@davemloft.net, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Add IRC channel and URL of the wiki.
Also add soc drivers folder and regex to catch more
mediatek components.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ac000cc006d..66782dad6487 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1676,13 +1676,17 @@ ARM/Mediatek SoC support
 M:	Matthias Brugger <matthias.bgg@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+W:	https://mtk.bcnfs.org/
+C:	irc://chat.freenode.net/linux-mediatek
 S:	Maintained
 F:	arch/arm/boot/dts/mt6*
 F:	arch/arm/boot/dts/mt7*
 F:	arch/arm/boot/dts/mt8*
 F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/
+F:	drivers/soc/mediatek/
 N:	mtk
+N:	mt[678]
 K:	mediatek
 
 ARM/Mediatek USB3 PHY DRIVER
-- 
2.19.1
