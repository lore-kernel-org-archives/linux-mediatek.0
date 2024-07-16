Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C9EC3DA59
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 21:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag5NdJlDjgGBhuGOZDzJcu7IZkmLpKyxnSbjG+hkilc=; b=XrI9JFO6bzqdEU5URAFkyeD25u
	Coeea+5BLImXjDWr/3z6Rx6c2/izr7/1QfQgaqzrtcZsxATEUezjUEdYcTObPurpcn3J0Lj5G1Fd+
	vt2Jt5FPuSh2Eh4Pw7tByQo6CW0yiQgJgZdJ4BoZdIt/QqMqxoxKOFufRHE7jZ+lSPou0TPF2ry54
	nxzzod4eL/9Ujz1DCEA81fYXwEGTBdkntYOL2U8FCEz88WRTXIYk/OI8lLNrx8NwDUOP4xxS+OPwY
	GaidaEk0jAzEGRhzRs1x08RBn8FKa/1S/9ab2n6mKvHynpdc+TLV5dVNs/vExIKwqIxEkzP37WCD7
	BZz8vL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTpUr-0000000BmjA-26yg;
	Tue, 16 Jul 2024 21:14:05 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTpUQ-0000000BmXp-2OwL;
	Tue, 16 Jul 2024 21:13:40 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso4168019a12.2;
        Tue, 16 Jul 2024 14:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721164417; x=1721769217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ag5NdJlDjgGBhuGOZDzJcu7IZkmLpKyxnSbjG+hkilc=;
        b=fCxNsl6e3LH2deyXYzZRirOfrL6FDzUo9oAOXM4hs9PvM4S5lKFwgh6av63jb89emX
         w/U4BpznnwXHkeVGKbmnkUIM8kQn6Ed5OqiiRR2QdaimUf+XnSnRjuF4ZwGl+I4XI2Tt
         bZzhGj+pZCjrMNbAX1Kd+M6keyFPOjCR2BZbyiTr+r+kp3rQrk0y3yYH89ruMUqezqdT
         jDAvEzuUqriph1a1gfxUTxkJ/WRiK3DcGCjgrQxxO4A68u7n+EUKGtgCiWDQwXHgPOlM
         b1T5ynVx7EYiVporUnyuKIivFYD8L75SAaA4Zfog5bOYxyUL4Be4gKH2qRW6uvn0ohd0
         CJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721164417; x=1721769217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ag5NdJlDjgGBhuGOZDzJcu7IZkmLpKyxnSbjG+hkilc=;
        b=hR+3AQiPLpRHb6fia5i1HPgWCUs9IKpVUzvMTaUZsf70/agW7QtqCqpt5WNSWZDe4/
         um0B01GcLUGPrlCjtQttkKlz++3jziDWws+sx4oBvC2fPJhRUEDYO1tpSdRioRzNk9z4
         q2XBzLc+NS+AK+lLLRg8A39AOdozts75auRAR+Ox8uNlxzJK7AzWys98AAnWFyrNlmvJ
         ua63i9Av0ht3zr33ZSKt9ENVY3a5sWgGN+iPiMFRLHH+9lxRwewr9i70tWQ5ar66nBP7
         zUsd7AalKQlgu3N/y0zAHvK8y6VgR3gRQHvJeaU/+qJ+Y+peXVYowZn0QjH9syLNuuxj
         nW+A==
X-Forwarded-Encrypted: i=1; AJvYcCXhkepgearqAUzbyo7jbJ0BUBVAaix6wJ9sOrr726AL+qn9uI+JRkWNJkqrszHQns7cn12i25kITKKuWKX1kkKVsttA+7EubfLq5h0kRgdT7EG9QRCr9MyD/TewCLW4KSlZx8BRIxRppzgoYaJLnXUUl5DFf+qQR54=
X-Gm-Message-State: AOJu0Yw6o+xfbe/EA9XzmKyhsyn9LEqIeRrsww7n8HbTbBWvV5I4w/55
	Y7ZGos8EHRneWFlLWg7xfy4czIPk+t3MiRevYPQb9YDqIWdhiPQd
X-Google-Smtp-Source: AGHT+IEvPNah8o8ElhR2lXdjKaUmNu2BHdD7tWO6AdHw+HwAq26CaXaLi2pF9DM3SbCMdFzYQrtBvg==
X-Received: by 2002:a05:6a20:729c:b0:1c1:89f8:8609 with SMTP id adf61e73a8af0-1c3f10e02d5mr4669359637.0.1721164417106;
        Tue, 16 Jul 2024 14:13:37 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eca7a7bsm6795727b3a.152.2024.07.16.14.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 14:13:36 -0700 (PDT)
Date: Tue, 16 Jul 2024 11:13:35 -1000
From: Tejun Heo <tj@kernel.org>
To: "boy.wu" <boy.wu@mediatek.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Burkov <boris@bur.io>, cgroups@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, iverlin.wang@mediatek.com
Subject: Re: [PATCH v3] blk-cgroup: Replace u64 sync with spinlock for iostat
 update
Message-ID: <Zpbify32lel9J-5I@slm.duckdns.org>
References: <20240716075206.23121-1-boy.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716075206.23121-1-boy.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_141338_638845_4911AF83 
X-CRM114-Status: GOOD (  23.99  )
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

Hello, Boy.

So, looking at the patch, I'm not sure per-blkg lock makes sense.

On Tue, Jul 16, 2024 at 03:52:06PM +0800, boy.wu wrote:
> @@ -995,15 +995,13 @@ static void blkcg_iostat_update(struct blkcg_gq *blkg, struct blkg_iostat *cur,
>  				struct blkg_iostat *last)
>  {
>  	struct blkg_iostat delta;
> -	unsigned long flags;
>  
>  	/* propagate percpu delta to global */
> -	flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
> +	guard(spinlock_irqsave)(&blkg->iostat.spinlock);
>  	blkg_iostat_set(&delta, cur);
>  	blkg_iostat_sub(&delta, last);
>  	blkg_iostat_add(&blkg->iostat.cur, &delta);
>  	blkg_iostat_add(last, &delta);
> -	u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
>  }

This is already called with blkg_stat_lock held.

> @@ -1051,10 +1048,8 @@ static void __blkcg_rstat_flush(struct blkcg *blkcg, int cpu)
>  			goto propagate_up; /* propagate up to parent only */
>  
>  		/* fetch the current per-cpu values */
> -		do {
> -			seq = u64_stats_fetch_begin(&bisc->sync);
> +		scoped_guard(spinlock_irqsave, &bisc->spinlock)
>  			blkg_iostat_set(&cur, &bisc->cur);
> -		} while (u64_stats_fetch_retry(&bisc->sync, seq));

This is per-cpu stat and we should keep using u64_sync for them.

> @@ -1134,9 +1128,8 @@ static void blkcg_fill_root_iostats(void)
>  				cpu_dkstats->sectors[STAT_DISCARD] << 9;
>  		}
>  
> -		flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
> +		guard(spinlock_irqsave)(&blkg->iostat.spinlock);
>  		blkg_iostat_set(&blkg->iostat.cur, &tmp);
> -		u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
>  	}
>  }
...
> @@ -1157,16 +1149,14 @@ static void blkcg_print_one_stat(struct blkcg_gq *blkg, struct seq_file *s)
>  
>  	seq_printf(s, "%s ", dname);
>  
> -	do {
> -		seq = u64_stats_fetch_begin(&bis->sync);
> -
> +	scoped_guard(spinlock_irqsave, &bis->spinlock) {
>  		rbytes = bis->cur.bytes[BLKG_IOSTAT_READ];
>  		wbytes = bis->cur.bytes[BLKG_IOSTAT_WRITE];
>  		dbytes = bis->cur.bytes[BLKG_IOSTAT_DISCARD];
>  		rios = bis->cur.ios[BLKG_IOSTAT_READ];
>  		wios = bis->cur.ios[BLKG_IOSTAT_WRITE];
>  		dios = bis->cur.ios[BLKG_IOSTAT_DISCARD];
> -	} while (u64_stats_fetch_retry(&bis->sync, seq));
> +	}

The above two are the only places which can potentially benefit from
per-blkg lock but these aren't hot paths. I'd just use blkg_stat_lock for
the above.

> @@ -2152,30 +2141,29 @@ void blk_cgroup_bio_start(struct bio *bio)
>  
>  	cpu = get_cpu();
>  	bis = per_cpu_ptr(bio->bi_blkg->iostat_cpu, cpu);
> -	flags = u64_stats_update_begin_irqsave(&bis->sync);
> -
> -	/*
> -	 * If the bio is flagged with BIO_CGROUP_ACCT it means this is a split
> -	 * bio and we would have already accounted for the size of the bio.
> -	 */
> -	if (!bio_flagged(bio, BIO_CGROUP_ACCT)) {
> -		bio_set_flag(bio, BIO_CGROUP_ACCT);
> -		bis->cur.bytes[rwd] += bio->bi_iter.bi_size;
> -	}
> -	bis->cur.ios[rwd]++;
> +	scoped_guard(spinlock_irqsave, &bis->spinlock) {
> +		/*
> +		 * If the bio is flagged with BIO_CGROUP_ACCT it means this is a split
> +		 * bio and we would have already accounted for the size of the bio.
> +		 */
> +		if (!bio_flagged(bio, BIO_CGROUP_ACCT)) {
> +			bio_set_flag(bio, BIO_CGROUP_ACCT);
> +			bis->cur.bytes[rwd] += bio->bi_iter.bi_size;
> +		}
> +		bis->cur.ios[rwd]++;
>  
> -	/*
> -	 * If the iostat_cpu isn't in a lockless list, put it into the
> -	 * list to indicate that a stat update is pending.
> -	 */
> -	if (!READ_ONCE(bis->lqueued)) {
> -		struct llist_head *lhead = this_cpu_ptr(blkcg->lhead);
> +		/*
> +		 * If the iostat_cpu isn't in a lockless list, put it into the
> +		 * list to indicate that a stat update is pending.
> +		 */
> +		if (!READ_ONCE(bis->lqueued)) {
> +			struct llist_head *lhead = this_cpu_ptr(blkcg->lhead);
>  
> -		llist_add(&bis->lnode, lhead);
> -		WRITE_ONCE(bis->lqueued, true);
> +			llist_add(&bis->lnode, lhead);
> +			WRITE_ONCE(bis->lqueued, true);
> +		}

These are per-cpu stat updates which should keep using u64_sync. We don't
want to incur locking overhead for stat updates in the hot issue path.

Thanks.

-- 
tejun

