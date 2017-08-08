From: Pan Bian <bianpan2016@163.com>
Subject: media: mtk-mdp: use IS_ERR to check return value of of_clk_get
Date: Tue,  8 Aug 2017 22:49:58 +0800
Message-ID: <1502203798-31997-1-git-send-email-bianpan2016@163.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Pan Bian <bianpan2016@163.com>
List-Id: linux-mediatek@lists.infradead.org

Function of_clk_get() returns an ERR_PTR on failures. In file
mtk_mdp_commp.c, its return value is checked against NULL. Such checks
cannot prevent from accessing bad memory. This patch replaces the NULL
checks with IS_ERR checks.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index aa8f9fd..54bb716 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -75,7 +75,7 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
-		if (!comp->clk[i])
+		if (IS_ERR(comp->clk[i]))
 			continue;
 		err = clk_prepare_enable(comp->clk[i]);
 		if (err)
@@ -90,7 +90,7 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
-		if (!comp->clk[i])
+		if (IS_ERR(comp->clk[i]))
 			continue;
 		clk_disable_unprepare(comp->clk[i]);
 	}
-- 
1.9.1
