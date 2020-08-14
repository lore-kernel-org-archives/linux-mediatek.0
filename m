Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4616C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 08:30:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A2220708
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 08:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hUOZdnMN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="a8EXI30E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A2220708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WaI/JZ+KFDjz6hdjQZJyQULSuI+AxVcTTMjRE8ALh6s=; b=hUOZdnMNmhtfj3pXXPpiU6R9V
	SlSLe7toRREhd7BdvI5SQhseNhWA1aMgBSklKmnbC2sKTxIzGQwzqlk4N9vqPBmCGHoJFY5mmnmnp
	7kkulhBTT6Pv3PAtovpsuhtH9U5mhQVhAlwrDj/hmSXZhrWYaiSunEyBDRnO2Fvr0g6U9lIfWssKo
	4NKJptl/Iet53yMGt3mjX/yqzES0aDMhQ1m1UPjPwm5z/c1/GeDvGxsT6dJ61N9PS7ufi5hbxaj5X
	MEKhI7Ezah3XG1VrMPjucdBmVd6tgH2ltI0rF+Rae7YzTCTNjKvHN5pd1OFPNNicw/mMiRY8IDue6
	fD0ysN7+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6V6S-0008M6-Ai; Fri, 14 Aug 2020 08:30:20 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6V6P-0008Kl-8z
 for linux-mediatek@lists.infradead.org; Fri, 14 Aug 2020 08:30:18 +0000
Received: by mail-yb1-xb42.google.com with SMTP id m200so4781595ybf.10
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Aug 2020 01:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3FTYvzqtwTFg32oQ2R1iT/fxQYwIO5aEnRMfUKVR7Oc=;
 b=a8EXI30EnDIPpIpx03Sd32eIfrso3BfcxnHyuAmDr5hmLTex8csYsnA9uZ316d8+bV
 sOEB/63/jWXUQXNPxzlvTziNsLhCzV+LYdqyR66PA/ZKL9aedLGB3m7E4J7PJ96iMNP1
 HkdlGmEzCWqRKidgDrvMNP43EbLGV/cRtR73DUUrI0yxZ05fIi5y0fZQtvuqF76mORow
 zHCXH/esL0lg5ebyMvZHR4aV3OCvpJAPEMnkf656Epo4coILnvz6InECDbGlBQGQHcM0
 YlurOpy3r0mZ0QR5hMkDdcvD/SLUmXa1Naesw9cyAoE6/0caKGpBdG4cUvKyjsTkjI+M
 J5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3FTYvzqtwTFg32oQ2R1iT/fxQYwIO5aEnRMfUKVR7Oc=;
 b=oasYuBE+dLTw7IlZGe02a6gk0cU0ctPO01hJYCHTb0CPnxO0NNDgPfEjmeYEYRJr4x
 DD1hNg1JVQ5FDp0yAWENrkYdACu8+60fSAmPydREX9fyzJcra+BfQKuGG5pCpf99lMXj
 2HhTRXhiySW7QN9AP1egBwCvD8uwhCvGj5+5LiVVMI8l4H/UrGWvCH0o08k/1j64UAJg
 1gV98qYFVp8kXacVGU7dcOlgH3F//chXuKC5oL6EQLEGLtYlYIwbnBwI46DFR/9U77m0
 PoVBZx+6UwnodSxovQ7LR0YQNoSHh25FuMEs6Y75OSIaHM/HPEUnjjZqg8Dbv/6dKe8D
 ozsw==
X-Gm-Message-State: AOAM5312cVq45WxaorBNQ0MsGcOfadc3amI6qZPz/B86bvtb0uvSDeCh
 cdpNMn7KXJNsGz6O80dsLkY32AnJgOrbiYRwwWzMrw==
X-Google-Smtp-Source: ABdhPJw13pPX/3kPqJmeuWDN2VsAFdhKvqiSsbN8Cuj1qsFtz1LjVZiTxa/qFhrVFcgAEIezPtI+eYfXKR4LKmD5VnE=
X-Received: by 2002:a25:e684:: with SMTP id d126mr2335998ybh.332.1597393813820; 
 Fri, 14 Aug 2020 01:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
 <CANN689G0DkL-wpxMha=nyysPYG6LM3Aw7060k2xQTxTA4PAf-w@mail.gmail.com>
 <1597335088.32469.55.camel@mtkswgap22>
In-Reply-To: <1597335088.32469.55.camel@mtkswgap22>
From: Michel Lespinasse <walken@google.com>
Date: Fri, 14 Aug 2020 01:29:59 -0700
Message-ID: <CANN689GsiBga4a6P3JMG-iwT9WY6V_qodJxeaw0uWsTHVsW4JQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Try to release mmap_lock temporarily in
 smaps_rollup
To: Chinwen Chang <chinwen.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_043017_461740_91B2F21F 
X-CRM114-Status: GOOD (  27.43  )
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

On Thu, Aug 13, 2020 at 9:11 AM Chinwen Chang
<chinwen.chang@mediatek.com> wrote:
> On Thu, 2020-08-13 at 02:53 -0700, Michel Lespinasse wrote:
> > On Wed, Aug 12, 2020 at 7:14 PM Chinwen Chang
> > <chinwen.chang@mediatek.com> wrote:
> > > Recently, we have observed some janky issues caused by unpleasantly long
> > > contention on mmap_lock which is held by smaps_rollup when probing large
> > > processes. To address the problem, we let smaps_rollup detect if anyone
> > > wants to acquire mmap_lock for write attempts. If yes, just release the
> > > lock temporarily to ease the contention.
> > >
> > > smaps_rollup is a procfs interface which allows users to summarize the
> > > process's memory usage without the overhead of seq_* calls. Android uses it
> > > to sample the memory usage of various processes to balance its memory pool
> > > sizes. If no one wants to take the lock for write requests, smaps_rollup
> > > with this patch will behave like the original one.
> > >
> > > Although there are on-going mmap_lock optimizations like range-based locks,
> > > the lock applied to smaps_rollup would be the coarse one, which is hard to
> > > avoid the occurrence of aforementioned issues. So the detection and
> > > temporary release for write attempts on mmap_lock in smaps_rollup is still
> > > necessary.
> >
> > I do not mind extending the mmap lock API as needed. However, in the
> > past I have tried adding rwsem_is_contended to mlock(), and later to
> > mm_populate() paths, and IIRC gotten pushback on it both times. I
> > don't feel strongly on this, but would prefer if someone else approved
> > the rwsem_is_contended() use case.
> >
> Hi Michel,
>
> Thank you for your kind feedback.
>
> In my opinion, the difference between the case in smaps_rollup and the
> one in your example is that, for the former, the interference comes from
> the outside of the affected process, for the latter, it doesn't.
>
> In other words, anyone may use smaps_rollup to probe the affected
> process without the information about what step the affected one is
> executing.

Thanks, that is a good enough point for me :)

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
