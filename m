Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D682C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 14:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8asMA5McnjUqiDsQhrdKj0am/206nD+kU8Fb3R8j7Q=; b=plz3WPCaxeaLqqIU7Iw0x6P3Hl
	r4qz6kAhurQ3Ea5jXmu390KUdFZJtCisdxErPRJpOurdHbs6wBmkNVNxODzR1susFZqpep9pDLVAt
	cNOYukTShJ/egrLI0rNQY653RE/6fR3HAvKtB9wian6qX/dtiYBe/FE5jbMDi3obQVkHntTucjWdG
	beDG+p3SNPIRWyeUnIX3RpbA4KKeonyQuHG2StvIXAfD9y7y4m0jRjDlSRe1zvt3oTFcaoh8iMDIJ
	l5Fv5/YDQJVfRGc8gsguve7mcyQCVpH0TFPnMT7wbVAEQCDDzSZpThoXUnxi8P7FiWuAlVHsTSXLw
	KdRZppFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cT4-002gdS-0o;
	Mon, 27 Nov 2023 14:20:10 +0000
Received: from mail-yw1-f195.google.com ([209.85.128.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cT0-002gcK-1c;
	Mon, 27 Nov 2023 14:20:08 +0000
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-5cbcfdeaff3so42805467b3.0;
        Mon, 27 Nov 2023 06:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094805; x=1701699605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8asMA5McnjUqiDsQhrdKj0am/206nD+kU8Fb3R8j7Q=;
        b=D36gDpEFsbyf0LQs95PnnADCOLwG/fwqPPmEXqB5lKp1WA7h0gmhsrQQpkMIcLVZD8
         R8r1xOKiDwTEiTNWAVdfOY7WbSq+A7BhbcGz5z83lJZPOEiThtC7JIe17bfI36ceM9L7
         NzT/c+3OTQDA16ujk0875fIONy3p93jy4DeD0G4rFnklBTe3E7JS9GR3DAy6Ar+rejZ4
         InZzTga6huLqweN723pfBoPIt/NSX7Y/gj1uh+b8wcKPDAQfvN/p1vkPHpBfDLrlpwIA
         UmE48W9jb1GHWqyNOYRuLP3LWFoDzybH9tqjrgB0Is7YeCF+47kPrPhFxgnjk2AvCttu
         Abiw==
X-Gm-Message-State: AOJu0YwMI8E8fQr5P5IoKgWiTsyXBMyGuSnYkqFaHtLvK3mfAyEk5CAL
	4STibeHVru4cwC7VUjkqJIB6JobVM7meCFOc
X-Google-Smtp-Source: AGHT+IHOrcDoV8LHmGn1Fu4pA56O7GTe0BttqKAknUyWlC2jZ9tGtevZtsS4Ssthq7dPn+Q5lggzIg==
X-Received: by 2002:a81:6008:0:b0:5cd:f157:fd05 with SMTP id u8-20020a816008000000b005cdf157fd05mr11595985ywb.25.1701094804776;
        Mon, 27 Nov 2023 06:20:04 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id a124-20020a0df182000000b005af6df31bb0sm3255806ywf.105.2023.11.27.06.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 06:20:04 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5cbcfdeaff3so42805237b3.0;
        Mon, 27 Nov 2023 06:20:03 -0800 (PST)
X-Received: by 2002:a0d:e207:0:b0:5a8:207b:48d with SMTP id
 l7-20020a0de207000000b005a8207b048dmr10958508ywe.11.1701094803713; Mon, 27
 Nov 2023 06:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Nov 2023 15:19:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYEwMuxJ2Xx=KRVKneRT-e+uHz8LE1JVY5zLDkWksqKw@mail.gmail.com>
Message-ID: <CAMuHMdUYEwMuxJ2Xx=KRVKneRT-e+uHz8LE1JVY5zLDkWksqKw@mail.gmail.com>
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Jonathan Corbet <corbet@lwn.net>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_062006_536329_4B557DA4 
X-CRM114-Status: GOOD (  24.85  )
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

Hi Krzysztof,

On Sat, Nov 25, 2023 at 7:44=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Document preferred coding style for Devicetree sources (DTS and DTSI),
> to bring consistency among all (sub)architectures and ease in reviews.
>
> Cc: Andrew Davis <afd@ti.com>
> cc: Andrew Lunn <andrew@lunn.ch>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Chen-Yu Tsai <wens@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Merging idea: Rob/DT bindings
>
> Changes in v3
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. should->shall (Angelo)
> 2. Comments // -> /* (Angelo, Michal)
> 3. Use imaginary example in "Order of Properties in Device Node"
>    (Angelo)
> 4. Added paragraphs for three sections with justifications of chosen
>    style.
> 5. Allow two style of ordering overrides in board DTS: alphabetically or
>    by order of DTSI (Rob).
> 6. I did not incorporate feedback about, due to lack of consensus and my
>    disagreement:
>    a. SoM being DTS without DTSI in "Organizing DTSI and DTS"

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dts-coding-style.rst

> +       /* SoC DTSI */
> +
> +       / {
> +               cpus {
> +                       /* ... */
> +               };
> +
> +               psci {
> +                       /* ... */
> +               };
> +
> +               soc@ {

"soc@" is invalid, that should be "soc".

As the "soc" node is special, you may want to elaborate:

                compatible =3D "simple-bus";
                #address-cells =3D <1>;
                #size-cells =3D <1>;
                ranges;

> +                       dma: dma-controller@10000 {
> +                               /* ... */
> +                       };
> +
> +                       clk: clock-controller@80000 {
> +                               /* ... */
> +                       };
> +               };
> +       };
> +
> +       /* Board DTS - alphabetical order */
> +
> +       &clk {
> +               /* ... */
> +       };
> +
> +       &dma {
> +               /* ... */
> +       };
> +
> +       /* Board DTS - alternative order, keep as DTSI */
> +
> +       &dma {
> +               /* ... */
> +       };
> +
> +       &clk {
> +               /* ... */
> +       };

IMO that alternative order is hard to review: you need to have multiple
files open.  It will also make validation hard, as you can only validate
the end result, not individual files.

Anyway, this is already quite usable so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

