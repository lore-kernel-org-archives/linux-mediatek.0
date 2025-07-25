Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44FDC87FD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=; b=iZ0ZiTXcU6hRE5DwEr7P04Hxug
	4S81uz0PmkF6W2TjdZtFCRDgbcS32b+mtc/OI5Grfe1msn9C3L5/Ksb0KBhu0vzU0JU8w3A5ez9bZ
	2gk0h4klYp12+InsNhHEQn68OMwVc/YI5s+bpYQ/5KcsYeANaCE7g8ehwLgd7aCTf5B139fgarWsW
	zmEqTpxLIO3M8XFmpRIbsPlJz911EtMVzNk9/YhH1Vu8dUpbvFJH+mue3ezhooH6ojUibGF4bv56O
	6JUkEZtZtvuMbxhfOj7K3edO0jHm2zTHVnENuwbLGYEfABoqJXZJ85N9wjg+AmCaat0s3PYkpHavO
	zHU/YKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHNU-00000009nnI-1TIG;
	Fri, 25 Jul 2025 12:18:20 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufH61-00000009ljS-3Wtl
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 12:00:18 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-53140c33563so1322495e0c.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 05:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444817; x=1754049617; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
        b=MHoS7OV6zBn6gPg1+wvN6QwkFGXPC+QG2wJF4UBfhuq19LMlQcWgI9uoJih5P/aZxj
         ss6rVGcrhAvZc38V8Clc7Kjr5vzE6qNJt9VFBYZOzROQo6CynXCJlUnNrHgR8NLQKEws
         IPg13uDQPuS7PB+T2E5OXlYS0djONpICrwUws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444817; x=1754049617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
        b=J+15+903o98fDiThAUj6LXouTZTlDIn5T0gZtZMLT7jq24SN9LJf09UaSizkgILMWu
         WvHTIsmfufYkJD2DALGYVDAFyeOwkcmxLat2gd6hXoHhix8qMRhGnpm9qColzhWshBLl
         M2xxKFmcAjRvMXi2tTCtwkMYAamiLQTqkB2K0VVWjDDnd8I53Ys4kLLi0rtfBw/vwjpF
         ZrqUem2Bi+oSzmGcTRSPewiaEKFyEEZ22qaBIggjKCRc0mMldADQYajxZoto4bBx3wuv
         lK/bUFY9UiRhHtWgyTNuXRLsXV5Sb/jwRuVCRngdU2RMQMBfmk9kE2n9mizrGYgAhbCx
         YQVg==
X-Gm-Message-State: AOJu0YweQaTbaeMUN9+ib01o3vXkCgMhEV/MgoW8FpQoAlV7iz65LfsS
	d0YfyBcZ5LnqPKNhtbXcC1/ZXuBc3gzWOZU6ZZKbYSTOcAVcbCQecvCQVPvaKKE248t/7Otva9E
	3Dus=
X-Gm-Gg: ASbGncspOobenYigVWH4C5TWzc8/porGYeJf9bmKFRMZqi8C4J/9S+h4sbjkaXMacJ/
	AzOjYbkkawDzW4adIbfm+3QGaILSwIpy7hNTip38724vMKbhgqxcyX9bdE4Camx0LHyKuaFkI7K
	Jvf62NpWaetxeUoDEgkO5XmDKXzKKfIP3Ql1socsLPnykl06g2LdEblUhg9QSAcOn09uHDJ2a5g
	s9OWsHxgdh48gP6MY9z0ymBCLW1dh4nkRCdabow0nVpjpInaNdVYfoRET9+9iGJaePdaEFhnnS0
	ZuDIp3ekZTJr1aZiXMyxLv4ARenxccS8zj41D4l+ktOV1WSrZ4PxLaa3k1JVvANG3kTapO5aHFu
	tnD2exe5hatDm41w346BY/9a+3tkio/ZUaTE4M/lsxqvyCp8tvGSfucmzlUMyDQ==
X-Google-Smtp-Source: AGHT+IEjPADGjL/QODVpIequfGao/p+Tse5AG0dPrqyDS4Jt5xP+QbYpD0KlQLdUZgTI0Bs5nfB+KQ==
X-Received: by 2002:a05:6122:3107:b0:537:b126:bf07 with SMTP id 71dfb90a1353d-538db4f2640mr406184e0c.1.1753444816426;
        Fri, 25 Jul 2025 05:00:16 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-537bf605acbsm925776e0c.7.2025.07.25.05.00.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:00:16 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-53140c33563so1322486e0c.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 05:00:16 -0700 (PDT)
X-Received: by 2002:a05:6102:358c:b0:4e4:5df7:a10a with SMTP id
 ada2fe7eead31-4fa3fc6be93mr374132137.16.1753440996607; Fri, 25 Jul 2025
 03:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:55:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
X-Gm-Features: Ac12FXy6b-EYxcfTGxWYM-OfSnpWrsOFjS6YFWPk3kTV_ZIdvcSVvNebJ1JSwHk
Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
Subject: Re: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators,
 rtc, keys node names
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
X-CRM114-CacheID: sfid-20250725_050017_876486_3C4B0800 
X-CRM114-Status: GOOD (  13.69  )
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
> The node names for "pmic", "regulators", "rtc", and "keys" are
> dictated by the PMIC MFD binding: change those to adhere to it.
>
> Fixes: aef783f3e0ca ("arm64: dts: mediatek: Add MT6331 PMIC devicetree")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6331.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6331.dtsi
> index d89858c73ab1..243afbffa21f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> @@ -6,12 +6,12 @@
>  #include <dt-bindings/input/input.h>
>
>  &pwrap {
> -       pmic: mt6331 {
> +       pmic: pmic {
>                 compatible =3D "mediatek,mt6331";
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> -               mt6331regulator: mt6331regulator {
> +               mt6331regulator: regulators {
>                         compatible =3D "mediatek,mt6331-regulator";
>
>                         mt6331_vdvfs11_reg: buck-vdvfs11 {
> @@ -258,7 +258,7 @@ mt6331_vrtc_reg: ldo-vrtc {
>                         };
>
>                         mt6331_vdig18_reg: ldo-vdig18 {
> -                               regulator-name =3D "dvdd18_dig";
> +                               regulator-name =3D "vdig18";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
>                                 regulator-ramp-delay =3D <0>;
> @@ -266,11 +266,11 @@ mt6331_vdig18_reg: ldo-vdig18 {
>                         };
>                 };
>
> -               mt6331rtc: mt6331rtc {
> +               mt6331rtc: rtc {
>                         compatible =3D "mediatek,mt6331-rtc";
>                 };
>
> -               mt6331keys: mt6331keys {
> +               mt6331keys: keys {
>                         compatible =3D "mediatek,mt6331-keys";
>                         power {
>                                 linux,keycodes =3D <KEY_POWER>;
> --
> 2.50.1
>
>

