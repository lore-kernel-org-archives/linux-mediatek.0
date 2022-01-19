Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E2BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 02:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIZntq9JFZXAsxK+4if3occxVQHu5uQE5j6eO90KZdc=; b=QtkUOIz3NQetj8
	cRCK9V3gZPyLUaN9dYy/RF1XhGQ/360nkJbX3o1vUG+2XtQbFJYwTWdzxLEnGs2vl28HS8ts2bLUk
	RQ9oCcTpv8RkTps59RziSU3Uq4IXBzp4iI+KEqfr+4gxkNq56ipyRswVt5HDl9pW8hGO/T6/Sctnj
	0sUq9tRBdSxsi7RCVNe50FETlVhtw+D+oPqBu9EgOPu/ZmNoa/gHuyheyNOW+F+IcQ1j6Qyic8d/n
	ImZx/62IVOiyQiuxyzY1he2C5l21FkOWdDnalAmg773xoOlb16IBoQcWSzbQATAM35ZuKc4Z2X7nv
	9Tjdake2rVZ1Ohi4rqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA0Ys-003WKw-4y; Wed, 19 Jan 2022 02:18:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA0Yf-003WK1-VN; Wed, 19 Jan 2022 02:18:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC46C614CE;
 Wed, 19 Jan 2022 02:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C225C340E5;
 Wed, 19 Jan 2022 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642558724;
 bh=quWTO0BctwTPOXaro7ImoNZv9OKkQlUcJBr0qz2PkM0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=I2wfYoZPydKxYX2k9hfHwmSPOWsUmeHRg7koyHrH+mcuS7OBh03to7iUvxbs/qqv5
 gqVtqSLy0TWdw0PDT03B/HwWbJ9ekd18DKUyAL1O2ATBPezTTPf2j95nnbPOlFSGU5
 KaWG33xLuIPqwG1LCYX113tUZ3EJC2nintt8SsQwblusOemzpzWOXbAEtz+96ZuPOV
 SaNm2gSkSvT5qsfvXUBPJ4r7N1FpD3LIbPre8s34y8+8tkkqnSDEpCd6J/ZMriHBC4
 /Jwete5LN1X+fytA5sdNCqti7mHiZaqYTh46E1amG+kuu/J6uv0pX8g0M53N/q3pEi
 0eqI10uT6XeSQ==
MIME-Version: 1.0
In-Reply-To: <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com> <YeF/AYZ0DuKGwLLk@maud>
 <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
 <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
From: Stephen Boyd <sboyd@kernel.org>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Nick Fan <Nick.Fan@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
To: Alyssa Rosenzweig <alyssa@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>
Date: Tue, 18 Jan 2022 18:18:42 -0800
User-Agent: alot/0.10
Message-Id: <20220119021844.3C225C340E5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_181846_139832_39498883 
X-CRM114-Status: GOOD (  39.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Robin Murphy (2022-01-18 07:01:46)
> On 2022-01-18 07:19, Chen-Yu Tsai wrote:
> > Hi,
> > 
> > On Fri, Jan 14, 2022 at 9:47 PM Alyssa Rosenzweig <alyssa@collabora.com> wrote:
> >>
> >>>> That links to an internal Google issue tracker which I assume has more
> >>>> information on the bug. I would appreciate if someone from Google or
> >>>> MediaTek could explain what this change actually does and why it's
> >>>> necessary on MT8192.
> >>>>
> >>>> At any rate, this register logically belongs to the MT8192 "infra" clock
> >>>> device, so it makes sense to set it there too. This avoids adding any
> >>>> platform-specific hacks to the 3D driver, either mainline (Panfrost) or
> >>>> legacy (kbase).
> >>>
> >>> Does this really have anything to do with clocks?
> >>
> >> I have no idea. MediaTek, Google, please explain.
> >>
> >>> In particular, "ACP" usually refers to the Accelerator Coherency Port
> >>> of a CPU cluster or DSU, and given the stated symptom of the issue
> >>> affected by it, my first guess would be that this bit might indeed
> >>> control routing of GPU traffic either to the ACP or the (presumably
> >>> non-coherent) main interconnect.
> >>
> >> I'd easily believe that.
> > 
> > As Robin guessed, "ACP" here does refer to the Accelerator Coherency Port.
> > And the bit in infracfg toggles whether ACP is used or not.
> > 
> > Explanation from MediaTek in verbatim:
> > 
> > -------------------------------------------------------------------------
> > The ACP path on MT8192 is just for experimental only.
> > We are not intended to enable ACP by design.
> > 
> > But due to an unexpected operation, it was accidently opened by default.
> > So we need a patch to disable the ACP for MT8192.
> > -------------------------------------------------------------------------
> 
> Aha! That's great, thanks ChenYu!
> 
> Stephen, my thinking here is that if this feature controls the GPU 
> interconnect, and only matters when the GPU is going to be used (as 
> strongly implied by the downstream implementation), then the GPU driver 
> is the only interested party and may as well take responsibility if 
> there's no better alternative.
> 
> I'd agree that if there was already a "base" infracfg driver doing 
> general system-wide set-and-forget configuration then it would equally 
> well fit in there, but that doesn't seem to be the case.

Wouldn't this first set-and-forget configuration fit that bill? We can't
have a "base" driver because why?

> Short of trying 
> to abuse the bp_infracfg data in the mtk-pm-domains driver (which 
> doesn't seem like a particularly pleasant idea), the code to poke a bit 
> into a syscon regmap is going to be pretty much the same wherever we add 
> it. There's already a bit of a pattern for MTK drivers to look up and 
> poke their own infracfg bits directly as needed, so between that and the 
> downstream implementation for this particular bit, leaving it to 
> Panfrost seems like the least surprising option.
> 

I'd prefer we leave the SoC glue out of device drivers for subsystems
that really don't want to or need to know about the SoC level details.
The GPU driver wants to live life drawing triangles! :) It doesn't want
to know that the ACP path didn't work out on some SoC it got plopped
down into. And of course GPU is the only interested party, because the
SoC glue for the GPU is all messed up so GPU can't operate properly
without this bit toggled. I wonder where the fix would end up if this
port was shared by more than one driver. Probably back here in the
closest thing there is to the SoC driver.

It's not as simple as poking bits in some SoC glue IO space
unconditionally either. The GPU driver will need to know which SoC is
being used and then only poke the bits if the affected SoC is in use. Or
we'll have some DT binding update to poke the bit if some syscon
property is present in the DT node. Either way, it's a set-and-forget
thing, so the GPU driver will now have some set-and-forget logic for one
SoC out of many that it supports; do it once at boot, grab a regmap,
parse some more stuff to make sure it's needed, poke the bit, release
the regmap, finally start drawing.

Of course, I won't oppose the mess being moved somewhere outside of the
subsystem I maintain ;-) I was mainly curious to understand why the
regmap path is proposed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
