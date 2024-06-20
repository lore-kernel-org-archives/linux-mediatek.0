Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF98C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMQv+SI/kH2fj+sCWOpuzWhC+RAihSFQwyEfWFTRJ0E=; b=1xobjN8XwJZ7uDH52QMCWIwUpC
	VPsB8pnSEUk3DkzpN+6sFR6ufSUMkDk/P4+DOkMuwfXhWoXEpjWHtnd0tJ4CDtGEjqWtI+WE89QmH
	4oYDSz0WOmtPPSHcgseLOaH163k2gcenZjqnKeyMQTC/R+rlnHzR8a8VkzNrIyWYmDWMnjkv9z6J1
	zyKmIK0SfhUdNT/KaJoHCXXNT/yULJMr6L+JR8Mr514175TAOXQjp8b5cYDHUTk4YeJht4uxtCbJq
	PNnw/VGTC8ZUnu9hbISD7ySWZ80lrk665KqJhNkQWkKRKS/PJIJaFym5yggSejvxvO1UI2F21cijn
	jOEAxB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEto-00000004YAu-0naQ;
	Thu, 20 Jun 2024 10:20:12 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEtl-00000004Y9u-0G5j
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 10:20:10 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ec002caeb3so8354581fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718878807; x=1719483607; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMQv+SI/kH2fj+sCWOpuzWhC+RAihSFQwyEfWFTRJ0E=;
        b=bWk5ydk605VjxS8K9R3cRJMdC8mYcwftkBT3QsOaS2wNc0UKNrxN8C1L19+b0PZQWz
         kK5s+1ID30xEeDysUY1p6+QMJf5K3n9r4nPRghikgC3eueZ+TcNqmWLBCqMbhouZitCQ
         dpqJ7iCvu8Oq8VO99kF9fPPn642yB2t4F3GjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718878807; x=1719483607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMQv+SI/kH2fj+sCWOpuzWhC+RAihSFQwyEfWFTRJ0E=;
        b=UAuCl/UV9I2pmxyXJNDFoR+ZuzDQw/a+PHg2nMl6fm/TJK7UuZ7OaFMYlTFk0RmWK3
         hyYv8dFFWBehmQfcOBS8Hondw6ffF/c/qVDyCLjwnWfDX1zfqyAMS+iFhIxyxBbEItYn
         3YUyC9Xfpfew+XK0izcjleDnzyvqWAReK92AwvveVOphFDfZNentvs/0RuwmAYAmMKZ2
         L/mbigSZB0lBqQn7fxMYPDO2aFa2PeNwRi0ktpOcGmjLE9h7YgDJP7ThjINOSjg5r7TK
         vFn0wByedhqk2ne2nAB0VE//r4tty693k8sNbRSQzE9NK6dNmlOCokSQxONtDslD9rZu
         2BTg==
X-Gm-Message-State: AOJu0YzgnC6Uy+gFD2ifgpI2U/8WwwzygIZ3quJWWVYfnF5CkxZ7+nQM
	Cemg3h8+auezPaWFBNGoZ+lvSe4se+KP0BvkisOtIAHk3Z7zk7Iv7s0BOix/ERzxSnAS16SbhXK
	4sm+QdVpo9GXYQ50XtcmBx/o2iMe/ps91lrsj
X-Google-Smtp-Source: AGHT+IFzCFhLF+GpdQivYBjTN44c3awT7QjJvjvCa4N6HMck3/8WvClS9kMnKrGjmoVAcGvXMshNVwpxInBhTRdLn5g=
X-Received: by 2002:a2e:8811:0:b0:2eb:e9cf:e179 with SMTP id
 38308e7fff4ca-2ec3ce9419fmr34233601fa.21.1718878807358; Thu, 20 Jun 2024
 03:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240620101656.1096374-1-angelogioacchino.delregno@collabora.com> <20240620101656.1096374-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240620101656.1096374-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 20 Jun 2024 18:19:56 +0800
Message-ID: <CAGXv+5GLCrQzxGFSuReD77CLBa-w4=1So8qdbPm_1nohKOOnpw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: mediatek: Declare drive-strength numerically
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_032009_204834_A7EE42D0 
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

On Thu, Jun 20, 2024 at 6:17=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On some devicetrees, the drive-strength property gets assigned a
> MTK_DRIVE_(x)_mA definition, which matches with (x).
>
> For example, MTK_DRIVE_8mA equals to 8 and MTK_DRIVE_30mA equals
> to 30.
>
> Also keeping in mind that the drive-strength property is, by
> (binding) definition, taking a number in milliamperes unit,
> change all devicetrees to avoid the usage of any MTK_DRIVE_(x)
> definition.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  arch/arm/boot/dts/mediatek/mt2701-evb.dts |  2 +-
>  arch/arm/boot/dts/mediatek/mt7623.dtsi    | 18 +++++++++---------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/mediatek/mt2701-evb.dts b/arch/arm/boot/dt=
s/mediatek/mt2701-evb.dts
> index 9c7325f18933..4c76366aa938 100644
> --- a/arch/arm/boot/dts/mediatek/mt2701-evb.dts
> +++ b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
> @@ -231,7 +231,7 @@ pins1 {
>                                  <MT2701_PIN_238_EXT_SDIO1__FUNC_EXT_SDIO=
1>,
>                                  <MT2701_PIN_237_EXT_SDIO2__FUNC_EXT_SDIO=
2>,
>                                  <MT2701_PIN_236_EXT_SDIO3__FUNC_EXT_SDIO=
3>;
> -                       drive-strength =3D <MTK_DRIVE_4mA>;
> +                       drive-strength =3D <4>;
>                         bias-pull-up;
>                 };
>         };
> diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/m=
ediatek/mt7623.dtsi
> index f0b4a09004b3..814586abc297 100644
> --- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
> @@ -1143,13 +1143,13 @@ pins-cmd-dat {
>                                  <MT7623_PIN_121_MSDC0_DAT0_FUNC_MSDC0_DA=
T0>,
>                                  <MT7623_PIN_116_MSDC0_CMD_FUNC_MSDC0_CMD=
>;
>                         input-enable;
> -                       drive-strength =3D <MTK_DRIVE_2mA>;
> +                       drive-strength =3D <2>;
>                         bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;
>                 };
>
>                 pins-clk {
>                         pinmux =3D <MT7623_PIN_117_MSDC0_CLK_FUNC_MSDC0_C=
LK>;
> -                       drive-strength =3D <MTK_DRIVE_2mA>;
> +                       drive-strength =3D <2>;
>                         bias-pull-down =3D <MTK_PUPD_SET_R1R0_01>;
>                 };
>
> @@ -1167,14 +1167,14 @@ pins-cmd-dat {
>                                  <MT7623_PIN_110_MSDC1_DAT3_FUNC_MSDC1_DA=
T3>,
>                                  <MT7623_PIN_105_MSDC1_CMD_FUNC_MSDC1_CMD=
>;
>                         input-enable;
> -                       drive-strength =3D <MTK_DRIVE_4mA>;
> +                       drive-strength =3D <4>;
>                         bias-pull-up =3D <MTK_PUPD_SET_R1R0_10>;
>                 };
>
>                 pins-clk {
>                         pinmux =3D <MT7623_PIN_106_MSDC1_CLK_FUNC_MSDC1_C=
LK>;
>                         bias-pull-down;
> -                       drive-strength =3D <MTK_DRIVE_4mA>;
> +                       drive-strength =3D <4>;
>                 };
>
>                 pins-wp {
> @@ -1197,13 +1197,13 @@ pins-cmd-dat {
>                                  <MT7623_PIN_110_MSDC1_DAT3_FUNC_MSDC1_DA=
T3>,
>                                  <MT7623_PIN_105_MSDC1_CMD_FUNC_MSDC1_CMD=
>;
>                         input-enable;
> -                       drive-strength =3D <MTK_DRIVE_4mA>;
> +                       drive-strength =3D <4>;
>                         bias-pull-up =3D <MTK_PUPD_SET_R1R0_10>;
>                 };
>
>                 pins-clk {
>                         pinmux =3D <MT7623_PIN_106_MSDC1_CLK_FUNC_MSDC1_C=
LK>;
> -                       drive-strength =3D <MTK_DRIVE_4mA>;
> +                       drive-strength =3D <4>;
>                         bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
>                 };
>         };
> @@ -1211,7 +1211,7 @@ pins-clk {
>         nand_pins_default: nanddefault {
>                 pins-ale {
>                         pinmux =3D <MT7623_PIN_116_MSDC0_CMD_FUNC_NALE>;
> -                       drive-strength =3D <MTK_DRIVE_8mA>;
> +                       drive-strength =3D <8>;
>                         bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
>                 };
>
> @@ -1226,13 +1226,13 @@ pins-dat {
>                                  <MT7623_PIN_115_MSDC0_RSTB_FUNC_NLD8>,
>                                  <MT7623_PIN_119_MSDC0_DAT2_FUNC_NLD2>;
>                         input-enable;
> -                       drive-strength =3D <MTK_DRIVE_8mA>;
> +                       drive-strength =3D <8>;
>                         bias-pull-up;
>                 };
>
>                 pins-we {
>                         pinmux =3D <MT7623_PIN_117_MSDC0_CLK_FUNC_NWEB>;
> -                       drive-strength =3D <MTK_DRIVE_8mA>;
> +                       drive-strength =3D <8>;
>                         bias-pull-up =3D <MTK_PUPD_SET_R1R0_10>;
>                 };
>         };
> --
> 2.45.2
>
>

