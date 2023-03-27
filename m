Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EB9C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/V3pA35xhVCbP9jkYQO9e9S5qEV2hgRETTuNLYG0J5I=; b=C5JprKsbw5u5UNLMnPFSgONdCl
	OX8hTq2ml2GsloYAB4Rj1XIcPrgOTIQpqJs5SmFr0GoL4/LbUy9t1+lsHYFNexPyPY5EXmDP++Lqk
	kBPyA/tRpJUCbH5yi46yyw1GHyRSb00LF3q7qggdvaNRzBqieeNgx1qa0js+X1gL3z4a5OirwRhVN
	4SeondNasD3gHgTSiREkJcsv8veNJrobR/3yLMbqIsTMq8y6fgVSl2nZmx5qCRshmPjQbnmpCBBl2
	uoF97u/Dxcbc4e36wE4IpWJbB6y1Akk9tyd3oL6TjfvJb5vSxrHvza4YaRDcHSTVrQkjgVMRSaegY
	suntpNgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkWy-00Agjg-25;
	Mon, 27 Mar 2023 10:56:52 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkWu-00AgiT-0q
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Mar 2023 10:56:50 +0000
Received: by mail-yb1-xb29.google.com with SMTP id i6so9956168ybu.8
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679914607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V3pA35xhVCbP9jkYQO9e9S5qEV2hgRETTuNLYG0J5I=;
        b=q6NUh0GLhbSm+jdtm5u/zJSq9hxnLKIfoo86F6ho5smnjf34w4TPsj9OZwgJekDkfe
         W+/E4fPYuxWqCcR0vFt/V5DtbFMv76+JyAmmnJ0wDwyX9VkezXK6dmfKe0lGXCkVV1nQ
         punl2iTjp0SNLSPRDx0NFGQ5yRKS1RhOa+esRXcB0rDOTQMuv6QnlQ6J0w3XbombUITr
         maO1C4mmuLpNd4Yky5AvLakgbvtYmCIuyXvMSstF73DGH90kUum/xdYY4Lvz/2gGcsF1
         BKAD5nHXNHn0M7WGb+KgnAMiTaGScaC4MXH6KxkSk+tALMQm2DQxRv8i6rZRUoe1a891
         pdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679914607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V3pA35xhVCbP9jkYQO9e9S5qEV2hgRETTuNLYG0J5I=;
        b=QyIx5XPnNNMG647pJOjAjr413tDpMviy3kfCdK5b0qotFV9X97nmBsTDVDzB4hEEKY
         mJb94spQCIEmTM87ZfdE7Upjkk4YulMfq8PfJFecYsNlreg/ezjZMoOFgEq1AJQ4+AL4
         /vkRBqkR8eqyaoE8AcPxZFetpyjgn5wdZFw5vB3m8keFjnsgw1nNN2IjlJT4N8KSRXh5
         fiCF6fYkoqRg1w4rj1UPCSvUKy7Zx7VB9Yai/y2g8tFwIaiik8XVu+gtAHcv2QRlO4i9
         5/CWouByAbbxCf/suBBzPHMCGW3T5z1EkMaONTUs5BNipTyTgqarjPWjHeRvVerKoDZZ
         DfTg==
X-Gm-Message-State: AAQBX9chbKayXOSqy1RM8n3b5UQrWSg1GDwO7XWpIb0Xf/ryYWSO8mcv
	P0jsPsS6zVKfe+ztCyUUFKE6flsPHj2meLPXsWPGqA==
X-Google-Smtp-Source: AKy350YfvVDOEdafb4m5KIOnnCg2t8RAuLdF4lY57Kt2SzbDhA40QER8ozVCwQkqO3tcWU5y9O4EoOR4PmQqRw+iAnQ=
X-Received: by 2002:a05:6902:1181:b0:b6c:2224:8a77 with SMTP id
 m1-20020a056902118100b00b6c22248a77mr7052843ybu.1.1679914607297; Mon, 27 Mar
 2023 03:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
 <20221122-mt8365-i2c-support-v5-2-6e4f3b54937f@baylibre.com> <2a1b1f66-970e-5adb-389e-b9c47a790712@collabora.com>
In-Reply-To: <2a1b1f66-970e-5adb-389e-b9c47a790712@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 27 Mar 2023 12:56:36 +0200
Message-ID: <CAFGrd9pf+ojPDciF3Mtw-QT51LZCj+GNLHXurGx_vcC17GHA2A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_035648_299564_5D6D8DE8 
X-CRM114-Status: GOOD (  17.07  )
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

Hi Angelo,

Le lun. 27 mars 2023 =C3=A0 10:45, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 27/03/23 10:27, Alexandre Mergnat ha scritto:
> > Enable the I2C0 bus provides communication with:
> > - The integrated RT9466 Switching Battery Charger.
> > - The integrated MT6691 LP4X buck for VDDQ.
> > - The integrated MT6691 LP4X buck for VDD2.
> > - The pin header, to plug external I2C devices.
> >
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/b=
oot/dts/mediatek/mt8365-evk.dts
> > index 4683704ea235..35cb142004a4 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> > @@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
> >       };
> >   };
> >
> > +&i2c0 {
> > +     clock-frequency =3D <100000>;
> > +     pinctrl-0 =3D <&i2c0_pins>;
> > +     pinctrl-names =3D "default";
> > +     status =3D "okay";
> > +};
> > +
> >   &pio {
> >       gpio_keys: gpio-keys-pins {
> >               pins {
> > @@ -96,6 +103,15 @@ pins {
> >               };
> >       };
> >
> > +     i2c0_pins: i2c0-pins {
> > +             pins {
>                         pinmux =3D ...pins...
>                         bias-pull-up =3D <your-pull-up-adv-value>;
>                 };
>
> ...and please do *not* use the mediatek,pull-up-adv property: this is
> supposed to be there only for older devicetrees and there's a replacement
> for it.... unless you have any specific reason to do so (and if you do,
> you should well explain that).

bias-pull-up isn't necessary currently because MT8365 doesn't use MTK
paris/moore drivers.

> Besides, if you introduce the usage of that property in any 8365 devicetr=
ee,
> the previously proposed 8365 pinctrl cleanup will become a bit harder to =
do.

I'm thinking of deprecating the "mediatek,pull-up-adv",
"mediatek,pull-down-adv" properties from mt8365 pinctrl binding too.

Regards,
Alex

