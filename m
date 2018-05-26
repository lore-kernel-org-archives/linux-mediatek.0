From: Colin King <colin.king@canonical.com>
Subject: [PATCH] media: mtk-vpu:  fix spelling mistake: "Prosessor" -> "Processor"
Date: Sat, 26 May 2018 14:45:07 +0100
Message-ID: <20180526134507.28919-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in module description text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 1ff6a93262b7..f8d35e3ac1dc 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -960,4 +960,4 @@ static struct platform_driver mtk_vpu_driver = {
 module_platform_driver(mtk_vpu_driver);
 
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Mediatek Video Prosessor Unit driver");
+MODULE_DESCRIPTION("Mediatek Video Processor Unit driver");
-- 
2.17.0
