Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9F6C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEduu8lG576J1PT74GPwcOiZm9fPXyVi3oiEJ3RNdS8=; b=gsHrSPi8JLIZ5GLzYT/ywwf2g3
	8SHdpK4jde2U4ynywq3z9f+rt8nXLcG3ENTMrTs61pzJE2k5rouGFtxRH/+pxSz/jZatPKEvZoxKp
	ElZZV9HIVN6TOcv47+0Tj7lRjA7MAlw9fYgIBbeH5oS53vegzKpor6H2IFO2be25u9UIdcpYeRZVz
	nypw6ArWZ2tfgvyP7dV3ji88jyE9bAi8Lw1taxHbmjiOrwYIRv+b+pJGP7xHyfNbJh6+ybfXWwJ6K
	FA4BKenUuEAtSd1nqboxdjmneEDJPZnJIc2dO2n+z40JRhvvBTQ99SdLk17sWqGcUqG62B9wF4HMJ
	HkuDL5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXTw-009OY5-W8; Tue, 21 Feb 2023 18:35:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXTm-009OVp-UN; Tue, 21 Feb 2023 18:35:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCDEB60FBC;
	Tue, 21 Feb 2023 18:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44575C433D2;
	Tue, 21 Feb 2023 18:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677004504;
	bh=dgnjcSUG5w1/UXY20oy7pA67rk5DpCFG+LKqSztlm2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JaHaknMQH94f0Ouz7x7+bJIIjbqP/1A+lf0z1r07/7u31jA6NOMhkjW7+NQyvj35e
	 r/jQRM84dkmgFx+I10T1+lXThjNBjateNxycYIcs8ndkx+83AY7RtGGDH1RDlxKsfx
	 F0ElKYH0Wx72EtvnPAl2tSazAPHRHXzUqgYigzELtugc3AHpiPANpZvByCujdPkOTF
	 w0dPFwyDldQNFWCLQNnI2VnKaMG/a15VZoIU6XlPnNlL9JqQDQxANx9QltdGXZU71M
	 Dl2ye6B6QBHGkFlvvHhMbYXijeMmxJYK1eg3IOhRUo8lxsPqfw5aljOdgLV50q/zFN
	 Y/WQZlhgK3iOA==
From: SeongJae Park <sj@kernel.org>
To: Andrew Yang <andrew.yang@mediatek.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com,
	casper.lin@mediatek.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/damon/paddr: fix pin page problem
Date: Tue, 21 Feb 2023 18:35:01 +0000
Message-Id: <20230221183501.132024-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221090313.15396-1-andrew.yang@mediatek.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_103507_056838_AA9E096A 
X-CRM114-Status: GOOD (  23.41  )
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

Hi Andrew,


On Tue, 21 Feb 2023 17:03:13 +0800 Andrew Yang <andrew.yang@mediatek.com> wrote:

> From: "andrew.yang" <andrew.yang@mediatek.com>
> 
> damon_get_page() would always increase page _refcount and
> isolate_lru_page() would increase page _refcount if the page's lru
> flag is set.
> 
> If a unevictable page isolated successfully, there will be two more
> _refcount. The one from isolate_lru_page() will be decreased in
> putback_lru_page(), but the other one from damon_get_page() will be
> left behind. This causes a pin page.
> 
> Whatever the case, the _refcount from damon_get_page() should be
> decreased.

Thank you for finding this issue!  I think the David suggested subject[1] is
better, though.

I think we could add below Fixes: and Cc: tags?

Fixes: 57223ac29584 ("mm/damon/paddr: support the pageout scheme")
Cc: <stable@vger.kernel.org> # 5.16.x

> 
> Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
> ---
>  mm/damon/paddr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
> index e1a4315c4be6..56d8abd08fb1 100644
> --- a/mm/damon/paddr.c
> +++ b/mm/damon/paddr.c
> @@ -223,8 +223,8 @@ static unsigned long damon_pa_pageout(struct damon_region *r)
>  			putback_lru_page(page);
>  		} else {
>  			list_add(&page->lru, &page_list);
> -			put_page(page);
>  		}
> +		put_page(page);

Seems your patch is not based on mm-unstable tree[2].  Could you please rebase
on it?

Also, let's remove the braces for the single statements[3].

[1] https://lore.kernel.org/damon/1b3e8e88-ed5c-7302-553f-4ddb3400d466@redhat.com/
[2] https://docs.kernel.org/next/mm/damon/maintainer-profile.html#scm-trees
[3] https://docs.kernel.org/process/coding-style.html?highlight=coding+style#placing-braces-and-spaces


Thanks,
SJ

>  	}
>  	applied = reclaim_pages(&page_list);
>  	cond_resched();
> -- 
> 2.18.0

