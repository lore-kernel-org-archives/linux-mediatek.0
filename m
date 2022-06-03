Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 19:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4j+PvExi9vUmMenlJNv2BPy4G/YJ3ezQ7r6xc2FNbs=; b=RAzblvZ2ydG6oN
	NuuhfrsZEr/JeIEpc70LYeccIZVO8f0mXYugU7rXO1ilOEX2fQ5vYm3IJjS4SBQrkWoF31eaQhbpk
	T2XFc/V+k6aP0iVcczsJiRsoSK3g8rN0n0SQSHlxhLs3vR50esP9a73YDAMZxhY1+O0ef228D82AD
	FJwVtlw6vexT+p2CknQwCbqvrIdYgcyJzKYRPAkFaatuYJQbO4ojTpzfW8ViP8Fz592aScEgS6U6B
	UP0fHVT40naFSvLGMoagFeuUmkdjGklsDAyiGBR/g+QWfsrw5yafrDPqDsFkCzlFmF/XK8S1u95FU
	RVCAbntvaTjyKNHjg7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxDOO-008YvY-88; Fri, 03 Jun 2022 19:55:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxDOC-008Ysb-Kw; Fri, 03 Jun 2022 19:55:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0BB84B8247A;
	Fri,  3 Jun 2022 19:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F29AC385B8;
	Fri,  3 Jun 2022 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654286117;
	bh=y8aYnaYwz4+KId5P5OeplEKVGDbn7Zzq1Ft2dBsCh3U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iJTbyezmQ9eaEmyTuFD/fY5KA7hnnJLhI6ELaf5GmGUBoWBMVo0pv5BPLbO7WWFIw
	 UzuXhT6QzCyOXM0pKRjilJLdOausogus+uE3VRNA1SmOqcJK/NKbq+mRtU/3+VZdZi
	 n3VQ08ZtKeHb7nRjnnzMCeVcnY+BF5769Cd3itj8hGfbfmjXjZHIblzdgkzqE1c0D7
	 JL1lbbXSZRLhejRq/7n2MV6joHNfRVPE4J8/Myjec5UgQUbKLxZr6TMKeK+EHGaGvj
	 k7ieV3fxfbn8gh6oZZ0N5p/n4ECiwIsLOzq5di0JI8lJGJUwyi4FjFvNGDfCYsyxhp
	 VAyhQ9kiriIcQ==
Date: Fri, 3 Jun 2022 12:55:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Dumazet <edumazet@google.com>
Cc: Chen Lin <chen45464546@163.com>, Felix Fietkau <nbd@nbd.name>,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, David
 Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev[napi]_alloc_frag
Message-ID: <20220603125516.52353a4a@kernel.org>
In-Reply-To: <CANn89i+dW+paaybeDkkC0XxYM+Mv_AOnbi6GSLtTgAv9L=TX7Q@mail.gmail.com>
References: <2997c5b0-3611-5e00-466c-b2966f09f067@nbd.name>
	<1654245968-8067-1-git-send-email-chen45464546@163.com>
	<CANn89iKiyh36ULH4PCXF4c8sBdh9WLksMoMcmQwipZYWCzBkMA@mail.gmail.com>
	<20220603115956.6ad82a53@kernel.org>
	<CANn89i+dW+paaybeDkkC0XxYM+Mv_AOnbi6GSLtTgAv9L=TX7Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_125520_879628_B8B21A7B 
X-CRM114-Status: GOOD (  19.17  )
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

On Fri, 3 Jun 2022 12:11:43 -0700 Eric Dumazet wrote:
> Yes, we only have to review callers and change the documentation and
> implementation.
> 
> The confusion/overhead/generalization came with :
> 
> commit 7ba7aeabbaba484347cc98fbe9045769ca0d118d
> Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Date:   Fri Jun 7 21:20:34 2019 +0200
> 
>     net: Don't disable interrupts in napi_alloc_frag()
> 
>     netdev_alloc_frag() can be used from any context and is used by NAPI
>     and non-NAPI drivers. Non-NAPI drivers use it in interrupt context
>     and NAPI drivers use it during initial allocation (->ndo_open() or
>     ->ndo_change_mtu()). Some NAPI drivers share the same function for the  
>     initial allocation and the allocation in their NAPI callback.
> 
>     The interrupts are disabled in order to ensure locked access from every
>     context to `netdev_alloc_cache'.
> 
>     Let netdev_alloc_frag() check if interrupts are disabled. If they are,
>     use `netdev_alloc_cache' otherwise disable BH and invoke
>     __napi_alloc_frag() for the allocation. The IRQ check is cheaper
>     compared to disabling & enabling interrupts and memory allocation with
>     disabled interrupts does not work on -RT.

Hm, should have looked at the code. Were you thinking of adding a
helper which would replace both netdev_ and napi_ variants and DTRT
internally?

An option for getting GFP_KERNEL in there would be having an rtnl frag
cache. Users who need frags on the reconfig path should be under rtnl,
they can call rtnl_alloc_frag(), which can use GFP_KERNEL internally.
Otherwise the GFP_KERNEL frag cache would need to be protected by
another mutex, I presume. Pre-allocating memory before using the napi
cache seems hard.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
