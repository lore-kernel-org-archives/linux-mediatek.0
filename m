Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0010C87FCF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mqK1RSBPE9C31GyE2vJbWJ8NDfAV+1bNXjXR8+rtBo=; b=0zd+zulf7tfmkhsjq0PbZ47Azp
	g4x7WAor6BJIVxKrPYOy6HOlahdNpunHg/g/mn+GeSbrZ0y2xzdc/lIXfxBTSGBgIlPtvKD9C8rAj
	D2+HT1RtNRa/SgfosjOGt41E18StvUfLW/dSykvv1MXUr+/K9Sl++wsrFaTph+hCurPx/kyI6Cn88
	DdyPiJ4XaOrPLL9BySULGIG8sqbIBg3HmjniTXRwIUfg7BaZDemr9ncirT8UxgTnK4jDlvU9WGUy+
	fsRdDhMuQzZhCpFkl6SwUndDDS2QTjzz0ajzHNgtSrRt7BvzZ+KSZyGiUNGjyQQ5GK32A3X3rz/oS
	ZQyM3wkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHIb-00000009nFt-1MOJ;
	Fri, 25 Jul 2025 12:13:17 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGuK-00000009kf6-2il9
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 11:48:13 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-301a83477e5so1552373fac.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444091; x=1754048891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mqK1RSBPE9C31GyE2vJbWJ8NDfAV+1bNXjXR8+rtBo=;
        b=bTLlyOqmE/fZJQ8fY34pyom4LtRvXCDrS7ZYsFzzI1BbJV+fNU6ThNHU3HbAdSGtaC
         Ni6J8oHt7LiXGVMuvOWjhZSmHSf6dwgO1ufrQIB9rzndg5deucaS8XZZg8zbvUvhQzU1
         s4qMWuIshwxinjULQ4ZXiLbKlLbFEne66IQHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444091; x=1754048891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mqK1RSBPE9C31GyE2vJbWJ8NDfAV+1bNXjXR8+rtBo=;
        b=HNHPsHNX9mpNiQNvxgQuX3NrqNAse6355UPT45PhfimI5nYbrMNdgC2r3x3cF1BC6t
         ZvUesXABL8WrdbzKR0EHUfFClkp/Bp6c/clIJbhnoemfxi0Ci+PHfMQL8RyMY3XuMDme
         sm/rvPfybeWenv4bpJ3ZoikgO9ezm4C/Eiv80BFn10H6repYci2J1MlUnMjyTA251EoP
         u9K5u9N2vY4995saoOWZQD9GrpdIi6I4G4f4CIH04KUsc0kg/X7luNpzJUpkTYhWNukO
         9Lun71uiHqorUNdxGtjiG02sstZa5Ci7/dovxhuC/gZVFlK00rGNuhg+PcvYw5MLkox6
         Nd8w==
X-Gm-Message-State: AOJu0YyasqreMzvZGEYR/VU3lplwSPOAyfxwJinM6XlmWeVpUA+SYC4t
	1DH5X5Q0ua0SO8LLmxggLfvArUIGhOF9R36oDj7lz45WqKrycm2TsZUNypN4ky7Yitank/J8AUk
	zaYs1kA==
X-Gm-Gg: ASbGncuJvgudpUqMyevKRsQOu/hxvC9G0RAcFOa6uP3f9SgRv5CfVa4kkD63uhBkvBr
	tSunJlmYijM6EVTXhPANXMPq33L5KYduROBjQ+w9akAWNaNhssUY9TxFXlXqcO3e85MXEANjrHw
	kqDVY7E5ZNTLR0kL5ICLeNwf0y7Yf2HF2he9o/ePB/AE0U2d0rO4oezeVGYTaFB4qYPErRjJMlZ
	LUgDt+79V7y/ay8X46VplDHTHvrKUwIAvyOLRFCCZM5u9TZOg6P1iJTwO3T2hpiSxptkFTyYjGO
	uyZ4edUpQS9+f/n+4PfIDYBALxraEnEHMfLLiwqKlpEUljuyrG8DY3SaIcGymumTcMz8QFX99aw
	ySAJuJQkOcfejSdxWi++azpyj0IPTY5s4Qn0beoOpq8RjXt8+v7YUraXQnPfBLQ==
X-Google-Smtp-Source: AGHT+IF+re5k9yldgyJvX1qy1I27hg2VVlvDdY8vm1hA5FiRdBGIv8BOY+jDavG5GM5gzt1KfE4b4g==
X-Received: by 2002:a05:6871:9f0b:b0:2d5:25b6:ec14 with SMTP id 586e51a60fabf-30701d18b22mr971603fac.15.1753444091387;
        Fri, 25 Jul 2025 04:48:11 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7412d2ad45esm640948a34.36.2025.07.25.04.48.10
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:48:11 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-41b7d12401bso1259171b6e.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 04:48:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5a92:b0:4eb:502c:569a with SMTP id
 ada2fe7eead31-4fa3fb3f3f9mr285813137.9.1753440864290; Fri, 25 Jul 2025
 03:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-19-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:53:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1njpbfARTSBwddCeeO+c0vvf=GVaD6+QhauJOki0NS9dTQ@mail.gmail.com>
X-Gm-Features: Ac12FXy3jzZS4uZ6X5J7uIwzpvgV1oXiUrEGuonvNPTbsP1Oacxt9m6NF-3FvZA
Message-ID: <CAC=S1njpbfARTSBwddCeeO+c0vvf=GVaD6+QhauJOki0NS9dTQ@mail.gmail.com>
Subject: Re: [PATCH 18/38] arm64: dts: mediatek: mt6797: Remove bogus id
 property in i2c nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_044812_691721_986DA458 
X-CRM114-Status: GOOD (  13.31  )
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

On Thu, Jul 24, 2025 at 5:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All of the I2C nodes in this devicetree has a bogus "id" property,
> which was probably specifying the I2C bus number.
>
> This property was never parsed and never used - and besides, it
> also gives dtbs_check warnings: remove it from all i2c nodes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6797.dtsi
> index be401617dfd8..f2d93bf6a055 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -285,7 +285,6 @@ uart3: serial@11005000 {
>         i2c0: i2c@11007000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <0>;
>                 reg =3D <0 0x11007000 0 0x1000>,
>                       <0 0x11000100 0 0x80>;
>                 interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
> @@ -301,7 +300,6 @@ i2c0: i2c@11007000 {
>         i2c1: i2c@11008000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <1>;
>                 reg =3D <0 0x11008000 0 0x1000>,
>                       <0 0x11000180 0 0x80>;
>                 interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
> @@ -317,7 +315,6 @@ i2c1: i2c@11008000 {
>         i2c8: i2c@11009000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <8>;
>                 reg =3D <0 0x11009000 0 0x1000>,
>                       <0 0x11000200 0 0x80>;
>                 interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
> @@ -334,7 +331,6 @@ i2c8: i2c@11009000 {
>         i2c9: i2c@1100d000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <9>;
>                 reg =3D <0 0x1100d000 0 0x1000>,
>                       <0 0x11000280 0 0x80>;
>                 interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
> @@ -351,7 +347,6 @@ i2c9: i2c@1100d000 {
>         i2c6: i2c@1100e000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <6>;
>                 reg =3D <0 0x1100e000 0 0x1000>,
>                       <0 0x11000500 0 0x80>;
>                 interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
> @@ -367,7 +362,6 @@ i2c6: i2c@1100e000 {
>         i2c7: i2c@11010000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <7>;
>                 reg =3D <0 0x11010000 0 0x1000>,
>                       <0 0x11000580 0 0x80>;
>                 interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_LOW>;
> @@ -383,7 +377,6 @@ i2c7: i2c@11010000 {
>         i2c4: i2c@11011000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <4>;
>                 reg =3D <0 0x11011000 0 0x1000>,
>                       <0 0x11000300 0 0x80>;
>                 interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
> @@ -399,7 +392,6 @@ i2c4: i2c@11011000 {
>         i2c2: i2c@11013000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <2>;
>                 reg =3D <0 0x11013000 0 0x1000>,
>                       <0 0x11000400 0 0x80>;
>                 interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>;
> @@ -416,7 +408,6 @@ i2c2: i2c@11013000 {
>         i2c3: i2c@11014000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <3>;
>                 reg =3D <0 0x11014000 0 0x1000>,
>                       <0 0x11000480 0 0x80>;
>                 interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> @@ -433,7 +424,6 @@ i2c3: i2c@11014000 {
>         i2c5: i2c@1101c000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <5>;
>                 reg =3D <0 0x1101c000 0 0x1000>,
>                       <0 0x11000380 0 0x80>;
>                 interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
> --
> 2.50.1
>
>

