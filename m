Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3660C83F05
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Npsdh7o/phl+J0hTe78rjYAxCLG4BlzPDCZswKqor3Y=; b=N5g25PjI/Af1YG36JN8uq3GHc1
	tm5se8AR0FLUkkq4gePjBEGHVVXPoq4zonmbniFwDbbezfypl2ANSY7aNbRXEko5W7NzMB1FLRCJJ
	hqgi1O2peDB2ZMhf9io03YVSHhO4kcmlUvPBj6nECTzgp5/t45hCLNpFW6K2pHLCxHeuI2hJ1OcAZ
	tCUpdnuvYLxMPjdyMOw9hg6kE7qs+z0HeeQXk4JPUKFhfwToolQtb3jNcGR2vz7PdPufmlLIhJHrJ
	WfDQEFJGjTystfanylMb4pXiDQcwaibR9UqhUP1U7v9NmbiQcGvZKAo0T+RnR/e1K4Bs7xy9VsdxH
	Rd5Jm5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUA-0000000EC1X-3lap;
	Fri, 04 Jul 2025 11:21:42 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbtE-0000000DkuX-1IQ7;
	Fri, 04 Jul 2025 08:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Npsdh7o/phl+J0hTe78rjYAxCLG4BlzPDCZswKqor3Y=; b=Z5Uyd6WafiGI7Vj8mvDeVq4djE
	qakNSYai6eHyIpoQkdTzaKX7zqRJfyAVahsqdKs1IGgeht/7jtw4gTXnR3Alg1M2rFIOZgXn/7roD
	jCVja9IVRUsPmFN6lUlIO7KIr0P1d2l90Vkc3DG9RKXxvo5D0o30C0+7oQdcphpH4ei4Ni4rWvZWd
	o2u7U6mfbUx9FnudypN/+rgpXqyp8Wrx+5WWgjx2pTSH+w5mqnhpZgdFAC6rPjRa8AnFhaJ9fTDgt
	voPz9xhG5y/GtENkxuTYiF9dG5m6Ja+2spJ/waLdpMpV/lM3kaIMaKd1gK/SVgkTpDnvIIHdHpRhk
	8E0YXKyQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbt9-0000000GDWP-1cvL;
	Fri, 04 Jul 2025 08:35:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8EB56300212; Fri, 04 Jul 2025 10:35:18 +0200 (CEST)
Date: Fri, 4 Jul 2025 10:35:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 1/1] sched/deadline: Fix dl_server runtime calculation
 formula
Message-ID: <20250704083518.GE2001818@noisy.programming.kicks-ass.net>
References: <20250702021440.2594736-1-kuyo.chang@mediatek.com>
 <CANDhNCqYCpdhYS9afdKeY34Bmw8MXyqKWCSTxOZNLTjYrUaVXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANDhNCqYCpdhYS9afdKeY34Bmw8MXyqKWCSTxOZNLTjYrUaVXg@mail.gmail.com>
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

On Tue, Jul 01, 2025 at 08:28:12PM -0700, John Stultz wrote:
> On Tue, Jul 1, 2025 at 7:14???PM Kuyo Chang <kuyo.chang@mediatek.com> wrote:
> >
> > In our testing with 6.12 based kernel on a big.LITTLE system, we were
> > seeing instances of RT tasks being blocked from running on the LITTLE
> > cpus for multiple seconds of time, apparently by the dl_server. This
> > far exceeds the default configured 50ms per second runtime.
> >
> > This is due to the fair dl_server runtime calculation being scaled
> > for frequency & capacity of the cpu.
> >
> > Consider the following case under a Big.LITTLE architecture:
> > Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> > scale-invariance defined as below:
> > Frequency scale-invariance: 100
> > Capacity scale-invariance: 50
> > First by Frequency scale-invariance,
> > the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> > Then by capacity scale-invariance,
> > it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> > So it will scaled to 238,418 ns.
> >
> > This smaller "accounted runtime" value is what ends up being
> > subtracted against the fair-server's runtime for the current period.
> > Thus after 50ms of real time, we've only accounted ~238us against the
> > fair servers runtime. This 209:1 ratio in this example means that on
> > the smaller cpu the fair server is allowed to continue running,
> > blocking RT tasks, for over 10 seconds before it exhausts its supposed
> > 50ms of runtime.  And on other hardware configurations it can be even
> > worse.
> >
> > For the fair deadline_server, to prevent realtime tasks from being
> > unexpectedly delayed, we really do want to use fixed time, and not
> > scaled time for smaller capacity/frequency cpus. So remove the scaling
> > from the fair server's accounting to fix this.
> >
> > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > Acked-by: Juri Lelli <juri.lelli@redhat.com>
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Suggested-by: John Stultz <jstultz@google.com>
> > Tested-by: John Stultz <jstultz@google.com>
> 
> Thanks so much again for the multiple iterations here.
> 
> I've re-tested this and it still looks good.
> 
> For what its worth:
> Acked-by: John Stultz <jstultz@google.com>
> 
> Juril/Peter: if/when you take this, could you add a:
> Fixes: a110a81c52a9 ("sched/deadline: Deferrable dl server")

Nice, b4 picked it up and DTRT.

Thanks!

