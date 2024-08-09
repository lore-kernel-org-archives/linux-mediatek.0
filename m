Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD39C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOhlBCGx3wgliIklN4sJ6vIsr9hRttzR53fydIf4y5g=; b=XXtQKHUtkl/DqjgJgOW0Wvknlm
	XvhpJC921JQ8CzomEAmq4OWCa1mRD4jvcFNquBpv79z8087hetyDqqwOz8bm8jy8re0dcs5ZPrYUF
	qiQ0IkzWQVD1566Wi3ULCtD7FybL16wmkyOwYgyrqXukm6ccbXkuJ00Y84pt2I21svZnS12rfGHrV
	sbpLkZCg+z6ccT+Oglsw4cLECQc6dFXF9xP/5VqQp/F2Y8hn+cXt9cRphbeAeFftekYitxhkcEf55
	3coeCdAe2HdOuN/7u9oQ4sEGF5Jd9Xo88102+iAkzFyFHpqOPpr3ioMJI7lwg/d8t68L+xyiem0QW
	UUBC7R8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scKRa-0000000AcII-2n1A;
	Fri, 09 Aug 2024 07:53:50 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scKRV-0000000AcHZ-4340
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Aug 2024 07:53:49 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52f042c15e3so1519618e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Aug 2024 00:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723190024; x=1723794824; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOhlBCGx3wgliIklN4sJ6vIsr9hRttzR53fydIf4y5g=;
        b=IeIxU9rFgzhaTMFFP3aWcmrY/PnqsK+rWljtLKdFHyofvsNQCVYuqIRp7dynXkxsVY
         /l7unCWuscmMlCgXqTWUzkfYv3kynb9uElskWs5qOiAshaJ7b+4+cYKZfL25hLtxjgbh
         811YnzUFW1mcnSo1CvSujtCcraUMgfip/bbxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723190024; x=1723794824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOhlBCGx3wgliIklN4sJ6vIsr9hRttzR53fydIf4y5g=;
        b=gVr+ovz8FJ/JXSc8xuEBVAASPu+N6wWb+Odpp2IrXEjmYSJuLEFF7rhbCRr47qXJ6q
         mXMAKISEyehZjPA7vIH9kaa/8A1/0O7PHo33FbbHOIcgLA+FMQHf5QJacT/ybzUUlDw6
         ZX9tzC/jr4qj53anw7yAxrQ3cZ3yDulZ4J2Infnxz8RA9y9Lc5rL5KML/+zhTtm77dNd
         9EyUhPswRXajwdaJ7OEOyUYJBxytfsVAWcmJgaVe0/yvDeL0hPyU2RMPk0luXeyu3yzC
         EyGxmOqX8/oj6fTJ4UIAZfmndu0DuW6N36hIg1jFYtlNnR3nHimUDFTxAZNBmM8v/5iN
         zdMw==
X-Forwarded-Encrypted: i=1; AJvYcCW4I5iDgew5DlR+waHwQHZaZ70qG7+eR4HOTKGf8KVeMrmi8fqWidBWwxxwGaFZeWDKDU9k+OpCwcDaL6/P4Gvzmwo35yndPgIFwUT4hFNrabKS
X-Gm-Message-State: AOJu0Yw5eZqe5uP6fM5KGTRzio3tnLtfe/Gs0lJ0hXFEX5ycBN9pGBCk
	R2cAhXwwvPAzV5EBtogen39bJHqvTjol4tXpNKsgpxBkTDSisu5Ls8yCrmtoysXH9Iq+dPXY16j
	9TfpQZjY5WTi1QWiIneh9uAH11vRE4jW6WEIa
X-Google-Smtp-Source: AGHT+IH6ychLenqDgOvMBzDQh2JMkFFn21GgkZRTJgCiT8vrbwbMMfUcAwkW9CQQCIA8Bgb7QPT8OmlAiGtufGVI5DI=
X-Received: by 2002:a05:6512:3f05:b0:52f:cc9e:449d with SMTP id
 2adb3069b0e04-530e5d210abmr1449084e87.3.1723190023966; Fri, 09 Aug 2024
 00:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240808-kukui_trip-v1-1-6a73c8e0b79a@chromium.org>
In-Reply-To: <20240808-kukui_trip-v1-1-6a73c8e0b79a@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 9 Aug 2024 15:53:32 +0800
Message-ID: <CAGXv+5GgmRiqkZdQo--XciuEgAvyOiR+XYWO=dZWziZ-pJzPDQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183-kukui: Add trip points to each thermal zone
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_005347_451104_76DBD914 
X-CRM114-Status: GOOD (  19.13  )
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

On Thu, Aug 8, 2024 at 5:09=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.or=
g> wrote:
>
> Add trip points to the tboard1 and tboard2 thermal zones to ensure they
> are registered successfully.

The position of tboard_thermistor2 is different between end devices.
And both sensors are outside of the SoC. Having such a high trip point
probably doesn't help with keeping the device or user safe.

The SoC itself also has internal sensors which would be more suited for
this.

So I think it makes more sense to have the kernel not require trip points
for thermal zones, matching what the thermal binding says. I resurrected
an old patch for this [1].


ChenYu

[1] https://lore.kernel.org/linux-arm-kernel/20240809070822.2835371-1-wenst=
@chromium.org/

> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 26 ++++++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 6345e969efae..1593ea14f81f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -978,12 +978,38 @@ tboard1 {
>                 polling-delay =3D <1000>; /* milliseconds */
>                 polling-delay-passive =3D <0>; /* milliseconds */
>                 thermal-sensors =3D <&tboard_thermistor1>;
> +               trips {
> +                       tboard1_alert: trip-alert {
> +                               temperature =3D <85000>;
> +                               hysteresis =3D <2000>;
> +                               type =3D "passive";
> +                       };
> +
> +                       tboard1_crit: trip-crit {
> +                               temperature =3D <100000>;
> +                               hysteresis =3D <2000>;
> +                               type =3D "critical";
> +                       };
> +               };
>         };
>
>         tboard2 {
>                 polling-delay =3D <1000>; /* milliseconds */
>                 polling-delay-passive =3D <0>; /* milliseconds */
>                 thermal-sensors =3D <&tboard_thermistor2>;
> +               trips {
> +                       tboard2_alert: trip-alert {
> +                               temperature =3D <85000>;
> +                               hysteresis =3D <2000>;
> +                               type =3D "passive";
> +                       };
> +
> +                       tboard2_crit: trip-crit {
> +                               temperature =3D <100000>;
> +                               hysteresis =3D <2000>;
> +                               type =3D "critical";
> +                       };
> +               };
>         };
>  };
>
>
> ---
> base-commit: 21b136cc63d2a9ddd60d4699552b69c214b32964
> change-id: 20240801-kukui_trip-6625c0a54c50
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>
>

