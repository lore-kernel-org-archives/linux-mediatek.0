Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFF8C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 04:02:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C875361456
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 04:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C875361456
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A40JvXCd/zRr1F4VbT3QdTrpQetB1IrWsPvXy8rdrWg=; b=Bob8c8GtzmUwFV
	3c/vuZtHcgCG1KTdeYA7fW1ZIV0zUPR2qEj/ll6LqzO6XgNa9cLP04fq0SHi2bWhJMb+sb6ys083t
	twJglzOqwqj5wGSH6Y8XRA69eSjOb1UFNJBsQGyXh+QqAZPHwyT82mkif3Sacbl1v4wuqUm/Q78M3
	q0NLR8SfM7XQBb1iBDQaGltJwjSKTEEq5lcumIHS7LCnUsAaVKwg5h1SYf2gD5j5K50WfU8tlTdj0
	yT4y/Y1Y5zjkMZ8g2SsFixQ5T68uOeRjxEzinzr4LFJgvlD04Yo9Rc2azNqF1Rhq3Yo64aEC+Oxw1
	eBQ5rLeMwe/1aUUiTWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lynuV-00G2Vb-Kj; Thu, 01 Jul 2021 04:02:43 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lynuI-00G2U5-C2
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 04:02:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id q18so9232017lfc.7
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 21:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7hi2FrhIaizwpDJPwnSinv9W2oMvoHm0CGYALUuuXDs=;
 b=kWWeltzlSYGGc5QRSaAkNEu3wbwvMTyMjx7Hi1Du8rAm3U1ZDS7a2a2e9GB/JtvpeI
 3iWP3ESanAX0jItDlj8NFWAfWGDMbaPHtU+xbFrBLaplzEIJyb0VhMk8diCaNxGaxuzy
 R8XGe8kox80GEpIggg2eFJJwK/ZKq3i11ixHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7hi2FrhIaizwpDJPwnSinv9W2oMvoHm0CGYALUuuXDs=;
 b=cmcKd/NrcNAQSaH4iH+2iYo0MIlHuVHEMqylEbwa0K83sf2G4hblSD+6mpFXolKXp3
 3M95U0BKsJRpRbgfVgiluUolP/yp31AVpLiq/nOgI0Y1BzjmBDHFwBDVIuhT/XP9CR06
 WsztLIrTWQtNYKAHv79xMFIPqoDC3wO6EplxQYCHb4Ws0JCn8+9fHRxCFDO17MothxLg
 biZgRXRHo6ZshIq+NBJnKet8VGkItbKcLAn0wrI1pbqShPCMtkedBvUX0BCR8i0zoJEa
 yBLuKUgJNyyyvXmieRQbG37szCSQUpH/d8byEh/UaWaRLUAcifYFF924DUTUM7lYFUTK
 gqnQ==
X-Gm-Message-State: AOAM532TG6VxL/OcYfG+59xLw9/ZzFBEYmufNCnsurgqgz3Qf9Xp2IUR
 0nfJ3lKgOeVKwZOSgh1bjwHjinEYyLUnPIrb/cBRSg==
X-Google-Smtp-Source: ABdhPJw/v6AwK/W5MblRaHBzvNcBF8/BLoJuYBeXADDntlPIgf2Bpc9gBKz0UhSMGyatSQ8BxnhizhHgp4pWwKlsVxw=
X-Received: by 2002:a05:6512:63:: with SMTP id
 i3mr29997663lfo.587.1625112148504; 
 Wed, 30 Jun 2021 21:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-4-chun-jie.chen@mediatek.com>
 <CAGXv+5F2zTcqnjH2ud38vUD149KJtgxhPQME2Mk6-vGtQv+2YQ@mail.gmail.com>
 <ff6179e8-06f9-fbba-c704-a74381c2149a@gmail.com>
 <CAGXv+5FXuMnhsnytLYKKA9YE97bps7KnkDNADvv8f_wdTqnrfg@mail.gmail.com>
 <be824462-4c2f-3bde-0a3d-c5470a5b0fbb@gmail.com>
In-Reply-To: <be824462-4c2f-3bde-0a3d-c5470a5b0fbb@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Jul 2021 12:02:17 +0800
Message-ID: <CAGXv+5FSq-cCRR-wB_kp2s+59273r0nrhtkH9006ezN-sUtNzQ@mail.gmail.com>
Subject: Re: [PATCH 03/22] clk: mediatek: Fix corner case of tuner_en_reg
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_210230_480691_32C4B9C8 
X-CRM114-Status: GOOD (  27.67  )
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

"On Wed, Jun 30, 2021 at 7:43 PM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> On 30/06/2021 13:09, Chen-Yu Tsai wrote:
> > On Wed, Jun 30, 2021 at 6:53 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >> On 30/06/2021 09:31, Chen-Yu Tsai wrote:
> >>> On Thu, Jun 17, 2021 at 7:01 AM Chun-Jie Chen
> >>> <chun-jie.chen@mediatek.com> wrote:
> >>>>
> >>>> On MT8195, tuner_en_reg is moved to register offest 0x0.
> >>>> If we only judge by tuner_en_reg, it may lead to wrong address.
> >>>> Add tuner_en_bit to the check condition. And it has been confirmed,
> >>>> on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
> >>>> clock square control.
> >>>>
> >>>> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> >>>
> >>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>
> >>> Though you might want to consider converting these types of checks into feature
> >>> flags.
> >>>
> >>
> >> Yes I think adding a feature flag is the way to go. Luckily there are only a few
> >> SoCs that will need updates at the same time.
> >
> > I also see that the different clock modules are tied together using only clock
> > names written in the drivers, instead of clock references in the device tree.
> >
>
> Not sure I understand what you mean. Do you refer to something like [1]? That's
> because the clock is probed by the DRM driver, as they share the same compatible
> and IP block.

In the example driver you mentioned, most of the registered clocks have the same
parent clock, "mm_sel". This clock is from another hardware block,
"topckgen" [1].

The two are linked together by looking up the clock name. The link should be
explicitly described in the device tree, instead of implicitly by some name
found in two drivers. The consuming driver can fetch the clock name via
of_clk_get_parent_name(), or be migrated to use `struct clk_parent_data`,
which allows specifying local (to the DT node) clock names or clk indices
as parent clk references.

What's more confusing is that the mmsys node actually has "assigned-clocks"
properties [2] referencing the "mm_sel" clock, but not "clock" properties
referencing the same clock. On the surface this looks like the hardware
is trying to configure clocks that it doesn't use.

Also, Maxime Ripard made the argument before that "assigned-clock-rates"
doesn't give any real guarantees that the clock rate won't change. A
better method is to request and "lock" the clock rate in the consuming
driver.

So overall I think there are many improvements that can be made to the
Mediatek clk drivers. They aren't real blockers to new drivers though,
and I think each would take some effort and coordination across all
the SoCs.


Regards
ChenYu

[1] https://elixir.bootlin.com/linux/latest/source/drivers/clk/mediatek/clk-mt8173.c#L545
[2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/mediatek/mt8173.dtsi#L996


> Regards,
> Matthias
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/mediatek/clk-mt8173-mm.c?h=v5.13#n139
>
> > Unfortunately reworking this would likely require a lot more work. I previously
> > did a bit of internal reworking for the sunxi drivers. While not the same, I
> > think the plumbing required is comparable.
> >
> > ChenYu
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
