From: Vic Wu <vic.wu@mediatek.com>
Subject: [PATCH 2/5] crypto: mediatek: fix uninitialized value of gctx->textlen
Date: Wed, 28 Aug 2019 14:37:13 +0800
Message-ID: <20190828063716.22689-2-vic.wu@mediatek.com>
References: <20190828063716.22689-1-vic.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190828063716.22689-1-vic.wu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org, Vic Wu <vic.wu@mediatek.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Ryder Lee <ryder.lee@mediatek.com>

Add a pre-computed text length to avoid uninitialized value in the check.

Fixes: e47270665b5f ("crypto: mediatek - Add empty messages check in GCM mode")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Vic Wu <vic.wu@mediatek.com>
---
 drivers/crypto/mediatek/mtk-aes.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-aes.c b/drivers/crypto/mediatek/mtk-aes.c
index 43fcc8b5..425d7f3f 100644
--- a/drivers/crypto/mediatek/mtk-aes.c
+++ b/drivers/crypto/mediatek/mtk-aes.c
@@ -896,14 +896,11 @@ static int mtk_aes_gcm_start(struct mtk_cryp *cryp, struct mtk_aes_rec *aes)
 		aes->resume = mtk_aes_transfer_complete;
 		/* Compute total process length. */
 		aes->total = len + gctx->authsize;
-		/* Compute text length. */
-		gctx->textlen = req->cryptlen;
 		/* Hardware will append authenticated tag to output buffer */
 		scatterwalk_map_and_copy(tag, req->dst, len, gctx->authsize, 1);
 	} else {
 		aes->resume = mtk_aes_gcm_tag_verify;
 		aes->total = len;
-		gctx->textlen = req->cryptlen - gctx->authsize;
 	}
 
 	return mtk_aes_gcm_dma(cryp, aes, req->src, req->dst, len);
@@ -915,19 +912,22 @@ static int mtk_aes_gcm_crypt(struct aead_request *req, u64 mode)
 	struct mtk_aes_gcm_ctx *gctx = mtk_aes_gcm_ctx_cast(ctx);
 	struct mtk_aes_reqctx *rctx = aead_request_ctx(req);
 	struct mtk_cryp *cryp;
+	bool enc = !!(mode & AES_FLAGS_ENCRYPT);
 
 	cryp = mtk_aes_find_dev(ctx);
 	if (!cryp)
 		return -ENODEV;
 
+	/* Compute text length. */
+	gctx->textlen = req->cryptlen - (enc ? 0 : gctx->authsize);
+
 	/* Empty messages are not supported yet */
 	if (!gctx->textlen && !req->assoclen)
 		return -EINVAL;
 
 	rctx->mode = AES_FLAGS_GCM | mode;
 
-	return mtk_aes_handle_queue(cryp, !!(mode & AES_FLAGS_ENCRYPT),
-				    &req->base);
+	return mtk_aes_handle_queue(cryp, enc, &req->base);
 }
 
 /*
-- 
2.17.1
