Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3D2C33CA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 07:21:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B622187F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 07:21:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+nEAY/3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FBLmig+X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B622187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHEK+P10hC4i7wKOXG7hZOEE1pqlHwLf+wKvkgBHOPU=; b=e+nEAY/3tVl7d1
	VSb4+/FRn3YMAVFg71XFAGA07GHT2MJclLBOjbfhR1ss43BZ51oA0NVbK9O9Vtl0OEftFApq7lizb
	+0hBl4g23ppJ4WO05ymnFfw6uGWHMWoTEAgt3oNFGPVcta/o4fag/EzLxa2CxOUpvW5wYXXHzE5z9
	91Jkm5YD1DPbTN6f9W1xHplV12vv1gzftSX+rYFWDHzYjEkrpnlfg+ddWfe0pJrSpdeXJzKTKihxD
	RekGp5ej+n2AIe2B14dJbO0fBndHRIPLz2+vYLkBOeExeW6yTtENEKM+qGY0Blgg5bZ0WJYbkDkOu
	pkStGt02cUcB+h5XX+Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irGWA-0008QW-1G; Tue, 14 Jan 2020 07:21:38 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irGVo-000872-Na
 for linux-mediatek@lists.infradead.org; Tue, 14 Jan 2020 07:21:19 +0000
Received: by mail-qt1-x841.google.com with SMTP id e12so11630341qto.2
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2020 23:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qu8L9/P7G3E9Yw4p+SvLP/VGjTn+xJR8yruIENAwmw8=;
 b=FBLmig+XuYQLjy+MeDi4VsXucyJ6x0+XdvVzpi5nWJqWnehAgKtDnYacLVqKcbPzIH
 UyGqW0OT0p1dWpNDMovF2Lm9I6w7iFZU/8ULTFeHFJQ9p5LA9Zgyc+J1gC6Hyp8txp+1
 vMsvum9BkFPYlPeoCokHaWZR/Gb75cRTzLyB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qu8L9/P7G3E9Yw4p+SvLP/VGjTn+xJR8yruIENAwmw8=;
 b=BHNQFs9aoOGWimTlohtAw6y6si0758rF+CdaR02oD5CCGrFl8yf+9PgPagfn2WgfLG
 BkzcDc98b2UT8ovg4Z5xT4KlsY7wfWmq2CPARxBKaoSJpRtDMY6NklO5lvUxMDpbj1FR
 giLaJ06pqU5w2xcNq4pMWAkg8ZHHqg2qDylacggF3fsL7r3HvwB+h4Uio1QalWO1i9gV
 k10Z7+OM/A90ZMbuSAchiLMCssCytCks9I23uokOJlNcaIlIPp4Rgg9EVA2oyw12xo43
 rLpTPl1x9RTcc+YxNk9V5p7RSEqVP18/GDPU/RKn+UkkO2CsPTQZrutjB5YZ1kGTLSY1
 7JyQ==
X-Gm-Message-State: APjAAAVzQMVufVF5Pbn5zaKeoEJkZW9GpnmFcYsLTbywWwTxWZA7eITn
 eyoH75lifxmTi5oEg3qKlLSsGOAzik9069L1iwBCkA==
X-Google-Smtp-Source: APXvYqy5dTRwvBZSp2Sl2oa5uqtPjgwo9dLYORqfUzS4GprMz5UdJxHfSaILw3N4vb/BqqZHf3UJ8KY/Bw2G5cK4+Kc=
X-Received: by 2002:ac8:4446:: with SMTP id m6mr2448249qtn.159.1578986475520; 
 Mon, 13 Jan 2020 23:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-5-drinkcat@chromium.org>
 <20200108132302.GA3817@sirena.org.uk>
 <CANMq1KBo8ND+YDHaCw3yZZ0RUr69-NSUcVbqu38DuZvHUB-LFw@mail.gmail.com>
 <09ddfac3-da8d-c039-92a0-d0f51dc3fea5@arm.com>
 <20200109162814.GB3702@sirena.org.uk>
 <a40baddb-cbab-d8fc-3fd9-0582f1b5b24e@arm.com>
 <20200109194930.GD3702@sirena.org.uk>
 <90993401-6896-bf95-a15a-d99c465ec12a@arm.com>
In-Reply-To: <90993401-6896-bf95-a15a-d99c465ec12a@arm.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 14 Jan 2020 15:21:04 +0800
Message-ID: <CANMq1KBnUZ8v62=P734BrwPYwojWiqnvweewUY7OQjym-xuQ2Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add support for a second regulator
 for the GPU
To: Steven Price <steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_232116_844423_3ABA4BBD 
X-CRM114-Status: GOOD (  32.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 10, 2020 at 7:30 PM Steven Price <steven.price@arm.com> wrote:
>
> On 09/01/2020 19:49, Mark Brown wrote:
> > On Thu, Jan 09, 2020 at 04:53:02PM +0000, Steven Price wrote:
> >> On 09/01/2020 16:28, Mark Brown wrote:
> >>> On Thu, Jan 09, 2020 at 02:14:42PM +0000, Steven Price wrote:
> >
> >>>> I'm not sure if it's better, but could we just encode the list of
> >>>> regulators into device tree. I'm a bit worried about special casing an
> >>>> "sram" regulator given that other platforms might have a similar
> >>>> situation but call the second regulator a different name.
> >
> >>> Obviously the list of regulators bound on a given platform is encoded in
> >>> the device tree but you shouldn't really be relying on that to figure
> >>> out what to request in the driver - the driver should know what it's
> >>> expecting.
> >
> >> From a driver perspective we don't expect to have to worry about power
> >> domains/multiple regulators - the hardware provides a bunch of power
> >> registers to turn on/off various parts of the hardware and this should be
> >> linked (in hardware) to a PDC which sorts it out. The GPU/PDC handles the
> >> required sequencing. So it *should* be a case of turn power/clocks on and
> >> go.
> >
> > Ah, the well abstracted and consistent hardware with which we are all so
> > fortunate to work :) .  More seriously perhaps the thing to do here is
> > create a driver that provides a soft PDC and then push all the special
> > case handling into that?  It can then get instantiated based on the
> > compatible or perhaps represented directly in the device tree if that
> > makes sense.
>
> That makes sense to me.
>
> >> However certain integrations may have quirks such that there are physically
> >> multiple supplies. These are expected to all be turned on before using the
> >> GPU. Quite how this is best represented is something I'm not sure about.
> >
> > If they're always on and don't ever change then that's really easy to
> > represent in the DT without involving drivers, it's when you need to
> > actively manage them that it's more effort.
>
> Sorry, I should have been more clear. They are managed as a group - so
> either the entire GPU is powered off, or powered on. There's no support
> in Panfrost or mali_kbase for attempting to power part of the GPU.
>
> >>> Bear in mind that getting regulator stuff wrong can result
> >>> in physical damage to the system so it pays to be careful and to
> >>> consider that platform integrators have a tendency to rely on things
> >>> that just happen to work but aren't a good idea or accurate
> >>> representations of the system.  It's certainly *possible* to do
> >>> something like that, the information is there, but I would not in any
> >>> way recommend doing things that way as it's likely to not be robust.
> >
> >>> The possibility that the regulator setup may vary on other platforms
> >>> (which I'd expect TBH) does suggest that just requesting a bunch of
> >>> supply names optionally and hoping that we got all the ones that are
> >>> important on a given platform is going to lead to trouble down the line.
> >
> >> Certainly if we miss a regulator the GPU isn't going to work properly (some
> >> cores won't be able to power up successfully). However at the moment the
> >> driver will happily do this if someone provides it with a DT which includes
> >> regulators that it doesn't know about. So I'm not sure how adding special
> >> case code for a SoC would help here.
> >
> > I thought this SoC neeed to vary the voltage on both rails as part of
> > the power management?  Things like that can lead to hardware damage if
> > we go out of spec far enough for long enough - there can be requirements
> > like keeping one rail a certain voltage above another or whatever.
>
> Yes, you are correct. My concern is that a DT which specifies a new
> regulator (e.g. "sram2") would be accepted by an old kernel (because it
> wouldn't know to look for the new regulator) but wouldn't know to
> control the regulator. It could then create a situation which puts the
> board out of spec - potentially in a damaging way. Hence I'd like to
> express the regulator structure in such a way that old kernels wouldn't
> "half-work". Your "soft-PDC" approach would seem to fit that requirement.

FYI, I sent a v3 here: https://patchwork.kernel.org/patch/11331373/
that addresses _some_ of these concerns.

I'm not quite sure how to describe the regulators in a way that we can
check that the device tree does not specific extra ones (apart from
doing some string matching on all properties?), and I don't think I'm
best placed to implement the soft-PDC idea. See my comment on that
patch.

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
