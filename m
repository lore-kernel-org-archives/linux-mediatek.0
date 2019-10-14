From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 17/25] crypto: mediatek - switch to skcipher API
Date: Mon, 14 Oct 2019 14:19:02 +0200
Message-ID: <20191014121910.7264-18-ard.biesheuvel@linaro.org>
References: <20191014121910.7264-1-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20191014121910.7264-1-ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Eric Biggers <ebiggers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Commit 7a7ffe65c8c5 ("crypto: skcipher - Add top-level skcipher interface")
dated 20 august 2015 introduced the new skcipher API which is supposed to
replace both blkcipher and ablkcipher. While all consumers of the API have
been converted long ago, some producers of the ablkcipher remain, forcing
us to keep the ablkcipher support routines alive, along with the matching
code to expose [a]blkciphers via the skcipher API.

So switch this driver to the skcipher API, allowing us to finally drop the
blkcipher code in the near future.

Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/crypto/mediatek/mtk-aes.c | 248 +++++++++-----------
 1 file changed, 116 insertions(+), 132 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-aes.c b/drivers/crypto/mediatek/mtk-aes.c
index 90c9644fb8a8..d3416020669f 100644
--- a/drivers/crypto/mediatek/mtk-aes.c
+++ b/drivers/crypto/mediatek/mtk-aes.c
@@ -11,6 +11,7 @@
 
 #include <crypto/aes.h>
 #include <crypto/gcm.h>
+#include <crypto/internal/skcipher.h>
 #include "mtk-platform.h"
 
 #define AES_QUEUE_SIZE		512
@@ -414,7 +415,7 @@ static int mtk_aes_map(struct mtk_cryp *cryp, struct mtk_aes_rec *aes)
 static void mtk_aes_info_init(struct mtk_cryp *cryp, struct mtk_aes_rec *aes,
 			      size_t len)
 {
-	struct ablkcipher_request *req = ablkcipher_request_cast(aes->areq);
+	struct skcipher_request *req = skcipher_request_cast(aes->areq);
 	struct mtk_aes_base_ctx *ctx = aes->ctx;
 	struct mtk_aes_info *info = &ctx->info;
 	u32 cnt = 0;
@@ -450,7 +451,7 @@ static void mtk_aes_info_init(struct mtk_cryp *cryp, struct mtk_aes_rec *aes,
 		return;
 	}
 
-	mtk_aes_write_state_le(info->state + ctx->keylen, req->info,
+	mtk_aes_write_state_le(info->state + ctx->keylen, (void *)req->iv,
 			       AES_BLOCK_SIZE);
 ctr:
 	info->tfm[0] += AES_TFM_SIZE(SIZE_IN_WORDS(AES_BLOCK_SIZE));
@@ -552,13 +553,13 @@ static int mtk_aes_transfer_complete(struct mtk_cryp *cryp,
 
 static int mtk_aes_start(struct mtk_cryp *cryp, struct mtk_aes_rec *aes)
 {
-	struct ablkcipher_request *req = ablkcipher_request_cast(aes->areq);
-	struct mtk_aes_reqctx *rctx = ablkcipher_request_ctx(req);
+	struct skcipher_request *req = skcipher_request_cast(aes->areq);
+	struct mtk_aes_reqctx *rctx = skcipher_request_ctx(req);
 
 	mtk_aes_set_mode(aes, rctx);
 	aes->resume = mtk_aes_transfer_complete;
 
-	return mtk_aes_dma(cryp, aes, req->src, req->dst, req->nbytes);
+	return mtk_aes_dma(cryp, aes, req->src, req->dst, req->cryptlen);
 }
 
 static inline struct mtk_aes_ctr_ctx *
@@ -571,7 +572,7 @@ static int mtk_aes_ctr_transfer(struct mtk_cryp *cryp, struct mtk_aes_rec *aes)
 {
 	struct mtk_aes_base_ctx *ctx = aes->ctx;
 	struct mtk_aes_ctr_ctx *cctx = mtk_aes_ctr_ctx_cast(ctx);
-	struct ablkcipher_request *req = ablkcipher_request_cast(aes->areq);
+	struct skcipher_request *req = skcipher_request_cast(aes->areq);
 	struct scatterlist *src, *dst;
 	u32 start, end, ctr, blocks;
 	size_t datalen;
@@ -579,11 +580,11 @@ static int mtk_aes_ctr_transfer(struct mtk_cryp *cryp, struct mtk_aes_rec *aes)
 
 	/* Check for transfer completion. */
 	cctx->offset += aes->total;
-	if (cctx->offset >= req->nbytes)
+	if (cctx->offset >= req->cryptlen)
 		return mtk_aes_transfer_complete(cryp, aes);
 
 	/* Compute data length. */
-	datalen = req->nbytes - cctx->offset;
+	datalen = req->cryptlen - cctx->offset;
 	blocks = DIV_ROUND_UP(datalen, AES_BLOCK_SIZE);
 	ctr = be32_to_cpu(cctx->iv[3]);
 
@@ -620,12 +621,12 @@ static int mtk_aes_ctr_transfer(struct mtk_cryp *cryp, struct mtk_aes_rec *aes)
 static int mtk_aes_ctr_start(struct mtk_cryp *cryp, struct mtk_aes_rec *aes)
 {
 	struct mtk_aes_ctr_ctx *cctx = mtk_aes_ctr_ctx_cast(aes->ctx);
-	struct ablkcipher_request *req = ablkcipher_request_cast(aes->areq);
-	struct mtk_aes_reqctx *rctx = ablkcipher_request_ctx(req);
+	struct skcipher_request *req = skcipher_request_cast(aes->areq);
+	struct mtk_aes_reqctx *rctx = skcipher_request_ctx(req);
 
 	mtk_aes_set_mode(aes, rctx);
 
-	memcpy(cctx->iv, req->info, AES_BLOCK_SIZE);
+	memcpy(cctx->iv, req->iv, AES_BLOCK_SIZE);
 	cctx->offset = 0;
 	aes->total = 0;
 	aes->resume = mtk_aes_ctr_transfer;
@@ -634,10 +635,10 @@ static int mtk_aes_ctr_start(struct mtk_cryp *cryp, struct mtk_aes_rec *aes)
 }
 
 /* Check and set the AES key to transform state buffer */
-static int mtk_aes_setkey(struct crypto_ablkcipher *tfm,
+static int mtk_aes_setkey(struct crypto_skcipher *tfm,
 			  const u8 *key, u32 keylen)
 {
-	struct mtk_aes_base_ctx *ctx = crypto_ablkcipher_ctx(tfm);
+	struct mtk_aes_base_ctx *ctx = crypto_skcipher_ctx(tfm);
 
 	switch (keylen) {
 	case AES_KEYSIZE_128:
@@ -651,7 +652,7 @@ static int mtk_aes_setkey(struct crypto_ablkcipher *tfm,
 		break;
 
 	default:
-		crypto_ablkcipher_set_flags(tfm, CRYPTO_TFM_RES_BAD_KEY_LEN);
+		crypto_skcipher_set_flags(tfm, CRYPTO_TFM_RES_BAD_KEY_LEN);
 		return -EINVAL;
 	}
 
@@ -661,10 +662,10 @@ static int mtk_aes_setkey(struct crypto_ablkcipher *tfm,
 	return 0;
 }
 
-static int mtk_aes_crypt(struct ablkcipher_request *req, u64 mode)
+static int mtk_aes_crypt(struct skcipher_request *req, u64 mode)
 {
-	struct crypto_ablkcipher *ablkcipher = crypto_ablkcipher_reqtfm(req);
-	struct mtk_aes_base_ctx *ctx = crypto_ablkcipher_ctx(ablkcipher);
+	struct crypto_skcipher *skcipher = crypto_skcipher_reqtfm(req);
+	struct mtk_aes_base_ctx *ctx = crypto_skcipher_ctx(skcipher);
 	struct mtk_aes_reqctx *rctx;
 	struct mtk_cryp *cryp;
 
@@ -672,185 +673,168 @@ static int mtk_aes_crypt(struct ablkcipher_request *req, u64 mode)
 	if (!cryp)
 		return -ENODEV;
 
-	rctx = ablkcipher_request_ctx(req);
+	rctx = skcipher_request_ctx(req);
 	rctx->mode = mode;
 
 	return mtk_aes_handle_queue(cryp, !(mode & AES_FLAGS_ENCRYPT),
 				    &req->base);
 }
 
-static int mtk_aes_ecb_encrypt(struct ablkcipher_request *req)
+static int mtk_aes_ecb_encrypt(struct skcipher_request *req)
 {
 	return mtk_aes_crypt(req, AES_FLAGS_ENCRYPT | AES_FLAGS_ECB);
 }
 
-static int mtk_aes_ecb_decrypt(struct ablkcipher_request *req)
+static int mtk_aes_ecb_decrypt(struct skcipher_request *req)
 {
 	return mtk_aes_crypt(req, AES_FLAGS_ECB);
 }
 
-static int mtk_aes_cbc_encrypt(struct ablkcipher_request *req)
+static int mtk_aes_cbc_encrypt(struct skcipher_request *req)
 {
 	return mtk_aes_crypt(req, AES_FLAGS_ENCRYPT | AES_FLAGS_CBC);
 }
 
-static int mtk_aes_cbc_decrypt(struct ablkcipher_request *req)
+static int mtk_aes_cbc_decrypt(struct skcipher_request *req)
 {
 	return mtk_aes_crypt(req, AES_FLAGS_CBC);
 }
 
-static int mtk_aes_ctr_encrypt(struct ablkcipher_request *req)
+static int mtk_aes_ctr_encrypt(struct skcipher_request *req)
 {
 	return mtk_aes_crypt(req, AES_FLAGS_ENCRYPT | AES_FLAGS_CTR);
 }
 
-static int mtk_aes_ctr_decrypt(struct ablkcipher_request *req)
+static int mtk_aes_ctr_decrypt(struct skcipher_request *req)
 {
 	return mtk_aes_crypt(req, AES_FLAGS_CTR);
 }
 
-static int mtk_aes_ofb_encrypt(struct ablkcipher_request *req)
+static int mtk_aes_ofb_encrypt(struct skcipher_request *req)
 {
 	return mtk_aes_crypt(req, AES_FLAGS_ENCRYPT | AES_FLAGS_OFB);
 }
 
-static int mtk_aes_ofb_decrypt(struct ablkcipher_request *req)
+static int mtk_aes_ofb_decrypt(struct skcipher_request *req)
 {
 	return mtk_aes_crypt(req, AES_FLAGS_OFB);
 }
 
-static int mtk_aes_cfb_encrypt(struct ablkcipher_request *req)
+static int mtk_aes_cfb_encrypt(struct skcipher_request *req)
 {
 	return mtk_aes_crypt(req, AES_FLAGS_ENCRYPT | AES_FLAGS_CFB128);
 }
 
-static int mtk_aes_cfb_decrypt(struct ablkcipher_request *req)
+static int mtk_aes_cfb_decrypt(struct skcipher_request *req)
 {
 	return mtk_aes_crypt(req, AES_FLAGS_CFB128);
 }
 
-static int mtk_aes_cra_init(struct crypto_tfm *tfm)
+static int mtk_aes_init_tfm(struct crypto_skcipher *tfm)
 {
-	struct mtk_aes_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct mtk_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	tfm->crt_ablkcipher.reqsize = sizeof(struct mtk_aes_reqctx);
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct mtk_aes_reqctx));
 	ctx->base.start = mtk_aes_start;
 	return 0;
 }
 
-static int mtk_aes_ctr_cra_init(struct crypto_tfm *tfm)
+static int mtk_aes_ctr_init_tfm(struct crypto_skcipher *tfm)
 {
-	struct mtk_aes_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct mtk_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	tfm->crt_ablkcipher.reqsize = sizeof(struct mtk_aes_reqctx);
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct mtk_aes_reqctx));
 	ctx->base.start = mtk_aes_ctr_start;
 	return 0;
 }
 
-static struct crypto_alg aes_algs[] = {
+static struct skcipher_alg aes_algs[] = {
 {
-	.cra_name		= "cbc(aes)",
-	.cra_driver_name	= "cbc-aes-mtk",
-	.cra_priority		= 400,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_ASYNC,
-	.cra_init		= mtk_aes_cra_init,
-	.cra_blocksize		= AES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct mtk_aes_ctx),
-	.cra_alignmask		= 0xf,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_u.ablkcipher = {
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.setkey		= mtk_aes_setkey,
-		.encrypt	= mtk_aes_cbc_encrypt,
-		.decrypt	= mtk_aes_cbc_decrypt,
-		.ivsize		= AES_BLOCK_SIZE,
-	}
+	.base.cra_name		= "cbc(aes)",
+	.base.cra_driver_name	= "cbc-aes-mtk",
+	.base.cra_priority	= 400,
+	.base.cra_flags		= CRYPTO_ALG_ASYNC,
+	.base.cra_blocksize	= AES_BLOCK_SIZE,
+	.base.cra_ctxsize	= sizeof(struct mtk_aes_ctx),
+	.base.cra_alignmask	= 0xf,
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= AES_MIN_KEY_SIZE,
+	.max_keysize		= AES_MAX_KEY_SIZE,
+	.setkey			= mtk_aes_setkey,
+	.encrypt		= mtk_aes_cbc_encrypt,
+	.decrypt		= mtk_aes_cbc_decrypt,
+	.ivsize			= AES_BLOCK_SIZE,
+	.init			= mtk_aes_init_tfm,
 },
 {
-	.cra_name		= "ecb(aes)",
-	.cra_driver_name	= "ecb-aes-mtk",
-	.cra_priority		= 400,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_ASYNC,
-	.cra_init		= mtk_aes_cra_init,
-	.cra_blocksize		= AES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct mtk_aes_ctx),
-	.cra_alignmask		= 0xf,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_u.ablkcipher = {
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.setkey		= mtk_aes_setkey,
-		.encrypt	= mtk_aes_ecb_encrypt,
-		.decrypt	= mtk_aes_ecb_decrypt,
-	}
+	.base.cra_name		= "ecb(aes)",
+	.base.cra_driver_name	= "ecb-aes-mtk",
+	.base.cra_priority	= 400,
+	.base.cra_flags		= CRYPTO_ALG_ASYNC,
+	.base.cra_blocksize	= AES_BLOCK_SIZE,
+	.base.cra_ctxsize	= sizeof(struct mtk_aes_ctx),
+	.base.cra_alignmask	= 0xf,
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= AES_MIN_KEY_SIZE,
+	.max_keysize		= AES_MAX_KEY_SIZE,
+	.setkey			= mtk_aes_setkey,
+	.encrypt		= mtk_aes_ecb_encrypt,
+	.decrypt		= mtk_aes_ecb_decrypt,
+	.init			= mtk_aes_init_tfm,
 },
 {
-	.cra_name		= "ctr(aes)",
-	.cra_driver_name	= "ctr-aes-mtk",
-	.cra_priority		= 400,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_ASYNC,
-	.cra_init		= mtk_aes_ctr_cra_init,
-	.cra_blocksize		= 1,
-	.cra_ctxsize		= sizeof(struct mtk_aes_ctr_ctx),
-	.cra_alignmask		= 0xf,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_u.ablkcipher = {
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.ivsize		= AES_BLOCK_SIZE,
-		.setkey		= mtk_aes_setkey,
-		.encrypt	= mtk_aes_ctr_encrypt,
-		.decrypt	= mtk_aes_ctr_decrypt,
-	}
+	.base.cra_name		= "ctr(aes)",
+	.base.cra_driver_name	= "ctr-aes-mtk",
+	.base.cra_priority	= 400,
+	.base.cra_flags		= CRYPTO_ALG_ASYNC,
+	.base.cra_blocksize	= 1,
+	.base.cra_ctxsize	= sizeof(struct mtk_aes_ctx),
+	.base.cra_alignmask	= 0xf,
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= AES_MIN_KEY_SIZE,
+	.max_keysize		= AES_MAX_KEY_SIZE,
+	.ivsize			= AES_BLOCK_SIZE,
+	.setkey			= mtk_aes_setkey,
+	.encrypt		= mtk_aes_ctr_encrypt,
+	.decrypt		= mtk_aes_ctr_decrypt,
+	.init			= mtk_aes_ctr_init_tfm,
 },
 {
-	.cra_name		= "ofb(aes)",
-	.cra_driver_name	= "ofb-aes-mtk",
-	.cra_priority		= 400,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_ASYNC,
-	.cra_init		= mtk_aes_cra_init,
-	.cra_blocksize		= 1,
-	.cra_ctxsize		= sizeof(struct mtk_aes_ctx),
-	.cra_alignmask		= 0xf,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_u.ablkcipher = {
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.ivsize		= AES_BLOCK_SIZE,
-		.setkey		= mtk_aes_setkey,
-		.encrypt	= mtk_aes_ofb_encrypt,
-		.decrypt	= mtk_aes_ofb_decrypt,
-	}
+	.base.cra_name		= "ofb(aes)",
+	.base.cra_driver_name	= "ofb-aes-mtk",
+	.base.cra_priority	= 400,
+	.base.cra_flags		= CRYPTO_ALG_ASYNC,
+	.base.cra_blocksize	= AES_BLOCK_SIZE,
+	.base.cra_ctxsize	= sizeof(struct mtk_aes_ctx),
+	.base.cra_alignmask	= 0xf,
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= AES_MIN_KEY_SIZE,
+	.max_keysize		= AES_MAX_KEY_SIZE,
+	.ivsize			= AES_BLOCK_SIZE,
+	.setkey			= mtk_aes_setkey,
+	.encrypt		= mtk_aes_ofb_encrypt,
+	.decrypt		= mtk_aes_ofb_decrypt,
 },
 {
-	.cra_name		= "cfb(aes)",
-	.cra_driver_name	= "cfb-aes-mtk",
-	.cra_priority		= 400,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_ASYNC,
-	.cra_init		= mtk_aes_cra_init,
-	.cra_blocksize		= 1,
-	.cra_ctxsize		= sizeof(struct mtk_aes_ctx),
-	.cra_alignmask		= 0xf,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_u.ablkcipher = {
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.ivsize		= AES_BLOCK_SIZE,
-		.setkey		= mtk_aes_setkey,
-		.encrypt	= mtk_aes_cfb_encrypt,
-		.decrypt	= mtk_aes_cfb_decrypt,
-	}
+	.base.cra_name		= "cfb(aes)",
+	.base.cra_driver_name	= "cfb-aes-mtk",
+	.base.cra_priority	= 400,
+	.base.cra_flags		= CRYPTO_ALG_ASYNC,
+	.base.cra_blocksize	= 1,
+	.base.cra_ctxsize	= sizeof(struct mtk_aes_ctx),
+	.base.cra_alignmask	= 0xf,
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= AES_MIN_KEY_SIZE,
+	.max_keysize		= AES_MAX_KEY_SIZE,
+	.ivsize			= AES_BLOCK_SIZE,
+	.setkey			= mtk_aes_setkey,
+	.encrypt		= mtk_aes_cfb_encrypt,
+	.decrypt		= mtk_aes_cfb_decrypt,
 },
 };
 
@@ -1259,7 +1243,7 @@ static void mtk_aes_unregister_algs(void)
 	crypto_unregister_aead(&aes_gcm_alg);
 
 	for (i = 0; i < ARRAY_SIZE(aes_algs); i++)
-		crypto_unregister_alg(&aes_algs[i]);
+		crypto_unregister_skcipher(&aes_algs[i]);
 }
 
 static int mtk_aes_register_algs(void)
@@ -1267,7 +1251,7 @@ static int mtk_aes_register_algs(void)
 	int err, i;
 
 	for (i = 0; i < ARRAY_SIZE(aes_algs); i++) {
-		err = crypto_register_alg(&aes_algs[i]);
+		err = crypto_register_skcipher(&aes_algs[i]);
 		if (err)
 			goto err_aes_algs;
 	}
@@ -1280,7 +1264,7 @@ static int mtk_aes_register_algs(void)
 
 err_aes_algs:
 	for (; i--; )
-		crypto_unregister_alg(&aes_algs[i]);
+		crypto_unregister_skcipher(&aes_algs[i]);
 
 	return err;
 }
-- 
2.20.1
