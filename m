Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BEAC388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 21:16:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B28CA207DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 21:16:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ghggk0Z+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rVk4X0PM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B28CA207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HhISL8i/ifVyclwj4eByUXYOO62tQ0XUW0xS4Xb2JNs=; b=Ghggk0Z+gct2bQ9pddtkE2pvL
	+WkJ23VTeJlMPS8A6OsU+tawpbB8E6G+BEf14mykml5tm1/c0iPF5QxFgITsQWNSr5Dz1XNIGHZtR
	UIfwa2IwZEXAQy8PCxZr4GvXmicb4ISkOYEw92YwjQReqRtAO5HYbEp6NCuEN01Ux8icQ27uGmCv5
	hId3sELIHslA2TaKaMoAqjbBo5svuSWKJcitc5cwjdOM9bZRGw5X3yvGutxgix0HjC7N+i1ipo5lJ
	sy+gjAxbpW3TRYbrQc0QArEWPPsZrcruLadjaWXCtyqBymnB9td+iNiPBrCfKlfBFZzsu2B/cwPq2
	GGMmvBPog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXWKc-0007H9-MZ; Tue, 27 Oct 2020 21:16:38 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXWKZ-0007G0-NM
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 21:16:37 +0000
Received: by mail-io1-xd42.google.com with SMTP id z5so3149009iob.1
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 14:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pGFs6C8VYOAYY3Cv4pHG5uzsWG4Q+pilWSuMe/kuTqg=;
 b=rVk4X0PMSBLtGuVsOVwaWzLHzbDTC5xNxTrme35jwZ8Yiej919jXchGq3YVEdtyP/V
 Wn4BEj+svXNHms2mqc4wKbc20X1jeaixX+z/9RhBHGHPQE/mNqdI40hTqbx1iEPIHKqs
 GxmdzbroYWUjbdE+JUBT8AuJr45tH/GCVtxb7MFwowcyBKvkZqMLfuBcaT18Gy1mEIH3
 omt8PVhbk3ncIDDqHJ0/UcFTvWCf9AAn/nWDGkweeGmjRhCZOMQ/h882GXmLrHjG+66Q
 yiASH2wZNHPGHBiISbBbDPDuv2Yu5h7WzyQKJUIT8Zr/zTVX+nD2yFlCsuz7F3T+Ske3
 Lalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pGFs6C8VYOAYY3Cv4pHG5uzsWG4Q+pilWSuMe/kuTqg=;
 b=NRVBz3BwG+bttbCJ63KXLLk01Phg5jHIZ45X/Nl7purmIUPCBF8d1j202pTspdaVLd
 pqvpb9/huSLIkbja37w/JjXamSwpnTfxrsc+lXTimwazRtRdURNtgsp0sC0Fa50zsHPe
 ZxZMKMmq+WOxBIlXhBmT/afbI75lLAVO0KBbwz7Suc+a4L+Yu1hRNuYNTjOp1aKRFjyE
 SfzJTyfIjU/mVRJPuvmY2lZGABx0QiyVyv6cyYmfwKZNzV44AATKHFUVQy5xHElkM94Q
 gOh1P/xop2h5IB4l1vbAGPh9W3f93Eit10VMrT2AAcKueFHwFiS/BJlS/BJxb1l4w8TC
 4bow==
X-Gm-Message-State: AOAM532BQ4lXm2+DiFK/zzb1wHZFcTK9nAPTZy9qZ5zMR64nLT0+rG76
 coRFylSxsfDYGJbXyMGoFlOZ920wqEUTD1bYtohAYA==
X-Google-Smtp-Source: ABdhPJxT0OuVK6OChsnkhKxzrZFXZ6la8BdEkzmBSfiVmcTz1t7A9wQFzJesS9grhn1hO/tuEA2ogczM8pFNFQTQ8Hg=
X-Received: by 2002:a02:b786:: with SMTP id f6mr4336431jam.75.1603833393648;
 Tue, 27 Oct 2020 14:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201024200304.1427864-1-fparent@baylibre.com>
 <20201026121316.GB7402@sirena.org.uk>
 <CAOwMV_w5N0_Qgg3MFph1147cbvFP1Y=mUtNjGbcr-Tca4ZJ3yA@mail.gmail.com>
 <20201026172431.GI7402@sirena.org.uk>
 <CAOwMV_xt=OV6cKqQTZUUSAvYKxUUQZAUywAHtFFHL=E5xVu-Zg@mail.gmail.com>
 <20201026203608.GJ7402@sirena.org.uk>
In-Reply-To: <20201026203608.GJ7402@sirena.org.uk>
From: Fabien Parent <fparent@baylibre.com>
Date: Tue, 27 Oct 2020 22:16:22 +0100
Message-ID: <CAOwMV_xUWea81rKFE=zD4xWL3rZ5G8cpWm5xJHT_AX=_frLDRQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: regulator: add support for MT6392
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_171635_898977_9B411B20 
X-CRM114-Status: GOOD (  21.41  )
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
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, lgirdwood@gmail.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark,

On Mon, Oct 26, 2020 at 9:36 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Oct 26, 2020 at 07:38:14PM +0100, Fabien Parent wrote:
> > On Mon, Oct 26, 2020 at 6:24 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > >         .name = "mt6392-regulator",
> > > >         .of_compatible = "mediatek,mt6392-regulator"
>
> > > This is still unneeded, it's just a reflection of Linux implementation
> > > details and should be removed.   The MFD can just register the child
> > > without supplying a compatible and things will continue to work just as
> > > well.
>
> > I'm not exactly sure how it is supposed to work. mfd_add_devices seems
> > to register devices based on of_compatible or acpi_match from the
> > mfd_cell. This platform does not have ACPI so I don't understand how
>
> It should also support unconditionally registering devices, if it no
> longer does so that's a regression in the framework which should be
> fixed.  Looking at mfd_add_devices() I can't see an issue though, both
> ACPI and DT information is optional - the entire DT section in
> mfd_add_device() will be skipped if no of_compatible is specified in the
> cell.  Are you *sure* that the regulator driver isn't running?

You are correct, the regulator driver is running and probes
successfully. From my investigation it seems the failure when removing
the compatible string from the MFD and the DTS is because the
regulator driver does not have a of_node matched since the compatible
is gone. Because of that all the regulators registered by the driver
are not linked to the regulator definitions in the device tree. And
all the drivers that tries to acquire a regulator get -EPROBE_DEFER
because of it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
