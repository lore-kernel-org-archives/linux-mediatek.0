From: Colin King <colin.king@canonical.com>
Subject: [PATCH] staging: mt7621-eth: fix spelling mistake: "devictree" ->
 "devicetree"
Date: Thu, 22 Mar 2018 09:40:40 +0000
Message-ID: <20180322094040.12258-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Lee <igvtee@gmail.com>, John Crispin <blogic@openwrt.org>, NeilBrown <neil@brown.name>, Felix Fietkau <nbd@openwrt.org>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/mt7621-eth/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-eth/mtk_eth_soc.c b/drivers/staging/mt7621-eth/mtk_eth_soc.c
index 98b44629bc1d..eb3e14ae2929 100644
--- a/drivers/staging/mt7621-eth/mtk_eth_soc.c
+++ b/drivers/staging/mt7621-eth/mtk_eth_soc.c
@@ -2096,7 +2096,7 @@ static int mtk_probe(struct platform_device *pdev)
 	sysclk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(sysclk)) {
 		dev_err(&pdev->dev,
-			"the clock is not defined in the devictree\n");
+			"the clock is not defined in the devicetree\n");
 		return -ENXIO;
 	}
 	eth->sysclk = clk_get_rate(sysclk);
-- 
2.15.1
