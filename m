Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA652C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+M08tpos8evh2hu91cRjLmMwuJ4cMW1pehmYWY8GhA=; b=oQ4xV/HNwhaJjBdkzN/Z4oprmt
	oAclHDDWVG2BgqktQmV8cduzXAjs5D9aD/H/df72eiftvjLLzu2ExikiYVaj56czvZ63pQ8QlCvd3
	qzn4fi5pCz+k95EBfuJ1wOMXobuY0n3ghBqAvMjGIqhkwtjMSKaqsgX+ppZ8fJjVTmxYNeK/6iIUC
	1P0vNJRfBd7vfOsx0pz7KTb9hI3g7Xft1qc430av/WVN1is6B2XAaUy4PxIDRVl0plWlK6EjBFvWY
	/vU+XVYEyyOfiU5V4s26++u6DLtNxHH5DcTlZ23X3Pw+xD4hDjflENl/FbJpYKSKHxY6DLNAtVV75
	atSjYe4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHHAq-000N8r-Lk; Fri, 29 Jul 2022 04:00:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHHAn-000N6n-QE
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 04:00:27 +0000
Received: by mail-wr1-x42b.google.com with SMTP id k8so2348068wrd.5
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 21:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N+M08tpos8evh2hu91cRjLmMwuJ4cMW1pehmYWY8GhA=;
        b=DlRnNYVHf3u5DiGzLfwBE2FvJZHevCE3BjBtqtFkubjnjY9nLKabKPj4chGSNNn3M9
         ckesrVKRzHqgd0zNFCU3pfN/1vpQXp0ZRVF8ledWD+k1i7p4cUono+MnZB68y7/5jdE7
         10COQAgbY8OimaBx54LYhTY3oxT/m4O/adaGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N+M08tpos8evh2hu91cRjLmMwuJ4cMW1pehmYWY8GhA=;
        b=VwIWjNvvVtTX+xI9bFtrK/KOGDPaqwqO3+halXkNWVZJk4BuNUnghmdX5OOWdNHFNZ
         y5ophxmiribbS8J6emd90WxI34m1O7oO9E2gLewW8AH4Yj65pRbYi25xtxfrygCcrLf1
         M/U4ihXczvvi0mV0cLUI3Cgb31mX/l124Qw8Cn/S+pP6GTEjh+QOVKSPfS9Kw3vItbaD
         6EL5vM3W4UNtS1a7XtXX/WLEk3IW24Hoy6lQo1wkKuqXJQGhW4oCUpT0lmssc/a8dg69
         mGg0uUXg96Y8tBJTOECPZ8gVr0EqcTFpzr8ja4HV+YrwmQX1uks/JCmrp9whw/kHZYo0
         9SQg==
X-Gm-Message-State: ACgBeo3yi112YU2wT1PHXbPf++VyX14JeGPPq7ZqjdjpgKOjVczYY2kV
	mK/qcMXXqMUS/HgPvwueOxkciWnowjJkQiHAi0jSpg==
X-Google-Smtp-Source: AA6agR7/0FtNh7jjz3ZxnoZKxjIxEcKDzaD7rZuUPapJb2MMh3j0nj5Ylz9QQMxX5PTay7wZW4S9C6oKjcQEsjdfF9M=
X-Received: by 2002:a5d:64cc:0:b0:21d:a4bd:fdbe with SMTP id
 f12-20020a5d64cc000000b0021da4bdfdbemr1011124wri.580.1659067223723; Thu, 28
 Jul 2022 21:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220727094034.1372745-1-treapking@chromium.org>
 <c455adea-2d18-60af-7175-a4e283e3dcb8@collabora.com> <CAEXTbpc7W40-vYcTVTNo7ikQ-n0O246AsbPntNb4q2nBErYVQw@mail.gmail.com>
 <689b439f-531b-9b3d-2e48-b7b83c50b3dd@collabora.com> <CAEXTbperyGnKZw9y_55yE-T5gzuR8yzpTwfg7dy_bvTUhmrOag@mail.gmail.com>
In-Reply-To: <CAEXTbperyGnKZw9y_55yE-T5gzuR8yzpTwfg7dy_bvTUhmrOag@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 29 Jul 2022 12:00:12 +0800
Message-ID: <CAEXTbpdc29kKeaU=GO_=6JwXvx=vSpR3wG+VsjYQaT+kAdVuoQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8173-oak: Switch to SMC watchdog
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Eizan Miyamoto <eizan@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_210025_905862_BA760A72 
X-CRM114-Status: GOOD (  38.20  )
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

On Fri, Jul 29, 2022 at 10:59 AM Pin-yen Lin <treapking@chromium.org> wrote:
>
> On Thu, Jul 28, 2022 at 11:51 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 28/07/22 17:39, Pin-yen Lin ha scritto:
> > > On Thu, Jul 28, 2022 at 7:21 PM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com> wrote:
> > >>
> > >> Il 27/07/22 11:40, Pin-yen Lin ha scritto:
> > >>> Switch to SMC watchdog because we need direct control of HW watchdog
> > >>> registers from kernel. The corresponding firmware was uploaded in
> > >>> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> > >>>
> > >>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > >>> ---
> > >>>
> > >>> Changes in v2:
> > >>> - Move the modifications to mt8173-elm.dtsi and add some comments.
> > >>>
> > >>>    arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 12 ++++++++++++
> > >>>    1 file changed, 12 insertions(+)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > >>> index e21feb85d822..b2269770abc3 100644
> > >>> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > >>> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > >>> @@ -161,6 +161,18 @@ hdmi_connector_in: endpoint {
> > >>>                        };
> > >>>                };
> > >>>        };
> > >>> +
> > >>> +     soc {
> > >>> +             /*
> > >>> +              * Disable the original MMIO watch dog and switch to the SMC watchdog,
> > >>> +              * which operates on the same MMIO.
> > >>> +              */
> > >>> +             /delete-node/ watchdog@10007000;
> > >>
> > >> Unfortunately, we're not quite there yet.
> > >> The comment is fine, but...
> > >>
> > >> There's no need to /delete-node/: you can just do it like
> > >>
> > >> /*
> > >>    * Disable the original MMIO watch dog and switch to the SMC watchdog,
> > >>    * which operates on the same MMIO.
> > >>    */
> > >> &watchdog {
> > >>          status = "disabled";
> > >> };
> > >>
> > >> and...
> > >>
> > >>> +
> > >>> +             watchdog {
> > >>
> > >> This isn't addressable, hence it belongs to the root node, not to soc.
> > >> If you did that because of naming issues, I would propose to call it
> > >> smc-watchdog instead of watchdog.
> > >>
> > >>
> > >>> +                     compatible = "arm,smc-wdt";
> > >>
> > > Thanks for the suggestion. I'll modify it accordingly in v3.
> > >
> > >> P.S.: No timeout-sec?
> > >
> > > The example in the binding file has a timeout-sec property, but it is
> > > not defined in the binding nor used in the driver...
> > > The driver seems to talk with the firmware to get a timeout value[1]
> > > instead of reading it from the devicetree.
> > >
> >
> > Oh. I admit I trusted the binding blindly, didn't check the actual driver code.
> >
> > On a note, we should check why is that binding partially wrong and eventually
> > fix it (remove the property), or add the capability to the driver, but feel free
> > to ignore that for now, as this is not relevant for the context of this specific
> > change that you're trying to do here.
>
> It looks like the timeout-sec property was not defined nor referenced
> from the very first commit [2][3]. I'll send out another patch to
> remove it.
>
> [2]: dt-bindings:
> https://lore.kernel.org/all/20200505131242.v6.1.Id96574f1f52479d7a2f3b866b8a0552ab8c03d7f@changeid/
> [3]: watchdog driver:
> https://lore.kernel.org/all/20200505131242.v6.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid/

I checked the drivers again, and I realized that the `timeout-sec`
property overrides the default timeout from the firmware.

But for MT8173 chromebooks, I think we can just leave it blank and use
the default value.

> >
> > P.S.: I just noticed that the commit title is also wrong. s/mt8173-oak/mt8173-elm/g
>
> I sent out the v3 before I saw this reply.  I'll send out a v4 for
> this and address Krzysztof's comment as well.
>
> >
> > Waiting for a v3!
> >
> >
> > > [1]: https://elixir.bootlin.com/linux/latest/source/drivers/watchdog/arm_smc_wdt.c#L138
> > >>
> > >> Regards,
> > >> Angelo
> > >>
> > >>> +             };
> > >>> +     };
> > >>>    };
> > >>>
> > >>>    &mfg_async {
> > >>>
> > >>
> >

