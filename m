Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2209C3F2D2
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 01:49:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 708C42073B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 01:49:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h0VUO2hc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 708C42073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2thXmcXOlx6xRFDQuRbvl12UnQ4LRFV3+nZwY1rsIBU=; b=h0VUO2hc960MYy
	N/UcxKGZDs+uqulED4af55P6y/25LUEJx/GY3huN5d2p2Uf6MU08MYAyvtK8Kavfktaz7BBxNZqXd
	+EckioUnnro4i9YJj5f4EjrS1NpjGLYWFno6H5/2ewSB66gXoDfN+vd8GV6W9RavAHpmQOJ5Hhu2x
	SIgzGpXzwNcTdnha82R87SkjYvbzsDM9p59FW+qdqM5YT3cSWmfzw6HTwd44Y0UM0oDN8C9v6WZgX
	YjmSl5Mbu26txMIkghU7krgCckQQSq/ASyIP0Xw2lk/0A3hVjzpsJb5c3QaUfP7ha+5NSAPiJRM0R
	fbB6ItVWum1gL2VCx7Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA27U-0006KU-6w; Fri, 06 Mar 2020 01:49:44 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA279-0005wx-37; Fri, 06 Mar 2020 01:49:25 +0000
Received: from gwarestrin.me.apana.org.au ([192.168.0.7]
 helo=gwarestrin.arnor.me.apana.org.au)
 by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
 id 1jA26R-0005j2-Mp; Fri, 06 Mar 2020 12:48:40 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 06 Mar 2020 12:48:39 +1100
Date: Fri, 6 Mar 2020 12:48:39 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] crypto: Replace zero-length array with flexible-array
 member
Message-ID: <20200306014839.GC30653@gondor.apana.org.au>
References: <20200224162100.GA25697@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224162100.GA25697@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_174923_431793_22472FBB 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Nayna Jain <nayna@linux.ibm.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Atul Gupta <atul.gupta@chelsio.com>,
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 24, 2020 at 10:21:00AM -0600, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/crypto/caam/caamalg.c              | 2 +-
>  drivers/crypto/caam/caamalg_qi.c           | 4 ++--
>  drivers/crypto/caam/caamalg_qi2.h          | 6 +++---
>  drivers/crypto/caam/caamhash.c             | 2 +-
>  drivers/crypto/cavium/nitrox/nitrox_main.c | 2 +-
>  drivers/crypto/chelsio/chcr_core.h         | 2 +-
>  drivers/crypto/mediatek/mtk-sha.c          | 2 +-
>  drivers/crypto/nx/nx.h                     | 2 +-
>  drivers/crypto/omap-sham.c                 | 4 ++--
>  include/crypto/if_alg.h                    | 2 +-
>  10 files changed, 14 insertions(+), 14 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
