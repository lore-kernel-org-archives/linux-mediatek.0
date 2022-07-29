Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE55DC19F2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 03:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqOa2ydWKPCFCDt1F37LPTz5eL6WtbCSjhIkDCaOa5c=; b=zmeYxir+1QTUtvZYcx50VSYjV2
	8J4xEr5p+WHKhOuG8I7g+s3QaRjJOnBnZutrBsNibNZ2//WSZdQeRn6ZNfBIrV0qRSdyo0N88/scP
	QIEOwbGxFU6sSLJhzqAKCbNsU14IwECEYVXeGxP9KHeByEIjAhoEm0YWcYT1LdDagTUvbx5aRgnNF
	vFjo//NvPqNu11IrUrRiAVaS0A1YtD8ve9+CSmNKz/k2hR8OehG6nAVx0k/fsvbzuR4+596OGv4Op
	/DpHd7WnAhx1eqyHfhxRMg4m2/1nPdqC3quV4PMWw8Se1ycwmxWNChIuRW/azEG6tJpBCHvM6D3Le
	z1i8sHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHGEN-0005Es-8y; Fri, 29 Jul 2022 03:00:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHGEJ-0005Dt-R6
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 03:00:01 +0000
Received: by mail-wr1-x434.google.com with SMTP id q30so17897wra.11
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 19:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NqOa2ydWKPCFCDt1F37LPTz5eL6WtbCSjhIkDCaOa5c=;
        b=ig1aLUwDBF5K8r2xiXUpGpnlzg85IiadmuaALx5IUb+9Q9EWw/YjeZJS94s5/tuspY
         LmJSFgP5e3p4SYbfBq4TBfoIxrTVAaurJdNnpp4SefZUZw/nM3QjI0k2LK33SJzFkUlD
         xUMLU0Cf0vePKX0nwkOS8+4bbspWWeALobH0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NqOa2ydWKPCFCDt1F37LPTz5eL6WtbCSjhIkDCaOa5c=;
        b=DeBHi248Ktpj0TwRnOd4CasfDvwTVpAxvLva5VEF6MwAtHWoV4FOxcT5UnXBrf8dCv
         c42tQdWWpjmVqhQtlNlmnqPDTWrOE9zRwVoZ4Gluq8mnS8iJ/jn7njWJB0vyjve6CXgM
         xMqgctWQEx/ffDFo38/+qSVFtJIxybCg3cLbrRUMmUsnLzLTxd2tAEAwmiLoUiXRQvBf
         2kKvEXqeq3aN1nAlKxEK2z7+faSoklplazquaGQ5EmYCojf6edV2NL0oZ7DYF+NC1Kn4
         fAwOuypNjV1O+rsTMGjyx6JGO1wSUnLqvrW/rqK9D3gM8EFqMKQsiTQ77Ij9o5Jhr2py
         t8hg==
X-Gm-Message-State: ACgBeo24hFKEzf05FKgJ9dP2wJwUDIXsHCKQ8YFlyKEvDm1wrGipHO29
	5fi08bFCr4EKFpoQs0fZ5lADux7OEk7FQYzmIi2NOw==
X-Google-Smtp-Source: AA6agR4toWohZGJKI+9YbnPUu2yUsYg/YV9HP/3UFT4/MV/bpns3J4siYJlYs6COKIg0lrGKxz70EhFqqeOtGJX3zu8=
X-Received: by 2002:a5d:64cc:0:b0:21d:a4bd:fdbe with SMTP id
 f12-20020a5d64cc000000b0021da4bdfdbemr932345wri.580.1659063598082; Thu, 28
 Jul 2022 19:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220727094034.1372745-1-treapking@chromium.org>
 <c455adea-2d18-60af-7175-a4e283e3dcb8@collabora.com> <CAEXTbpc7W40-vYcTVTNo7ikQ-n0O246AsbPntNb4q2nBErYVQw@mail.gmail.com>
 <689b439f-531b-9b3d-2e48-b7b83c50b3dd@collabora.com>
In-Reply-To: <689b439f-531b-9b3d-2e48-b7b83c50b3dd@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 29 Jul 2022 10:59:47 +0800
Message-ID: <CAEXTbperyGnKZw9y_55yE-T5gzuR8yzpTwfg7dy_bvTUhmrOag@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220728_195959_916298_686E882D 
X-CRM114-Status: GOOD (  33.81  )
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

On Thu, Jul 28, 2022 at 11:51 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 28/07/22 17:39, Pin-yen Lin ha scritto:
> > On Thu, Jul 28, 2022 at 7:21 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 27/07/22 11:40, Pin-yen Lin ha scritto:
> >>> Switch to SMC watchdog because we need direct control of HW watchdog
> >>> registers from kernel. The corresponding firmware was uploaded in
> >>> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> >>>
> >>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >>> ---
> >>>
> >>> Changes in v2:
> >>> - Move the modifications to mt8173-elm.dtsi and add some comments.
> >>>
> >>>    arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 12 ++++++++++++
> >>>    1 file changed, 12 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> >>> index e21feb85d822..b2269770abc3 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> >>> @@ -161,6 +161,18 @@ hdmi_connector_in: endpoint {
> >>>                        };
> >>>                };
> >>>        };
> >>> +
> >>> +     soc {
> >>> +             /*
> >>> +              * Disable the original MMIO watch dog and switch to the SMC watchdog,
> >>> +              * which operates on the same MMIO.
> >>> +              */
> >>> +             /delete-node/ watchdog@10007000;
> >>
> >> Unfortunately, we're not quite there yet.
> >> The comment is fine, but...
> >>
> >> There's no need to /delete-node/: you can just do it like
> >>
> >> /*
> >>    * Disable the original MMIO watch dog and switch to the SMC watchdog,
> >>    * which operates on the same MMIO.
> >>    */
> >> &watchdog {
> >>          status = "disabled";
> >> };
> >>
> >> and...
> >>
> >>> +
> >>> +             watchdog {
> >>
> >> This isn't addressable, hence it belongs to the root node, not to soc.
> >> If you did that because of naming issues, I would propose to call it
> >> smc-watchdog instead of watchdog.
> >>
> >>
> >>> +                     compatible = "arm,smc-wdt";
> >>
> > Thanks for the suggestion. I'll modify it accordingly in v3.
> >
> >> P.S.: No timeout-sec?
> >
> > The example in the binding file has a timeout-sec property, but it is
> > not defined in the binding nor used in the driver...
> > The driver seems to talk with the firmware to get a timeout value[1]
> > instead of reading it from the devicetree.
> >
>
> Oh. I admit I trusted the binding blindly, didn't check the actual driver code.
>
> On a note, we should check why is that binding partially wrong and eventually
> fix it (remove the property), or add the capability to the driver, but feel free
> to ignore that for now, as this is not relevant for the context of this specific
> change that you're trying to do here.

It looks like the timeout-sec property was not defined nor referenced
from the very first commit [2][3]. I'll send out another patch to
remove it.

[2]: dt-bindings:
https://lore.kernel.org/all/20200505131242.v6.1.Id96574f1f52479d7a2f3b866b8a0552ab8c03d7f@changeid/
[3]: watchdog driver:
https://lore.kernel.org/all/20200505131242.v6.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid/
>
> P.S.: I just noticed that the commit title is also wrong. s/mt8173-oak/mt8173-elm/g

I sent out the v3 before I saw this reply.  I'll send out a v4 for
this and address Krzysztof's comment as well.

>
> Waiting for a v3!
>
>
> > [1]: https://elixir.bootlin.com/linux/latest/source/drivers/watchdog/arm_smc_wdt.c#L138
> >>
> >> Regards,
> >> Angelo
> >>
> >>> +             };
> >>> +     };
> >>>    };
> >>>
> >>>    &mfg_async {
> >>>
> >>
>

