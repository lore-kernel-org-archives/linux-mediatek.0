From: weiyj_lk-9Onoh4P/yGk@public.gmane.org
Subject: [PATCH -next] [media] vcodec: mediatek: Fix return value check in
 mtk_vcodec_init_enc_pm()
Date: Tue, 12 Jul 2016 11:02:28 +0000
Message-ID: <1468321348-16045-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

In case of error, the function devm_clk_get() returns ERR_PTR()
and not returns NULL. The NULL test in the return value check
should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 2379e97..3e73e9d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -67,27 +67,27 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 	pm->dev = &pdev->dev;
 
 	pm->vencpll_d2 = devm_clk_get(&pdev->dev, "venc_sel_src");
-	if (pm->vencpll_d2 == NULL) {
+	if (IS_ERR(pm->vencpll_d2)) {
 		mtk_v4l2_err("devm_clk_get vencpll_d2 fail");
-		ret = -1;
+		ret = PTR_ERR(pm->vencpll_d2);
 	}
 
 	pm->venc_sel = devm_clk_get(&pdev->dev, "venc_sel");
-	if (pm->venc_sel == NULL) {
+	if (IS_ERR(pm->venc_sel)) {
 		mtk_v4l2_err("devm_clk_get venc_sel fail");
-		ret = -1;
+		ret = PTR_ERR(pm->venc_sel);
 	}
 
 	pm->univpll1_d2 = devm_clk_get(&pdev->dev, "venc_lt_sel_src");
-	if (pm->univpll1_d2 == NULL) {
+	if (IS_ERR(pm->univpll1_d2)) {
 		mtk_v4l2_err("devm_clk_get univpll1_d2 fail");
-		ret = -1;
+		ret = PTR_ERR(pm->univpll1_d2);
 	}
 
 	pm->venc_lt_sel = devm_clk_get(&pdev->dev, "venc_lt_sel");
-	if (pm->venc_lt_sel == NULL) {
+	if (IS_ERR(pm->venc_lt_sel)) {
 		mtk_v4l2_err("devm_clk_get venc_lt_sel fail");
-		ret = -1;
+		ret = PTR_ERR(pm->venc_lt_sel);
 	}
 
 	return ret;
