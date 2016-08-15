From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] net: mediatek: remove unnecessary platform_set_drvdata()
Date: Mon, 15 Aug 2016 22:51:48 +0000
Message-ID: <1471301508-24970-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Felix Fietkau <nbd@openwrt.org>, John Crispin <blogic@openwrt.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

The driver core clears the driver data to NULL after device_release
or on probe failure. Thus, it is not needed to manually clear the
device driver data to NULL.

Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 88b04dd..65986a0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1895,7 +1895,6 @@ static int mtk_remove(struct platform_device *pdev)
 	netif_napi_del(&eth->tx_napi);
 	netif_napi_del(&eth->rx_napi);
 	mtk_cleanup(eth);
-	platform_set_drvdata(pdev, NULL);
 
 	return 0;
 }
