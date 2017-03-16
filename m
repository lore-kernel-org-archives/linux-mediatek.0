From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v1 0/8] improve performances on mediatek crypto driver
Date: Thu, 16 Mar 2017 18:08:47 +0800
Message-ID: <20170316100847.GC12137@gondor.apana.org.au>
References: <1489025479-48036-1-git-send-email-ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489025479-48036-1-git-send-email-ryder.lee@mediatek.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Mar 09, 2017 at 10:11:11AM +0800, Ryder Lee wrote:
> Hi all,
> 
> Some patches of this series improve the performances whereas others
> clean up code and refine data structure to make it more efficient
> 
> Changes since v1:
> - drop OFB and CFB patch
> 
> Ryder Lee (8):
>   crypto: mediatek - rework interrupt handler
>   crypto: mediatek - add MTK_* prefix and correct annotations.
>   crypto: mediatek - make mtk_sha_xmit() more generic
>   crypto: mediatek - simplify descriptor ring management
>   crypto: mediatek - add queue_task tasklet
>   crypto: mediatek - fix error handling in mtk_aes_complete()
>   crypto: mediatek - add mtk_aes_gcm_tag_verify()
>   crypto: mediatek - make hardware operation flow more efficient

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
