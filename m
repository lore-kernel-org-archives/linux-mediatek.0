From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 1/5] crypto: mediatek: move mtk_aes_find_dev() to the
 right place
Date: Thu, 5 Sep 2019 14:52:18 +1000
Message-ID: <20190905045218.GA32038@gondor.apana.org.au>
References: <20190828063716.22689-1-vic.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828063716.22689-1-vic.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vic Wu <vic.wu@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Ryder Lee <ryder.lee@mediatek.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Aug 28, 2019 at 02:37:12PM +0800, Vic Wu wrote:
> From: Ryder Lee <ryder.lee@mediatek.com>
> 
> Move mtk_aes_find_dev() to right functions as nobody uses the
> 'cryp' under current flows.
> 
> We can also avoid duplicate checks here and there in this way.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Vic Wu <vic.wu@mediatek.com>
> ---
>  drivers/crypto/mediatek/mtk-aes.c | 39 +++++++++++--------------------
>  1 file changed, 14 insertions(+), 25 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
