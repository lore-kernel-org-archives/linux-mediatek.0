Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7D9C636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnASALWcmQx9VakGnwgR1mxBal/Ve7GSPKBAGVW6jVc=; b=2rsVdsYtpBPaT3tsmkGgxjMpG9
	pIlss/9yavLfYL0HDxR+TCs79RBp+16X9YFcMpDW3uwsQA9rsElH1w4hvGrPRKIM9rauG0D9JxT+d
	+RVs/VD59gc28ju32p1t93ITU3HAdfLw7xpMgCjqwlznxFvrysDwR8rjM5NHgCAdJMLZ6WliRFjDZ
	fMhzzrCX5xxm17q81Lm5DUWq0p4NeZbbwaoKSRqTnWmSGG542wKdP2UWw27Z3bYiu70QKEVpdhDZ8
	0RQz5iK2jjd66lJnX0zas8bDolVzGTkppf1qZkk2Hww8niGYLI4Lp0/9uyBBrT36LjHj+TRyWDldA
	VGrpvJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtpb-00DRU5-Tj; Wed, 22 Feb 2023 18:27:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtpR-00DRRj-LG; Wed, 22 Feb 2023 18:26:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD17460C5B;
	Wed, 22 Feb 2023 18:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424DBC433EF;
	Wed, 22 Feb 2023 18:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677090416;
	bh=xBFAtQy7H9IEzhN6tiCIgW4YKmQxOgfi228DV4+IAOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gyy8EWcwUoDh5Qjanib5yUoXbwdJ3E933glFTOrgDTICp8tQxuZZkdBWdCGE3GP5L
	 IxTfwN+Fh1JdZsKTXuH3jKRJEB9zy2LO/NH1jbTZ7E/EOY4q1FNVRzyJjAoBxvmdDu
	 MVV+eDn0AMPxdnL8Q0FRbrW2+coXXNG5QDtWh3vppgE5oVBaBvMuflomt+yJYgElsD
	 MlPWYQGEs//RgjLSUiJywp5dwIEHNFErsiKFuvoqUa/G+n4gVnIs1G6MkBP917I6I1
	 Ekzw/9EtI+E+SdRK5UvkWyfFnnXBWppvc+L5Lm48S6NxOuPYko2N/twjqZwm5QpX26
	 VmfP0U9PyOClQ==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com,
	casper.li@mediatek.com,
	"andrew . yang" <andrew.yang@mediatek.com>,
	stable@vger.kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] mm/damon/paddr: fix missing folio_put()
Date: Wed, 22 Feb 2023 18:26:53 +0000
Message-Id: <20230222182653.156921-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230222064223.6735-1-andrew.yang@mediatek.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_102657_756462_4AB77BB1 
X-CRM114-Status: GOOD (  23.72  )
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


Thank you for revising this patch!

> From: "andrew.yang" <andrew.yang@mediatek.com>
> 
> damon_get_folio() would always increase folio _refcount and
> folio_isolate_lru() would increase folio _refcount if the folio's lru
> flag is set.
> 
> If an unevictable folio isolated successfully, there will be two more
> _refcount. The one from folio_isolate_lru() will be decreased in
> folio_puback_lru(), but the other one from damon_get_folio() will be
> left behind. This causes a pin page.
> 
> Whatever the case, the _refcount from damon_get_folio() should be
> decreased.
> 
> Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
> Fixes: 57223ac29584 ("mm/damon/paddr: support the pageout scheme")
> Cc: <stable@vger.kernel.org> # 5.16.x

Reviewed-by: SeongJae Park <sj@kernel.org>

This may not cleanly applicable on 6.1.y and 6.2.y.  I would post backports
once this is merged in the mainline, unless others do earlier than me.


Thanks,
SJ

> ---
> v3:
>   add fixes tag and cc stable
> v2:
>   according to David's suggestion
>     1. revise subject
>   according to SeongJae's suggestions
>     1. rebase to mm-unstable tree 
>     2. remove braces for th single statements
> ---
>  mm/damon/paddr.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
> index 607bb69e526c..6c655d9b5639 100644
> --- a/mm/damon/paddr.c
> +++ b/mm/damon/paddr.c
> @@ -250,12 +250,11 @@ static unsigned long damon_pa_pageout(struct damon_region *r, struct damos *s)
>  			folio_put(folio);
>  			continue;
>  		}
> -		if (folio_test_unevictable(folio)) {
> +		if (folio_test_unevictable(folio))
>  			folio_putback_lru(folio);
> -		} else {
> +		else
>  			list_add(&folio->lru, &folio_list);
> -			folio_put(folio);
> -		}
> +		folio_put(folio);
>  	}
>  	applied = reclaim_pages(&folio_list);
>  	cond_resched();
> -- 
> 2.18.0
> 
> 

