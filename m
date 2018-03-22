From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] staging: mt7621-eth: fix return value check in mtk_probe()
Date: Thu, 22 Mar 2018 02:09:39 +0000
Message-ID: <1521684579-76660-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <blogic@openwrt.org>, Michael Lee <igvtee@gmail.com>, NeilBrown <neil@brown.name>, Felix Fietkau <nbd@openwrt.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: e3cbf478f846 ("staging: mt7621-eth: add the drivers core files")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/mt7621-eth/mtk_eth_soc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-eth/mtk_eth_soc.c b/drivers/staging/mt7621-eth/mtk_eth_soc.c
index 98b4462..dea4270 100644
--- a/drivers/staging/mt7621-eth/mtk_eth_soc.c
+++ b/drivers/staging/mt7621-eth/mtk_eth_soc.c
@@ -2077,8 +2077,8 @@ static int mtk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	eth->base = devm_ioremap_resource(&pdev->dev, res);
-	if (!eth->base)
-		return -EADDRNOTAVAIL;
+	if (IS_ERR(eth->base))
+		return PTR_ERR(eth->base);
 
 	spin_lock_init(&eth->page_lock);
