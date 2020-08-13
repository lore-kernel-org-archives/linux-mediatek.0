Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B898DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:53:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 863D72074D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:53:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="arfYHFh/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="g4mDUYV/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 863D72074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I2ikKU+pKPWY9KqYPeEnLDx5re9GwaVFWxkxkZsbwws=; b=arfYHFh/+vBOoty32S7cYR8Y6
	hJsdzBpXPvvPU2eCl+Eg9rTHaaDehYv9h1FjeBfZCtZbfcCwxu2fjWqmdbBpMukpkpco1dTTd24T8
	Y91d1FrwasBBrY6ZGK78HCAWvTNtNl9o6nu6HVYXpeWJFJlVgwMarf08xbxM1UJShGkSFQxNRsdDA
	FBpqzq3i+L1yj5M4jgTOmbD8UFnkKrLAUJwKh7Rxzcs5AHg13Y5N5c8G50zS/W7m8ZNBzdWOgMG/y
	0xCltik/VOUPy2ud9vqdZNgh+LoOLYQAQy4h6YpcbmpKaJVGceJOZt6YbkWIYqNhxmhA81JwILcCn
	valRKlNyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k69vX-0007MT-2m; Thu, 13 Aug 2020 09:53:39 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69vU-0007HU-7J
 for linux-mediatek@lists.infradead.org; Thu, 13 Aug 2020 09:53:37 +0000
Received: by mail-yb1-xb44.google.com with SMTP id g3so2997823ybc.3
 for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2020 02:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yul9D5KaapMfO0wSYYumb3nXfH25wAQuTtPB6LytFFQ=;
 b=g4mDUYV/kR2xqvMovbB9tOP1UwfQk6O047mQnaEfU/wAgqPu1NK8GhI6gfzcY5gZQ3
 kZdFLbxgB7OqRvASEeMmcEe99LPAOZaz1kZskBXb/8XLTVke3a8uOYyXOpCAh4FedTtR
 9E7hUlfMGcRn3WfwvWi5YlF/FOSHG3E+wgdpSgj+p9Y2eLtGyRueVDENXxuIaA1s3otY
 fFOfdc7Cz1qEY35Es+aJJFSnpioiFZWGZk+LMsIWu/gGIUaAk2if4K2HJi4QVVS8cDdU
 ckMfr+jW5QSRMSVhuiCR8ex32+qd5wmgdgLepZcJIB/BCSs6gIOX0NPYuRcry/7YIAgL
 JPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yul9D5KaapMfO0wSYYumb3nXfH25wAQuTtPB6LytFFQ=;
 b=fnZu2F+YTHdxwQVf7mRlibDrS4ArNyk61ixEUhGHx2rrPIGwk+BxmDsglzuAEeDRuN
 7QW4Aa1/kDZIL4/cUIlWtld4oiBzXnXAuo2kKf16IPDfEKBUXu4NPaaR80Fz/BYUFmHl
 C0QN9uo8GHiyQEL8dbE5lU/AeE+Hwr77YBT9Ddeu5W6W77XvfbbK7AUsoqJl2LTkfIxQ
 gTXRVwQi6Ag43Ny9k21sKsNkIWG7cigiIZCVuwrrLNq5NbmHr2JRYzCoq2OnyecGMvv+
 ibYjFACfrupWRz54txqas6tTjCHPy3Cfot9zxbp97J2IKpt9ihgcD9DhaJHa0CFdJqCX
 /uxw==
X-Gm-Message-State: AOAM531nrUd/aDESDuDPtwtmwUCQMAvsUvZCvqxinWiOp5I9UUKaoa4r
 KuXL5r87oynqPrzBZYR390g3Ur5aFsClHp8bnNiy9Q==
X-Google-Smtp-Source: ABdhPJzfpaSBTx1xrZzflOrcYcv5QD4lOFsRlbhX3DHwVGqruN6Tmp191fs//DhyO/wYUtsNm9az23vyctAAcFPz7n0=
X-Received: by 2002:a25:ab34:: with SMTP id u49mr5170276ybi.516.1597312412264; 
 Thu, 13 Aug 2020 02:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
In-Reply-To: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
From: Michel Lespinasse <walken@google.com>
Date: Thu, 13 Aug 2020 02:53:20 -0700
Message-ID: <CANN689G0DkL-wpxMha=nyysPYG6LM3Aw7060k2xQTxTA4PAf-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Try to release mmap_lock temporarily in
 smaps_rollup
To: Chinwen Chang <chinwen.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_055336_290751_68013F44 
X-CRM114-Status: GOOD (  18.50  )
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

On Wed, Aug 12, 2020 at 7:14 PM Chinwen Chang
<chinwen.chang@mediatek.com> wrote:
> Recently, we have observed some janky issues caused by unpleasantly long
> contention on mmap_lock which is held by smaps_rollup when probing large
> processes. To address the problem, we let smaps_rollup detect if anyone
> wants to acquire mmap_lock for write attempts. If yes, just release the
> lock temporarily to ease the contention.
>
> smaps_rollup is a procfs interface which allows users to summarize the
> process's memory usage without the overhead of seq_* calls. Android uses it
> to sample the memory usage of various processes to balance its memory pool
> sizes. If no one wants to take the lock for write requests, smaps_rollup
> with this patch will behave like the original one.
>
> Although there are on-going mmap_lock optimizations like range-based locks,
> the lock applied to smaps_rollup would be the coarse one, which is hard to
> avoid the occurrence of aforementioned issues. So the detection and
> temporary release for write attempts on mmap_lock in smaps_rollup is still
> necessary.

I do not mind extending the mmap lock API as needed. However, in the
past I have tried adding rwsem_is_contended to mlock(), and later to
mm_populate() paths, and IIRC gotten pushback on it both times. I
don't feel strongly on this, but would prefer if someone else approved
the rwsem_is_contended() use case.

Couple related questions, how many VMAs are we looking at here ? Would
need_resched() be workable too ?

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
