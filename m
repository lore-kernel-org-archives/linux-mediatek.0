Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F9DC4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 06:48:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B159C2085B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 06:48:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lPs4bmWE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B159C2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vF61Kq9w23Ly2Cx7MD3bO1rvqsA+oM7xDzCIFqxSxYA=; b=lPs4bmWESbMa/7AFBv9K/uzCj
	fPM1bY+1ORyCKGcxjephOXpuNs1WL732hLuX6a4nIdGbCHjTl8L7E0Yp1AxcCUjUrhJH9f8TqCmZ5
	SkOqCQZFx6QKhU+hrA9d71shwmn5YA/M/anR7euXQOqhBlTsOinVYvWNkBMICm/DedopE8dEEjvNi
	m7ZXet5V74Zx3snBr0j5qhNmVmjbG7oExpw/wIHLV5kQosvz8X1Xje5kfHT0xfapPzfhWdDp0Lj/F
	leJTAYk0pJ+2KL3aMXazyF3Gen9RCiz1XSp9U4sJfpbwzlCUnBvD8b1yeiHBvvezMOLq6byGG9EwU
	OeQlE0wIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVUOm-0007uL-7j; Thu, 22 Oct 2020 06:48:32 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVUOh-0007tL-Eq; Thu, 22 Oct 2020 06:48:28 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1kVUON-00077a-V1; Thu, 22 Oct 2020 17:48:09 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 22 Oct 2020 17:48:07 +1100
Date: Thu, 22 Oct 2020 17:48:07 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "zhuoliang.zhang" <zhuoliang.zhang@mediatek.com>
Subject: Re: [PATCH] net: xfrm: fix a race condition during allocing spi
Message-ID: <20201022064807.GA16043@gondor.apana.org.au>
References: <20201020081800.29454-1-zhuoliang.zhang@mediatek.com>
 <20201021071222.GA11474@gondor.apana.org.au>
 <1603345995.13237.2.camel@mbjsdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603345995.13237.2.camel@mbjsdccf07>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_024827_535844_16F3F140 
X-CRM114-Status: GOOD (  10.46  )
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

On Thu, Oct 22, 2020 at 01:53:15PM +0800, zhuoliang.zhang wrote:
> 
> there are 2 related hash lists : net->xfrm.state_bydst and
> net->xfrm.state_byspi:
> 
> 1. a new state x is alloced in xfrm_state_alloc() and added into the
> bydst hlist in  __find_acq_core() on the LHS;
> 2. on the RHS, state_hash_work thread travels the old bydst and tranfers
> every xfrm_state (include x) to the new bydst hlist and new byspi hlist;
> 3. user thread on the LHS gets the lock and adds x to the new byspi
> hlist again.

Good catch.  Please add a Fixes header.  I think this was introduced
with the dynamic resizing in f034b5d4efdfe0fb9e2a1ce1d95fa7914f24de49.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
