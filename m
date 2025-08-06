Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B94FC87FD1
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Aug 2025 06:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhtoojIstWLZMvAWUii3e0nHW5CIpKIzqhojK1vhx0E=; b=rlEIOoBjjQSDWG+chvLtQH12Fl
	2U4Mr8O7CvJOdseoAsTVGOS2er7zU/F3qmEzC1DIQlO1WDUteikd8BQoyIqRwol8CJKPb0dkxQ5oi
	n8YF6mAVkLIVwKoPmhq/lGGWQV0Elf/aPdxgMccj+qRk79wx6zR5OiWif5ehxtMZ0zt32m4O9qtDl
	OwNPo2e4jDnjj2BNUFHnTkQ4aeOWXBovY5dG/uynLM/eHt+51ySZuWBMeQYHk/1uEnyTWxwNR4Mwq
	quyQgbxLHKG/u2bEb0rpvW9CSgl2XnVt5tQ2lUxRabg107/a/OqqdaPlFMR+cZ3hfLkzZsPpiuGwi
	QBR7c9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXrZ-0000000EQZn-0Eau;
	Wed, 06 Aug 2025 06:43:01 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXng-0000000EQGC-3hIi
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Aug 2025 06:39:02 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55b7e35a452so7841848e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Aug 2025 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754462339; x=1755067139; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhtoojIstWLZMvAWUii3e0nHW5CIpKIzqhojK1vhx0E=;
        b=NYzXUstUhGucX0un5YsBSa8JYXCqz0ObVDYx2UrsNAxAbd7qXqB30tG5JMAV1UJROh
         miF2HTFz1N8JH02taqDWAK8LNBBOXnu2XobcthsvqSpHNUgCp+kuvLfJftVJiH/LP2M2
         B9T+lQpJ03FL71VHlcFzqfZZCX97aG69HiKWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754462339; x=1755067139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhtoojIstWLZMvAWUii3e0nHW5CIpKIzqhojK1vhx0E=;
        b=XgXA5D4ncNSzgE/cDKd6PaJttxwuI/L/QqVPjbZLPGULNrmwZZIxzOyeTsa302iYkJ
         ob/xynvkk09UvO4nWKZUp9ZX+felJ3zascC/IyhN3hQ4AGy0yhDaODm+FtKKcpPtNWlD
         zp1OLu8w3Sz/7NYV6QSnfexIeWaYz4lyqB0grVMGG6mIrtcy+yrbVhsfzUpOjMlqqqeK
         R1Xc3VRgtkHbulPJYXdsM6TpNTDMPn67Im7ccbYNxrDwcjdRdqyIX8AsqGxFTz0Ygq2y
         scUqfYqiJlajDB7u/8boCO6hZ73ZCLWLh5FbCBiTUxkls57Kq2hAFptsepUscx+F1Ji4
         M6+w==
X-Forwarded-Encrypted: i=1; AJvYcCX4VBFEOWp0uJgv907LqNfSEkA2sXabGVSukZCEp21lqh1EgDcCtpCNeeV6gaolHh2GX2RUM7WyUhiUfstwaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjYWMlh3zia1YsLGS0jyJpxABxZW17mRXnyTU6/qXUbhFafjFf
	I/tlmE87o2iOrMNReJ6dPyvXFn7uZmW9Gioy1JNOQyCsDHKYD3YsjwKP2+FuCP6RI6n/WjUV2Su
	uRiqnnoeskGVoCxi3XxXh5SsQ0ZpObPY9n5JEZ5eZ
X-Gm-Gg: ASbGncunilmssHUw4oiyKppGDi8GaKsEz1cBjdDX+xmYV9VpHlgASmkORFDY3JF/tgN
	hY+HsQ/uYwBfUjN7qkO4RD9icoGw59gPf79Q0JTsKH/M/SQu7TeJWAhPtR1zdlfTvW1uN57cNX0
	GdjXpXGb9JVBEIX6qPMKv9FMoKfnhlEmb9tKFgHt3HWbdwLXDSZdLcaRZLrIDV3yoB73AEqdHhG
	PotR+KDcl3WZ44U3L08HthQONYATLdj6eA=
X-Google-Smtp-Source: AGHT+IEQpBY1+GYkqQqfR5rfDKIpVNEsVsD4XjBG59L6bS42oOLB3npxd/OiMhM0pzS9tJDOxKoUlXs1gPu0gbIUws0=
X-Received: by 2002:a05:651c:1986:b0:332:5fd5:e3c7 with SMTP id
 38308e7fff4ca-33381426bb6mr5405841fa.33.1754462339071; Tue, 05 Aug 2025
 23:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com> <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 6 Aug 2025 14:38:47 +0800
X-Gm-Features: Ac12FXzbV3K2KVqpeLliCyv42tL4lMejc8rYQr4TjPtkAaTNfrGgDJMp31K_Lv0
Message-ID: <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, 
	Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_233900_952716_42210F14 
X-CRM114-Status: GOOD (  18.83  )
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

On Fri, Aug 1, 2025 at 7:18=E2=80=AFPM Julien Massot
<julien.massot@collabora.com> wrote:
>
> The properties `mediatek,pull-up-adv` and `mediatek,pull-down-adv`
> were using incorrect values like `<10>` and `<01>`. These values
> are parsed as decimal (10 and 1 respectively), not binary.
>
> However, the driver interprets these as bitfields:
>   - BIT(0): R0
>   - BIT(1): R1
>
> So valid values are:
>   - 0 =3D> no pull
>   - 1 =3D> enable R0
>   - 2 =3D> enable R1
>   - 3 =3D> enable R0 + R1
>
> Using `<10>` is invalid as it exceeds the accepted range.
> It was likely intended as binary `0b10` (i.e., `2`),
> to enable R1 only.
>
> This patch replaces incorrect values with the correct ones
> and removes the leading zero from `<01>` to avoid confusion
> with bitfield notation.
>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 22 +++++++++++---------=
--
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 400c61d1103561db6ee0fb2d2e1c157529d03206..02bdfdb8e53c87dba0ba0024e=
0c69fcee825552b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -574,19 +574,19 @@ pins-cmd-dat {
>                                  <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
>                         input-enable;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-up-adv =3D <01>;
> +                       mediatek,pull-up-adv =3D <1>;

I suggest we just convert them to the standard bias-* properties:

        bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;

>                 };
>
>                 pins-clk {
>                         pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-down-adv =3D <10>;
> +                       mediatek,pull-down-adv =3D <2>;

        bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;

and so on.

ChenYu

>                 };
>
>                 pins-rst {
>                         pinmux =3D <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-down-adv =3D <01>;
> +                       mediatek,pull-down-adv =3D <1>;
>                 };
>         };
>
> @@ -603,25 +603,25 @@ pins-cmd-dat {
>                                  <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
>                         input-enable;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-up-adv =3D <01>;
> +                       mediatek,pull-up-adv =3D <1>;
>                 };
>
>                 pins-clk {
>                         pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-down-adv =3D <10>;
> +                       mediatek,pull-down-adv =3D <2>;
>                 };
>
>                 pins-ds {
>                         pinmux =3D <PINMUX_GPIO131__FUNC_MSDC0_DSL>;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-down-adv =3D <10>;
> +                       mediatek,pull-down-adv =3D <2>;
>                 };
>
>                 pins-rst {
>                         pinmux =3D <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
>                         drive-strength =3D <MTK_DRIVE_14mA>;
> -                       mediatek,pull-up-adv =3D <01>;
> +                       mediatek,pull-up-adv =3D <1>;
>                 };
>         };
>
> @@ -633,13 +633,13 @@ pins-cmd-dat {
>                                  <PINMUX_GPIO33__FUNC_MSDC1_DAT2>,
>                                  <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
>                         input-enable;
> -                       mediatek,pull-up-adv =3D <10>;
> +                       mediatek,pull-up-adv =3D <2>;
>                 };
>
>                 pins-clk {
>                         pinmux =3D <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
>                         input-enable;
> -                       mediatek,pull-down-adv =3D <10>;
> +                       mediatek,pull-down-adv =3D <2>;
>                 };
>         };
>
> @@ -652,13 +652,13 @@ pins-cmd-dat {
>                                  <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
>                         drive-strength =3D <6>;
>                         input-enable;
> -                       mediatek,pull-up-adv =3D <10>;
> +                       mediatek,pull-up-adv =3D <2>;
>                 };
>
>                 pins-clk {
>                         pinmux =3D <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
>                         drive-strength =3D <8>;
> -                       mediatek,pull-down-adv =3D <10>;
> +                       mediatek,pull-down-adv =3D <2>;
>                         input-enable;
>                 };
>         };
>
> --
> 2.50.1
>

