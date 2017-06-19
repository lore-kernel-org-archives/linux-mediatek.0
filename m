From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: mediatek - drop .owner field in mtk_crypto_driver
Date: Mon, 19 Jun 2017 14:39:44 +0800
Message-ID: <20170619063944.GD13651@gondor.apana.org.au>
References: <55f4a84740c5d01a35ff6ec68890fcca0b26f28d.1493797414.git.geliangtang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55f4a84740c5d01a35ff6ec68890fcca0b26f28d.1493797414.git.geliangtang@gmail.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Geliang Tang <geliangtang@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, May 06, 2017 at 11:35:29PM +0800, Geliang Tang wrote:
> Drop .owner field in mtk_crypto_driver, since platform_driver_register()
> will set it automatically.
> 
> Signed-off-by: Geliang Tang <geliangtang@gmail.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
