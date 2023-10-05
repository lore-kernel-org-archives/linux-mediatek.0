Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F89CE8FDC7
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 10:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jAIT8711ULGb6f+FX7b7dt1N2Jmj997+xycepBbzyo=; b=vpLzeod/sUExqL/AKg9OvezWBC
	sLRGXCiKF1i9BOfGXK67ohXn3v8jKJ+Gp0wXJGvDwD9H3WlHb+x971gbLZ0jfPiLNKMjOj3SxHeWZ
	1NIJKZ64NDHbp9l0OY6OSnXdKJldCXAhRrAyaH34PeZDjOIxKOh/yHm0Th734LDUvOrRYS7Xe40/t
	s1VuCAHUiV3CGlEV1nM/QSuav1uhdFZMEaa9gjjTe/Mdvgd/Z9+vmFTC+dHsM8JqofLO14/WUndcB
	9FY2JzzRoIvGk3isLso3NR3orY139cGbfliu8j4TRhxFmTukoYWPY/X2yV/diNUcoS2ZogWJbmzXu
	809OPS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLZy-001tHg-2r;
	Thu, 05 Oct 2023 10:27:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLZt-001tGG-0U;
	Thu, 05 Oct 2023 10:27:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0F1F153B;
	Thu,  5 Oct 2023 03:28:10 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.94.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 676E23F5A1;
	Thu,  5 Oct 2023 03:27:29 -0700 (PDT)
Date: Thu, 5 Oct 2023 11:27:26 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Misono Tomohiro <misono.tomohiro@fujitsu.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: smp: Fix pseudo NMI issues w/ broken Mediatek
 FW
Message-ID: <ZR6Pjk_3gpx1K3pF@FVFF77S0Q05N>
References: <20231002094526.1.Ie8f760213053e3d11592f892b30912dbac6b8b48@changeid>
 <ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com>
 <CAD=FV=UeeL9uycVeKpOm+eDm3xHrOnKi2frt6a1qFG1HX9yEUg@mail.gmail.com>
 <ZRwJKBZaYwF1rrur@FVFF77S0Q05N>
 <CAD=FV=WASz1uvTgwsu3H3cTr3smHk+E_XNUVnjoPpttwv095rQ@mail.gmail.com>
 <ZRxCCZxZWCG0NBur@FVFF77S0Q05N>
 <CAD=FV=Xk-OMKQPXxU9Z9HOcWwUxxrmLZ4vD0u5ouZRW_zDFDPg@mail.gmail.com>
 <ZR03liCodnTQWs7s@FVFF77S0Q05N>
 <86jzs2ofqs.wl-maz@kernel.org>
 <CAD=FV=XasZR6dhKBjpbYfby4F1Nu_bsq1m_HP+NpufjsJi0COg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XasZR6dhKBjpbYfby4F1Nu_bsq1m_HP+NpufjsJi0COg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_032733_304252_722F4625 
X-CRM114-Status: GOOD (  22.89  )
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

On Wed, Oct 04, 2023 at 07:04:12AM -0700, Doug Anderson wrote:
> On Wed, Oct 4, 2023 at 3:15 AM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Wed, 04 Oct 2023 10:59:50 +0100,
> > Mark Rutland <mark.rutland@arm.com> wrote:
> > >
> > > Given you haven't seen any issues, I suspect those are getting reset to fixed
> > > values that happens to work out for us, but it is a bit worrisome more
> > > generally (e.g. the LPI case above).
> >
> > It is likely that these SoCs don't even have an ITS.
> 
> Right. That was what we decided [1] when Marc pointed this out earlier.
> 
> Overall: we know that this firmware behavior is not good but we're
> stuck with it. :( At the very least, any new devices coming out will
> have this fixed. Presumably if old devices are working OK enough today
> (as long as you don't enable pseudo-NMI) then they can be made to keep
> working?
> 
> So circling back: what patch should we actually land?

For now I'd prefer we took the patch I sent in:

  https://lore.kernel.org/linux-arm-kernel/ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com/

... as that leaves us no worse than before this series, and it's pretty simple.

> As of right now only pseudo-NMI is broken, but it would be good to make sure
> that if the kernel later adds other features that would be broken on this
> hardware that it gets handled properly...

Going further than the above, I think there are three options here:

1) Complete fix: depend on a working firmware, and throw this workaround away.

   IIUC from the above, that's not something you can commit to.

2) Partial fix: have the kernel save/restore everything.

   IIUC this is unpalatable.

3) Partial fix: make the ARM64_HAS_GIC_PRIO_MASKING cpucap depend on the
   absence of a "mediatek,broken-save-restore-fw" property in the DT. I believe
   we can check that in early_enable_pseudo_nmi() or can_use_gic_priorities().

   That'll avoid potential issues if/when we change the priorities used for
   pNMI (which is something I've been looking at).

I'm happy with (3) if Marc is.

Mark.

