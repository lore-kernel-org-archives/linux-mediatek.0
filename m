From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH -next] crypto: mediatek - make symbol of_crypto_id static
Date: Fri, 13 Jan 2017 22:37:09 +0800
Message-ID: <20170113143709.GA26101@gondor.apana.org.au>
References: <20170112150321.4187-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170112150321.4187-1-weiyj.lk@gmail.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jan 12, 2017 at 03:03:21PM +0000, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Fixes the following sparse warning:
> 
> drivers/crypto/mediatek/mtk-platform.c:585:27: warning:
>  symbol 'of_crypto_id' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
