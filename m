Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07046C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 16:42:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539546191F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 16:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 539546191F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A4PZ+794+cLqoGVmG+dvW9mSso5wFhBNwpy+8MYaZFs=; b=aKg41iQ6hKC00QdfQ38576kl4
	/aM9dO6uPmho4yJ+yoATmQ4cQLysjGJmWYfeyhfebY83pLIRk+si0FJWsCKn9BxkOVF0bKN73XN6G
	re5N/YxMZqdKc/cFhxnU+HGkonsNPZiU67VCAI4p8ykSFJvnziESs8fAUBqekiOfnFu25q/zZqsNJ
	+3CfoJLGYL08qUMrzErOoJ+ucdIF2Eq/zNqTh01eV2CW4Tw+w9eTBiARl6u49p9oFkoWgoq9Mhv9V
	p+XCl3iNpCYjjWBdhL6aYzfeJwnjQEu5CDF0+RVM8OfP7BRUcpLK850BB5WWK0cdldQtDs0luziQS
	2JOImEFfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQuwr-000lvx-KU; Mon, 29 Mar 2021 16:41:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQod3-000Yhr-U1; Mon, 29 Mar 2021 09:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ATCZKkeTs8IU0MUNJGSvTKYmalE+QBjXSnPWHHehSEY=; b=BB2LO/7lBfmzc65J9HACyxObYN
 m4veGbleDQdddGP+IZNlgZ7pFEVgNry4W+3Qfa3QpEDV5zCuLkaU2pAP5BFZoP2jrKM9WOzXjW4UN
 5WBVYqpga6lDaba1zACMS3NsfEinl+3DDHeDbADoPptrcjxOTi8OwOv7ckc+5TrkGUby8LzXO0CxP
 TIxruU/HloS4W61dBJ/Zoj7rWTskPEqyWh66oOd/3pUgW+RTFh6KwQtuL7/lSa7LYpF500gxYztT4
 pl9iORbJxRkzVDwZjGLgV38zMO/0iKYGizgI1G9VUxqZ+13RhzxGUu+MzQBkznQ2GgY1L3poCC3ZD
 4nJIBunw==;
Received: from elvis.franken.de ([193.175.24.41])
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoEa-001KKi-Pd; Mon, 29 Mar 2021 09:31:24 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lQoE1-0003qb-04; Mon, 29 Mar 2021 11:30:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 0D378C1D90; Mon, 29 Mar 2021 11:25:46 +0200 (CEST)
Date: Mon, 29 Mar 2021 11:25:46 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] MIPS: ralink: annotate prom_soc_init() with __init
Message-ID: <20210329092545.GD8484@alpha.franken.de>
References: <20210327053840.471155-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210327053840.471155-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_103101_876094_15DCA0C0 
X-CRM114-Status: GOOD (  12.71  )
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

On Fri, Mar 26, 2021 at 10:38:39PM -0700, Ilya Lipnitskiy wrote:
> prom_soc_init is only called from prom_init in arch/mips/ralink/prom.c,
> which is already annotated with __init, so annotate prom_soc_init with
> __init too.
> 
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/ralink/common.h | 2 +-
>  arch/mips/ralink/mt7620.c | 2 +-
>  arch/mips/ralink/mt7621.c | 2 +-
>  arch/mips/ralink/rt288x.c | 2 +-
>  arch/mips/ralink/rt305x.c | 2 +-
>  arch/mips/ralink/rt3883.c | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
