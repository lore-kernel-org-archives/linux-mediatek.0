Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3B2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 12:24:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B325860F44
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 12:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B325860F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23vwiBf1pHV/9iOdObalxN9mI8XXFHmi25QiNAktogM=; b=E9Qmqdf3lepKwU
	tfqK703/wQgT7hXJhdJs0i80xaUGFpc/XwxZBl2eyDDU7nB+jsGdNfUOAbM7Y1sUh70TG2j3l41AV
	I9i1EvvOFOWK05lVifICYJMor14yi/lKHM7eeJQnyitih4AfhEu/Hn3pq4qJQMMtlPArrcunY1NyM
	f4TjTrJRKdlOOTwOb06bQGbfyk/2kQ2VRJ3yDQWP3OQai7AHEG5B6Y8O7WGaaaeDGIgT9lTPjbWvH
	b6NjGtquCvLW6nqeXwgp1m1APcFw41ktZo0dOPfcJxF5n/bedEBlD3d4kaMA/WnELn9BVp8z1/7dN
	W6WG1/x3ZhI4G9T3RAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYovQ-002gYX-QW; Fri, 08 Oct 2021 12:24:32 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=deadmen.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYovN-002gXK-Oo; Fri, 08 Oct 2021 12:24:31 +0000
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
 id 1mYovH-0003dn-28; Fri, 08 Oct 2021 20:24:23 +0800
Received: from herbert by gondobar with local (Exim 4.92)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1mYovD-00086s-P6; Fri, 08 Oct 2021 20:24:19 +0800
Date: Fri, 8 Oct 2021 20:24:19 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Matt Mackall <mpm@selenic.com>,
 linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] hwrng: mediatek - Force runtime pm ops for sleep ops
Message-ID: <20211008122419.GE31060@gondor.apana.org.au>
References: <20210930191242.2542315-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930191242.2542315-1-msp@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_052429_829881_A4D3ED28 
X-CRM114-Status: GOOD (  14.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 30, 2021 at 09:12:42PM +0200, Markus Schneider-Pargmann wrote:
> Currently mtk_rng_runtime_suspend/resume is called for both runtime pm
> and system sleep operations.
> 
> This is wrong as these should only be runtime ops as the name already
> suggests. Currently freezing the system will lead to a call to
> mtk_rng_runtime_suspend even if the device currently isn't active. This
> leads to a clock warning because it is disabled/unprepared although it
> isn't enabled/prepared currently.
> 
> This patch fixes this by only setting the runtime pm ops and forces to
> call the runtime pm ops from the system sleep ops as well if active but
> not otherwise.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/char/hw_random/mtk-rng.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
