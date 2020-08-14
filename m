Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E7CC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 08:36:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C674720774
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 08:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbKxeeVr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="oqVy0fps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C674720774
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=05uzJZeNECR7FJ13+Pq//flJRXPD/9sLeFvxlxR378w=; b=GbKxeeVrUsSHKYFKoTGoVD/9f
	M9iolRNNwiSMmJdq0THQstS9ttZOnCHxCBf9/3lHPysr7eVKRtWXSqMiZQxBYQtr5m88YkGGb6Pse
	x4Va8U+AziRJbj29fF1HVi4tK3KyEjRUHlblll526KERP8NvAANxLF5LbUiLNC6EOyERZv6LaNMEp
	mkLqgMb6r7duN4hsVHzlFDyuubGcriJJyBwoPx2qHUNCasVaeYV1Lcqav11Jf+ya23s/l4VEVWi1t
	I7w3VgRUQIfezAtTgdKpq3GTFT3Zn15I2PrDNZYsrFNsq2n8OMpqPlIxnRMjJ8lsICvteVMf6vl8z
	oGHBJsHhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6VBq-0000lT-Io; Fri, 14 Aug 2020 08:35:54 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6VBo-0000ju-05
 for linux-mediatek@lists.infradead.org; Fri, 14 Aug 2020 08:35:53 +0000
Received: by mail-yb1-xb43.google.com with SMTP id a34so4790229ybj.9
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Aug 2020 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AdqxtBBzE8zkm3kxwd6M5EQuKDKvTyliTVOnv4Gy5lw=;
 b=oqVy0fpsXt6mcaf8A0SC3B/hbz8tbu1sLp+p2pRxvv8AbXvXwBHIFsfkMCRqNri3GF
 qJ5LaxL7IMvfVknso37KHelMIw8Dd2z7cxXhdshfuODzyH2Xseg89iJdaKUlQjvHq7Hq
 lhVM/0EfF59L/acBDsdGpzOFVzg978mH+5YR0Xnus5a+hauEXlwXVyH0k/uzyUQXeOV+
 GoD9sItD5ZTLV2cb+jVfv+1qVPtgrDmNyETiLEcVRayEQDHThAdY1wjwZE3Exe3WMAGf
 B0CMyWrcmpON8PTov2dXTjRTU6wL6B8HVQWcoUhp+BuAHQUBWllyB0qzr6niC+D7+S2F
 fxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AdqxtBBzE8zkm3kxwd6M5EQuKDKvTyliTVOnv4Gy5lw=;
 b=XEv/hz0e6LC3t9QVxrYx4qHC6/I5tcMpRkU1i3GAjt4x/czunpuUb3rRl0c/CCcRnT
 wcpgLpgIUyH8av6iIIrjz2DhCWjPieDbWmrib7FtuCM8umKtHGy+x2jE3xgVAKt5biTb
 RYIU3nHbfRd+TZJ4XmK9quwP1unyEU8jsB6pxlGiQKGeZje6b58gKBPDVvBrrIrf78qV
 w6N19eS9s4ToNbTzsPhtAtrGNFy81eypWjIEIfHI7y0XKlqbprNvux5GUnK+WSpb6f1B
 IWtBoBHznl0Q+uDRS+lckoxoKyogtymD32PESwfPJgPAvm5gWhVktgb5PCEaJ4QNXZgW
 yLTg==
X-Gm-Message-State: AOAM530tw2hjRBNeuPZtI8XFoltvzR8koloik6AR5uM6hTvBlJ4N9Drl
 QlstcmuZSpECpC7EWMP9zszqfFbJucs42ExCTWJhaQ==
X-Google-Smtp-Source: ABdhPJy4hZxzSJG2zp9/9fyOvZB1bpfPoOKRLt/YSmrRg6wSBSlJmdqUtSRvhcYGxO1/TjNY1yNIgU0oMFRVQUhfajs=
X-Received: by 2002:a25:7455:: with SMTP id p82mr2121422ybc.287.1597394149918; 
 Fri, 14 Aug 2020 01:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
 <1597284810-17454-3-git-send-email-chinwen.chang@mediatek.com>
In-Reply-To: <1597284810-17454-3-git-send-email-chinwen.chang@mediatek.com>
From: Michel Lespinasse <walken@google.com>
Date: Fri, 14 Aug 2020 01:35:37 -0700
Message-ID: <CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: proc: smaps_rollup: do not stall write
 attempts on mmap_lock
To: Chinwen Chang <chinwen.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_043552_516583_0C2F2C56 
X-CRM114-Status: GOOD (  13.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, Song Liu <songliubraving@fb.com>,
 wsd_upstream@mediatek.com, Davidlohr Bueso <dbueso@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-mediatek@lists.infradead.org, Jimmy Assarsson <jimmyassarsson@gmail.com>,
 Huang Ying <ying.huang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Steven Price <steven.price@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 12, 2020 at 7:13 PM Chinwen Chang
<chinwen.chang@mediatek.com> wrote:
> smaps_rollup will try to grab mmap_lock and go through the whole vma
> list until it finishes the iterating. When encountering large processes,
> the mmap_lock will be held for a longer time, which may block other
> write requests like mmap and munmap from progressing smoothly.
>
> There are upcoming mmap_lock optimizations like range-based locks, but
> the lock applied to smaps_rollup would be the coarse type, which doesn't
> avoid the occurrence of unpleasant contention.
>
> To solve aforementioned issue, we add a check which detects whether
> anyone wants to grab mmap_lock for write attempts.

I think your retry mechanism still doesn't handle all cases. When you
get back the mmap lock, the address where you stopped last time could
now be in the middle of a vma. I think the consistent thing to do in
that case would be to retry scanning from the address you stopped at,
even if it's not on a vma boundary anymore. You may have to change
smap_gather_stats to support that, though.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
