Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7969C87FCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 12:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=; b=rvgxmqr76O4SdZPgu/FhRFwLQG
	XtY5TbtAKMB7lxZHJEcN0bkKQWpjoL7ls6EZKiE3v2s5yCYFT45hiF9dT8+GnduJ3ZeQTFTjhwqh5
	PQBC9eewFIQADwxSxOYlwaYDoLagjCyXf5BoUrN/O8oXW579FvTghwKNz+xTA4+wUCwPzOKqtr+W5
	xNn+X0zMsXkz1UYPADlL6ykBDVe3PwZOI6Mp99OvibE6fOpuwGP59/h00YWw7vTVGs0wyFUaelTh5
	EN/wnBHY4TYY13a42YX/+AxU1o3RdIAGERlgYckNeqJc54ovwdXswl8LWngXIDEb0f8iQ3duQ1WkV
	DIASVPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHSR-00000009oPH-1eGU;
	Fri, 25 Jul 2025 12:23:27 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHQH-00000009o9k-0HHV
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 12:21:14 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e8defed8130so342927276.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753446072; x=1754050872; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=;
        b=akotVNf9zDtSZvKjRMFJQWUp7w5blbSAjcZ+x6ruusq1RpRDWCzcuzly06aXU6Y9w6
         NVozptb8pdXvzz48G7tu42H996Oa40VAk2NSy4OimJGfItQlSdzXhuAxVOTn4mUYWdvO
         NnLp3/F78/FCJ5T1pW839vcEGBmoc0of79KaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753446072; x=1754050872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=;
        b=M9f9hENEAocskRkCP3E3ApQtXFX1S6voMZPHILwTCP/F7H3yfq7w/9uCxe7sJjSlMc
         20Ymo1zWTf0gi5ZCLNdV8tv2gcTmGAQoEivemiUBzA9WQb/AZgDxnhGnk22j4tUpW/zT
         z3kVKb4jvMhdiJl0DMr6G5WQvDpX5KAFQaV2FaVlQbWZQJME0z5JECdMvq90QMq/WQhf
         RIN34fNothEhae3J247wrn6Iafr2jInczkrTtO84Vo3QWm6kwiOWWTc5k4H0b1AVn4or
         zBVFyqhqriq0Xgqft54u9bccsrUfnR75OGeoHipWOgQ6WE6l3LrQBNN/tn0J/hukwjBH
         t57Q==
X-Gm-Message-State: AOJu0Yx0pH5sRQT2aO6Nk9E65sitf9p1TvNQv3F9wlfZ6oQcqeTaxPpj
	+9m4boEyEBA2cN37JEvLDmwxqZj1eSEX4BLm+9kqlKAgGgVVe0NanNfpXXM/Ykm2STwHFYWSHlW
	T83U=
X-Gm-Gg: ASbGncvSPal+/oGIHTCjEI47v9E1MIRDFABKSlgN3Z6DVEQtmxxOOni3O5g8aCTN3s6
	iLv/MDHUssqhA+bGr5q8rsI0TuSZJEcfpddUOEoY3HnAF66phnaZEY26Ljgd4nCibPpyR2PlkJ5
	F7etGdhfPst+1AX/3jp21SLrpXIWLJ9yfOTWRXmMft2lWpJ+CRk5d7a4X1u2ZeqXmp0zeOXpEvf
	WbMQW1X+rC01yKDM10ftM7jj7KkAW+zysbUpFV3Q4ozrj4Io7Ljr+p5Amgvci5ZK5hpiv+a6B4m
	o14Cgsuz/WsUYOSoP6h6jMknm7yNdbGiLnIKVPhisZasbTi1o4u6pxCwxIjmJMY0zAkDyH+KgeB
	KLIU02lPxrgnC5FpHX0Yya1qYHPcCJXag3QsLgD4Drp2O6kLoyuzokPVU3+ggPDP3SxWQNmfd
X-Google-Smtp-Source: AGHT+IHao3yX0OThb65J8TEWHMXa8tEwBfiiL4o9QQhHnk5+6/rbRZy5QRuRIZCu/hzX50TMg1TTFw==
X-Received: by 2002:a05:6902:15cd:b0:e84:27a0:6ad0 with SMTP id 3f1490d57ef6-e8df110b514mr1442237276.7.1753446071539;
        Fri, 25 Jul 2025 05:21:11 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8ddf038c97sm1139095276.0.2025.07.25.05.21.11
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:21:11 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e8defed8130so342908276.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 05:21:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr308667137.17.1753440019738; Fri, 25 Jul 2025
 03:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:39:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1njv7qrL0LyhZsp=HVdxxDo2bA7FbCkMVqJ9R9qpg-0hMw@mail.gmail.com>
X-Gm-Features: Ac12FXzAeqGgOrEJjRR1J4ryO0U3L8RJWv4_H_TyT4RYPsIpmGY3ViSbTr41uno
Message-ID: <CAC=S1njv7qrL0LyhZsp=HVdxxDo2bA7FbCkMVqJ9R9qpg-0hMw@mail.gmail.com>
Subject: Re: [PATCH 37/38] arm64: dts: mediatek: mt8395-kontron-i1200: Fix
 MT6360 regulator nodes
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
X-CRM114-CacheID: sfid-20250725_052113_100994_145DA60D 
X-CRM114-Status: GOOD (  14.35  )
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

On Thu, Jul 24, 2025 at 5:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All of the MT6360 regulator nodes were wrong and would not probe
> because the regulator names are supposed to be lower case, but
> they are upper case in this devicetree.
>
> Change all nodes to be lower case to get working regulators.
>
> Fixes: 94aaf79a6af5 ("arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dt=
s b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> index 4985b65925a9..d16f545cbbb2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> @@ -352,7 +352,7 @@ regulator {
>                         LDO_VIN2-supply =3D <&vsys>;
>                         LDO_VIN3-supply =3D <&vsys>;
>
> -                       mt6360_buck1: BUCK1 {
> +                       mt6360_buck1: buck1 {
>                                 regulator-name =3D "emi_vdd2";
>                                 regulator-min-microvolt =3D <600000>;
>                                 regulator-max-microvolt =3D <1800000>;
> @@ -362,7 +362,7 @@ MT6360_OPMODE_LP
>                                 regulator-always-on;
>                         };
>
> -                       mt6360_buck2: BUCK2 {
> +                       mt6360_buck2: buck2 {
>                                 regulator-name =3D "emi_vddq";
>                                 regulator-min-microvolt =3D <300000>;
>                                 regulator-max-microvolt =3D <1300000>;
> @@ -372,7 +372,7 @@ MT6360_OPMODE_LP
>                                 regulator-always-on;
>                         };
>
> -                       mt6360_ldo1: LDO1 {
> +                       mt6360_ldo1: ldo1 {
>                                 regulator-name =3D "mt6360_ldo1"; /* Test=
 point */
>                                 regulator-min-microvolt =3D <1200000>;
>                                 regulator-max-microvolt =3D <3600000>;
> @@ -380,7 +380,7 @@ mt6360_ldo1: LDO1 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo2: LDO2 {
> +                       mt6360_ldo2: ldo2 {
>                                 regulator-name =3D "panel1_p1v8";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
> @@ -388,7 +388,7 @@ mt6360_ldo2: LDO2 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo3: LDO3 {
> +                       mt6360_ldo3: ldo3 {
>                                 regulator-name =3D "vmc_pmu";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <3300000>;
> @@ -396,7 +396,7 @@ mt6360_ldo3: LDO3 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo5: LDO5 {
> +                       mt6360_ldo5: ldo5 {
>                                 regulator-name =3D "vmch_pmu";
>                                 regulator-min-microvolt =3D <3300000>;
>                                 regulator-max-microvolt =3D <3300000>;
> @@ -404,7 +404,7 @@ mt6360_ldo5: LDO5 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo6: LDO6 {
> +                       mt6360_ldo6: ldo6 {
>                                 regulator-name =3D "mt6360_ldo6"; /* Test=
 point */
>                                 regulator-min-microvolt =3D <500000>;
>                                 regulator-max-microvolt =3D <2100000>;
> @@ -412,7 +412,7 @@ mt6360_ldo6: LDO6 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo7: LDO7 {
> +                       mt6360_ldo7: ldo7 {
>                                 regulator-name =3D "emi_vmddr_en";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
> --
> 2.50.1
>
>

