Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABCDC369DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 May 2025 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsPTvIUlonTz6aoFURvjc48QUmCzpcROb/H1/P6AxH4=; b=SofzRzLg7aTjiEuI+oozl3G4oV
	rA90+HxSCmYel46vd4s03xaCPfO3MMDo/QPCLDr3eaPoIhlqlE/GKUKn62NPH5BXrqBB/jaQtNaMK
	CATvRKZuL0YATbYZiDigvsmNPeXFCa6otYMx8F6dE+Fj8OPA/LrYV6NE8FZcB+R0JZdh312I5/G4m
	w74fqsUCO+aaaZ1NQtMlmbppHGOPVrQ29FMAhxOn6cuqmSyczrzgEx5gx6ezbP4PiSZOAnDTDNhl8
	89LjTJHtTPazoEN5mmciugRSPSzmp7Pjex0hQUL6syhYKMvcN7q0fPfAYZ2lKIFasigcOYRT3Uz2j
	UmfkGFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUVY-0000000FuEW-1hLH;
	Thu, 01 May 2025 14:03:24 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUUj-0000000Fu8d-1URo
	for linux-mediatek@lists.infradead.org;
	Thu, 01 May 2025 14:02:35 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-6f2b04a6169so12764296d6.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 May 2025 07:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746108151; x=1746712951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wsPTvIUlonTz6aoFURvjc48QUmCzpcROb/H1/P6AxH4=;
        b=ClW5FlAnZX7dBO4NyqK1vixt0RFfklBhSowUSWVomB3qlhEvwQgQ85qyvBlv/dUF6F
         ZGmFA+IX/MI5i/nEhpuJGE8CRcIq0nDxT5bmklwK8qg6tYG9/9mS5nz+VDLvNMTpoLIF
         COxlrFbOeFPh5FTPw0+LbcjCTmHU614T7Jz4oIDglA/GmGNZ5bC2DVOf8ElKgtUxRcGs
         HljvKSKcEOzTS4ho6k8K0SC9Vj4IsT8PYgyBBznCrbZDath/5CGOVjzOt2Had++0aIK9
         B26gCjYrJZkM3sqd+s2apbo1C+AA6mKfr1odX4ejJ5z6m7yg1qsjIH4qhJa4IOqdlASs
         3GRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108151; x=1746712951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsPTvIUlonTz6aoFURvjc48QUmCzpcROb/H1/P6AxH4=;
        b=QvKqvv7PKOJPYDCjzWp2DyWsqoUiSZsv/m7p92NQ1pSXlAsHFzALWYMwoEgWQvVyoy
         5Cqi3GxXjlkD/oLqgKIqL6dCXT0DVtkUTssFzNIb5qyubjtqd4Bf2xbXkDXgnkZYRtzy
         0Qvtn860O+UGheedGSt4/Zf981Uvsrp9bADZS5ALi3OYFsRMvkibl1ndor8LH4qbta4i
         ygrxHA/U3A6/3ku/vXUWCCPkdOX0gQde+yRsbggsjW51bKDmjwRfVtgMAlW97hEuUL+F
         fUecbaHjmXAtiZIUEIZVK3UxhWYFcTDjlOohJqHdcYHaYnmYEj+ndaHSN10HRmqKmccm
         d7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZB3GWuT6E7GmqdJA4hIFX6bYjKKhhXGiZxMdzi0yJ/smN4Lo1O05+JAtEVAlNltqV6DqXhwirSW7cDLn+/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6KRwFVbp9kSESJxYKyXS+RP/nKHws+iLiOwzD7ncd691Qc7Ei
	asZDsyTHBTDwopmF52KctNBpBXL3k3zUJZ5VIF2Q5B/0klzCgqkG4JOvtdUXams=
X-Gm-Gg: ASbGnctA1EgwVS0rduDXARNbbJF/3zFGkZ4vj8cCCmB9pVJCo7QhPQqb/EXw31vwC/J
	cKuDHOEpZPGadktbUnbawhc9HsWPghyfHlFe+zsvp3tyDO7vsjx9tzEpEQTiwIzxx1gLMCbhXHR
	T0IIucyOiSgrmCGTg3OV5Htpp2/G9QV5BKYWY2ydb3CNMfDddYzBxYXEh8LMSeZS6OwksC2+whC
	5QjqF5IDPJGB+hVGCagVrgITKVu+/LWDbCiTqTse7gGsUrUDf8Ib4UyL8nIFAgoMG8JLMU0GweN
	AO1BxV5kV+EfimePbrIHIOagzEl2n8/lZJ0ZabTaNivzXyQUQg==
X-Google-Smtp-Source: AGHT+IHMMzdAha+mSe5FENeDnuJbBSEZwl1rV0kTSW+UDo/woOhAYywdrFjkvAnvanulduGVihb2gQ==
X-Received: by 2002:a05:6214:1306:b0:6e4:3eb1:2bdb with SMTP id 6a1803df08f44-6f4fe1357c5mr100135346d6.43.1746108151086;
        Thu, 01 May 2025 07:02:31 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f50f3b058dsm4858996d6.4.2025.05.01.07.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:02:30 -0700 (PDT)
Date: Thu, 1 May 2025 10:02:26 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Casper Li <casper.li@mediatek.com>,
	Chinwen Chang <chinwen.chang@mediatek.com>,
	Andrew Yang <andrew.yang@mediatek.com>,
	James Hsu <james.hsu@mediatek.com>, Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Message-ID: <20250501140226.GE2020@cmpxchg.org>
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_070233_619923_CFAA28FB 
X-CRM114-Status: GOOD (  22.98  )
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

On Wed, Apr 30, 2025 at 04:26:41PM +0800, Qun-Wei Lin wrote:
> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system.
> 
> Problem:
>   In the current system, the kswapd thread is responsible for both scanning
>   the LRU pages and handling memory compression tasks (such as those
>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can lead
>   to significant performance bottlenecks, especially under high memory
>   pressure. The kswapd thread becomes a single point of contention, causing
>   delays in memory reclaiming and overall system performance degradation.
> 
> Solution:
>   Introduced kcompressd to handle asynchronous compression during memory
>   reclaim, improving efficiency by offloading compression tasks from
>   kswapd. This allows kswapd to focus on its primary task of page reclaim
>   without being burdened by the additional overhead of compression.
> 
> In our handheld devices, we found that applying this mechanism under high
> memory pressure scenarios can increase the rate of pgsteal_anon per second
> by over 260% compared to the situation with only kswapd. Additionally, we
> observed a reduction of over 50% in page allocation stall occurrences,
> further demonstrating the effectiveness of kcompressd in alleviating memory
> pressure and improving system responsiveness.

Yes, I think parallelizing this work makes a lot of sense.

> Co-developed-by: Barry Song <21cnbao@gmail.com>
> Signed-off-by: Barry Song <21cnbao@gmail.com>
> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> Reference: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd - Barry Song
>            https://lore.kernel.org/lkml/20250313093005.13998-1-21cnbao@gmail.com/
> ---
>  include/linux/mmzone.h |  6 ++++
>  mm/mm_init.c           |  1 +
>  mm/page_io.c           | 71 ++++++++++++++++++++++++++++++++++++++++++
>  mm/swap.h              |  6 ++++
>  mm/vmscan.c            | 25 +++++++++++++++
>  5 files changed, 109 insertions(+)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 6ccec1bf2896..93c9195a54ae 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -23,6 +23,7 @@
>  #include <linux/page-flags.h>
>  #include <linux/local_lock.h>
>  #include <linux/zswap.h>
> +#include <linux/kfifo.h>
>  #include <asm/page.h>
>  
>  /* Free memory management - zoned buddy allocator.  */
> @@ -1398,6 +1399,11 @@ typedef struct pglist_data {
>  
>  	int kswapd_failures;		/* Number of 'reclaimed == 0' runs */
>  
> +#define KCOMPRESS_FIFO_SIZE 256
> +	wait_queue_head_t kcompressd_wait;
> +	struct task_struct *kcompressd;
> +	struct kfifo kcompress_fifo;

The way you implemented this adds time-and-space overhead even on
systems that don't have any sort of swap compression enabled.

That seems unnecessary. There is an existing method for asynchronous
writeback, and pageout() is naturally fully set up to handle this.

IMO the better way to do this is to make zswap_store() (and
zram_bio_write()?) asynchronous. Make those functions queue the work
and wake the compression daemon, and then have the daemon call
folio_end_writeback() / bio_endio() when it's done with it.

