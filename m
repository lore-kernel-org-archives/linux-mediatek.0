Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6A9C07CB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 04:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hyXUgZR2V8CGJro2dBZPICRFG2CL4zf1FqusNumER4=; b=mqdL2BuGWnrvM1NWm6KwBIbfPc
	FNT6IBojxAx7hhLHiqlIS5ecAqKHSRw82l/azVjIOSbPQ5GIj+BZXjfUEz9MMsZXkydYmGC4XxdtS
	Cnl9VWNPKjWwF4ShWtnshlpI0MV8yEg33KUMZUD+Cqg+GrGPmlGpH+Crv0cF6zwV05HxJPQvSd5Re
	x/0LhsUvrucERTFc3kp0uv10CrXuzNnaiTHzmz6wnNIS0xpSB5oJJf1YUPeknpGBmVeAbdjxk54BC
	cAAlVBUnL15tNJkR11HhlRR2gHLMIYZcumQhrYjTvnyYYd9fgXlkBV+p9wDJ/NtrBsBDtK9VmDlm0
	MackMLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7SnN-001GIx-11;
	Mon, 27 Nov 2023 04:00:29 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7SnI-001GGr-31
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 04:00:27 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50aaaf6e58fso5773143e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Nov 2023 20:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701057621; x=1701662421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hyXUgZR2V8CGJro2dBZPICRFG2CL4zf1FqusNumER4=;
        b=DsMRxkbkBgncSbg2IEXeY8Kw8icPnVM6udtw9cKZhOY7ubg0p9kt4tZe3FRtqhnHYV
         D6VaEWbfbpTmmFAHhXl1pTjwR2aDrgNlHfvgfrOiy5GuQ414u0l41foOUrPn5iGsG48M
         TcszxlSc87wkDi1Ne14Kq9pgxwHd0nh0f0gKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701057621; x=1701662421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hyXUgZR2V8CGJro2dBZPICRFG2CL4zf1FqusNumER4=;
        b=LjdhwEHy+vt1YdNSCsA7i3j5MEMxCRKkAq8yZWsPJtuTh3ry2P9FFElRHnEZBSlZ0M
         yLQDKqnr9tY4aLpbKy2HPEGkTqdmUuhMbL7icpSm7tmWD044mEkJKDPP1qrpOVUzC4HX
         18iiF5bnPMv+yZ7wLb9SM2pHIwkUL3A286+DM6zPFJDgAJkqdSs0USFIz7Wd6P/uG7u9
         iImYIepisGq/Tmt3Z3sBSLXg8AGBZoK22kS13YwRz80g8WdVTB4O+2JsiXrqSg6J5G5z
         lBeu7KmUGTMhPs/Z9q3x7j7E7cVGtiCDqVx1Ka6wAd+0odIBLo+31+QJQ57pWC8JTvOb
         cfHQ==
X-Gm-Message-State: AOJu0Yz1yFuPX5xteUNDwqovROIOAMWYIQZxz/JpuxjWTl6pT3x8crkk
	ACHVS77Yn7enbgCxgBakK7JHkkJggl8yqWpt16M+Lg==
X-Google-Smtp-Source: AGHT+IGWNLzkTfKJ9/s46JZ8EFnCkfTriGkCE5/WH1eK+5G+zIursvHQuaGd5Lbk44N+a4VuvKKNSbjCULPbRF3Hxbg=
X-Received: by 2002:a19:ac48:0:b0:50a:6fc5:e95c with SMTP id
 r8-20020a19ac48000000b0050a6fc5e95cmr6666053lfc.60.1701057621033; Sun, 26 Nov
 2023 20:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20231012230237.2676469-1-wenst@chromium.org> <20231012230237.2676469-7-wenst@chromium.org>
 <60beb523-292b-4c77-9030-1bfdfd73c140@collabora.com>
In-Reply-To: <60beb523-292b-4c77-9030-1bfdfd73c140@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Nov 2023 12:00:10 +0800
Message-ID: <CAGXv+5GmjZbzLbxADoNXDiF8dTAwnxva29vuM0FG8vY-6wTJcQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_200025_126931_548763BB 
X-CRM114-Status: GOOD (  23.16  )
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

On Mon, Oct 23, 2023 at 5:05=E2=80=AFPM Eugen Hristev
<eugen.hristev@collabora.com> wrote:
>
> On 10/13/23 02:02, Chen-Yu Tsai wrote:
> > Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> > Krabby design.
> >
> > Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> > convertible device with touchscreen and stylus.
> >
> > Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
> > device. It does not have a touchscreen or stylus.
> >
> > The two devices both have two variants. The difference is a second
> > source touchpad controller that shares the same address as the original=
,
> > but is incompatible.
> >
> > The extra SKU IDs for the Tentacruel devices map to different sensor
> > components attached to the Embedded Controller. These are not visible
> > to the main processor.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile         |    4 +
> >   .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  130 ++
> >   .../mt8186-corsola-tentacool-sku327681.dts    |   49 +
> >   .../mt8186-corsola-tentacool-sku327683.dts    |   26 +
> >   .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
> >   .../mt8186-corsola-tentacruel-sku262148.dts   |   28 +
> >   .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1704 ++++++++++++++++=
+
> >   7 files changed, 1985 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby=
.dtsi
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentac=
ool-sku327681.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentac=
ool-sku327683.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentac=
ruel-sku262144.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentac=
ruel-sku262148.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> >

[...]

> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/ar=
m64/boot/dts/mediatek/mt8186-corsola.dtsi
> > new file mode 100644
> > index 000000000000..42ebab1bafeb
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> > @@ -0,0 +1,1704 @@

[...]

>
> Hi Chen-Yu,
>
> These two aud_gpio_tdm empty entries cause this message to be printed:
>
> [   12.949519] mt8186_mt6366_rt1019_rt5682s sound: there is not valid
> maps for state aud_gpio_tdm_off
> [   12.959025] mt8186_mt6366_rt1019_rt5682s sound: there is not valid
> maps for state aud_gpio_tdm_on

I guess we need to teach the sound driver to ignore empty pinmux states?

ChenYu

