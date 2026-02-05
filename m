Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5A1E8B397
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Feb 2026 05:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzGxohzHaCZBXOQDj4ICHBHU8hdxs9Sm1M5Lz5fCpVw=; b=hXhrHruCRcB5WwvmcY0Pgrw8dF
	p0Pic8tq65Nj4Zb8aWofYmoK3o1jhwxHtPxI7iXp4IwaHyyK166RpGON1JWgruqPfBrAzvWv8s98r
	mo9EqDfK3VEAxK5Sg+TpVjSBbq8AFxm42TT4hp4kITfn2l5SWWvZTqD0EIkMQnHxnqAY8Jv5idFQO
	buiRf9TQITXy8s7wiEv4W/c20ikUpQ8Ez+f0A4XvRIR5JA2UB5B8iaWq5oVulyk/S07zqeVVX2r+B
	spG7zigT0JwZOK3n668N8namePbGy1JaVBUQdIV9tZeKG4jQeWSqdftM/TEsvb8Wv4+cwmsjKC/Jh
	tEgVt8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vns2I-00000009ScS-3Fj1;
	Thu, 05 Feb 2026 05:36:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vns2H-00000009ScL-0EUg
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Feb 2026 05:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED5E060010;
	Thu,  5 Feb 2026 05:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5227C4CEF7;
	Thu,  5 Feb 2026 05:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770269771;
	bh=c/2v7icKPFyeTOkKWCFw3lN/zTG8b96T0vy+Y4haNTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYOzcznI0ar7+PpBlPxNIGtGxhS6l0E3jyewZKJ7tVpIvSz/8nOWTwJXzgTtK/okG
	 6DFKS6Hz0kDhwE4HRN4neDQzwLylcz5MuBZpFMzXX7KyPc1VWLlNMUHwZj8dc+bXvy
	 vZWEpCMXq8d0da4l0diMNKs78cNZbJ8S+iYLypE927EZwwnj/hZOuHCZ5nArOqklSw
	 ptAMQbjMRnM6tov7+VgqWYJnDJgvCrETcGM+JtFOdqKpOjcdqI0aL2xag0cFfJLqGh
	 TKubUdouvTDAlD7Z7X0pM21uGbBisbpVyVwn3oAARXjapw09SWKK+uN7vBt40KO28J
	 L84dKwB/8KwyQ==
Date: Thu, 5 Feb 2026 05:36:08 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] pmdomain: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aYQsSPQdx-DOzSSh@google.com>
References: <20251231035357.1147578-1-tzungbi@kernel.org>
 <CAGXv+5Fm7DFkZ_JONhHN4467=oVhuw-e1XtXuD53qBQDWd7cNw@mail.gmail.com>
 <CAPDyKFrqqXYy_Y-7WA=5taBhE4rcYX+Uz_RnGpOtD-AF3eipVQ@mail.gmail.com>
 <aXxpG3hEVVjuWInc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXxpG3hEVVjuWInc@google.com>
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

On Fri, Jan 30, 2026 at 08:17:34AM +0000, Tzung-Bi Shih wrote:
> On Tue, Jan 27, 2026 at 02:57:46PM +0100, Ulf Hansson wrote:
> > On Thu, 22 Jan 2026 at 09:38, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > > On Wed, Dec 31, 2025 at 11:54 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > > @@ -398,7 +398,7 @@ static int scpsys_hwv_power_off(struct generic_pm_domain *genpd)
> > > >                         return ret;
> > > >         }
> > > >
> > > > -       ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
> > > > +       ret = clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
> > 
> > scpsys_hwv_power_off() is typically called by genpd in the suspend
> > noirq() phase, when all devices attached to the genpd in question have
> > been suspended too. See genpd_suspend_noirq().
> > 
> > This means that scpsys_suspend() (below) may be called to unprepare
> > the clock, before scpsys_hwv_power_off() may call clk_disable(). This
> > is a bug according to the clock framework.
> 
> Ack, I observed a similar warning in a system suspend/resume cycle.
> 
> > 
> > Moving scpsys_suspend() to the noirq phase too could maybe work.
> 
> No, I guess it doesn't work as .prepare() can sleep however noirq phase
> shouldn't/can't.
> 
> > Although, perhaps an even simpler solution would be to do the
> > clk_prepare() during ->probe() and clk_unprepare() during ->remove()
> > (and error path in probe). Of course, this assumes that
> > clk_prepare/unprepare doesn't really do anything hardware wise, so we
> > don't start wasting power by keeping the clocks prepared.
> 
> It turns out a pure revert of f0fce06e345d ("soc: mtk-pm-domains: Fix
> the clock prepared issue").  Per the commit message of f0fce06e345d,
> the concern is some PLLs keep prepared even if the system is suspended.
> 
> Not sure should we take the compromise?

Please ignore the patch.  The observed paths are two independent power
domains.  Distinguishing them by setting different lock class key fixes
the lockdep warning as Chen-Yu suggested in [1].

[1] https://lore.kernel.org/all/CAGXv+5Fm7DFkZ_JONhHN4467=oVhuw-e1XtXuD53qBQDWd7cNw@mail.gmail.com/

