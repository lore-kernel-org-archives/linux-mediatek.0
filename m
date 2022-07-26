Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE80C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAKHknFtsvT1+469TMaGtV4FNnDqf7wnEERMTyMAfco=; b=0OKNw+5IF4d6oZ4/pf+r3DxLTf
	U+irMV2eiJiysTusnRLM1zwf7IOmvyyas3lGBF1AVW0yrKCf2t/k+l85xC8MLuAC5mQp8+gw720Lz
	L+9xySN4cqbIc3z91aU+uMwf35fGZHKAQlS/noHNu62wRvUTOgaKnOGWWml18WMnTxMnABvW1XAQf
	meMUoYRga6IvOQd94DMb++0f5CLKqJQsMMpaQgVwKlG7WuefzqDnJ5rUS7HNrbCxCnY2CoZcZJ52e
	2UvlhE1CCvuJ6mhWle399/O52eDo6+k9960SxWhgVy1oahHRpJmsxJ5EG8zz2r0idWoY0OrnGu9PU
	uMEPJsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFvJ-00AB76-DE; Tue, 26 Jul 2022 08:28:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFvG-00AB1E-4F
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 08:28:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id h9so19147275wrm.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 01:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qAKHknFtsvT1+469TMaGtV4FNnDqf7wnEERMTyMAfco=;
        b=FUUrWzuDishjz9cWOzadM6Gl14xPV+esI8ec68cYC8L7HNGTMZO71Vz0SsxSvz/d/M
         qRyNp9YUPMSZGVuqzZ6UD0rqiJw/qW+gV6aDzdqByjID17FYpJDMFkICUnmAEE0vu10t
         H5b6bqv3WvhstO48+JQ5pMzSWALXBv0YWf6q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qAKHknFtsvT1+469TMaGtV4FNnDqf7wnEERMTyMAfco=;
        b=NyltwDfUpngtExlg+xcWTv4g39Ap4o97XRr3vFDxWso6igATRkGb0izdPLCw2ZDNy4
         zA0np4pWMj7mHUCN7rg6r4APNX4mHerkZ8PIP6Ch5auja+eDy4g7bAa8ripE47Z80H3R
         PceJQEi8wtr5o07qplDA2GX7gimaJGMTMJpAktmTF0eVgXrzuKT4bHYc2qpbbR98oG6R
         w2WKqPOMAhD532ctlz3aHmw76cDQX5XNN9Cth2I7GbOlrgKIM1rrAyZV/0sy0ON3LJeJ
         JJKOWgl2ZCubaCaGNwx+n6LB9YYDmsDF0/ptxpNZOjvb0jn++bSQgr0P8eh9RMHMKEkF
         o0Ew==
X-Gm-Message-State: AJIora9wGzSSGDFX0YI1nESJk1jyLmW0IphIq5vxiqK8a3n16IZXYJDW
	VRubSAUYmYv+y8/Q5mfB5I6FXLQt3Lq/kjMeM0Qukja+yhWQaA==
X-Google-Smtp-Source: AGRyM1t/lZNz8m3urqK9JXJr8NpFEnVRSKywvR7SNPRuB0E8haJrZ/ZUTHOWy4RG+PM3vnOlQFpwUR8D2fNwB3WOo5s=
X-Received: by 2002:a5d:59a9:0:b0:21e:5e6a:6a8e with SMTP id
 p9-20020a5d59a9000000b0021e5e6a6a8emr10795876wrr.190.1658824085827; Tue, 26
 Jul 2022 01:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220725082447.2613231-1-treapking@chromium.org>
 <5856610d-510f-46dc-63b2-79e571956a7c@collabora.com> <CAEXTbpeHy6-WjLOyWFkncoHzBPM+6qq4w-kUoZj7=05gf8YBjw@mail.gmail.com>
 <bcb8c2b4-a1ab-8646-9fcb-034a70f5a329@collabora.com> <CAEXTbpeEkpgFjQfONM030k8drcfYzOoWnB_FUqFptd-27YRqNg@mail.gmail.com>
 <a91e09c8-377f-7143-2c66-11ef09552d8e@collabora.com>
In-Reply-To: <a91e09c8-377f-7143-2c66-11ef09552d8e@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 26 Jul 2022 16:27:54 +0800
Message-ID: <CAEXTbpeddwN1vqsmRvgvqmWhtKqkKeKhvtKHAzTneZBrkhSa0A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173-oak: Switch to SMC watchdog
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_012810_229166_53F52129 
X-CRM114-Status: GOOD (  52.13  )
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

On Tue, Jul 26, 2022 at 4:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/07/22 07:55, Pin-yen Lin ha scritto:
> > On Mon, Jul 25, 2022 at 6:31 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 25/07/22 12:19, Pin-yen Lin ha scritto:
> >>> On Mon, Jul 25, 2022 at 4:39 PM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> Il 25/07/22 10:24, Pin-yen Lin ha scritto:
> >>>>> Switch to SMC watchdog because we need direct control of HW watchdog
> >>>>> registers from kernel. The corresponding firmware was uploaded in
> >>>>> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> >>>>>
> >>>>
> >>>> There's a fundamental issue with this change, I think.
> >>>>
> >>>> What happens if we run this devicetree on a device that does *not* have
> >>>> the new(er) firmware?
> >>>
> >>> I haven't tried this patch with an older firmware. I'll manage to
> >>> build one for this.
> >>>>
> >>>> The kernel *shall not* get broken when running on devices that are running
> >>>> on older firmware, especially because that's what was initially supported
> >>>> and what is working right now.
> >>>
> >>> Actually the current approach does not work *right*. The device boots,
> >>> but the watchdog does not work properly.
> >>>
> >>
> >> Is this a Chromebook firmware specific issue?
> >
> > I'm not sure if this is a Chromebook-specific issue. The internal
> > issue thread only discussed this for the Chromebook firmware.
> >>
> >>> Also, all MT8173 ChromeOS devices have this firmware updated, and we
> >>> don't have other upstream users apart from mt8173-evb. Do we want to
> >>> support the developers that are running upstream linux with their
> >>> MT8173 boards?
> >>>
> >>
> >> Upstream shall not be just about one machine: if we add support for a SoC there,
> >> we shall support the SoC-generic things in the SoC-specific DTSI, and the machine
> >> specific things in the machine-specific devicetrees.
> >>
> >> Chromebooks are not the only machines using the MT8173 SoC (Chuwi, Amazon also do
> >> have products using MT8173), so we shall not make the main mt8173.dtsi incompatible
> >> with these machines.
> >
> > I don't see their DTS files uploaded to the upstream kernel. So we
> > still want to support them even if they didn't upstream their changes?
> >
>
> The point is not about having to support them, but about not making things
> harder for them, in case any community person wants to add support for these
> upstream.
>
> By rule, everything SoC-generic goes to soc.dtsi; everything board-specific
> goes to board.dts(i).
>
> > Does it make sense if we move the modification to mt8173-elm.dtsi? The
> > device should be running ChromeOS AP firmware if it uses or references
> > mt8173-elm.dtsi. Also, all the MT8173 Chromebooks were shipped with
> > the "new" firmware from the very beginning. We just somehow didn't
> > upstream this around the time.
>
> Moving this to mt8173-elm.dtsi is the only sensible option, as this is something
> that was addressed in Chromebooks' firmwares and it's not a SoC hardware spec.
>
> So yes, please.
>
> The disablement of the MMIO watchdog should also be done in mt8173-elm.dtsi, and
> please please please, make sure to add a comment in the devicetree saying that
> we're disabling that one because the SMC wdog operates on the same MMIO.
>
> Regards,
> Angelo

Thanks for your detailed explanation. I'll move the modifications to
mt8173-elm.dtsi and add comments in v2.

Regards,
Pin-yen
>
> >>
> >>>>
> >>>> For this reason, I think that we should get some code around that checks
> >>>> if the SMC watchdog is supported and, if not, resort to MMIO wdog.
> >>>
> >>> What is the expected way to support this backward compatibility? Do we
> >>> put the old compatible strings ("mediatek,mt8173-wdt" and
> >>> "mediatek,mt6589-wdt") after "arm,smc-wdt" and reject it in the
> >>> drivers if the firmware does not support it?
> >>
> >> I don't know what's the best option to support both cases... Perhaps a good one
> >> would be to check (in mtk_wdt? or in arm_smc_wdt?) if the arm_smc_wdt is actually
> >> supported in firmware, so if the SMC one is registered, we skip the other.
> >>
> >>>>
> >>>> Regards,
> >>>> Angelo
> >>>>
> >>>>
> >>>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >>>>> ---
> >>>>>
> >>>>>     arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 ++----
> >>>>>     1 file changed, 2 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>>>> index a2aef5aa67c1..2d1c776740a5 100644
> >>>>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>>>> @@ -528,10 +528,8 @@ power-domain@MT8173_POWER_DOMAIN_MFG {
> >>>>>                         };
> >>>>>                 };
> >>>>>
> >>>>> -             watchdog: watchdog@10007000 {
> >>>>> -                     compatible = "mediatek,mt8173-wdt",
> >>>>> -                                  "mediatek,mt6589-wdt";
> >>>>> -                     reg = <0 0x10007000 0 0x100>;
> >>>>> +             watchdog {
> >>>>> +                     compatible = "arm,smc-wdt";
> >>>>>                 };
> >>>>>
> >>>>>                 timer: timer@10008000 {
> >>>>>
> >>>>
> >>>>
> >>
> >>
>

