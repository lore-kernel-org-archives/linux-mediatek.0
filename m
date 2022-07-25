Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0379CC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qKGmWMqZhEmESnw4XiD+O0THResKBg5Q3wlwtvAW/k=; b=PE2yLpjWwaaEOmbfz9kAra9pRI
	DqU9SJ3F9SSK/eb2zO5iEALhp8Bg7y0G+d5vYveA+Fw+hJU7xQoERZKift7/c7a61ZKZqRLFPS7u9
	pVf4b31QXE525eR8JXIY6YGz8mqWsn0fipc9/U0lNtPgshp/a8YHQ5SoekA9rYJb+WBiiSWdRS2tb
	LJvPXb3xmV/3aMEWXPIzu/gKa4Lc8wclJoqRCcTYDmUP1l0j0cSeIZ91MtV5fuHGzrnRVTY7nVuc6
	lnBLkkUPZ3BXvjlumHdmGl8y5uCIV98dNR6MeITI9cep+J8J9pD6MvEF2OZQgjb1cmblGCiYLAbZh
	SMQnRDAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvBO-0087K1-UC; Mon, 25 Jul 2022 10:19:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvBL-0087EA-Qd
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 10:19:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id u5so15280330wrm.4
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 03:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4qKGmWMqZhEmESnw4XiD+O0THResKBg5Q3wlwtvAW/k=;
        b=hv2GEF4dtTTSztB0obRjKRpHxTon1gEYyRohRuamIcDUPyt/tP2SXOQBZFsD7zpGE+
         bTEK8t5WDE+622xIsSiGf/Fs4gOdTrZhWaglwuctUCChX3HcB07SyaIQwElXb2W6RHRG
         iGA/Nxx3TL9R4Kd/V57KX6EiRH99aBno+/RAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4qKGmWMqZhEmESnw4XiD+O0THResKBg5Q3wlwtvAW/k=;
        b=PIWaoWulyX9RQVIEustEblqtpeV2WehWtGmOUtIsKhv8qn1KtNHRGNRDVCZ4FERtJb
         mHL/Y2J5JY3vO5ut+vzMR/lOt4wXGIQEbNiyPGnQyyXbw6dGkdqdAJLTYoC/be1lyl9U
         eutq5dnNur3CFR4MYCilmQRR9E+brlX/xcicYYFgppsMOjBJWxqxLENf1jgJU7LydQgZ
         zpe2cecIk5L8sj7rHPoa/WSnWjjsgE8kHCrzk0Ym1BLKeJBWeMtUegW4XWLFQjGhFsiD
         11OIUpeEhOiDdwEptYN0guHP0ohBim9D6S8Cd/GOC5XDH+hWM9Z+qhkZNR6KYcuKC7SS
         dmtg==
X-Gm-Message-State: AJIora+13H+Xr3TeQWmU3M/3upoW5igjlf2CrUIe3gTW4w3IUR2icP2P
	nxnd8+PL4nwfiQi73H4Pm2yJyUUwepWno8P+UGOeEQ==
X-Google-Smtp-Source: AGRyM1uN9zadKS6Nx4rG97C6xaz+jKp9LVcuSfRCaJh2ZAajRxqI38cP8WAfn6ByjTht9F2p1SRciCiBlVqAEVGzDmc=
X-Received: by 2002:a5d:59a9:0:b0:21e:5e6a:6a8e with SMTP id
 p9-20020a5d59a9000000b0021e5e6a6a8emr7812606wrr.190.1658744360514; Mon, 25
 Jul 2022 03:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220725082447.2613231-1-treapking@chromium.org> <5856610d-510f-46dc-63b2-79e571956a7c@collabora.com>
In-Reply-To: <5856610d-510f-46dc-63b2-79e571956a7c@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 25 Jul 2022 18:19:09 +0800
Message-ID: <CAEXTbpeHy6-WjLOyWFkncoHzBPM+6qq4w-kUoZj7=05gf8YBjw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220725_031923_906863_597FF9E1 
X-CRM114-Status: GOOD (  28.42  )
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

On Mon, Jul 25, 2022 at 4:39 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/07/22 10:24, Pin-yen Lin ha scritto:
> > Switch to SMC watchdog because we need direct control of HW watchdog
> > registers from kernel. The corresponding firmware was uploaded in
> > https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> >
>
> There's a fundamental issue with this change, I think.
>
> What happens if we run this devicetree on a device that does *not* have
> the new(er) firmware?

I haven't tried this patch with an older firmware. I'll manage to
build one for this.
>
> The kernel *shall not* get broken when running on devices that are running
> on older firmware, especially because that's what was initially supported
> and what is working right now.

Actually the current approach does not work *right*. The device boots,
but the watchdog does not work properly.

Also, all MT8173 ChromeOS devices have this firmware updated, and we
don't have other upstream users apart from mt8173-evb. Do we want to
support the developers that are running upstream linux with their
MT8173 boards?

>
> For this reason, I think that we should get some code around that checks
> if the SMC watchdog is supported and, if not, resort to MMIO wdog.

What is the expected way to support this backward compatibility? Do we
put the old compatible strings ("mediatek,mt8173-wdt" and
"mediatek,mt6589-wdt") after "arm,smc-wdt" and reject it in the
drivers if the firmware does not support it?
>
> Regards,
> Angelo
>
>
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> >   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index a2aef5aa67c1..2d1c776740a5 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -528,10 +528,8 @@ power-domain@MT8173_POWER_DOMAIN_MFG {
> >                       };
> >               };
> >
> > -             watchdog: watchdog@10007000 {
> > -                     compatible = "mediatek,mt8173-wdt",
> > -                                  "mediatek,mt6589-wdt";
> > -                     reg = <0 0x10007000 0 0x100>;
> > +             watchdog {
> > +                     compatible = "arm,smc-wdt";
> >               };
> >
> >               timer: timer@10008000 {
> >
>
>

