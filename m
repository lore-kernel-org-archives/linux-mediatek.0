Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D287EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRla7TvS6Xyca7BJIrqXLtu50EXCq8Mbvqiwa5vRgRY=; b=eVKh9KI01w5p/OB34RmI1ZKRTZ
	/qquu17SSHW4ka3d74sre/tm8Ukpo+38DosCBCwKamXWXifLhxMkZauZUWUuPrn/ZDVYr/UFf2f9T
	EcTI+HywekcKHtYZdf5LqZ8I2iB9TVIOy4VkZKxk3xePTHJdbqmAyTdJz1WyD59c/deTXfJMK5Z2w
	ZPQRxxmrXWX1nGiM+K73oeJ80fEAMmZXlL6gu7XxOlgOEYHJ/BXMEzoy9H4VS6Vib5O0hxMe29VAg
	WgBOvD1gL+S/vkxP2JPnrW3wI4NYTTm8xK03+nYlfC6CewuBHrTinmlu50mpJhyz9uDXlu6WvuZL9
	WK4eMebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGkQc-00DzoX-2v;
	Tue, 04 Jul 2023 18:07:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGkQX-00Dzn6-2I;
	Tue, 04 Jul 2023 18:07:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33F926131D;
	Tue,  4 Jul 2023 18:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2238BC433C7;
	Tue,  4 Jul 2023 18:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1688494020;
	bh=ax5aSQO7Q8i6scQMJDEtYLdG7HxPbixeLmpQBL1NGoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LiSYfNW4TUnYtrQLCm6LWhvyq7sD/au+ZwfSvS7XN04La/WLKynldo0dtKtmTTBwL
	 WunDie3WP/NVO2OTkEben6uoo40mXyy3iL4tIc0/SXP+KDsfcah/LL3k2H6Nid4f1F
	 iT9+PXkbHIQqe5sPUk5oPnCMOivXMUqefaaSpfF8=
Date: Tue, 4 Jul 2023 11:06:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Yang <andrew.yang@mediatek.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <wsd_upstream@mediatek.com>, <casper.li@mediatek.com>,
 <linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, linux-mm@kvack.org
Subject: Re: [PATCH] fs: drop_caches: draining pages before dropping caches
Message-Id: <20230704110659.3e1de8001f9208e7278352e8@linux-foundation.org>
In-Reply-To: <20230630092203.16080-1-andrew.yang@mediatek.com>
References: <20230630092203.16080-1-andrew.yang@mediatek.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_110701_804292_FD809B7A 
X-CRM114-Status: GOOD (  15.47  )
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

On Fri, 30 Jun 2023 17:22:02 +0800 Andrew Yang <andrew.yang@mediatek.com> wrote:

> We expect a file page access after dropping caches should be a major
> fault, but sometimes it's still a minor fault. That's because a file
> page can't be dropped if it's in a per-cpu pagevec. Draining all pages
> from per-cpu pagevec to lru list before trying to drop caches.
> 
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

um, yes.  I'm suprised that this oversight has survived 20+ years.

