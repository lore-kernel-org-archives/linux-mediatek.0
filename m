From: Vic Wu <vic.wu@mediatek.com>
Subject: [PATCH 5/5] crypto: mediatek: fix incorrect crypto key setting
Date: Wed, 28 Aug 2019 14:37:16 +0800
Message-ID: <20190828063716.22689-5-vic.wu@mediatek.com>
References: <20190828063716.22689-1-vic.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828063716.22689-1-vic.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S . Miller" <davem@davemloft.net>, Ryder Lee <ryder.lee@mediatek.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Vic Wu <vic.wu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Record crypto key to context during setkey and set the key to
transform state buffer in encrypt/decrypt process.

Signed-off-by: Vic Wu <vic.wu@mediatek.com>
---
 drivers/crypto/mediatek/mtk-aes.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-aes.c b/drivers/crypto/mediatek/mtk-aes.c
index 9eeb8b8d..05f21dc8 100644
--- a/drivers/crypto/mediatek/mtk-aes.c
+++ b/drivers/crypto/mediatek/mtk-aes.c
@@ -107,6 +107,7 @@ struct mtk_aes_reqctx {
 struct mtk_aes_base_ctx {
 	struct mtk_cryp *cryp;
 	u32 keylen;
+	__le32 key[12];
 	__le32 keymode;
 
 	mtk_aes_fn start;
@@ -541,6 +542,8 @@ static int mtk_aes_handle_queue(struct mtk_cryp *cryp, u8 id,
 		backlog->complete(backlog, -EINPROGRESS);
 
 	ctx = crypto_tfm_ctx(areq->tfm);
+	/* Write key into state buffer */
+	memcpy(ctx->info.state, ctx->key, sizeof(ctx->key));
 
 	aes->areq = areq;
 	aes->ctx = ctx;
@@ -660,7 +663,7 @@ static int mtk_aes_setkey(struct crypto_ablkcipher *tfm,
 	}
 
 	ctx->keylen = SIZE_IN_WORDS(keylen);
-	mtk_aes_write_state_le(ctx->info.state, (const u32 *)key, keylen);
+	mtk_aes_write_state_le(ctx->key, (const u32 *)key, keylen);
 
 	return 0;
 }
@@ -1093,10 +1096,8 @@ static int mtk_aes_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 	if (err)
 		goto out;
 
-	/* Write key into state buffer */
-	mtk_aes_write_state_le(ctx->info.state, (const u32 *)key, keylen);
-	/* Write key(H) into state buffer */
-	mtk_aes_write_state_be(ctx->info.state + ctx->keylen, data->hash,
+	mtk_aes_write_state_le(ctx->key, (const u32 *)key, keylen);
+	mtk_aes_write_state_be(ctx->key + ctx->keylen, data->hash,
 			       AES_BLOCK_SIZE);
 out:
 	kzfree(data);
-- 
2.17.1
