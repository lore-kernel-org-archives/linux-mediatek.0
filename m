Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE66EC388F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 06:00:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 313032244C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 06:00:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W1URY1lF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JqQgzu93"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 313032244C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BYeVeLB6YG45cnBbb9c3RKfJTgAjU6UCVGFVpf17cRE=; b=W1URY1lFGldwl5xph9gM6ehYz
	ORW9T93Yx9NJci1Z5Xa7m901LkJVxgejPL99/D0920cMcVJuiF0BUh/A/7IK+gmRlF/N+XKrTz7du
	VtOuXCjUAIjyw6KsLl2XY+I4IRFuhgFj/YixcgjKYvkYSjevEesI2XKgWJsSIMjJi8qzdOQRvuDuN
	ezfBBiQkkDa6Duttt3mQEbpOpuzBF6Z/C2Q+7ersB8a8i9aW756ZjKUFeIBAhzsYAioXBVbv9aQCT
	pR9sxhv0R2sdSZaKwvZXzLY/rapdXg9UnzoGs1yIg8BzD6j9ZG1SeGxEHXPhMt91LxHh0eCMTB3IE
	wEoLn0E/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVTdz-0005Jj-15; Thu, 22 Oct 2020 06:00:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVTdw-0005Ia-8G; Thu, 22 Oct 2020 06:00:09 +0000
X-UUID: af2babcb47284fff9892a57b5916142b-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2RTnJ5bggE6yxjCSkF508vcLzRCyBm7i8MbqmzI5xrI=; 
 b=JqQgzu936rBhuHQI3LFgeASeZrxW9MyxnzZn0RyGO0D+xCRrndvCz7uyEaVfqQF1Ydz6NqbdjXckxyvK4+e7y1VJr3mnE+uAzz5gaSPqyJVQTZ2718oV1leaDB1FRn9TUMGM1tkT9ZCDG/JmJ4e4watrjg2yKhRoOqVCVoOkgqA=;
X-UUID: af2babcb47284fff9892a57b5916142b-20201021
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <zhuoliang.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 509836399; Wed, 21 Oct 2020 21:59:50 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 22:59:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 13:59:47 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Oct 2020 13:59:47 +0800
Message-ID: <1603345995.13237.2.camel@mbjsdccf07>
Subject: Re: [PATCH] net: xfrm: fix a race condition during allocing spi
From: zhuoliang.zhang <zhuoliang.zhang@mediatek.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 22 Oct 2020 13:53:15 +0800
In-Reply-To: <20201021071222.GA11474@gondor.apana.org.au>
References: <20201020081800.29454-1-zhuoliang.zhang@mediatek.com>
 <20201021071222.GA11474@gondor.apana.org.au>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_020008_486196_22880737 
X-CRM114-Status: GOOD (  14.40  )
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

hi maintainer:

there are 2 related hash lists : net->xfrm.state_bydst and
net->xfrm.state_byspi:

1. a new state x is alloced in xfrm_state_alloc() and added into the
bydst hlist in  __find_acq_core() on the LHS;
2. on the RHS, state_hash_work thread travels the old bydst and tranfers
every xfrm_state (include x) to the new bydst hlist and new byspi hlist;
3. user thread on the LHS gets the lock and adds x to the new byspi
hlist again.

thanks




On Wed, 2020-10-21 at 18:12 +1100, Herbert Xu wrote:
> On Tue, Oct 20, 2020 at 04:18:00PM +0800, Zhuoliang Zhang wrote:
> > From: zhuoliang zhang <zhuoliang.zhang@mediatek.com>
> > 
> > we found that the following race condition exists in
> > xfrm_alloc_userspi flow:
> > 
> > user thread                                    state_hash_work thread
> > ----                                           ----
> > xfrm_alloc_userspi()
> >  __find_acq_core()
> >    /*alloc new xfrm_state:x*/
> >    xfrm_state_alloc()
> >    /*schedule state_hash_work thread*/
> >    xfrm_hash_grow_check()   	               xfrm_hash_resize()
> >  xfrm_alloc_spi                                  /*hold lock*/
> >       x->id.spi = htonl(spi)                     spin_lock_bh(&net->xfrm.xfrm_state_lock)
> >       /*waiting lock release*/                     xfrm_hash_transfer()
> >       spin_lock_bh(&net->xfrm.xfrm_state_lock)      /*add x into hlist:net->xfrm.state_byspi*/
> > 	                                                hlist_add_head_rcu(&x->byspi)
> >                                                  spin_unlock_bh(&net->xfrm.xfrm_state_lock)
> > 
> >     /*add x into hlist:net->xfrm.state_byspi 2 times*/
> >     hlist_add_head_rcu(&x->byspi)
> > 
> > So the same xfrm_stame (x) is added into the same list_hash
> > (net->xfrm.state_byspi)2 times that makes the list_hash become
> > a inifite loop.
> 
> Your explanation makes no sense.  Prior to obtaining the spin lock
> on the LHS, the state x hasn't been added to thte table yet.  So
> how can the RHS be transferring it?
> 
> Cheers,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
