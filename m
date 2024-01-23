Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB91FC47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 04:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZiWFNa696bYRV0aTpMTHBZfZZ8Fbva5ASueNEpSuTo=; b=UKVCR/6DCTM/KxhORnduiIGvKR
	F8cSqr2yQVn14xRATedemm0S3FHGtX6fc/tZOxovvGvvfmK6wrMAs4TMkJVsiF44CXzwnfG9Y3r/F
	PINzyNqSGvOFN4svPQcRQNW3RgBRSFweUM3KUttLCdSkFjm9lr8Mh3RVerZmlvstn4dpS6j/Pow5h
	aqtXkibVSkAww55Od8vWql+bVYIO5ThPL/U7pzVJ5oC00d6LmrjiR6zxcyf9JaZzvzqtNwPU9Ozko
	tDszWCN7S/+ap2Tl2MQe1zd+020XqCnjaPg0yHMez1lnYwwZp4Pll0G6EYlTCqh5C3V9OqzD26xup
	iLsw4VSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS80T-00F28q-2V;
	Tue, 23 Jan 2024 04:03:25 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS80Q-00F28A-1v
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jan 2024 04:03:24 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso45555401fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Jan 2024 20:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705982600; x=1706587400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZiWFNa696bYRV0aTpMTHBZfZZ8Fbva5ASueNEpSuTo=;
        b=iFJ3EtJUE22+5YArtXne93M3/xDPK9AQ5qCFUqCfgMAWYBPtr6alqWf5fOFvCuYRuK
         y2+lq5CjJ4MX/Z+YZ4Qdd3rEXyi73cT+JrWiOOBoagedxVKaoKT0/Xp+ZWUJkrPVV4ia
         8gGrvDBPqKysM8Bor5Z8vwxpUhWPWwA6YQHGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705982600; x=1706587400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZiWFNa696bYRV0aTpMTHBZfZZ8Fbva5ASueNEpSuTo=;
        b=Rn6bV2havXNYcHxYwrbbGSAJi7OupxZz/skWGJIy2lg/kU132fZLwEi8QZ4X3Oi1dc
         kego9Bvlao9xlBbzc96X8c3XYEzKTM7366aogEVePEVAWPbKcS9GfVx2KuS5jE7Jxycq
         ly5GLx2uX8Tedcxu1Rd+/4McPvetuACC+DtWotuJQnV8OSl+4f7daMYQkG2aYCJOQDL1
         TcYQVKRtK6sstcZZ0sw6zyALkYCtodLV/rxM4CGs6pbcX1t0Sd4rE7/ZHUYAlI1VcWmU
         TB+XEA7CJSo2bt/8+cORTyKTz1+zo/EtAbV8P0hVonBaqvH8J7VizgcXxOXaG9mJg8ne
         4ofg==
X-Gm-Message-State: AOJu0YxD3Vuezov8uzomPsD2nda3Tml5NEx+ViN+nfE0gKNSH97vFh/Z
	UYhO4GQ07P4mOWX1eyV8BuJlyOOG5DQKJ7Op8pdFdiDG0QgFosYwBF5CYSjgkyOcXfCzw+aYGca
	JcbCnfKjvFZgEGdWyj9+hjdwptPIE9ISjK0/w
X-Google-Smtp-Source: AGHT+IGiy9y9L53Ax5tTXs/dc2tT4NfqKH1k/Qj4AXIACAgYekrtU+BVkqbTaBWD6iDaDB+W8QdXO0quF0B5cBl9/58=
X-Received: by 2002:a2e:9112:0:b0:2cc:769e:723d with SMTP id
 m18-20020a2e9112000000b002cc769e723dmr2352566ljg.87.1705982599785; Mon, 22
 Jan 2024 20:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20231228105717.719624-1-yuanhsinte@chromium.org>
In-Reply-To: <20231228105717.719624-1-yuanhsinte@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 23 Jan 2024 12:03:08 +0800
Message-ID: <CAGXv+5H-mpXZ_0H_HchDWeTgx+4Nkxh6651DEs1C62mrXczTkA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] arm64: dts: mt8195-cherry-tomato: change
 watchdog reset boot flow
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_200322_634730_27E9E9F5 
X-CRM114-Status: GOOD (  17.39  )
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

+CC Nicolas

On Thu, Dec 28, 2023 at 6:57=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.o=
rg> wrote:
>
> The external output reset signal was originally disabled and sent from
> firmware. However, an unfixed bug in the firmware on tomato prevents
> the signal from being sent, causing the device to fail to boot. To fix
> this, enable external output reset signal to allow the device to reboot
> normally.
>
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Friendly ping?

Also wondering if you folks hit this, or if you haven't triggered the
watchdog at all.

ChenYu

> ---
>
> Changes in v2:
> - Limit the effect only on tomato.
>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts | 4 ++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/a=
rch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> index 2d5e8f371b6d..a82d716f10d4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> @@ -23,3 +23,7 @@ &sound {
>  &ts_10 {
>         status =3D "okay";
>  };
> +
> +&watchdog {
> +       /delete-property/ mediatek,disable-extrst;
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/a=
rch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> index 2586c32ce6e6..2fe20e0dad83 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> @@ -43,3 +43,7 @@ &sound {
>  &ts_10 {
>         status =3D "okay";
>  };
> +
> +&watchdog {
> +       /delete-property/ mediatek,disable-extrst;
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/a=
rch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> index f54f9477b99d..dd294ca98194 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> @@ -44,3 +44,7 @@ &sound {
>  &ts_10 {
>         status =3D "okay";
>  };
> +
> +&watchdog {
> +       /delete-property/ mediatek,disable-extrst;
> +};
> --
> 2.43.0.472.g3155946c3a-goog
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

