From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] hw_random: mediatek: Setup default RNG quality
Date: Thu, 18 Jan 2018 23:02:13 +1100
Message-ID: <20180118120213.GC20717@gondor.apana.org.au>
References: <134f98ae3270cc6040121cf75d50c916adfe58dc.1515556571.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <134f98ae3270cc6040121cf75d50c916adfe58dc.1515556571.git.sean.wang@mediatek.com>
Sender: linux-crypto-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: mpm@selenic.com, clabbe.montjoie@gmail.com, prasannatsmkumar@gmail.com, romain.perier@free-electrons.com, shannon.nelson@oracle.com, weiyongjun1@huawei.com, linux-crypto@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Jan 10, 2018 at 12:02:46PM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> When hw_random device's quality is non-zero, it will automatically fill
> the kernel's entropy pool at boot.  For the purpose, one conservative
> quality value is being picked up as the default value.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
