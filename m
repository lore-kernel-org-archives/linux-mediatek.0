Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A9AC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 13:41:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FD5B20809
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 13:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yT6d64Av";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ox24dyt6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FD5B20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PbrBIYpU1SlLqiCQSQkF2LA0Evg4N9lcDYAK5TNFlek=; b=yT6d64AvjAqRklmizo9+0QfOt
	jS0Awv4xdAchm6ufIo2OP3bkLZB+v4IUBctF3Ua9sS1paT56FnjffRyPhG8d0z63vf0RbMKJ3gWIr
	xaDtnD+8vaUxVM9VU01y9XkuWHUHoJumFUI+TXmGQAeJGlSq8To6zQyEl5FnxuC93pQJ51clUog04
	k9wCeQRYTJ2XwwLhA+HrPDTuT9gYATtJtgL8CJCXqNoO64u/GUIEmAaffG3gKC4RYldckzv3CYlEX
	7t3Dhx/dKMvyChNbPWRyN5EtxfKLzlKCR6r5uohUEAMWfkQCRi0FNVl97+11GBPnGgIi9ZlUMw1Kj
	VZumejyMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGMpR-0000dU-P3; Thu, 10 Sep 2020 13:41:33 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGMpM-0000bN-1p
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 13:41:29 +0000
Received: by mail-io1-xd41.google.com with SMTP id b6so7075024iof.6
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTlbqLOdrEt7UPiiXLx6yUBn8+Vw9g0DGn2N0VRJHZQ=;
 b=Ox24dyt6nVjtGDGN1CPYXDGOo/2oq3U8X/r9mzO/S9lH3U3T8OSsyYjG9fjzR+qgBD
 5ugaO811qVghi5tQ9nmTEt34eIyJfKTARh95uAu2ms6P0BKuV2yCJqhhTgTpckA3wY5V
 5owBQNpU8wLydaLeTRaUOOfcne0j1r0lFOIQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTlbqLOdrEt7UPiiXLx6yUBn8+Vw9g0DGn2N0VRJHZQ=;
 b=gLNcg9gVGJJMqetH+xoYT5B3dv+zBX+hFilKt4QyT/+nEtpCwyYFGNODyVghTlSj65
 hEYjJsZ2K5kP/C1spKTINNc6KwwJtTIwDEsfJFqNkFx9yFWESOmDjL4miG3SEtArNfZK
 BISSP6GZPhIIyuoJGBhz3pWo/l1jgg9mfpW8sTPjiDtKzeqfwaNE1LQxmcRyu5q8z3rx
 WwAofubMUJPpN9SrdrTZiI4iC+zQYZdfK+r4bnNaxRh1Rx0ElXSFkLk5lYkqsKS0L1Qp
 Bl45uvcc0zRJrd+MUjsgejY28XEmnzXTysx4jaca/6D8+v/aGNOuejXgF+fGAcOysI4x
 O6gw==
X-Gm-Message-State: AOAM530mieOpSo8PzUkGnj96ClT6Z3sWw9cT9Sjn6BNm3x17bj5lJcZ4
 I3wxMDNd8vkLqUJgAVe5owM8tlbbDZRyJlQw9MpuFw==
X-Google-Smtp-Source: ABdhPJx7rimxRz7QDx2lJr2uFaq/N7i1d6SG+0JOvjQrq9+OiBQgm/jvkZqZfSOI7yKji0+UoevlSl35L019lILyyVY=
X-Received: by 2002:a5e:930d:: with SMTP id k13mr7562170iom.40.1599745286349; 
 Thu, 10 Sep 2020 06:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200910084304.3429494-1-hsinyi@chromium.org>
 <9ca1b7c0-9fec-27b7-ae08-c00613c3004c@gmail.com>
In-Reply-To: <9ca1b7c0-9fec-27b7-ae08-c00613c3004c@gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 10 Sep 2020 21:40:59 +0800
Message-ID: <CAJMQK-g+pPR6ZrSJHPPcR9Tqw_4QjuMyUqML-RoPOjfnYZ=YGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8173: Set uart to mmio32 iotype
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_094128_099535_B9ADCFE7 
X-CRM114-Status: GOOD (  19.20  )
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

On Thu, Sep 10, 2020 at 6:25 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi,
>
> On 10/09/2020 10:43, Hsin-Yi Wang wrote:
> > Set uart iotype to mmio32 to make earlycon work with stdout-path.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index 5e046f9d48ce9..ca6ea71f5f435 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -613,6 +613,8 @@ uart0: serial@11002000 {
> >                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
> >                       clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
> >                       clock-names = "baud", "bus";
> > +                     reg-io-width = <4>;
>
> Why do we need that, we have
> device->port.iotype = UPIO_MEM32;
> in early_mtk8250_setup(). That should do the job already.
>
>

But if we don't change in dts, we would see
[    0.000000] earlycon: mtk8250 at MMIO 0x0000000011002000 (options '115200n8')
instead of
[    0.000000] earlycon: mtk8250 at MMIO32 0x0000000011002000 (options
'115200n8')

Perhaps we should move the pr_info part in earlycon_init() after
match->setup(). Since setup may change iotype. What do you think?


> > +                     reg-shift = <2>;
>
> Can't we just add
> device->port.regshift = 2;
> to early_mtk8250_setup()? I think that would be a cleaner solution. As the
> serial device is the same for all SoCs, I don't expect any regression here.
>
> CCing Eddie to correct me, if I'm wrong :)
>
> Regards,
> Matthias
>
> >                       status = "disabled";
> >               };
> >
> > @@ -623,6 +625,8 @@ uart1: serial@11003000 {
> >                       interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
> >                       clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
> >                       clock-names = "baud", "bus";
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> >                       status = "disabled";
> >               };
> >
> > @@ -633,6 +637,8 @@ uart2: serial@11004000 {
> >                       interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
> >                       clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
> >                       clock-names = "baud", "bus";
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> >                       status = "disabled";
> >               };
> >
> > @@ -643,6 +649,8 @@ uart3: serial@11005000 {
> >                       interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
> >                       clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
> >                       clock-names = "baud", "bus";
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> >                       status = "disabled";
> >               };
> >
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
