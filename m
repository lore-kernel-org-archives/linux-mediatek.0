Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049E2C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Aug 2023 16:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDhLE3ZT6vGy7jFyOFpA8ZS/b+W0KeOHURtugtULW3g=; b=IZDmHHb2ZE6hnRlLUReglofK5Y
	lnlJYkM+l/qN2t0dLrP8FDXnXdpBfTNeRwxxKf7pj2mI0TvRdjz9X56mOeeGIMJL4qZSQOKkIeCgs
	7e6XXxIV2q+FEmwbLLAsDsNroqEtHhrYDtZUzGCag9/VG9ILxBGvq/NGXoJQT66KnS26JhTu5yKkH
	HnhTXeSatlfStIHl620Ltho18aWTSrMMm+dzBvJSpA52YPPi3AgJ0lkQ0Ott4WWoVo8dFd5T8DFlK
	6pVR7E4cCJZFEXhGwEu6yovElZtZpgbanKnGJsq7OEL3/n7IXIKozSK/Rw1bYYp85gm28ISvolg39
	l4kzvelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTmIo-005QI2-30;
	Wed, 09 Aug 2023 16:44:54 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTmIl-005QFk-0R;
	Wed, 09 Aug 2023 16:44:52 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 84B7A2187E;
	Wed,  9 Aug 2023 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1691599487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDhLE3ZT6vGy7jFyOFpA8ZS/b+W0KeOHURtugtULW3g=;
	b=dfLcv7/AijRLKHjL1t1noAK9Qk5iKSFINL4VURbX3V9BPdMkLGdsFnao+maJUgXRq8FzHA
	ampedrAG6ab+ku3msmXGKGC50qGzvzpq1uFfrkN4bpx5ePJf7RBuXFD1UZW1zZJf/ZoseJ
	NK9IGgKfeS2AVFS48lEAsqJgWhNBWag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1691599487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDhLE3ZT6vGy7jFyOFpA8ZS/b+W0KeOHURtugtULW3g=;
	b=IC1FePROY468GiaL9M2rWyaAYV2g2X93uqoziugzeEp2uSvcA4TmqRA0ZiA/wR/ocuihXL
	TD4pMgaSKCACQrAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F4F8133B5;
	Wed,  9 Aug 2023 16:44:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id pbEbG3/C02S1awAAMHmgww
	(envelope-from <jack@suse.cz>); Wed, 09 Aug 2023 16:44:47 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id F112CA0769; Wed,  9 Aug 2023 18:44:46 +0200 (CEST)
Date: Wed, 9 Aug 2023 18:44:46 +0200
From: Jan Kara <jack@suse.cz>
To: Haibo Li <haibo.li@mediatek.com>
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, xiaoming.yu@mediatek.com
Subject: Re: [PATCH] mm/filemap.c:fix update prev_pos after one read request
 done
Message-ID: <20230809164446.uwxryhrfbjka2lio@quack3>
References: <20230628110220.120134-1-haibo.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628110220.120134-1-haibo.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_094451_319485_62D61B5D 
X-CRM114-Status: GOOD (  34.40  )
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

On Wed 28-06-23 19:02:20, Haibo Li wrote:
> ra->prev_pos tracks the last visited byte in the previous read request.
> It is used to check whether it is sequential read in
> ondemand_readahead and thus affects the readahead window.
> 
> From commit 06c0444290ce ("mm/filemap.c: generic_file_buffered_read()
> now uses find_get_pages_contig"),update logic of prev_pos is changed.
> It updates prev_pos after each returns from filemap_get_pages.
> But the read request from user may be not fully completed
> at this point.
> The updated prev_pos impacts the subsequent readahead window.
> 
> The real problem is performance drop of fsck_msdos between linux-5.4
> and linux-5.15(also linux-6.4).
> Comparing to linux-5.4,It spends about 110% time and read 140% pages.
> The read pattern of fsck_msdos is not fully sequential.
> 
> Simplified read pattern of fsck_msdos likes below:
> 1.read at page offset 0xa,size 0x1000
> 2.read at other page offset like 0x20,size 0x1000
> 3.read at page offset 0xa,size 0x4000
> 4.read at page offset 0xe,size 0x1000
> 
> Here is the read status on linux-6.4:
> 1.after read at page offset 0xa,size 0x1000
>     ->page ofs 0xa go into pagecache
> 2.after read at page offset 0x20,size 0x1000
>     ->page ofs 0x20 go into pagecache
> 3.read at page offset 0xa,size 0x4000
>     ->filemap_get_pages read ofs 0xa from pagecache and returns
>     ->prev_pos is updated to 0xb and goto next loop
>     ->filemap_get_pages tends to read ofs 0xb,size 0x3000
>     ->initial_readahead case in ondemand_readahead since prev_pos is
>       the same as request ofs.
>     ->read 8 pages while async size is 5 pages
>       (PageReadahead flag at page 0xe)
> 4.read at page offset 0xe,size 0x1000
>     ->hit page 0xe with PageReadahead flag set,double the ra_size.
>       read 16 pages while async size is 16 pages
> Now it reads 24 pages while actually uses 5 pages
> 
> on linux-5.4:
> 1.the same as 6.4
> 2.the same as 6.4
> 3.read at page offset 0xa,size 0x4000
>     ->read ofs 0xa from pagecache
>     ->read ofs 0xb,size 0x3000 using page_cache_sync_readahead
>       read 3 pages
>     ->prev_pos is updated to 0xd before generic_file_buffered_read
>       returns
> 4.read at page offset 0xe,size 0x1000
>     ->initial_readahead case in ondemand_readahead since
>       request ofs-prev_pos==1
>     ->read 4 pages while async size is 3 pages
> 
> Now it reads 7 pages while actually uses 5 pages.
> 
> In above demo,the initial_readahead case is triggered by offset
> of user request on linux-5.4.
> While it may be triggered by update logic of prev_pos on linux-6.4.
> 
> To fix the performance drop,update prev_pos after finishing one read
> request.
> 
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>

Sorry for the delayed reply. This seems to have fallen through the cracks.
So if I understand your analysis right, you are complaining that random
read larger than 1 page gets misdetected as sequential read and so "larger
than necessary" readahead happens. I tend to agree with your opinion and your
solution looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

Willy, any opinion? Andrew, can you pickup the patch if Willy doesn't
object?

								Honza

> ---
>  mm/filemap.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 83dda76d1fc3..16b2054eee71 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -2670,6 +2670,7 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
>  	int i, error = 0;
>  	bool writably_mapped;
>  	loff_t isize, end_offset;
> +	loff_t last_pos = ra->prev_pos;
>  
>  	if (unlikely(iocb->ki_pos >= inode->i_sb->s_maxbytes))
>  		return 0;
> @@ -2721,8 +2722,8 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
>  		 * When a read accesses the same folio several times, only
>  		 * mark it as accessed the first time.
>  		 */
> -		if (!pos_same_folio(iocb->ki_pos, ra->prev_pos - 1,
> -							fbatch.folios[0]))
> +		if (!pos_same_folio(iocb->ki_pos, last_pos - 1,
> +				    fbatch.folios[0]))
>  			folio_mark_accessed(fbatch.folios[0]);
>  
>  		for (i = 0; i < folio_batch_count(&fbatch); i++) {
> @@ -2749,7 +2750,7 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
>  
>  			already_read += copied;
>  			iocb->ki_pos += copied;
> -			ra->prev_pos = iocb->ki_pos;
> +			last_pos = iocb->ki_pos;
>  
>  			if (copied < bytes) {
>  				error = -EFAULT;
> @@ -2763,7 +2764,7 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
>  	} while (iov_iter_count(iter) && iocb->ki_pos < isize && !error);
>  
>  	file_accessed(filp);
> -
> +	ra->prev_pos = last_pos;
>  	return already_read ? already_read : error;
>  }
>  EXPORT_SYMBOL_GPL(filemap_read);
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

