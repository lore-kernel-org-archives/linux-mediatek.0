Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3081BC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:43:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C372621D40
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dSENwJjL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kYYtjn4J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C372621D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gQAAaDvfca09WkAVSEQ1eH6PG/4nQ52TDmXQn8C6DKw=; b=dSENwJjLDgGJCmFpUcQZZxdj5
	/j5BKI91ZMVDb0qmbjlBbyb5lSfcBXzBsLKOpTealZ+1PAVv0ZOiXTfKGpDKZpX20z750caErtbSL
	+fUiolBibvGxYKE6hs6BZtj57nOPY1fYBB4gV+MzUlHgQremIHsy1/zXJrM2acMu6JgbAOUDKUq+m
	L1qcl8TWn2RUuf047xAqlp2ljv/ATYwusBx2MrZZ40dAgoql3b4kgkWX4o5oDphD4pbD4RTnJf/hO
	ffnvPZI2wAQAWV5g7AIW4Tk+/A7WikgzfUhGjH/nKS2rjyiFD3495ZqM+i4jWg618lY67ZDkL1Pak
	yjkne047A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGfaj-0005Dp-9v; Fri, 11 Sep 2020 09:43:37 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfag-0005D3-K9
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 09:43:35 +0000
Received: by mail-io1-xd42.google.com with SMTP id y13so10363423iow.4
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2020 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rNzl7xSh7GeYDHs6F5Ee65tcB8SqNtnecrQQkoWodP0=;
 b=kYYtjn4J6Wg5q1cke3GsLsCSOoUQNBxGd/bYFJ65ZjZzFRei0UT3FxD5Z1/2fTN5c2
 sup6bN9bMyISt6qdA8xiEak/Iaor27vcznZQ2oe5rwYHes77LXMtCrDfSqJKY1Kmq2wV
 tK2wDoOsfpJfNH19YLo6Kua3O9Mxzid9qqAG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rNzl7xSh7GeYDHs6F5Ee65tcB8SqNtnecrQQkoWodP0=;
 b=pN8M0YxkT+XtrDYnNDtTqxn+x1zkP4wkFGWmQ2T3BosU3qTgGPWWze6KQ+vv8sASvw
 JPvbgQfkMsqdw1uQpzzS9vv15yI4F/rvCnmw0Y97ZkLTwhXV/yj7MkuAGbRdNykio3qk
 YogFnJN1yyHS6nFtheXnEqFokEOJFujg27gEkFRRwoiiP8LC4TJ2nNem+w/1Az9rWeqf
 w92pl+SZ2guI3eIsXGxOLXzEqvsC9HZvyYvsivbzwKyGcL35NbJRPsH40cEqZoj8h32f
 UiOXpZGiM0w4EyvMHCnGXaj93Tpdu8jvEuBW6wveAy1mdEMVAU4V11JyR/T+gbXSbI6r
 qCKQ==
X-Gm-Message-State: AOAM530bIA0hl5c/W1cfPePyHBsfMB3nBY9tfdvAHo2WE40dUZO3KkKf
 JxWeoLraF3bteHfLcPKQaKlUThsIHIxIEbXO1m7pUQ==
X-Google-Smtp-Source: ABdhPJzoiPOjS7GczBk4qpUIiLCY5BgKwWxC1Z2daUO/hLybds7C4dJoOq5cRA1EXajuX3+ksvlemLAahJbJaPldn9Y=
X-Received: by 2002:a05:6638:1643:: with SMTP id
 a3mr1105122jat.4.1599817412402; 
 Fri, 11 Sep 2020 02:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200910084304.3429494-1-hsinyi@chromium.org>
 <9ca1b7c0-9fec-27b7-ae08-c00613c3004c@gmail.com>
 <CAJMQK-g+pPR6ZrSJHPPcR9Tqw_4QjuMyUqML-RoPOjfnYZ=YGA@mail.gmail.com>
In-Reply-To: <CAJMQK-g+pPR6ZrSJHPPcR9Tqw_4QjuMyUqML-RoPOjfnYZ=YGA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 11 Sep 2020 17:43:06 +0800
Message-ID: <CAJMQK-gOqTJGgbY3XjOM112vyDQVKKOD3k2XEnJwji2b1TJhRg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8173: Set uart to mmio32 iotype
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_054334_704242_03CF1B04 
X-CRM114-Status: GOOD (  18.75  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 9:40 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Thu, Sep 10, 2020 at 6:25 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >
> > Hi,
> >
> > On 10/09/2020 10:43, Hsin-Yi Wang wrote:
> > > Set uart iotype to mmio32 to make earlycon work with stdout-path.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > >   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > > index 5e046f9d48ce9..ca6ea71f5f435 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > > @@ -613,6 +613,8 @@ uart0: serial@11002000 {
> > >                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
> > >                       clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
> > >                       clock-names = "baud", "bus";
> > > +                     reg-io-width = <4>;
> >
> > Why do we need that, we have
> > device->port.iotype = UPIO_MEM32;
> > in early_mtk8250_setup(). That should do the job already.
> >
> >
>
> But if we don't change in dts, we would see
> [    0.000000] earlycon: mtk8250 at MMIO 0x0000000011002000 (options '115200n8')
> instead of
> [    0.000000] earlycon: mtk8250 at MMIO32 0x0000000011002000 (options
> '115200n8')
>
> Perhaps we should move the pr_info part in earlycon_init() after
> match->setup(). Since setup may change iotype. What do you think?
>

The series is sent here: https://lore.kernel.org/patchwork/patch/1304227/

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
