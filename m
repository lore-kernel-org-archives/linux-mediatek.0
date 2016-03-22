From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] net: mediatek: fix checking for NULL instead of IS_ERR() in .probe
Date: Wed, 23 Mar 2016 01:06:04 +0200
Message-ID: <1458687964-9690-1-git-send-email-vz@mleia.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@openwrt.org>, John Crispin <blogic@openwrt.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

devm_ioremap_resource() returns ERR_PTR() value on error, it never
returns NULL, fix it and propagate the returned error upwards.

Fixes: 656e705243fd ("net-next: mediatek: add support for MT7623 ethernet")
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 7f2126b..e0b68af 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1690,8 +1690,8 @@ static int mtk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	eth->base = devm_ioremap_resource(&pdev->dev, res);
-	if (!eth->base)
-		return -EADDRNOTAVAIL;
+	if (IS_ERR(eth->base))
+		return PTR_ERR(eth->base);
 
 	spin_lock_init(&eth->page_lock);
 
-- 
2.1.4
