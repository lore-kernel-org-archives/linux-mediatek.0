Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A977C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 16:31:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04547205CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 16:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHhAcuZz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dUaibPgD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04547205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=923idnvd5ZuBsXq8tWizj2rkVhuagQVb/GrxRYpKeg4=; b=SHhAcuZzPCN+khX1mCrdMfMY+
	4CCyt37wH9nTRMUHWXlkDG7Gd/91F49nxzNSxtaiqgczUrQx2xHv0UAY8vBNbJ4IM15qnyQ5o2/FV
	kXg9fpsc5we+Aqedvp+FwAxaOH1TzXCScEFEZQlz3yPSJS0Fm02ddKt7U5i5B9OCFu/UB9FRcuJ51
	j40QvpQ3drg6D6cEtT+aC8V1wTaDKETChaQ+A3bKRhquVO85TtfRP6rg+jH5b8UkzdqFmxOWPORfW
	MUFtsWmRwc/3MzXWtmwR9QDh8R6LygMDFfbvwR+BPecRb8BE9+n/PCyycph8jstsNgeocwkl/ITG+
	wXmRQ8Qlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6G8E-0007bT-AL; Thu, 13 Aug 2020 16:31:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6G89-0007aq-Vy; Thu, 13 Aug 2020 16:31:06 +0000
X-UUID: 83367c5e4af245bb87a64fe20e953248-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XSjRijPE+nl4SmKKM6w/kNS1fIeih5vxdwiviIYA5dc=; 
 b=dUaibPgDf6r8W37jvcQi7XPsFZtDJ1cYrCM1no+nHKPLYFPgTAnjh81M6mqNxHQ25hv+YX7luKCYHLE21JmcUoYZV3JjW9QWYFy2sgvsOD0KpxfscrfycHt2GtsnphdsG4fg5TacMc5pFwB3iYNJHt1UJKDlUNze7JQLSn9Os8c=;
X-UUID: 83367c5e4af245bb87a64fe20e953248-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1928177405; Thu, 13 Aug 2020 08:19:38 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 09:11:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 00:11:26 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 00:11:26 +0800
Message-ID: <1597335088.32469.55.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/2] Try to release mmap_lock temporarily in
 smaps_rollup
From: Chinwen Chang <chinwen.chang@mediatek.com>
To: Michel Lespinasse <walken@google.com>
Date: Fri, 14 Aug 2020 00:11:28 +0800
In-Reply-To: <CANN689G0DkL-wpxMha=nyysPYG6LM3Aw7060k2xQTxTA4PAf-w@mail.gmail.com>
References: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
 <CANN689G0DkL-wpxMha=nyysPYG6LM3Aw7060k2xQTxTA4PAf-w@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_123106_171286_9822FEF8 
X-CRM114-Status: GOOD (  28.26  )
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Daniel
 Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-mediatek@lists.infradead.org, Jimmy Assarsson <jimmyassarsson@gmail.com>,
 Huang Ying <ying.huang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Steven Price <steven.price@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-13 at 02:53 -0700, Michel Lespinasse wrote:
> On Wed, Aug 12, 2020 at 7:14 PM Chinwen Chang
> <chinwen.chang@mediatek.com> wrote:
> > Recently, we have observed some janky issues caused by unpleasantly long
> > contention on mmap_lock which is held by smaps_rollup when probing large
> > processes. To address the problem, we let smaps_rollup detect if anyone
> > wants to acquire mmap_lock for write attempts. If yes, just release the
> > lock temporarily to ease the contention.
> >
> > smaps_rollup is a procfs interface which allows users to summarize the
> > process's memory usage without the overhead of seq_* calls. Android uses it
> > to sample the memory usage of various processes to balance its memory pool
> > sizes. If no one wants to take the lock for write requests, smaps_rollup
> > with this patch will behave like the original one.
> >
> > Although there are on-going mmap_lock optimizations like range-based locks,
> > the lock applied to smaps_rollup would be the coarse one, which is hard to
> > avoid the occurrence of aforementioned issues. So the detection and
> > temporary release for write attempts on mmap_lock in smaps_rollup is still
> > necessary.
> 
> I do not mind extending the mmap lock API as needed. However, in the
> past I have tried adding rwsem_is_contended to mlock(), and later to
> mm_populate() paths, and IIRC gotten pushback on it both times. I
> don't feel strongly on this, but would prefer if someone else approved
> the rwsem_is_contended() use case.
> 
Hi Michel,

Thank you for your kind feedback.

In my opinion, the difference between the case in smaps_rollup and the
one in your example is that, for the former, the interference comes from
the outside of the affected process, for the latter, it doesn't.

In other words, anyone may use smaps_rollup to probe the affected
process without the information about what step the affected one is
executing.

> Couple related questions, how many VMAs are we looking at here ? Would
> need_resched() be workable too ?
> 
It depends on the types of applications. The number of VMAs we are
looking at is around 3000 ~ 4000.

As far as I know, need_resched() is used by the caller to check if it
should release the CPU resource for others. But in the case of
smaps_rollup, the affected process is contended on the mmap_lock, not
waiting for CPU. So need_resched() may not be workable here.

Thanks again for your comment.
Chinwen

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
