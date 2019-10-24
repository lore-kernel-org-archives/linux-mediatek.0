Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25EBCA9EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 13:31:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC2421906
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 13:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E9CU5wxY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yam2Lo+h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC2421906
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omqThHKyeW7pmXoZZADitJ2Li1XU2AnUXoX7MELF7IU=; b=E9CU5wxY8SlANl
	NsRrDk2+7Xh2mB1Bozq0RXKkg4ZYT4Ui3pCCrvE5deBuycyqCY5eNLXv520FmzvGP8XzcsfGUdgqC
	vkB2J0b/sjSu7zaqthUiexUr6kxb9PFtACMTkx01uS90jWjCaggAm2bJb7+od1zL+CAu7GRghkX22
	XQx5FCR/ZN512lYwepmGXVeEyPKQMrazIiODMKsIY4IyTMCFZtn0YIA0CblWYtgxJqj3p7j3ODINC
	UiVC9NHQtWsQBLRBQszd+tUfIBCoUHuqLJIyZS05uRMKu11s65U3H4BC010xPxs1ofm8RwAJlaUKE
	QXcWw0aDLGtWqwQtleFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNdCh-0008IG-EE; Thu, 24 Oct 2019 13:31:03 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNd6C-0000gk-CN
 for linux-mediatek@lists.infradead.org; Thu, 24 Oct 2019 13:24:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id n7so2007371wmc.3
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2019 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=33/CVTeLGzG6b73PvB1DolonEza52HznBgK284X66LM=;
 b=Yam2Lo+hRVbLvFNTCDyB/iKYb8FH0k3OD8unvOGek5e9rwKOJngzNhRpfoWJgMOHl0
 4aMMGmuaY5th0gaL5yFSsbIISFAEaYh87aA3Hf1p2FFhZ3R+cMDQObiPGoph0hsZsqG0
 vfbclD8YNF+3KIEQPlvZC5s0wXpjdSch6DGMLctz3WVbR7eMURx9FtH5Otq7ZLDzpusO
 R45io91mEebjK7yZ0uOeBmQWXIuE7CUOBk/AjLXLLFBkaED2mn+xT2U1BmTm8rGFUIMA
 Mq+69lbCwAN9SoOzJtKJ0s8BnyaTs6ewNyZ0m8m1kZEQzjtvQAN8Jwh37h//KC8pjO/d
 MEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=33/CVTeLGzG6b73PvB1DolonEza52HznBgK284X66LM=;
 b=ICnhQ5QIdVBb0l4NZhkLJrZbQEFnSxyocvXnnKnnqBqRshXkLcqJerO2kkVc4JZmyN
 KYxPpe9OjwctuNGFz+D8HDcHXAP78eTAX6r8v4017pJ035UsH99LCvhIvg2/5pkeIFKq
 OBZ9Yifz4nqaFmPdvifJWZf5/QJvTT6oQ2DIBiuYlniQXWgfluz/udn2uvnvgWYx3DTh
 wInqzkxtwjYVQGM50eQ0e4uL5xqe0bEeI1yoyEs8Q6ms7t3yr0PJZBuzW/mRq8UuNJ2g
 rdzTSsza6HCzVw6kVtah/goDLqiiv7w6zGyN73SO9HUOQr92IydFmHRGOPfEWHrrYGTu
 wu1g==
X-Gm-Message-State: APjAAAX2s06ltn2MIwpDOwP7dAM252vjWRTda892TVo7K3ujP7rIx4qZ
 K3rYUJsGnrZsEnbI1vNsSlr3dg==
X-Google-Smtp-Source: APXvYqz+wWl3qSwzBgGs3O94wUbYTG9fOE3aaDqBqclhRubXa8eLvJxJxeWSd1Y9jvtb92Fo9O/M7A==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr4933230wmk.30.1571923458318; 
 Thu, 24 Oct 2019 06:24:18 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-657-1-83-120.w92-154.abo.wanadoo.fr. [92.154.90.120])
 by smtp.gmail.com with ESMTPSA id e3sm2346310wme.36.2019.10.24.06.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 06:24:16 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 17/27] crypto: mediatek - switch to skcipher API
Date: Thu, 24 Oct 2019 15:23:35 +0200
Message-Id: <20191024132345.5236-18-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024132345.5236-1-ard.biesheuvel@linaro.org>
References: <20191024132345.5236-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_062420_820667_96016F6F 
X-CRM114-Status: GOOD (  15.37  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit 7a7ffe65c8c5 ("crypto: skcipher - Add top-level skcipher interface")
dated 20 august 2015 introduced the new skcipher API which is supposed to
replace both blkcipher and ablkcipher. While all consumers of the API have
been converted long ago, some producers of the ablkcipher remain, forcing
us to keep the ablkcipher support routines alive, along with the matching
code to expose [a]blkciphers via the skcipher API.

So switch this driver to the skcipher API, allowing us to finally drop the
blkcipher code in the near future.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
