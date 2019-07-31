From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] net: mediatek: Drop unneeded dependency on NET_VENDOR_MEDIATEK
Date: Wed, 31 Jul 2019 15:12:02 +0200
Message-ID: <20190731131202.16749-1-geert+renesas@glider.be>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Felix Fietkau <nbd@openwrt.org>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-mediatek@lists.infradead.org

The whole block is protected by "if NET_VENDOR_MEDIATEK", so there is
no need for individual driver config symbols to duplicate this
dependency.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/mediatek/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
index 263cd0909fe0de39..1f7fff81f24dbb96 100644
--- a/drivers/net/ethernet/mediatek/Kconfig
+++ b/drivers/net/ethernet/mediatek/Kconfig
@@ -9,7 +9,6 @@ if NET_VENDOR_MEDIATEK
 
 config NET_MEDIATEK_SOC
 	tristate "MediaTek SoC Gigabit Ethernet support"
-	depends on NET_VENDOR_MEDIATEK
 	select PHYLIB
 	---help---
 	  This driver supports the gigabit ethernet MACs in the
-- 
2.17.1
