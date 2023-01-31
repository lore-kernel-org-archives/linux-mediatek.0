Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2E1C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 23:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYsCKqURYSpvX4r3vNrvgRphtVybBKSp8b/XLF2mR1k=; b=akGM2AlBdcnTge98+da9KR1Rfx
	/XzPWBSML5+CR7Hpi8wYY5R/aJrnPHieVHa066VAsnuE3bC8MRIl+Rw/hXGcFEgK0mCw2i2apZue/
	sH8Si6KiZ0hD2BY7AFd5OKzXUUhGuXkN1QHg53qZf9MOvYenVK5bzJo5uNqkEQj1n2wjMI0BUvv4R
	ti1mtKyCPF+aR4AhkSm0KghsEvTs84nixPjg9u9IjUDPFf483IYfw0l3cKVvccf5TJ9y6soOgO7fT
	nx87ZNOQY2OJUOKz3O4lHx+ZYGEyO/VJANlRv9RYb9aePLSV1gwYYGqFfvx/9kLhp3pzrwOyEWnty
	n84il9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMzsw-009f7B-RA; Tue, 31 Jan 2023 23:17:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMzsn-009f5H-1M; Tue, 31 Jan 2023 23:17:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 266096173F;
	Tue, 31 Jan 2023 23:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B71C433D2;
	Tue, 31 Jan 2023 23:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1675207063;
	bh=9gIG6ub4W7Ha8XoJuUw+fr70dVqCYbeFXGcT/33aTxM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yYF2fcfJYQ9Oj2bsgYjdQr3rA3MST8yjvB6HjFHEs11Ec+JcfyjhnGzPpD76rdCjh
	 5ETkg050rbXW8vogKCM3u0KwtMyLjv5iyGk+TAWBPx3981me5xnnSxTEqV2H004lzh
	 Zajar06+fQHk9w6VqMTwtt2D5seDlwEt0Dkx+sBI=
Date: Tue, 31 Jan 2023 15:17:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Alistair Popple
 <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <chinwen.chang@mediatek.com>, <andrew.yang@mediatek.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mm/gup: Add folio to list when folio_isolate_lru()
 succeed
Message-Id: <20230131151742.df43c3fd11bda01b613234ef@linux-foundation.org>
In-Reply-To: <20230131063206.28820-1-Kuan-Ying.Lee@mediatek.com>
References: <20230131063206.28820-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_151745_168751_97F3C906 
X-CRM114-Status: GOOD (  15.67  )
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

On Tue, 31 Jan 2023 14:32:06 +0800 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:

> If we call folio_isolate_lru() successfully, we will get
> return value 0. We need to add this folio to the
> movable_pages_list.
> 
> Fixes: 67e139b02d99 ("mm/gup.c: refactor check_and_migrate_movable_pages()")
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
>
> ...
>
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1914,7 +1914,7 @@ static unsigned long collect_longterm_unpinnable_pages(
>  			drain_allow = false;
>  		}
>  
> -		if (!folio_isolate_lru(folio))
> +		if (folio_isolate_lru(folio))
>  			continue;
>  
>  		list_add_tail(&folio->lru, movable_page_list);

Thanks.  What are the user-visible effects of this bug?


