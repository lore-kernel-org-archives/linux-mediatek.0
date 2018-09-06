From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] mt76: MT76x0U requires MT76_USB
Date: Thu,  6 Sep 2018 15:06:43 +0200
Message-ID: <1536239203-21733-1-git-send-email-martin@kaiser.cx>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Valdis Kletnieks <valdis.kletnieks@vt.edu>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
List-Id: linux-mediatek@lists.infradead.org

If we're building MT76x0U, we must select MT76_USB. Otherwise,
compilation fails because of undefined references.

MT76x2U already does this correctly, fix it for MT76x0U as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/net/wireless/mediatek/mt76/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
index 6a270e759006..cec977b81305 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -17,6 +17,7 @@ config MT76x2_COMMON
 config MT76x0U
 	tristate "MediaTek MT76x0U (USB) support"
 	select MT76_CORE
+	select MT76_USB
 	depends on MAC80211
 	depends on USB
 	select MT76x02_LIB
-- 
2.1.4
