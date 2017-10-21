From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] soc: mediatek: pwrap: fix fatal compiler error
Date: Sat, 21 Oct 2017 10:25:29 +0200
Message-ID: <20171021082529.31351-2-matthias.bgg@gmail.com>
References: <20171021082529.31351-1-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171021082529.31351-1-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com, chenglin.xu@mediatek.com, chen.zhong@mediatek.com, arvind.yadav.cs@gmail.com, christophe.jaillet@wanadoo.fr, robh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

When adding the MT6380 compatible, the sentinel for of_device_id was
deleted, which leades to the following compiler error:
FATAL: drivers/soc/mediatek/mtk-pmic-wrap: struct of_device_id is not terminated with a NULL entry!

Fix this by adding the sentinel again.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 912edf93c192..e9e054a15b7d 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1380,6 +1380,7 @@ static const struct of_device_id of_slave_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6397",
 		.data = &pmic_mt6397,
+	}, {
 		/* sentinel */
 	}
 };
-- 
2.14.2
