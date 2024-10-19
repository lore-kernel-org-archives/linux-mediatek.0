Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391C9D3DEA7
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Oct 2024 05:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzfvgqsAxHWenBWftlkZ/uVSGEyAz3grmzhqBSSTfDI=; b=reB2Qa8TSNcqMOaL5nyr8fcDfh
	q3oiZlpY/gv2G+wFzW47NMCNgGP6OCqjHOvuZsioHFfDg8kmkzAc7tV8n0rTVVD+ZgIRUiA5l/XUk
	+EP12aWB0LopKoMQ43ZdcJhfp5RS06ymzdkLG4D7I5CJJIUduPL5CoYNAJ3jtNf12mogQZubRFda6
	LT4LgH1Arm90VcCYlHyMq5q/7K1JFMdYrgE2Jtxb6sUD0Qycn6CeUT50MYKlk4yVM/O8Pi8E4bHhX
	EJmaJFhKDQhBXW7CiWe3mwnKJUNSpmMl+gqOVe+wDUnVm3GVYnhFiCQeVYTfGZZ13WDGBPPV/AzXf
	IDy9jx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t228d-00000002bHB-0Wld;
	Sat, 19 Oct 2024 05:36:31 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t228a-00000002bGP-36ZE
	for linux-mediatek@lists.infradead.org;
	Sat, 19 Oct 2024 05:36:30 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-4a47d70cd8aso837505137.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 22:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729316187; x=1729920987; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzfvgqsAxHWenBWftlkZ/uVSGEyAz3grmzhqBSSTfDI=;
        b=ZYzU9/Psoi/rJYZ+vqrqIqGBdrugeCI+CIYviN0UTKHndp+JO2bbj/uXDXYMhkhwPU
         GG0YP7Vek2mINe8ARXrjOyiFtUZmHeB+s4t3FOHaP7tdy9mtQxXYxSg9DO94Wur/sbPI
         HdN8XIhQUaXTOaW1duI2hvosa7U77AKwP72C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729316187; x=1729920987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzfvgqsAxHWenBWftlkZ/uVSGEyAz3grmzhqBSSTfDI=;
        b=HMglM82jxRgfdTfkFxwqaUtZPD3vFWgchfFwQcmaJlwx6iSy712PCS6Crewjat6LL0
         5AE754KccM2f9N2+5/ag4/n8+ia2ROdvFrQzf06se1ytvNbaXB4JNRl9TPXTOojqZeJm
         I6x9kfzRUYACmmbXfJtlTPTEQcAM6qizhIBMHW/hT1r15vb+i8UzCubZIdcS/7Y7AsIC
         Ga42uwmvyLyarfiFm5gKQB6g50apX7u3mB/1LraSc6SasF59HhN0vox4ebwo8/Nw8r6p
         +z9Vn7dn3QGYljrb/FM5rzhSvvn59gF4aZ826hQ0pRVYA2LcEgJ2WMLhpOpsvyWZSGc7
         Q40w==
X-Forwarded-Encrypted: i=1; AJvYcCUtiYqgyTpilaBp8/IruQ7xlixRlb65/gIR/Tl2kwqOqeufwpFYO1wzwEKc+EE1AOFimquCkGHFnAeGy+xHVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Gfa6n34hmchY9WKq8EgQ3zoGkx0BDxgDMWxgG6x4d5S2qd+y
	y3Cx8vBsAQyesZ2bFBIkiu7F9ZMCbBewzaMTGG959rdbzW2YH0Q8MZdh1vgiGcnvuxHVnm48yg2
	5jg==
X-Google-Smtp-Source: AGHT+IF+Ge3rQCs7DGBIKh+phFBv15rHA3p8fK3W6GNEAuZibbSEZHm2Gd069RumjwMGGzEQeRbCkg==
X-Received: by 2002:a05:6102:304c:b0:4a3:dd83:c0ac with SMTP id ada2fe7eead31-4a5d6bb72efmr5280531137.20.1729316186574;
        Fri, 18 Oct 2024 22:36:26 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a5d6228392sm469110137.9.2024.10.18.22.36.25
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 22:36:25 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-50d4a333a87so878864e0c.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 22:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/FD4ddKxqaTUd+tGN2t0pkLXmUMxt1Yac7Nan5r2DM6ydZFhh83Of0NbnpwIcOrp016VrXzYauOntqCmA8Q==@lists.infradead.org
X-Received: by 2002:a05:6102:3711:b0:48f:de23:14f0 with SMTP id
 ada2fe7eead31-4a5d6ad1703mr5830263137.8.1729316184547; Fri, 18 Oct 2024
 22:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241018-post-reset-v1-0-5aadb7550037@chromium.org> <172925540096.17773.4550001283125132036.robh@kernel.org>
In-Reply-To: <172925540096.17773.4550001283125132036.robh@kernel.org>
From: Fei Shao <fshao@chromium.org>
Date: Sat, 19 Oct 2024 13:35:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1njH=D247j80MezGPHjwg_ZLWtH5gasXfOB-Y9Geq50frA@mail.gmail.com>
Message-ID: <CAC=S1njH=D247j80MezGPHjwg_ZLWtH5gasXfOB-Y9Geq50frA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Using i2c-hid-of-elan driver instead of i2c-hid-of driver
To: "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_223628_829229_2E896E38 
X-CRM114-Status: GOOD (  24.73  )
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

On Fri, Oct 18, 2024 at 8:57=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Fri, 18 Oct 2024 12:03:03 +0000, Hsin-Te Yuan wrote:
> > After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
> > i2c-hid-of"), i2c-hid-of driver resets the touchscreen without having
> > proper post-reset delay on OF platform.  From the commit message of tha=
t
> > commit, not to decribe poset-reset delay in device tree is intended.
> > Instead, describing the delay in platform data and changing to use
> > specialized driver is more preferable solution.
> >
> > Also workaround the race condition of pinctrl used by touchscreen and
> > trackpad in this series to avoid merge conflict.
> >
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > ---
> > Hsin-Te Yuan (2):
> >       arm64: dts: mediatek: mt8183: Fix race condition of pinctrl
> >       arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver
> >
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts |  2 --
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts  |  3 ---
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts   | 12 +++-=
--------
> >  .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts   | 11 ++--=
-------
> >  .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts   | 11 ++--=
-------
> >  .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts   | 11 ++--=
-------
> >  .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  3 ---
> >  .../boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi      |  3 ---
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts   |  3 ---
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts  |  3 ---
> >  .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi |  3 ---
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi       | 10 +++-=
------
> >  12 files changed, 12 insertions(+), 63 deletions(-)
> > ---
> > base-commit: eca631b8fe808748d7585059c4307005ca5c5820
> > change-id: 20241018-post-reset-ac66b0351613
> >
> > Best regards,
> > --
> > Hsin-Te Yuan <yuanhsinte@chromium.org>
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=3Dy mediatek/mt8183-kukui-jacuzzi-b=
urnet.dtb mediatek/mt8183-kukui-jacuzzi-cozmo.dtb mediatek/mt8183-kukui-jac=
uzzi-damu.dtb mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb mediatek/mt8183=
-kukui-jacuzzi-fennel-sku6.dtb mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dt=
b mediatek/mt8183-kukui-jacuzzi-pico.dtb mediatek/mt8183-kukui-jacuzzi-pico=
6.dtb' for 20241018-post-reset-v1-0-5aadb7550037@chromium.org:
>
> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dpi@14015000:=
 power-domains: False schema does not allow [[92, 7]]
>         from schema $id: http://devicetree.org/schemas/display/mediatek/m=
ediatek,dpi.yaml#
> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dpi@14015000:=
 power-domains: False schema does not allow [[94, 7]]
>         from schema $id: http://devicetree.org/schemas/display/mediatek/m=
ediatek,dpi.yaml#
> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dpi@14015000=
: power-domains: False schema does not allow [[92, 7]]
>         from schema $id: http://devicetree.org/schemas/display/mediatek/m=
ediatek,dpi.yaml#
> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: dpi@14015000=
: power-domains: False schema does not allow [[90, 7]]
>         from schema $id: http://devicetree.org/schemas/display/mediatek/m=
ediatek,dpi.yaml#
> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dpi@1401500=
0: power-domains: False schema does not allow [[92, 7]]
>         from schema $id: http://devicetree.org/schemas/display/mediatek/m=
ediatek,dpi.yaml#
>

I sent a patch that should fix these errors:
https://lore.kernel.org/all/20241019052935.553886-1-fshao@chromium.org/

Regards,
Fei

