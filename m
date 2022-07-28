Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C669C19F2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 15:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBcPNZ2+mlbvsLKHm0Kf6uMfdcJuvK0J6XX3HZnb67s=; b=ZwKRMJPDE6naaOu6i1bzc5opPF
	qEDCQgiPUl3bWk2PfN8DRqFzAgepN4t0AE1Jk3uf8AtGQprdp03hIPJvS33c3bCcy71qmOa3QLvrF
	9TSI2gQNkUC5poo4oNCwfgO+ygo54v8Y97i4n8xP9PJ1sRledl/mipAhHmC/XrqWuX3dlTpCH9zQe
	ifkPQDEnuZZlItpKiKzUQuLvXYBkBnkrxqPbfu5VysTs3KE+eg+DT399Sk1kPQsIhuAIpeRkfod8J
	ia7EWNdKXotIPuW1KA4mV0ccJN/bAon8Ibsw6ufLmg8aCwtEprkrRXXm0Jwyt5jF5uapL4oBjJpLh
	2qeaFMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH5bx-00Ab2x-H4; Thu, 28 Jul 2022 15:39:41 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH5bv-00Ab0h-Eq
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 15:39:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id d8so2687853wrp.6
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XBcPNZ2+mlbvsLKHm0Kf6uMfdcJuvK0J6XX3HZnb67s=;
        b=dEexRtKhhdGuFxLZw7wIFaLC/s9383EBETm32CK3PLqptTDuxb2jI8IknXdnu4Xbxm
         SzkngLxgNrKxZMR6bIbDH26Zh2qFV7xfC/C7MB54GNXy1EO4moaom+0FEf8jn4sdPtWJ
         5CPCzhn1hE5/SzqLyJk3w4AkftYF7FQBW9Xso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XBcPNZ2+mlbvsLKHm0Kf6uMfdcJuvK0J6XX3HZnb67s=;
        b=iZYnljJOBm395EAv/tcrhGXyGc8tDF4AFl6jBQTXVbmFH/b0lkijJEaFxC6BUAsEBr
         SYYmMx0lUb2FWMcFr1/LbSsQ7IH/Nc8p5vd247sHyP5rxcQ17rtP8Ty5RQOCaI+Qjy2f
         eE/oua3T89BZreBeO0vx42xCwUkMLIys9be4ijK7JMTUmhAIEN3pz4qTdLbM/u8zfSfr
         N2dNla3rbGJu74Cwam7IhkuDtEz9FhyRo4EvlJdvX7QLBo4OBgSojsu3wGxKgW32pkc/
         b+groZdoaMEZj4Q/1JUQ80pah9eMkZKVvZiwNNN7swnDheFZdm3uuy+eHBZYV3BpPwNM
         0xrA==
X-Gm-Message-State: AJIora80s3Y3LoTAimGS9ClfRNddPWBNLWQuve9POP/epIIRTb2W8eqd
	o9+NVhVl8MG/CnovU/J91jIMshmb+XpyQVF9z82McA==
X-Google-Smtp-Source: AGRyM1uiraKwPpPmXImHqcfLCLjkiLs0EXwTzj4fmDBqlN+to9NWPT1jvCn430UUiC9qi4cBKySudZzFurAn0nLp5Z0=
X-Received: by 2002:a5d:64a4:0:b0:21e:93c4:f8c6 with SMTP id
 m4-20020a5d64a4000000b0021e93c4f8c6mr11535361wrp.246.1659022777735; Thu, 28
 Jul 2022 08:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220727094034.1372745-1-treapking@chromium.org> <c455adea-2d18-60af-7175-a4e283e3dcb8@collabora.com>
In-Reply-To: <c455adea-2d18-60af-7175-a4e283e3dcb8@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 28 Jul 2022 23:39:26 +0800
Message-ID: <CAEXTbpc7W40-vYcTVTNo7ikQ-n0O246AsbPntNb4q2nBErYVQw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220728_083939_525226_5C85F212 
X-CRM114-Status: GOOD (  24.48  )
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

On Thu, Jul 28, 2022 at 7:21 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 27/07/22 11:40, Pin-yen Lin ha scritto:
> > Switch to SMC watchdog because we need direct control of HW watchdog
> > registers from kernel. The corresponding firmware was uploaded in
> > https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Move the modifications to mt8173-elm.dtsi and add some comments.
> >
> >   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > index e21feb85d822..b2269770abc3 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > @@ -161,6 +161,18 @@ hdmi_connector_in: endpoint {
> >                       };
> >               };
> >       };
> > +
> > +     soc {
> > +             /*
> > +              * Disable the original MMIO watch dog and switch to the SMC watchdog,
> > +              * which operates on the same MMIO.
> > +              */
> > +             /delete-node/ watchdog@10007000;
>
> Unfortunately, we're not quite there yet.
> The comment is fine, but...
>
> There's no need to /delete-node/: you can just do it like
>
> /*
>   * Disable the original MMIO watch dog and switch to the SMC watchdog,
>   * which operates on the same MMIO.
>   */
> &watchdog {
>         status = "disabled";
> };
>
> and...
>
> > +
> > +             watchdog {
>
> This isn't addressable, hence it belongs to the root node, not to soc.
> If you did that because of naming issues, I would propose to call it
> smc-watchdog instead of watchdog.
>
>
> > +                     compatible = "arm,smc-wdt";
>
Thanks for the suggestion. I'll modify it accordingly in v3.

> P.S.: No timeout-sec?

The example in the binding file has a timeout-sec property, but it is
not defined in the binding nor used in the driver...
The driver seems to talk with the firmware to get a timeout value[1]
instead of reading it from the devicetree.

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/watchdog/arm_smc_wdt.c#L138
>
> Regards,
> Angelo
>
> > +             };
> > +     };
> >   };
> >
> >   &mfg_async {
> >
>

