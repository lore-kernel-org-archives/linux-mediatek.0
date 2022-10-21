Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A062CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 11:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0c1ct15PAXaObNvApI02T5H7NDvJ3McOK9KajrFP+k=; b=BXVkclennMK8CfQjJkmucBvwWS
	7peZMus6S6QFAtkUwjbyhINFVR3t8ZFQf99gk/MpZ28MBZpcSDnw07XNXyCIa5cxz4pVMZ9IPfWhM
	foOJ9vNMg5cE4OWc2ZprULVsqyXzTXfuzDwPKplyDBGRL66oDwMeCEaxYaV6Zu6FYgHuxttEZ2JUv
	xRcUT5kHVmkfgf3krvy6rIvARYm3h+tELRFpBZRZXNAihgMuKv08Ok2Zz8YUHVTptx23toZgsRZne
	n3OAG2SvRz5WvUFdjgmm06qXtOnLKUfaGmzwrUp6a8TWvFBmqkh/6Vj/4TBIUUzNqB1aUL6JNfjRz
	udx5Uu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olqLj-007PnB-Tx; Fri, 21 Oct 2022 11:38:03 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=formenos.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olqLh-007PmH-Vv; Fri, 21 Oct 2022 11:38:03 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1olqKy-004dy3-8g; Fri, 21 Oct 2022 19:37:53 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 21 Oct 2022 19:37:52 +0800
Date: Fri, 21 Oct 2022 19:37:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] hwrng: mediatek: add mt7986 support
Message-ID: <Y1KEkFvOu3f2Lu3k@gondor.apana.org.au>
References: <20221008164553.113260-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221008164553.113260-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_043802_043965_40C40CAE 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, "Mingming.Su" <Mingming.Su@mediatek.com>, linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 08, 2022 at 06:45:53PM +0200, Frank Wunderlich wrote:
> From: "Mingming.Su" <Mingming.Su@mediatek.com>
> 
> 1. Add trng compatible name for MT7986
> 2. Fix mtk_rng_wait_ready() function
> 
> Signed-off-by: Mingming.Su <Mingming.Su@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/char/hw_random/mtk-rng.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

