Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AEFD49C71
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jan 2026 08:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rgOMETSMC9Bs3nuV0cUho26a3uyffmK4JEWMz/4FzU=; b=17Tt7J/HXamMElfRQogiF2J+eW
	4t5InnR5BipWptY2/RN14i/z1U/eZqYTBbkDK7udHKo/8Yxwa2uKzGN8QuS7oNIcRi6i3Ag+O8Rq+
	dYRBCqgJbeMnYYeFu3jQHvUlkVZbVIBCkNVB9xoGFscK+MAWpIOat8G6rUzcc6TVfKg6ctUp9HUBc
	ONFBUGlSKr7jFQRm1qZxJpKNv4KcNhxlkrpbsVjJFL9RRoav+4RtHy6N/eT20FQK9EnOCqV1wqceG
	+nxlBKUzzJfITH/Lck/7xNs/XuZau+k5+rfsi1jHY7x0+whQKrN2TOiwGq/zLxVAWlN1NziuZthst
	VR1mZCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljhB-00000001CBx-30b8;
	Fri, 30 Jan 2026 08:17:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljh9-00000001CBU-1QKa
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Jan 2026 08:17:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5917043801;
	Fri, 30 Jan 2026 08:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CCAC4CEF7;
	Fri, 30 Jan 2026 08:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769761054;
	bh=SxLqE44zUUxs1dvaadGY9E3DpJnP/taoyxmSUjwcM00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiK1xCBmZRzZSTAGdSIV7V9uGeUjIdIa1736iKo1bi11W9OkKJhT9ttVn0pAEpDwT
	 rGtdYUWt4JbDaciao5Y6YdWMzZW+zCoP6Zjs3SLtE0xV+B9kZZs9X3KCNIgtvFUQw4
	 JJ14slv8bApSWz/a7RA07Bk0B7oCt7SJmdXFpHQWjgf7UV9EYxHPuwbWvnWOlb2ENA
	 LCWB8NU+/cXbgeurd+ocqQAsUCmH3pkD4zs4Wa6OS0n4wgdTcvl24eLybvQZMZdZ25
	 w+dHyoIPScNcPsJc18pYNc9PkRzdrK4OtYLL9Sm9s9q7+LTe9IVBeaYdILPWF2mlV8
	 httBgzWekJC5w==
Date: Fri, 30 Jan 2026 08:17:31 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] pmdomain: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aXxpG3hEVVjuWInc@google.com>
References: <20251231035357.1147578-1-tzungbi@kernel.org>
 <CAGXv+5Fm7DFkZ_JONhHN4467=oVhuw-e1XtXuD53qBQDWd7cNw@mail.gmail.com>
 <CAPDyKFrqqXYy_Y-7WA=5taBhE4rcYX+Uz_RnGpOtD-AF3eipVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFrqqXYy_Y-7WA=5taBhE4rcYX+Uz_RnGpOtD-AF3eipVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_001735_399033_0D36BE2A 
X-CRM114-Status: GOOD (  19.50  )
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

On Tue, Jan 27, 2026 at 02:57:46PM +0100, Ulf Hansson wrote:
> On Thu, 22 Jan 2026 at 09:38, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Wed, Dec 31, 2025 at 11:54 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > @@ -398,7 +398,7 @@ static int scpsys_hwv_power_off(struct generic_pm_domain *genpd)
> > >                         return ret;
> > >         }
> > >
> > > -       ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
> > > +       ret = clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
> 
> scpsys_hwv_power_off() is typically called by genpd in the suspend
> noirq() phase, when all devices attached to the genpd in question have
> been suspended too. See genpd_suspend_noirq().
> 
> This means that scpsys_suspend() (below) may be called to unprepare
> the clock, before scpsys_hwv_power_off() may call clk_disable(). This
> is a bug according to the clock framework.

Ack, I observed a similar warning in a system suspend/resume cycle.

> 
> Moving scpsys_suspend() to the noirq phase too could maybe work.

No, I guess it doesn't work as .prepare() can sleep however noirq phase
shouldn't/can't.

> Although, perhaps an even simpler solution would be to do the
> clk_prepare() during ->probe() and clk_unprepare() during ->remove()
> (and error path in probe). Of course, this assumes that
> clk_prepare/unprepare doesn't really do anything hardware wise, so we
> don't start wasting power by keeping the clocks prepared.

It turns out a pure revert of f0fce06e345d ("soc: mtk-pm-domains: Fix
the clock prepared issue").  Per the commit message of f0fce06e345d,
the concern is some PLLs keep prepared even if the system is suspended.

Not sure should we take the compromise?

