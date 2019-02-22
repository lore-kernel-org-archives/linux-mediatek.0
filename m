From: Wen Yang <wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
Subject: [PATCH 4/5] net: xilinx: fix a leaked reference by adding missing of_node_put
Date: Fri, 22 Feb 2019 15:15:41 +0800
Message-ID: <1550819742-32155-4-git-send-email-wen.yang99@zte.com.cn>
References: <1550819742-32155-1-git-send-email-wen.yang99@zte.com.cn>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1550819742-32155-1-git-send-email-wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, vivien.didelot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, UNGLinuxDriver-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, wang.yi59-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, Wen Yang <wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

The call to of_parse_phandle returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warning:
./drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1624:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1569, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
Cc: Anirudha Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 0789d8a..8335390 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1575,11 +1575,13 @@ static int axienet_probe(struct platform_device *pdev)
 	ret = of_address_to_resource(np, 0, &dmares);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to get DMA resource\n");
+		of_node_put(np);
 		goto free_netdev;
 	}
 	lp->dma_regs = devm_ioremap_resource(&pdev->dev, &dmares);
 	if (IS_ERR(lp->dma_regs)) {
 		dev_err(&pdev->dev, "could not map DMA regs\n");
+		of_node_put(np);
 		ret = PTR_ERR(lp->dma_regs);
 		goto free_netdev;
 	}
-- 
2.9.5
