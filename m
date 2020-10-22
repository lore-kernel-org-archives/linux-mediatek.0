Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D6CC388F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:29:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B44221FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PPFutMzh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B44221FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aW9JK1owdK9Yi+WrL81PO6V0heIPqBIeJ/8l2614k44=; b=PPFutMzhHY1tM3jGqBslj07Zr
	pLrT2mX2xCNPQCM2yEBYu5+ax6hRJcMicIe12sq53UruyqTw3ATarDRL0R9zyvvZ8K1BArYlWC3Xk
	oYSnBpfkNfbJJM2WcgGTr+Qke5pv0L87/5HVmYokEdC2BTbHKLGgR2Ld7rsJDf1clusO48PV6Y7B2
	ZpvLbANa5c6u2zV+Gbe7rSrK9rm2o7WwlCeiZJKphzDJJFJj5T6x9RPKMqND31uvEi3HNcy336pTp
	mSfxCwsFajsFTTuCbVikgZYubt8AY9Q0hG3FA0ytgshWux/lNE7KOly1Vp2CbHlfreK1Nkvtqb3oA
	7QYMYStpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVZj4-00045k-QP; Thu, 22 Oct 2020 12:29:50 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVZiz-00044R-4a; Thu, 22 Oct 2020 12:29:47 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1kVZid-00048U-5g; Thu, 22 Oct 2020 23:29:24 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 22 Oct 2020 23:29:23 +1100
Date: Thu, 22 Oct 2020 23:29:23 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zhuoliang Zhang <zhuoliang.zhang@mediatek.com>
Subject: Re: [PATCH v2] net: xfrm: fix a race condition during allocing spi
Message-ID: <20201022122923.GA16706@gondor.apana.org.au>
References: <20201022100126.19565-1-zhuoliang.zhang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201022100126.19565-1-zhuoliang.zhang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_082945_184622_E7093A84 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: Steffen Klassert <steffen.klassert@secunet.com>, wsd_upstream@mediatek.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 22, 2020 at 06:01:27PM +0800, Zhuoliang Zhang wrote:
> From: zhuoliang zhang <zhuoliang.zhang@mediatek.com>
> 
> we found that the following race condition exists in
> xfrm_alloc_userspi flow:
> 
> user thread                                    state_hash_work thread
> ----                                           ----
> xfrm_alloc_userspi()
>  __find_acq_core()
>    /*alloc new xfrm_state:x*/
>    xfrm_state_alloc()
>    /*schedule state_hash_work thread*/
>    xfrm_hash_grow_check()   	               xfrm_hash_resize()
>  xfrm_alloc_spi                                  /*hold lock*/
>       x->id.spi = htonl(spi)                     spin_lock_bh(&net->xfrm.xfrm_state_lock)
>       /*waiting lock release*/                     xfrm_hash_transfer()
>       spin_lock_bh(&net->xfrm.xfrm_state_lock)      /*add x into hlist:net->xfrm.state_byspi*/
> 	                                                hlist_add_head_rcu(&x->byspi)
>                                                  spin_unlock_bh(&net->xfrm.xfrm_state_lock)
> 
>     /*add x into hlist:net->xfrm.state_byspi 2 times*/
>     hlist_add_head_rcu(&x->byspi)
> 
> 1. a new state x is alloced in xfrm_state_alloc() and added into the bydst hlist
> in  __find_acq_core() on the LHS;
> 2. on the RHS, state_hash_work thread travels the old bydst and tranfers every xfrm_state
> (include x) into the new bydst hlist and new byspi hlist;
> 3. user thread on the LHS gets the lock and adds x into the new byspi hlist again.
> 
> So the same xfrm_state (x) is added into the same list_hash
> (net->xfrm.state_byspi) 2 times that makes the list_hash become
> an inifite loop.
> 
> To fix the race, x->id.spi = htonl(spi) in the xfrm_alloc_spi() is moved
> to the back of spin_lock_bh, sothat state_hash_work thread no longer add x
> which id.spi is zero into the hash_list.
> 
> Fixes: f034b5d4efdf ("[XFRM]: Dynamic xfrm_state hash table sizing.")
> Signed-off-by: zhuoliang zhang <zhuoliang.zhang@mediatek.com>
> ---
>  net/xfrm/xfrm_state.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
