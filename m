Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89885C2D0F6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 02:06:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1D6206CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 02:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hrQDjItx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bKrZMNc8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D1D6206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfFRpFkrWmWDfOFSYqF6Y+q4eOxdwzS5E+/Of76MhKo=; b=hrQDjItxTJpeRe
	lHl59rxzJ6JZWDGrG3nyNwR5vURO+QLATsZnihSSgPONPDLT9ZrnPtcYZendsTEMrVHB0ebW4GzcL
	plGmnjD3d0VvRg4+OZ15PiUdJCU+6n/Ua8aOmVX9IvQvAdkoNZHLOyV03BjxZkACid9vsmIr0pN7K
	icOAxrfBwxguzKiWwYEhOQBgRFEbq6Zj37E0K0TdEMcNSs1I/R5StAqwKlrX/eiuJhkqveu+PgObO
	6mNv3MCZR/0lnSAhNcV3oX3vm4pXX16WRAVOKGeyC9z1nTMmnaKgBnIu7y4Mg8mALG1m2GVN+4Jpm
	I8B8SBqZ2cBlRvlkapSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYgmN-0008N9-Gx; Wed, 13 May 2020 02:05:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYgmE-0008Cd-TD; Wed, 13 May 2020 02:05:44 +0000
X-UUID: dce11a502948478e8e6a164621bc9a95-20200512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=096wrzVA6wz4JNcGHZfNakkofpMPOvUZEm4oZoXOkWA=; 
 b=bKrZMNc8Dxupct/QmcqIVlE+liwgTKoQwFy6LR2dresY5HuOUv3quCFwlPy2MbusDZva/F4IGI3pb+Ega7bLEb17LPhREQ7tE8mYcc941vyv7F/9A9bCWrYwvw6aEIeuDlQnF0hi2FPKO51K8iSFz0i8WOFpxN0U25zm1MzrNvY=;
X-UUID: dce11a502948478e8e6a164621bc9a95-20200512
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1307097255; Tue, 12 May 2020 18:05:37 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 May 2020 19:05:34 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 May 2020 10:05:30 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 May 2020 10:05:30 +0800
Message-ID: <1589335531.19238.52.camel@mtksdccf07>
Subject: Re: [PATCH v2 1/3] rcu/kasan: record and print call_rcu() call stack
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 13 May 2020 10:05:31 +0800
In-Reply-To: <CACT4Y+aWNDntO6+Rhn0a-4N1gLOTe5UzYB9m5TnkFxG_L15cXA@mail.gmail.com>
References: <20200511023111.15310-1-walter-zh.wu@mediatek.com>
 <20200511180527.GZ2869@paulmck-ThinkPad-P72>
 <1589250993.19238.22.camel@mtksdccf07>
 <CACT4Y+b6ZfmZG3YYC_TkoeGaAQjSEKvF4dZ9vHzTx5iokD4zTQ@mail.gmail.com>
 <20200512142541.GD2869@paulmck-ThinkPad-P72>
 <CACT4Y+ZfzLhcG2Wy_iEMB=hJ5k=ib+X-m29jDG2Jcs7S-TPX=w@mail.gmail.com>
 <20200512161422.GG2869@paulmck-ThinkPad-P72>
 <CACT4Y+aWNDntO6+Rhn0a-4N1gLOTe5UzYB9m5TnkFxG_L15cXA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_190542_947901_8F389A34 
X-CRM114-Status: GOOD (  26.50  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-05-12 at 18:22 +0200, Dmitry Vyukov wrote:
> On Tue, May 12, 2020 at 6:14 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > > > > > > This feature will record first and last call_rcu() call stack and
> > > > > > > > print two call_rcu() call stack in KASAN report.
> > > > > > >
> > > > > > > Suppose that a given rcu_head structure is passed to call_rcu(), then
> > > > > > > the grace period elapses, the callback is invoked, and the enclosing
> > > > > > > data structure is freed.  But then that same region of memory is
> > > > > > > immediately reallocated as the same type of structure and again
> > > > > > > passed to call_rcu(), and that this cycle repeats several times.
> > > > > > >
> > > > > > > Would the first call stack forever be associated with the first
> > > > > > > call_rcu() in this series?  If so, wouldn't the last two usually
> > > > > > > be the most useful?  Or am I unclear on the use case?
> > > > >
> > > > > 2 points here:
> > > > >
> > > > > 1. With KASAN the object won't be immediately reallocated. KASAN has
> > > > > 'quarantine' to delay reuse of heap objects. It is assumed that the
> > > > > object is still in quarantine when we detect a use-after-free. In such
> > > > > a case we will have proper call_rcu stacks as well.
> > > > > It is possible that the object is not in quarantine already and was
> > > > > reused several times (quarantine is not infinite), but then KASAN will
> > > > > report non-sense stacks for allocation/free as well. So wrong call_rcu
> > > > > stacks are less of a problem in such cases.
> > > > >
> > > > > 2. We would like to memorize 2 last call_rcu stacks regardless, but we
> > > > > just don't have a good place for the index (bit which of the 2 is the
> > > > > one to overwrite). Probably could shove it into some existing field,
> > > > > but then will require atomic operations, etc.
> > > > >
> > > > > Nobody knows how well/bad it will work. I think we need to get the
> > > > > first version in, deploy on syzbot, accumulate some base of example
> > > > > reports and iterate from there.
> > > >
> > > > If I understood the stack-index point below, why not just move the
> > > > previous stackm index to clobber the previous-to-previous stack index,
> > > > then put the current stack index into the spot thus opened up?
> > >
> > > We don't have any index in this change (don't have memory for such index).
> > > The pseudo code is"
> > >
> > > u32 aux_stacks[2]; // = {0,0}
> > >
> > > if (aux_stacks[0] != 0)
> > >     aux_stacks[0] = stack;
> > > else
> > >    aux_stacks[1] = stack;
> >
> > I was thinking in terms of something like this:
> >
> > u32 aux_stacks[2]; // = {0,0}
> >
> > if (aux_stacks[0] != 0) {
> >     aux_stacks[0] = stack;
> > } else {
> >    if (aux_stacks[1])
> >         aux_stacks[0] = aux_stacks[1];
> >    aux_stacks[1] = stack;
> > }
> >
> > Whether this actually makes sense in real life, I have no idea.
> > The theory is that you want the last two stacks.  However, if these
> > elements get cleared at kfree() time, then I could easily believe that
> > the approach you already have (first and last) is the way to go.
> >
> > Just asking the question, not arguing for a change!
> 
> Oh, this is so obvious... in hindsight! :)
> 
> Walter, what do you think?
> 

u32 aux_stacks[2]; // = {0,0}

if (aux_stacks[0] != 0) {
     aux_stacks[0] = stack;
} else {
    if (aux_stacks[1])
         aux_stacks[0] = aux_stacks[1];
    aux_stacks[1] = stack;
}

Hmm...why I think it will always cover aux_stacks[0] after aux_stacks[0]
has stack, it should not record last two stacks?

How about this:

u32 aux_stacks[2]; // = {0,0}

if (aux_stacks[1])
    aux_stacks[0] = aux_stacks[1];
aux_stacks[1] = stack;

> I would do this. I think latter stacks are generally more interesting
> wrt shedding light on a bug. The first stack may even be "statically
> known" (e.g. if object is always queued into a workqueue for some lazy
> initialization during construction).

I think it make more sense to record latter stack, too.

Thanks for your and Paul's suggestion.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
