Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404F0D0BB49
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 04:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXHBkD5lHjgDpSqAIuvzM4kWXZrUfO6y78LQBr3izWA=; b=31ZgqUas39LGRJ05GHQ/YoLfMs
	QTmMLor46RX1gxEOr3iNiQdf3v/pqaAdD8ggkR2rwiOn7L1RHIH/QMaQrRwj2P3JiEiOAcS31KG1y
	1Sfqoy7QqKb/0jxnka5DKZz63TckDLWPnTl4u9RL93jvfD9lO9Zzon8g/j8AGHB98ej7LAl67lTYo
	F9retkHkROOg6uZuw68TxRXNnDu9D1KR0PyLfbfrWqNxv1Mdle2iXyPK9GZaE8FQZCCwzUHFllvIj
	cccy+cbFiYRQ65rvDMyRsKr26rAc3vFTLEPwtwMTzBerNViB1QWF4Xqw//W5fHE9mMonpNKVv5HAC
	X3eqcguQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3pXS-0000000GiKq-0cAY;
	Thu, 24 Oct 2024 04:33:34 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3pVu-0000000GiB0-0qUj
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 04:31:59 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f7606199so553856e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 21:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729744315; x=1730349115; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXHBkD5lHjgDpSqAIuvzM4kWXZrUfO6y78LQBr3izWA=;
        b=U5Qe312nsHE00K20pJ97pYCt04LntAniRWWKT9zMwy3EAOQowXeBR5EkTb2YkYARh6
         AbR5SN3whNzObCYHHT/MFqpZa3/YIgy68/d1RhoqFkf8pLEZNamiJNRLDGl/eyV6rBM+
         pmMkb3Uo8GDwKs/AlXRHFw1nPgY/UaDUlDGCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729744315; x=1730349115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXHBkD5lHjgDpSqAIuvzM4kWXZrUfO6y78LQBr3izWA=;
        b=v79Cx5rN4RxLVAIVlmbSr9Mz+GzjR/p/G0dpXp2x2U+8CjjeCPko7/Gq0zrNgCR5iH
         258Ln7icDCd9+XYRvOIzSLlCBq+XF8cl7WhRM23i5ROsX/jYwAJ2/2QwC0leBkNyQuoZ
         EX5c472/T3IlYeq3gwauq450lbODWMKeZgNpK5IgGrpH3Bd4jXrpHid37FzU1um65M7h
         5r4b35zWw+nXEx7fGG3tYXQnLiXPMwmrNaE+gTtoHyWt2JVnLshvKmNVHta0BzG+ZY8x
         zl7v8Rm8SdEChYsjW1SG7U21+K1eG4biBeb5oo684HqeGBYgLfUS/+Je7ErOijr/gPX5
         zjzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx30hfNp56BAyt2YwfH4+/MhFhorjitcrBp/ytUgSwCXKTLySl8f9Rsvoy+6nGGmsGEOoiYB8H6Exios4fWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwfdv/EPZgwZlSQB1LD3GlUH6dmDb2HvifUQVJqRg43X8xPFxN
	n1+bIUlcw5DKt6zimCrDbHlN058IBelFBabTQUxyEWaM7bVio6wOHZgg3tkMEBGEizWvTzHQbmi
	7mgQHn9Wo3sVuvL6/3pCpO32KBEDgdnfeTKLc
X-Google-Smtp-Source: AGHT+IHXDBEMaX7ic839HhtSb4X50NJuUWp4GLOIZefhwLSR4kBcZE77mUD9AbXS9mfI98mMdm40M834lvETM/6lm2k=
X-Received: by 2002:a05:6512:3a83:b0:53a:1a81:f006 with SMTP id
 2adb3069b0e04-53b1a34084dmr2238654e87.31.1729744315273; Wed, 23 Oct 2024
 21:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240702145102.46953-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240702145102.46953-1-krzysztof.kozlowski@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Oct 2024 12:31:43 +0800
Message-ID: <CAGXv+5HSZfr14K1sGky4g9Sik987DAisH7KTZn9v_svOwF+y6A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui: align thermal node
 names with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_213158_288972_E9E82683 
X-CRM114-Status: GOOD (  14.66  )
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

On Tue, Jul 2, 2024 at 10:51=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Bindings expect thermal zones node name to follow certain pattern.
> This fixes dtbs_check warning:
>
>   mt8183-kukui-jacuzzi-burnet.dtb: thermal-zones: 'tboard1', 'tboard2'
>     do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-therm=
al$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

This seems to have been sitting for a long time. Angelo, can you pick it up=
?


> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 6345e969efae..3aea2643f21c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -974,13 +974,13 @@ &ssusb {
>  };
>
>  &thermal_zones {
> -       tboard1 {
> +       tboard1-thermal {
>                 polling-delay =3D <1000>; /* milliseconds */
>                 polling-delay-passive =3D <0>; /* milliseconds */
>                 thermal-sensors =3D <&tboard_thermistor1>;
>         };
>
> -       tboard2 {
> +       tboard2-thermal {
>                 polling-delay =3D <1000>; /* milliseconds */
>                 polling-delay-passive =3D <0>; /* milliseconds */
>                 thermal-sensors =3D <&tboard_thermistor2>;
> --
> 2.43.0
>
>

