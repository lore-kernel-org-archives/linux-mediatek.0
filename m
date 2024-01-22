Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462CCC47DD9
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 03:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtF+0AZ9mYZSgEmOfYMUgTrNZfxIctdI17hPwZH8CYw=; b=V9Bk5mXAoEsiOdvnEV+svlQbao
	349LsyCG41tYjrF3PLyXaMPual+uJMQmADz98xuM0XuCZsCGMuDqrLu+R8nA8p3i/D2u3pyl4+I72
	8y9km8bgKyEzRKf5qOYodXviOJ80mfRU2wKdADyjkkXls/b13EwczKQMvQ17ldsfgWcSQi8V/eBYs
	PuuOe4fQWjUQF+cUNwBjkxvXbBxw9rzqpps1MUhwew5pGBSGHOlcrdqW/+Q4gIHZHvVa2t3A2NBZa
	dsPZI5EhkLuhFntr9px9hvC7ePsIPCsXVnBwNWWMupSmvF2NnWAgeODDwf00EQPQjJcP8MR9dFQHV
	0QwvF6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRl1q-00ASog-0M;
	Mon, 22 Jan 2024 03:31:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRl1o-00ASo2-0G;
	Mon, 22 Jan 2024 03:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OtF+0AZ9mYZSgEmOfYMUgTrNZfxIctdI17hPwZH8CYw=; b=blbufh+/edoEOsvCjfxyMSkPeL
	Ft4p4rX0rJGFWaJVaa1dcGE4froQC4i7GaHj8d/XbKoIaWqQ3s6PFM3/gLxFmAC/EktiTkg8kcZ3S
	/4D7I7qXQAaGuEHuQBd0Bi2RgO5kDRlTIlnZLN9WRpZ4zOvrg5t07ogw2aCn4L/URAC/Cr4rPw140
	LKVzTw561LO0alHSJIwtlmftXXXXQK3DGrseqfkS689bO2EfmSIh45UCeIty/TV1R41Ky8fFFYKey
	p1Mh3fp3l4lJG8I29Z+5mp88NQzTbFBKjgSen8VLMPdoBeZ0k36TJ1a2na0hzbnRwH16sXxgzyKId
	jGxSyZcg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRl1j-0000000Eqh2-1y9B;
	Mon, 22 Jan 2024 03:31:11 +0000
Date: Mon, 22 Jan 2024 03:31:11 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Haiqiang Gong <Haiqiang.Gong@mediatek.com>
Cc: linux-kernel@vger.kernel.org, mike.zhang@mediatek.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mm/compaction: add check mechanism to avoid cma alloc
 fail
Message-ID: <Za3hf6A4V5QECvDy@casper.infradead.org>
References: <20240122022317.30091-1-Haiqiang.Gong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122022317.30091-1-Haiqiang.Gong@mediatek.com>
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

On Mon, Jan 22, 2024 at 10:23:17AM +0800, Haiqiang Gong wrote:
> cma alloc may fail when we doing cma alloc/free test on kernel 5.10/5.15.
> 
> We found that the next memory cannot be migrated because of the alloc of
> fs as next backtrace:
> __alloc_pages_nodemask
> pagecache_get_page
> grow_dev_page
> __getblk_gfp
> ext4_sb_breadahead_unmovable
> __ext4_get_inode_loc
> __ext4_iget
> ext4_lookup
> __lookup_slow
> walk_component
> path_lookupat
> filename_lookup
> vfs_statx
> This kind of unmovable memory is not placed in the cma buffer when kernel
> memory alloc but is migrated in by kcompactd when the kernel migration.
> It will cause memory can't be migrate when cma alloc.

I don't understand.  You say that the memory isn't movable, but then you
say that it's migrated in.  So it was movable, but it's no longer
movable after being moved once?  

> Add check mechanism in the compaction_alloc() where kcompaced alloc for
> memory. Will return NULL and give up this memory migration if the
> allocated memory is in the cma buffer and the memory is unmovable.

> +static bool forbid_move_to_cma_range(struct folio *src, struct folio *dst)
> +{
> +	if (folio_mapping(src) && is_in_cma_range(dst))
> +		return true;
> +
> +	return false;
> +}

Why would folio_mapping() be the right way to determine if memory is
unmovable?  The vast majority of filesystem data is movable.

