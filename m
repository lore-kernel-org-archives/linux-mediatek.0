From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH 3/4] media: mtk-vcodec: fix leaked of_node references
Date: Mon, 6 May 2019 15:05:17 +0800
Message-ID: <1557126318-21487-4-git-send-email-wen.yang99@zte.com.cn>
References: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

The call to of_find_device_by_node returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c:60:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 38, but without a corresponding object release within this function.
drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c:63:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 38, but without a corresponding object release within this function.
drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c:72:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 38, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 7884465..11c45c5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -42,8 +42,8 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 	}
 
 	pdev = of_find_device_by_node(node);
+	of_node_put(node);
 	if (WARN_ON(!pdev)) {
-		of_node_put(node);
 		return -1;
 	}
 	pm->larbvdec = &pdev->dev;
-- 
2.9.5
