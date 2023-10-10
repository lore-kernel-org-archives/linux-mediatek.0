Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBA0CD8C9C
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 14:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWcJ6w7POfv7sCUBrmIpDvnagdGjD70oQgT03BbPqeQ=; b=sMP5USd0VmSYMwhQSCCYlUm3aB
	iBJra5KonsgHiwtsuPj1MpblMzm4wy4QSXD03YfQm2EMABSbkDSPdhJ7oCPyxFldze7wVQ4soLWgs
	mia0eckjPuFbDF7K6gSmDwWhvFm22a2v2YX+9+/KgqGwXPHoLEE41rCCjf03k+vSmC1Fr6CLM4H76
	Wsip42fkHyvpGMaZP3TXMGEMSVsiU24LWuODXQMww5cvkeUU8q/Q8Jl4b6KmYYL8u8eDWVYEkzswg
	rGDbRxR2EqowbeRMY9JYazaQENw7zT6/866PJYDMqR0XYDcN6tjVmY09gB9y6VIOZhPToSiuoYxaZ
	b6Cj9+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqEBG-00Dd3y-0a;
	Tue, 10 Oct 2023 14:57:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqEBE-00Dd3d-0q;
	Tue, 10 Oct 2023 14:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cWcJ6w7POfv7sCUBrmIpDvnagdGjD70oQgT03BbPqeQ=; b=ieKVLBYHiRjMpETBOyz60EGT0o
	QJWkOI+2O8r3aq8MKPC6KLodWkXT82MJP0N768qYFTB32n6ETsbgR9uUrz1sBjMGdIFweLA6DjJn4
	d7dsEaIrNC4kDh3J5DBXf7yS0sAoqKYyBK/NVQjcqwdgGxIoR12qhVPhRKb9gXrmVLB0kcDz2KneH
	GvJwjlPG32iIpfKWC7EUK1FroC/XsJmCxZFKrdzVdCTevqtsO/2hAUTc6xURsjEfl2pk2meJyJtmd
	7Zsp6MTiAET8k6J7psSkGm79XWVbOBQCTsO2zwfvn3RY0tE9LF9Citu0DUIkktTQL6SUiaOI0TRMD
	hEmJzQ4A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qqEB8-00Gvjp-11;
	Tue, 10 Oct 2023 14:57:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6C623300392; Tue, 10 Oct 2023 16:57:47 +0200 (CEST)
Date: Tue, 10 Oct 2023 16:57:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang =?utf-8?B?KOW8teW7uuaWhyk=?= <Kuyo.Chang@mediatek.com>
Cc: "dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"vschneid@redhat.com" <vschneid@redhat.com>,
	"bristot@redhat.com" <bristot@redhat.com>,
	"juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bsegall@google.com" <bsegall@google.com>,
	"mgorman@suse.de" <mgorman@suse.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/1] sched/core: Fix stuck on completion for
 affine_move_task() when stopper disable
Message-ID: <20231010145747.GQ377@noisy.programming.kicks-ass.net>
References: <20230927033431.12406-1-kuyo.chang@mediatek.com>
 <20230927080850.GB21824@noisy.programming.kicks-ass.net>
 <b9def8f3d9426bc158b302f4474b6e643b46d206.camel@mediatek.com>
 <20230929102135.GD6282@noisy.programming.kicks-ass.net>
 <8ad1b617a1040ce4cc56a5d04e8219b5313a9a6e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ad1b617a1040ce4cc56a5d04e8219b5313a9a6e.camel@mediatek.com>
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

On Tue, Oct 10, 2023 at 02:40:22PM +0000, Kuyo Chang (張建文) wrote:
> On Fri, 2023-09-29 at 12:21 +0200, Peter Zijlstra wrote:
> >  	 
> >  On Wed, Sep 27, 2023 at 03:57:35PM +0000, Kuyo Chang (張建文) wrote:
> > 
> > > This issue occurs at CPU hotplug/set_affinity stress test.
> > > The reproduce ratio is very low(about once a week).
> > 
> > I'm assuming you're running an arm64 kernel with preempt_full=y (the
> > default for arm64).
> > 
> > Could you please test the below?
> > 
> 
> It is running good so far(more than a week)on hotplug/set affinity
> stress test. I will keep it testing and report back if it happens
> again.

OK, I suppose I should look at writing a coherent Changelog for this
then...

