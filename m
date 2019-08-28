From: John Crispin <john@phrozen.org>
Subject: Re: [PATCH 5/5] crypto: mediatek: fix incorrect crypto key setting
Date: Wed, 28 Aug 2019 09:03:58 +0200
Message-ID: <f91ceaa6-edb3-1e70-1fdc-d0022fafd316@phrozen.org>
References: <20190828063716.22689-1-vic.wu@mediatek.com>
 <20190828063716.22689-5-vic.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190828063716.22689-5-vic.wu@mediatek.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vic Wu <vic.wu@mediatek.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


On 28/08/2019 08:37, Vic Wu wrote:
> Record crypto key to context during setkey and set the key to
> transform state buffer in encrypt/decrypt process.
>
> Signed-off-by: Vic Wu <vic.wu@mediatek.com>

Thanks for the fix !

Tested-by: John Crispin <john@phrozen.og>

> ---
>   drivers/crypto/mediatek/mtk-aes.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/crypto/mediatek/mtk-aes.c b/drivers/crypto/mediatek/mtk-aes.c
> index 9eeb8b8d..05f21dc8 100644
> --- a/drivers/crypto/mediatek/mtk-aes.c
> +++ b/drivers/crypto/mediatek/mtk-aes.c
> @@ -107,6 +107,7 @@ struct mtk_aes_reqctx {
>   struct mtk_aes_base_ctx {
>   	struct mtk_cryp *cryp;
>   	u32 keylen;
> +	__le32 key[12];
>   	__le32 keymode;
>   
>   	mtk_aes_fn start;
> @@ -541,6 +542,8 @@ static int mtk_aes_handle_queue(struct mtk_cryp *cryp, u8 id,
>   		backlog->complete(backlog, -EINPROGRESS);
>   
>   	ctx = crypto_tfm_ctx(areq->tfm);
> +	/* Write key into state buffer */
> +	memcpy(ctx->info.state, ctx->key, sizeof(ctx->key));
>   
>   	aes->areq = areq;
>   	aes->ctx = ctx;
> @@ -660,7 +663,7 @@ static int mtk_aes_setkey(struct crypto_ablkcipher *tfm,
>   	}
>   
>   	ctx->keylen = SIZE_IN_WORDS(keylen);
> -	mtk_aes_write_state_le(ctx->info.state, (const u32 *)key, keylen);
> +	mtk_aes_write_state_le(ctx->key, (const u32 *)key, keylen);
>   
>   	return 0;
>   }
> @@ -1093,10 +1096,8 @@ static int mtk_aes_gcm_setkey(struct crypto_aead *aead, const u8 *key,
>   	if (err)
>   		goto out;
>   
> -	/* Write key into state buffer */
> -	mtk_aes_write_state_le(ctx->info.state, (const u32 *)key, keylen);
> -	/* Write key(H) into state buffer */
> -	mtk_aes_write_state_be(ctx->info.state + ctx->keylen, data->hash,
> +	mtk_aes_write_state_le(ctx->key, (const u32 *)key, keylen);
> +	mtk_aes_write_state_be(ctx->key + ctx->keylen, data->hash,
>   			       AES_BLOCK_SIZE);
>   out:
>   	kzfree(data);
