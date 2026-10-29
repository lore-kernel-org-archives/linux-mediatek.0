Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966A60A260A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e8447zt0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O73oQffq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R5j+yiYhCHq58JPEG4iD9M+YB5PgArKotbfDfonHirY=; b=e8447zt0AiCazrS2ppxwocbL9h
	uX976jKyUDAS2WIAQrVWjuSExpwsiI4cVT4s8/yKQqBEgGGz/1bDub/KGUEOu4qqTaD88at1J7zoG
	6/viQwZr7+v2mG2Zt2iLQQrN9QmJOclNoJzK1n43VNodyOUA/AnNRNIEd5P4tDFGTPPrL2FWYXTwK
	9aE+y0edhatH1gpSqClGI4bVWx3NF7zfje96CkWuvfn73150DIlLFQGAGJZDG106wCt4JIu8W8q7T
	408ZAhkMWRTZzLlfdoKD8dYzBsLzlZp6oWqqmg3CHDfrqeqXZu+CLdRf2o1nPvSR4+VSmCuO8i+kF
	Xdfyde9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMvS-00000008upJ-2GId;
	Thu, 29 Oct 2026 10:00:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMvQ-00000008uoQ-365S;
	Thu, 29 Oct 2026 10:00:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0694843B14;
	Thu, 29 Oct 2026 10:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DE31F01825;
	Thu, 29 Oct 2026 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267999;
	bh=R5j+yiYhCHq58JPEG4iD9M+YB5PgArKotbfDfonHirY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O73oQffqeqikGDOuGDIY+NW2h/CpmNU5TKIWGZcmDMP/nIgRRBHUlxQ/rByvmxysZ
	 2DibCtTty4S0qQ9JYLUNQ2dkoJIfYb8Wg3hbow/0qw3zC5PBMT7ZxMHVn7cTHo7P2Q
	 eHigrpfHtmmgho+MFCgSY57Bf3fA0P7yUHFhFVvfcWiY3qyFqifrEJNJT3kb10q7fr
	 glHPWTJcD+Lxk+9D43PGxMBgpyc1vLVzeGu/TPAkP2mu3xRvW6L77MXJ9JtBs+0ddf
	 BwJsHcek9yBt2zul90gA9wabFYrnGM5WS2elzRf2uumNpf+KWH+n9eTsTQmHKx/8s9
	 GLzP+X0yXxHbg==
Date: Thu, 29 Oct 2026 09:59:54 +0000
From: Simon Horman <horms@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: alex@goodkind.io, nbd@nbd.name, lorenzo@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, tarick@bedeir.com
Subject: Re: [PATCH net] net: ethernet: mediatek: preserve sibling PPE
 bindings
Message-ID: <20261029095954.GD257209@horms.kernel.org>
References: <20261023012529.5994-1-alex@goodkind.io>
 <179306513862.3134.14236907013127690482@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179306513862.3134.14236907013127690482@kernel.org>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 01:38:58AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 (3) · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix is incomplete: the L2_SUBFLOW branch of
>   __mtk_ppe_check_skb()…

Hi Alexander,

The issue above does seem to be of concern.
Could you please respond to it?

> 
> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but L2 (bridge)
>   flows never get the 0xffff 'unbound' sentinel in entry->hash.
> - [Medium] This problem wasn't introduced by this patch, but
>   mtk_flow_offload_stats() reads entry->hash without ppe_lock: once for…
> - [Medium] This problem wasn't introduced by this patch, but the MIB read
>   sequence in mtk_mib_entry_read() is not serialized.

...

