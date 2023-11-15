Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFCDC47071
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 03:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxR8SEff9QhQWGnC0bTicTu902xyqq/a50SrjOH4Vi4=; b=j6HliSNWD2nacl/pemMvtRXcKf
	Ll5GJlgA+/3D1wmwNRVgvYv/IkpthGbwvTxW2d/uO+Yyolpu7i1Xc63L0YzUCmxjLLbvdOE4ffijq
	F8n1dLr+8BNiJMq7cEWAcFOx9+AhYCVU6MNxIA4x+V/QK64BebzAYukrlLXTHVymMM3gzC8NQx0jY
	OIkXM9Nf9+ZLvKTsavCBF6ki48tVZ38MgKnfh4Iv6XEQ3tDFK16mamKCzAx/kp4orQ4JQl3RAbe+6
	WaWXYC5lSqZ9gMacC/O2gVnJLfPInq8boBUhcMkte6Qd5KmlQAoIUyDX3C22m7sgwfRadIkOteHXt
	IoalnqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r36UR-00HMKL-2H;
	Wed, 15 Nov 2023 03:22:55 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r36UP-00HMJK-1b
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 03:22:54 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso8999605e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Nov 2023 19:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700018569; x=1700623369; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxR8SEff9QhQWGnC0bTicTu902xyqq/a50SrjOH4Vi4=;
        b=Cf83xhR7mZL6kMGojEG1Y5IZvq1R9oZpXWE2K2kVsD0muJUL/MvwBtInZSJjYWRYo4
         5jUxyln9f8XiR+kTnwOeLJQ3YNzXHnwKQJyVmk+kMb6bnjgDH7rbF+eAC5WKT9MlV5K8
         PWlHZmk3Zd5UVCbmsX2OXtXe+XPFmLiQbu3uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018569; x=1700623369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxR8SEff9QhQWGnC0bTicTu902xyqq/a50SrjOH4Vi4=;
        b=ruH9Q7A4WABl0R6ZuhpH2Q1vi6rQNIRF/NqOW4uGTXqihQiAn373qpDC4Km1+rLTnK
         QOoWzbTgK0YAFKcka1VkbURoveLLpqJfwnY/wFr/0Rk4FiPknYPEGon1OhqfD1JpfaDr
         l0Bb/8JxVkaRpwP3Cr+81hK0lG/cX+t1PAlHyiDi5mrCforHfcgC80Go+p1c1IIoWebk
         at7hZ53GawibJ1X8ft+qQGUT0BuaHa0L4jdvGqV6QskIeC4pumW6+7gGpUuW43NT5oOz
         CB8aTxit+P56c/YtGIKmC7qFEjBT+eyqktPw41UCRf+gasntk76BYFEXbXwZHlXgEAfw
         DhoA==
X-Gm-Message-State: AOJu0Yw9fhA4dULLI5+iKJs5rirpjBd4FBDMcZzIibZbulXo3zxO7T3Z
	4MnKSiz889ImC4fCybN4pKyKWrK5mJ0O8fgOab7Rpg==
X-Google-Smtp-Source: AGHT+IH/sEG2Ucut35rGScW2osfDdxASphCbak+GNijQXM9mN/aThAmwkj5q5kBza+Bkt5p0XJPSi1hAi7h0K4LMw1k=
X-Received: by 2002:a05:6512:1107:b0:509:7141:fec with SMTP id
 l7-20020a056512110700b0050971410fecmr8866004lfg.48.1700018569194; Tue, 14 Nov
 2023 19:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20231114104353.1693966-1-treapking@chromium.org>
In-Reply-To: <20231114104353.1693966-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 15 Nov 2023 11:22:37 +0800
Message-ID: <CAGXv+5FaCBdwhnwQPWPpxUN3=MW9HeGnpRtsK7a0A=E0rAJDKQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: Add G2Touch touchscreen node
To: Pin-yen Lin <treapking@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_192253_575952_24E57A99 
X-CRM114-Status: GOOD (  13.47  )
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

On Tue, Nov 14, 2023 at 6:44=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Lenovo Ideapad C330 Chromebook (MTK) uses G2Touch touchscreen as a
> second source component.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> index bdcd35cecad9..0d6dbc36c352 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> @@ -29,6 +29,14 @@ touchscreen3: touchscreen@20 {
>                 interrupt-parent =3D <&pio>;
>                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
>         };
> +
> +       touchscreen4: touchscreen@40 {

The label likely isn't needed.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x40>;
> +               hid-descr-addr =3D <0x0001>;
> +               interrupt-parent =3D <&pio>;
> +               interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
> +       };
>  };
>
>  &i2c4 {
> --
> 2.42.0.869.gea05f2083d-goog
>

