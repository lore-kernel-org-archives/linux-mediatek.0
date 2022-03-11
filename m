Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCEAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 10:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUXPyGUSVb1W9jXqSHuyygwA9qkwRIAuVS85w76I2XQ=; b=KPMAZY/qyf6XBK
	4tY/j6+zSmABQC5qO8JsSLXWLxAph9+OUgl3YYZkIoU2Pdyx/MWKOhaY545YSAnTKqIxrHTgGQb8u
	/nzdE5/SmD6lyqLqxxxFlETqjS50fdDBMuNwH6bDCHboYGgXkdUmmOp2vopks6rOialCm9aZUKoWF
	3FWZi5m0sZ8FBMc1h0djrm711qIs2b8T7hTpubn/4y8rZv1DFKJygmJyDvZYbmHgBAT0UXM+raQFe
	i349DsPuT8pdm1OTEjA2BMUB2ZxzmoIJs5+5/tb2miqN6LEzyF1s3ha5lYb7vKOHCQAalifR2hn91
	d09SGyMjG1sNZuEvfnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSceQ-00G2dj-BU; Fri, 11 Mar 2022 10:37:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nScdY-00G2H1-8j; Fri, 11 Mar 2022 10:36:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59A65619EE;
 Fri, 11 Mar 2022 10:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370C1C340E9;
 Fri, 11 Mar 2022 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646995002;
 bh=u/kSXHMnN1+8U8Bxqk12Hxiaac0bWzzSiArit+3M1pI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cRLPr4iyT9paIUvttcU5ai23HQDgfsYOs7z6XuN2Sz0mUYoEN0xMKxpoKcuqgF/me
 VFfkjVcGII0WVu1b/br3JPEd1aO3wlO1AF0AnmAl8ddehFqGtLOArHi766J/AyZEnH
 r/Klyi/uiwpfT63OgS827fjLeMb3HKiZlzYtnv1GM6OQAJmTY+sMXgtXwu3NzOYU8l
 pf8WCuORXZUG+QJbiI0hxdzAVJV6uPPcQ58gSnK8M9fh14m1DZQ00VgGXTa9yJtPn1
 9/d+2GIG48OT04vmAAAACXsSVyt3nmvpOkugVZ1ZSM6xC3l7rJzuzCbACqwFT8Ky51
 Ns9phry68Hsng==
Date: Fri, 11 Mar 2022 16:06:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 LAK <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/3] dmaengine: Use platform_get_irq*() variants to
 fetch IRQ's
Message-ID: <YismNmydtp3KEmo+@matsya>
References: <20220104163519.21929-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8sRizPbhG1qrFy1SLhWWuL2AM4ZM68y_jb4cg0_G5VPUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8sRizPbhG1qrFy1SLhWWuL2AM4ZM68y_jb4cg0_G5VPUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_023644_371369_E7BE1459 
X-CRM114-Status: GOOD (  17.57  )
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

On 09-03-22, 11:37, Lad, Prabhakar wrote:
> Hi Sean/Vinod,
> 
> Not sure how I missed you to add in the To/CC list.
> 
> On Tue, Jan 4, 2022 at 4:35 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Hi All,
> >
> > This patch series aims to drop using platform_get_resource() for IRQ types
> > in preparation for removal of static setup of IRQ resource from DT core
> > code.
> >
> > Dropping usage of platform_get_resource() was agreed based on
> > the discussion [0].
> >
> > [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> > patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (3):
> >   dmaengine: nbpfaxi: Use platform_get_irq_optional() to get the
> >     interrupt
> >   dmaengine: mediatek: mtk-hsdma: Use platform_get_irq() to get the
> >     interrupt
> >   dmaengine: mediatek-cqdma: Use platform_get_irq() to get the interrupt
> >
> >  drivers/dma/mediatek/mtk-cqdma.c | 12 ++++--------
> >  drivers/dma/mediatek/mtk-hsdma.c | 11 ++++-------
> >  drivers/dma/nbpfaxi.c            | 14 ++++++--------
> >  3 files changed, 14 insertions(+), 23 deletions(-)
> >
> These patches aren't in -next yet. Do you want me to resend them?

Yes that would be ideal! But after upcoming merge window closes

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
