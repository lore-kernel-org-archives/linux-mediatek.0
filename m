From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] phy: phy-mtk-tphy: fix missing clk_disable_unprepare() on error in mtk_phy_init()
Date: Tue, 20 Mar 2018 13:19:59 +0000
Message-ID: <1521551999-154546-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Fix the missing clk_disable_unprepare() before return
from mtk_phy_init() in the error handling case.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 38c281b..3ff9020 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -841,7 +841,7 @@ static int mtk_phy_init(struct phy *phy)
 	ret = clk_prepare_enable(instance->ref_clk);
 	if (ret) {
 		dev_err(tphy->dev, "failed to enable ref_clk\n");
-		return ret;
+		goto disable_u3phya_ref;
 	}
 
 	switch (instance->type) {
@@ -859,10 +859,17 @@ static int mtk_phy_init(struct phy *phy)
 		break;
 	default:
 		dev_err(tphy->dev, "incompatible PHY type\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto disable_ref_clk;
 	}
 
 	return 0;
+
+disable_ref_clk:
+	clk_disable_unprepare(instance->ref_clk);
+disable_u3phya_ref:
+	clk_disable_unprepare(tphy->u3phya_ref);
+	return ret;
 }
 
 static int mtk_phy_power_on(struct phy *phy)
