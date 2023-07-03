Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58454EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MmA8XEU+ZrXII3PHQqU0zf3NbN1gNUmXLfw9UboxhU=; b=Bm9gZZS+p49fCcKrXPBHRG7IA7
	BtXG6jfRcLljNVilZZwSHC6Y00+Mqte6TTTOxt+PoeIraciuIohxS6hq2LouBsG1Lqs+GV2xnXTVZ
	qXGcomJ2IAQ7aj5UNCPwjvqyXhcZgObsVpEWP+xvoIRpBz9KTF21cZpJ+ZCZ5TyYa/RiNBtXgF6aA
	O2tV0EvRViET9+RtQyF/Wl8eh1vAuB+MS4dMklLk2ztwusGCH24SuJAs145QK0qxH1xYe2uHQ9w6I
	0VzBU+GI8BYR+obIvtNQRPIf51y4WUkBbs0FsJZXOdJ142NkD8o4lWdRK8fABnrho87FSXEBc3Jah
	P5RR1ucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGcF-00A6YN-1m;
	Mon, 03 Jul 2023 10:17:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGcC-00A6Ul-0Z;
	Mon, 03 Jul 2023 10:17:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4097860E8B;
	Mon,  3 Jul 2023 10:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27205C433C9;
	Mon,  3 Jul 2023 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688379422;
	bh=Ny5BGLb0fUO45nms2Ulce0zlZ8XNNtXNnuA6dwqjEBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N48t31dmHrvPkjWqY/Baq5NMlwFHpF/7g/ejXfLwkkPN42h5TOXItvma+bxHIp+jm
	 Be0k1GcbbozhqawxgxQ9ckWmybPEkUlvoR9e3y1UyKVALxXzW/pPdkR9hHqr/iSdT4
	 KtIfKN2z/s/hK/pY0Q2lVADesdGmfW/yun/6rNax7EQfnaHXhp7uGAetlmtb6hRiFF
	 9pVWWJ+WHTLS+XS6sXe/ol5Nn/BuiOV3HkRU1rK+AcUuxMlj0YftQB0xU7RSHNZe3q
	 YdkBiGSeWYiXLYG+WOf3YVelcAYE+XuLl6TwnNB5nt1TDV7sYP7EF9CUqrn7ooo++S
	 butW0UvCnz+qA==
Date: Mon, 3 Jul 2023 12:16:57 +0200
From: Christian Brauner <brauner@kernel.org>
To: Andrew Yang <andrew.yang@mediatek.com>, linux-mm@kvack.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com, casper.li@mediatek.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] fs: drop_caches: draining pages before dropping caches
Message-ID: <20230703-freifahrt-dachwohnung-49d858588e88@brauner>
References: <20230630092203.16080-1-andrew.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230630092203.16080-1-andrew.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_031704_273787_6EB6916C 
X-CRM114-Status: GOOD (  17.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Really more suitable for -mm to review.

On Fri, Jun 30, 2023 at 05:22:02PM +0800, Andrew Yang wrote:
> We expect a file page access after dropping caches should be a major
> fault, but sometimes it's still a minor fault. That's because a file
> page can't be dropped if it's in a per-cpu pagevec. Draining all pages
> from per-cpu pagevec to lru list before trying to drop caches.
> 
> Signed-off-by: Andrew Yang <andrew.yang@mediatek.com>
> ---
>  fs/drop_caches.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/drop_caches.c b/fs/drop_caches.c
> index e619c31b6bd9..b9575957a7c2 100644
> --- a/fs/drop_caches.c
> +++ b/fs/drop_caches.c
> @@ -10,6 +10,7 @@
>  #include <linux/writeback.h>
>  #include <linux/sysctl.h>
>  #include <linux/gfp.h>
> +#include <linux/swap.h>
>  #include "internal.h"
>  
>  /* A global variable is a bit ugly, but it keeps the code simple */
> @@ -59,6 +60,7 @@ int drop_caches_sysctl_handler(struct ctl_table *table, int write,
>  		static int stfu;
>  
>  		if (sysctl_drop_caches & 1) {
> +			lru_add_drain_all();
>  			iterate_supers(drop_pagecache_sb, NULL);
>  			count_vm_event(DROP_PAGECACHE);
>  		}
> -- 
> 2.18.0
> 

