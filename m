Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B2CE81DED
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLisEMrwSw55L7II0CHG9iP51qUAlleMPZ/FDr/qaAQ=; b=GMI+WHMOPaotXhswn+ENK1dEU8
	0YB2g+0hhA1ClzSUM2nwp/iAHXuKXhf9iAFhASV0blZYqh7fu44HPoNDSZwxdS0XxqU6K7d7BHc55
	CzsqC2t4CM+A9o4bhjVdPY3ImozPdaJlbkhiTd57xidkzEGMYKzIf/9O4llXrFQQT7jHGncOFpZWS
	gjMMLsvEyfa+TMDGWjfWLEdKvQ+Qux6MZHN57vdVhC+JG4Wt3+Vmdu5CrxsdVOWJ06Ngx5HA1GwIm
	Rm6paThlR5/pDV0cqG1WmXwV0NTuHT9xet6eBGOzxaVVSgMMB5CE+f6VjYYPnGuNpRkbfrqFIQqSI
	Y9B1PgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojnt-005lRd-1R;
	Fri, 06 Oct 2023 12:19:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojnp-005lQG-31;
	Fri, 06 Oct 2023 12:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1994ECE27A7;
	Fri,  6 Oct 2023 12:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5F4C433C9;
	Fri,  6 Oct 2023 12:19:27 +0000 (UTC)
Date: Fri, 6 Oct 2023 13:19:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
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
Message-ID: <ZR/7TW1at0ltc4P4@arm.com>
References: <CAD=FV=UeeL9uycVeKpOm+eDm3xHrOnKi2frt6a1qFG1HX9yEUg@mail.gmail.com>
 <ZRwJKBZaYwF1rrur@FVFF77S0Q05N>
 <CAD=FV=WASz1uvTgwsu3H3cTr3smHk+E_XNUVnjoPpttwv095rQ@mail.gmail.com>
 <ZRxCCZxZWCG0NBur@FVFF77S0Q05N>
 <CAD=FV=Xk-OMKQPXxU9Z9HOcWwUxxrmLZ4vD0u5ouZRW_zDFDPg@mail.gmail.com>
 <ZR03liCodnTQWs7s@FVFF77S0Q05N>
 <86jzs2ofqs.wl-maz@kernel.org>
 <CAD=FV=XasZR6dhKBjpbYfby4F1Nu_bsq1m_HP+NpufjsJi0COg@mail.gmail.com>
 <ZR6Pjk_3gpx1K3pF@FVFF77S0Q05N>
 <CAD=FV=VbxM-hftVKsp2JhQpnQm9u_H86rQbnucS5-x-q8j0QQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VbxM-hftVKsp2JhQpnQm9u_H86rQbnucS5-x-q8j0QQA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_051934_140721_FDA8A21C 
X-CRM114-Status: GOOD (  22.59  )
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

On Thu, Oct 05, 2023 at 08:34:56AM -0700, Doug Anderson wrote:
> On Thu, Oct 5, 2023 at 3:27 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > On Wed, Oct 04, 2023 at 07:04:12AM -0700, Doug Anderson wrote:
> > > On Wed, Oct 4, 2023 at 3:15 AM Marc Zyngier <maz@kernel.org> wrote:
> > > > On Wed, 04 Oct 2023 10:59:50 +0100,
> > > > Mark Rutland <mark.rutland@arm.com> wrote:
> > > > > Given you haven't seen any issues, I suspect those are getting reset to fixed
> > > > > values that happens to work out for us, but it is a bit worrisome more
> > > > > generally (e.g. the LPI case above).
> > > >
> > > > It is likely that these SoCs don't even have an ITS.
> > >
> > > Right. That was what we decided [1] when Marc pointed this out earlier.
> > >
> > > Overall: we know that this firmware behavior is not good but we're
> > > stuck with it. :( At the very least, any new devices coming out will
> > > have this fixed. Presumably if old devices are working OK enough today
> > > (as long as you don't enable pseudo-NMI) then they can be made to keep
> > > working?
> > >
> > > So circling back: what patch should we actually land?
> >
> > For now I'd prefer we took the patch I sent in:
> >
> >   https://lore.kernel.org/linux-arm-kernel/ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com/
> >
> > ... as that leaves us no worse than before this series, and it's pretty simple.
> 
> Sounds good to me!
> 
> Catalin / Will: Please yell if there's anything you need me to do.
> Otherwise I'll assume you'll pick up Mark's patch instead of my patch
> #1 and then you'll pick up my patch #2.

I applied both to the arm64 for-next/backtrace-ipi branch. Thanks.

-- 
Catalin

