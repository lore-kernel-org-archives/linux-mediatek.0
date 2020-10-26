Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6FFC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 08:24:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7771B223B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 08:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HXziyiuy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7771B223B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5L0QxThlYyjbb866e/Y9kjG9cWt4W0ioniBjABcAviA=; b=HXziyiuyJfTDEjNbSRndAXykW
	Oeajo3MAQ8QWraJGrwis3ZCDxEaYkcR5MnWyFD6YAD1QvgQMqhnPGqYqX3n+eyLJz7oH30MFnbFU9
	6jIYJy0Hr/5RrPZpZE9Pi5qH/TsCntlvpPcOYcLjRknQ28hWCTfltAiTysQPjaIdASlBBdTH1n99k
	+D3biw0uz7NpyJtMCgAIEI0ioYjw7YMV1cIr3jaO5NMN7DU43ZOekfgir3i1CpBTEMItnRt9n/O0x
	hbB8LkCky0zjcJp5AXL0TFreoR5X60vhJShXqNy18l5u4cKuS8Zg8RU61qhojnasH/0oKGXqLI/Zc
	FPZsn9BZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWxnN-0007uK-AS; Mon, 26 Oct 2020 08:24:02 +0000
Received: from a.mx.secunet.com ([62.96.220.36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWxnI-0007rB-0s; Mon, 26 Oct 2020 08:23:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 59A8020501;
 Mon, 26 Oct 2020 09:23:40 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bBK94TIIxWU1; Mon, 26 Oct 2020 09:23:39 +0100 (CET)
Received: from mail-essen-01.secunet.de (unknown [10.53.40.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id CBB11200A3;
 Mon, 26 Oct 2020 09:23:39 +0100 (CET)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 mail-essen-01.secunet.de (10.53.40.204) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Mon, 26 Oct 2020 09:23:39 +0100
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 26 Oct
 2020 09:23:39 +0100
Received: by gauss2.secunet.de (Postfix, from userid 1000)	id ABD2B3184555;
 Mon, 26 Oct 2020 09:23:38 +0100 (CET)
Date: Mon, 26 Oct 2020 09:23:38 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Zhuoliang Zhang <zhuoliang.zhang@mediatek.com>
Subject: Re: [PATCH v2] net: xfrm: fix a race condition during allocing spi
Message-ID: <20201026082338.GS31157@gauss3.secunet.de>
References: <20201022100126.19565-1-zhuoliang.zhang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201022100126.19565-1-zhuoliang.zhang@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_042356_293415_EC8047A0 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, wsd_upstream@mediatek.com,
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

Applied, thanks a lot!

One remark, please don't use base64 encoding when you send patches.
I had to hand edit your patch to get it applied.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
