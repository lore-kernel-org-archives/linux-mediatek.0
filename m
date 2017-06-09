From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] MAINTAINERS: Add mediatek git repository
Date: Fri,  9 Jun 2017 10:43:54 +0200
Message-ID: <20170609084354.26499-1-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, gregkh@linuxfoundation.org, mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Mediatek repository lives in github for quite a while.
Add the repository to the file.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f7d568b8f133..41410639f650 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1554,6 +1554,7 @@ M:	Matthias Brugger <matthias.bgg@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+T:	git https://github.com/mbgg/linux-mediatek.git for-next
 F:	arch/arm/boot/dts/mt6*
 F:	arch/arm/boot/dts/mt7*
 F:	arch/arm/boot/dts/mt8*
-- 
2.12.3
