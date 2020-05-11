Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BC5C47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 10:42:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31873206F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 10:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JGOdc2Qc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aHHSCwP9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31873206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InvlaPe+/Z2ada/gdzof5rnVjMa4/rXfuEl5Dp8qtps=; b=JGOdc2QcWhbdiI
	WXxjNXuEB8OCz3QWFh2JPTYS7Fi8vUZuMtUFjLw14NiioBVGTDuKywQ034m7qg4tI02O1ttN68QUg
	XD0bk6UX+axZi0Qhr6VLKzk0OQ4nepCdZtk9bXlwScaAyq1lQ1x7prjwnHtEtOn2oLQOWJg6kG2Gr
	WWDej5j7aOEVxFL6+g9KUvTDRm1Zi90Yk+sGPxG2uvjvuZeLw46YzYNkw7+0OshgSP5+eOytCrftq
	+iyuZDtKFktZK1OGZANfnATpJD0TU0wNnJvaI2cdEsLaNh6ncyd/oP0ZTmw1bPmLeZVc2TG12FwmN
	J2VjyiXSVNGaNE3qCyYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY5tH-0001ST-Kn; Mon, 11 May 2020 10:42:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY5t8-0001L5-Vt; Mon, 11 May 2020 10:42:25 +0000
X-UUID: a4505c5fb14a4bb9824502a8d5515b7b-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1U5wzqzVt4EBKPbHjQ+DbeiJr8CenT4487+ft0swDlU=; 
 b=aHHSCwP9dy84me30HL8Zv6SGfja9eynXrd9Jq2DJNdg10H8M3BSIRCteS8YlBc5LS0cxRNkF6BpnuPXQVOKH+DNM+j2rTRqTas8M30euWkvA2cuHF0rP41pFn1oNjMQsd2+q3y4rro0DNnxtFFWQinyJplhkUrc6EsA2nL6yqAY=;
X-UUID: a4505c5fb14a4bb9824502a8d5515b7b-20200511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 322679965; Mon, 11 May 2020 02:42:08 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 03:32:12 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 18:32:04 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 May 2020 18:32:04 +0800
Message-ID: <1589193126.2930.2.camel@mtksdccf07>
Subject: Re: [PATCH v2 0/3] kasan: memorize and print call_rcu stack
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 11 May 2020 18:32:06 +0800
In-Reply-To: <CACT4Y+aC4i8cAVFu2-s82RczWCjYMpPVJLwS0OBLELR9qF8SYg@mail.gmail.com>
References: <20200511022359.15063-1-walter-zh.wu@mediatek.com>
 <CACT4Y+aC4i8cAVFu2-s82RczWCjYMpPVJLwS0OBLELR9qF8SYg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_034223_193694_31AD8FF4 
X-CRM114-Status: GOOD (  21.83  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrew
 Morton <akpm@linux-foundation.org>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-05-11 at 12:01 +0200, 'Dmitry Vyukov' via kasan-dev wrote:
> On Mon, May 11, 2020 at 4:24 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > This patchset improves KASAN reports by making them to have
> > call_rcu() call stack information. It is useful for programmers
> > to solve use-after-free or double-free memory issue.
> 
> Hi Walter,
> 
> I am looking at this now.
> 
> I've upload the change to gerrit [1]
> https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2458
> 
> I am not capable enough to meaningfully review such changes in this format...
> 
> [1] https://linux.googlesource.com/Documentation
> 

Hi Dmitry,

I don't fully understand your meaning, our patchset's format has
problem? or?


> 
> > The KASAN report was as follows(cleaned up slightly):
> >
> > BUG: KASAN: use-after-free in kasan_rcu_reclaim+0x58/0x60
> >
> > Freed by task 0:
> >  save_stack+0x24/0x50
> >  __kasan_slab_free+0x110/0x178
> >  kasan_slab_free+0x10/0x18
> >  kfree+0x98/0x270
> >  kasan_rcu_reclaim+0x1c/0x60
> >  rcu_core+0x8b4/0x10f8
> >  rcu_core_si+0xc/0x18
> >  efi_header_end+0x238/0xa6c
> >
> > First call_rcu() call stack:
> >  save_stack+0x24/0x50
> >  kasan_record_callrcu+0xc8/0xd8
> >  call_rcu+0x190/0x580
> >  kasan_rcu_uaf+0x1d8/0x278
> >
> > Last call_rcu() call stack:
> > (stack is not available)
> >
> > Generic KASAN will record first and last call_rcu() call stack
> > and print two call_rcu() call stack in KASAN report.
> >
> > This feature doesn't increase the cost of memory consumption. It is
> > only suitable for generic KASAN.
> >
> > [1]https://bugzilla.kernel.org/show_bug.cgi?id=198437
> > [2]https://groups.google.com/forum/#!searchin/kasan-dev/better$20stack$20traces$20for$20rcu%7Csort:date/kasan-dev/KQsjT_88hDE/7rNUZprRBgAJ
> >
> > Changes since v2:
> > - remove new config option, default enable it in generic KASAN
> > - test this feature in SLAB/SLUB, it is pass.
> > - modify macro to be more clearly
> > - modify documentation
> >
> > Walter Wu (3):
> > rcu/kasan: record and print call_rcu() call stack
> > kasan: record and print the free track
> > kasan: update documentation for generic kasan
> >
> > Documentation/dev-tools/kasan.rst |  6 ++++++
> > include/linux/kasan.h             |  2 ++
> > kernel/rcu/tree.c                 |  4 ++++
> > lib/Kconfig.kasan                 |  2 ++
> > mm/kasan/common.c                 | 26 ++++----------------------
> > mm/kasan/generic.c                | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
> > mm/kasan/kasan.h                  | 23 +++++++++++++++++++++++
> > mm/kasan/report.c                 | 47 +++++++++++++++++++++--------------------------
> > mm/kasan/tags.c                   | 37 +++++++++++++++++++++++++++++++++++++
> > 9 files changed, 149 insertions(+), 48 deletions(-)
> >
> > --
> > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200511022359.15063-1-walter-zh.wu%40mediatek.com.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
