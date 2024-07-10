Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3370C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 22:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeO+j7EWv8RaWA//CRWcO+n6MAqrnLpxeAvTpgFBQ2Y=; b=qKH20ESdjIm2WhOlW08rSb0bKR
	vQ3+aTqfTCC/gBtWwIzQQPQuIc9y5WE2FBsGC/lkeCXfEHJiP2AupXg0Z5KJWn3bfWKMOHkgm+hXP
	cBVBQvspVq8rbKU5jqpwUXBLITlajryGoQXmgUXebNgr6mn7AJGp45haPcfl41gmOrZ2AuuTnhdcZ
	9nQfqAcMbAgJGcpNORNs12v8GJk120JWw5wetRjaE0WO/FLLYwMPeUtCHJA+1FTpapN3onL8jRZ7t
	G6pswxHR15TDoI9oRCYfWETc8GZ5x81W1ME4UEe9S7kYkaAZwULn8Zk33eiVcTmpVzhNi2vukRFkb
	5tG9xEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfYP-0000000BtIG-0jzU;
	Wed, 10 Jul 2024 22:12:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfY7-0000000BtFf-2Gxe;
	Wed, 10 Jul 2024 22:12:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fb3cf78fbdso1438055ad.1;
        Wed, 10 Jul 2024 15:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720649550; x=1721254350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeO+j7EWv8RaWA//CRWcO+n6MAqrnLpxeAvTpgFBQ2Y=;
        b=hz6KJQg8hYeCwFU77pkr5dUzMZFjHdLvzcZZVCKrH0nL1EgiuDUT2jc0SgZZ2wnzSK
         Z46zTetdyGriy/97Vem0hJ4JT/nF2hR+GTL3PBw01v+mlAJsFvP7fr26X7mQZILwcBxU
         eK2EVmRpk/fiaXRFq60HfRKrBy1fkqBiEiMOQsrKl3Ts7IgxHXDJoMg2bZXV1cn2jfSy
         CYEu63CacI3CpS2ZegfoAVEJx6pug0bteDi6UuPtneqZbizTDBl7LnPUX0w82U+ovJIW
         uf/lUaQugfncBL1vaJn+Qz+xoZnNOI/lN59ghuDnc0A2lVGui+TBsBTyP/rsgg06C30g
         qJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720649550; x=1721254350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeO+j7EWv8RaWA//CRWcO+n6MAqrnLpxeAvTpgFBQ2Y=;
        b=RPF4bYBzB9b7ACwVQRew/tYbq9w/dpQNVrTQTeJO8jbuRqv4Q7HvkuGo0mJk2dquYG
         vn5bnPQ06H1xFI16k9ttzo4LreMG2J2ou4Byu/tbHu1bimICsR+kHqeCAoutuqOOn3hM
         BjkfZXOKHfyd7L3ixB0e9WRi/az4ADLHICEKkESeIAlGGiaGaCeC1YHToekZK9nax7Y9
         C0wxwjIf2b+tdlhZxSotNUkRNntv88GjZ1X7HEzWGCfmHWgTbpa8993MSUKsLEKmGD8i
         ZPTIjpRmpLn/DOR8NxtLVAIoNrchqEbMaD16ATN9Cda7hfrD6uFHVq7uj3Q6rol3fUTJ
         YOZA==
X-Forwarded-Encrypted: i=1; AJvYcCWxSOnN5ibATwABpoham1UA57QhdDc9rM5BI9ujQQaIP/dQ4CQeYn/JeeD+0LJKm4KCg5xmPaYD0ksLl/U52jmVULLj6ku+JC1OAyuCRzBfS7E0ymooEKKimiqX7BWUmzy5X8zxdJi8vurBvGq6UzzepMTrkNoYBng=
X-Gm-Message-State: AOJu0YzZqnKRId9ETkX6DxvcqInWwqxu216QqgprZoH6m5WHu1GAO2Dp
	OhiMQbU8zc94I8FGjFJB5h4g6CKox7Y9qwIRj7NjvIFVUwIAsclU
X-Google-Smtp-Source: AGHT+IEi1GFM06igSGbdlFQta76Bolr6tBsgOY76wBjNxJ7X5tzNqbaF4cLKyAbwi2EejYmVer+O3g==
X-Received: by 2002:a17:902:d4d2:b0:1fb:8f62:a7bc with SMTP id d9443c01a7336-1fbb6d53612mr58461955ad.52.1720649550492;
        Wed, 10 Jul 2024 15:12:30 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a0fc62sm38411395ad.40.2024.07.10.15.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 15:12:29 -0700 (PDT)
Date: Wed, 10 Jul 2024 12:12:28 -1000
From: Tejun Heo <tj@kernel.org>
To: "boy.wu" <boy.wu@mediatek.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Burkov <boris@bur.io>, cgroups@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, iverlin.wang@mediatek.com
Subject: Re: [PATCH v2] blk-cgroup: Replace u64_sync with blkg_stat_lock for
 stats update
Message-ID: <Zo8HTD2AD-b51q0C@slm.duckdns.org>
References: <20240710061334.1888-1-boy.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710061334.1888-1-boy.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_151231_604587_40F3DA10 
X-CRM114-Status: GOOD (  10.59  )
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

Hello,

On Wed, Jul 10, 2024 at 02:13:34PM +0800, boy.wu wrote:
...
> @@ -952,7 +952,6 @@ static void blkcg_fill_root_iostats(void)
>  		struct blkcg_gq *blkg = bdev->bd_disk->queue->root_blkg;
>  		struct blkg_iostat tmp;
>  		int cpu;
> -		unsigned long flags;
>  
>  		memset(&tmp, 0, sizeof(tmp));
>  		for_each_possible_cpu(cpu) {
> @@ -974,9 +973,10 @@ static void blkcg_fill_root_iostats(void)
>  				cpu_dkstats->sectors[STAT_DISCARD] << 9;
>  		}
>  
> -		flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
> +#if BITS_PER_LONG == 32
> +		guard(raw_spinlock_irqsave)(&blkg_stat_lock);
> +#endif
>  		blkg_iostat_set(&blkg->iostat.cur, &tmp);
> -		u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);

Isn't the problem shared across other blkg->iostat.sync users too? Also,
maybe, we can just grab the spinlock without testing for 32bit. blkg->iostat
(unlike the per-cpu counterpart) isn't accessed that frequently, so keeping
it simple and consistent probably makes more sense, right?

Thanks.

-- 
tejun

