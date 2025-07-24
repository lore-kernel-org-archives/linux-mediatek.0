Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB70C83F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 10:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UomwMYm6V80ZuZPrz7YKXe0vLuxIpqX7vRa+Pl5FCU8=; b=mV+uS7nYtKYcFa
	Yn0iQ79xNW1N4F9zVYO/8Jtxr0eXkxizp/NIsDiDOmrRNN3I8UoVcVoxXQoc6PXtEf+awAB2dJyrF
	QE1AeDE/CaKr9D6B5xabTvcWbf7bsY+a+9/9GCcsPm5EQ5618HlVYt9LAqM1PS6VbCvnEO3fjkDta
	Bsuni/dpcUi+C/chRzb1USJOB4ZWcIWu5LNYkatUDR/O5evq+uuN51i4JTIw/jVl7fDzIC14TeeOh
	fFY1wv8Trp7yaWseAVWWmQYbl1HOSmElssBkwuh7/czxA11vGTnmaWI1xeRGZkPx6mhjaJDx3hJSW
	oPsY+/EudfW29/9Og1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetY2-00000007G0u-0aXT;
	Thu, 24 Jul 2025 10:51:38 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesHL-000000072uR-1YJN
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 09:30:20 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553d52cb80dso893175e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753349418; x=1753954218; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UomwMYm6V80ZuZPrz7YKXe0vLuxIpqX7vRa+Pl5FCU8=;
        b=PpYfRzD6dzoZhyzpPgIgzNrBDMh4I8CknrDOQ/OXvO8MlfbCnycPNzzkw/I24irjuy
         87fKpVpEVU8D2Wh6LwGJ2k4KX0KQDnU675gge4bhpoVJg5ToWCuKpnhaLA7c5PxeJqJJ
         pdQsxn9NtBFLvPbjb8MWvYnlCS8BFM0lfYnfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349418; x=1753954218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UomwMYm6V80ZuZPrz7YKXe0vLuxIpqX7vRa+Pl5FCU8=;
        b=l4GT/UOOUw9Hvxs+Pd3i77tGqz71ltIeMV+t4b6tGIoJZbCGYq2rM5LqUFipDIDqvv
         MhbY5+ObU4VJMrVvtGnDd7RP+Qr2ey6uFHQ5L4xcn1ffrMuwQE5W6nbzw5wfoCcM2lNv
         qCHtuyvEDUQJN6d6XrC4ulYrudBxV31qyJjiPhCyFlQ/+jA1UQ/SdiFouHBx2d1PtNb4
         J/aROtPBf+t0P9X2A0c6rSR4SpuVSBsDyz3iKq9aqDR/AN3rDwQaYvL6oF8ZyDkL8nSR
         q/QJh5jh7LIsRaZiSi9PVTprwpHrKqbdmrzmA0uRBeeZ8esy8cGMAicTreA7onB2StxC
         +5ZA==
X-Gm-Message-State: AOJu0Ywen5IHX8hwUcPHqs0HHiKtM+pir3IbvgFb+ZiwIz0UtLESvytd
	V8I3v+pmAlIrsfOyBqP3+vvS8Kl24Ngm90NVlFgl24Mmg+HRVubSdJBpnIqU/4/hK12DFC/J+Ao
	gRwmD/v402SdUU1fAzRcsprt6+Jf6GW2WgQsQ4f4h
X-Gm-Gg: ASbGncvknm+4YNA84x0UkuGSMYg0xTDuiIKU2gvTXx28a8GEngNGVYo8PcPl1qF5ZE6
	eJeZNKh1meK8s93MbwkIB0aKWdRWFxJA2jPKxRkgNNdstnOM4zf2dEu54RgNhOCmmogD+/w2EyP
	RxGuvZJ7x4Q5HUovRydanMlxLJLim8ABGB3+3ph1Zaxx5x8wp6fAoFdT3GMhXVofvs+SvD/AP6D
	qkRlPD8OMwX4lfix4zZUwaw+mBWct2UBQiTV+q0/A5i7Q==
X-Google-Smtp-Source: AGHT+IH1lXhOoKFIGLzswAaXQ/xdrKCcLg4Bs+hSUU/wAe3mRs3pt6lfFpYUUkDOjisZO/3IZcyl3MPX+Jll/FYr+/8=
X-Received: by 2002:a05:6512:2c87:b0:55a:4e67:7cdb with SMTP id
 2adb3069b0e04-55b5589a412mr400418e87.18.1753349417507; Thu, 24 Jul 2025
 02:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-23-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-23-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:30:06 +0800
X-Gm-Features: Ac12FXxWUOXitKh1quEjvg3RMxamDaOT0bnXe7uMSX2DfmXQwXv_3I70hIvhN2Q
Message-ID: <CAGXv+5GBq5CqHAHWLMsZLU=NYVurAQZBgknsvOZoK_XhyUfxew@mail.gmail.com>
Subject: Re: [PATCH 22/38] arm64: dts: mediatek: Fix node name for SYSIRQ
 controller on all SoCs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_023019_434725_4FC4A7B4 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, herbert@gondor.apana.org.au, eugen.hristev@linaro.org, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, kishon@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 24, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The sysirq has "intpol-controller" as node name, but being this an
> interrupt controller, it needs to be named "interrupt-controller"
> as per what the bindings (correctly) expect.
>
> This commit brings no functional changes, but fixes a dtbs_check
> warning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6755.dtsi | 2 +-
>  arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi | 2 +-
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6755.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6755.dtsi
> index b55d3fac9bd4..8da5c0a56a02 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6755.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
> @@ -98,7 +98,7 @@ timer {
>                              (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW=
)>;
>         };
>
> -       sysirq: intpol-controller@10200620 {
> +       sysirq: interrupt-controller@10200620 {
>                 compatible =3D "mediatek,mt6755-sysirq",
>                              "mediatek,mt6577-sysirq";
>                 interrupt-controller;
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6779.dtsi
> index 5c579e88e749..70f3375916e8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -138,7 +138,7 @@ ppi_cluster1: interrupt-partition-1 {
>
>                 };
>
> -               sysirq: intpol-controller@c53a650 {
> +               sysirq: interrupt-controller@c53a650 {
>                         compatible =3D "mediatek,mt6779-sysirq",
>                                      "mediatek,mt6577-sysirq";
>                         interrupt-controller;
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6795.dtsi
> index 38f65aad2802..58833e5135c8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -404,7 +404,7 @@ pwrap: pwrap@1000d000 {
>                         clock-names =3D "spi", "wrap";
>                 };
>
> -               sysirq: intpol-controller@10200620 {
> +               sysirq: interrupt-controller@10200620 {
>                         compatible =3D "mediatek,mt6795-sysirq",
>                                      "mediatek,mt6577-sysirq";
>                         interrupt-controller;
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6797.dtsi
> index f2d93bf6a055..8ac98a378fd6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -228,7 +228,7 @@ apmixedsys: apmixed@1000c000 {
>                 #clock-cells =3D <1>;
>         };
>
> -       sysirq: intpol-controller@10200620 {
> +       sysirq: interrupt-controller@10200620 {
>                 compatible =3D "mediatek,mt6797-sysirq",
>                              "mediatek,mt6577-sysirq";
>                 interrupt-controller;
> --
> 2.50.1
>

