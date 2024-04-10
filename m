Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5639CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 12:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8P5WqVrHeK2zaTvdI8Gl1QefEqSb/GOhR4ipVI1tvQ=; b=R0g+ReOcvw2WIrYJ8+zBKW2qqF
	gO4fV2Am7hWLBHQj0ONmdJrBErQTmD70mv3gEdJZNRzh4aoJl+9lexmQgzNPN/AhAmBJrkCT+n9h2
	6r3i5be+XuKnegIkDJ037frnz/CFy8YkXc19B+oXl9WmTfDZttWieNpVBgZ9N/A32hcqWcTnD+MQt
	XjN4prTQMXfgzRfxj68g9fH0+matDh24dA6Utcj+ZvP9klaCu+ITH9OdSxQjhyeP1S8yRYpbeRJ/0
	ztb75fRcJzWqu8cQNqFnJYsrYW56mGp3Ug5/9nepuXJF4jFls6c479I1twwEK2HBeE8mTqz5U3JD2
	E4yg0qgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWji-00000006nwX-0Zgp;
	Wed, 10 Apr 2024 12:07:30 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWje-00000006npS-0sXL
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 12:07:28 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a51c8274403so466042866b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 05:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712750831; x=1713355631; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8P5WqVrHeK2zaTvdI8Gl1QefEqSb/GOhR4ipVI1tvQ=;
        b=H+cbN1L4m56+yFHwN3NzF0E6tE/nyUaFXsO6J7Q/JjcGcT9+baPYUFkcF5c+sZgWwF
         IToNBdyPG7mem2iz/LfWDkGe7gzgksERM5ZJAU7KRIYBI+iHqf8m0QIO5/MSB2KYR3Ka
         RP0TxRn4F/XuxxedLPqv7q+ByqlgbaCGUG6b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712750831; x=1713355631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8P5WqVrHeK2zaTvdI8Gl1QefEqSb/GOhR4ipVI1tvQ=;
        b=CHJzJgpHibnY8upONNOoY4BEcGFxSV1MVmpGKaCMign/1RN5Hdg6uw+i7TlIqmtpGg
         FVAh/Jdcm2UcDK8LWYXmTUNWvP4hj51ZyRvO70SZmKjHzRHBoo3YD+eEdZqNhPr5BQWH
         2domF7D85hGHTWUPphwUDY2lquNy418bWcM34rYiiClPVZ/cftdknt0UIqIreUXWCKkG
         zpTwyMQnxKUITUTx9H/Vw0G6GJzLy62s8ZV7q+szP7zBpjbd0Jntv+oEyq4SdY07C/sf
         jUmPkKyrR6AtwS19R8QTEfKfFwx0tlBayOPjELSVEZcePvVJ1N16Z0rwftpD1Bns4e9U
         8DuA==
X-Forwarded-Encrypted: i=1; AJvYcCVBWL3rjgpbLckRmVA33DP+UuhIC33T+O+EEY6P0yE9iLq8vvhqjWjEyw65IEFBLaX3nCsSzUFkalVwBUaRSiouWroMh+nXqNRYcBdhBpvmh+ZL
X-Gm-Message-State: AOJu0YxlrK4p2eGB6Z1WgkAGEXfyQRXCo2MctveUae70bxVvdFN+kqLf
	ys8vdAxXtRY64hx0bOrcTmufxpPU95ak9BT9+5WvIO9doHWUpAnvk4IVSJPOZ49Js6JewqO3teP
	0ag==
X-Google-Smtp-Source: AGHT+IEPK9YnFt5IIdWb/ybyVpeUOFwTBIozNMbZjTTh8pPypAFmUfyIQ21dlj1WTZWf4L/fhWtaOg==
X-Received: by 2002:a17:906:7192:b0:a51:c191:c0a0 with SMTP id h18-20020a170906719200b00a51c191c0a0mr1233867ejk.43.1712750830816;
        Wed, 10 Apr 2024 05:07:10 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id i19-20020a170906699300b00a4576dd5a8csm6789645ejr.201.2024.04.10.05.07.10
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:07:10 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e6f4ee104so2921593a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 05:07:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWg/NSpgvvwmIQDzBEZ9WPNNl86tVDY1K7z17tX7AG2/TIdpnRtOGm8PEIYG2WyJ8FezBPCu3uEduW5Lem9Xz9o4BUrge1iGso0JiyHfiG+DzSK
X-Received: by 2002:a17:907:7202:b0:a51:9d21:2a1e with SMTP id
 dr2-20020a170907720200b00a519d212a1emr1872195ejc.73.1712750829549; Wed, 10
 Apr 2024 05:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240410-upstream-torvalds-master-v2-1-679777847b63@chromium.org> <d1dafc46-9b14-4752-822c-86cbabdcfb8b@collabora.com>
In-Reply-To: <d1dafc46-9b14-4752-822c-86cbabdcfb8b@collabora.com>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 10 Apr 2024 20:06:33 +0800
X-Gmail-Original-Message-ID: <CAHc4DNLrU=QVWODOzHXW16Ko1V=W31zkSHOi7rztiJMOMDcKqg@mail.gmail.com>
Message-ID: <CAHc4DNLrU=QVWODOzHXW16Ko1V=W31zkSHOi7rztiJMOMDcKqg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8192: Add missing trip point
 in thermal zone
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	Balsam CHIHI <bchihi@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_050726_296793_EAC9D9A3 
X-CRM114-Status: GOOD (  28.56  )
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

Hi Angelo,

1. 68=C2=B0C is provided by MediaTek previously in downstream
2. I think sustainable power will be estimated by
estimate_sustainable_power in drivers/thermal/gov_power_allocator.c,
but I'll ask MediaTek if they can provide the precise value.
3. Sure. I'll do it in v3 after I check 2. with MediaTek

Regards,
Hsin-Te

On Wed, Apr 10, 2024 at 5:50=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 10/04/24 10:40, Hsin-Te Yuan ha scritto:
> > According to Documentation/driver-api/thermal/power_allocator.rst, ther=
e
> > should be two passive trip points. Adding the missing trip point to
> > ensure that the governor works optimally.
> >
> > Fixes: c7a728051f4e ("arm64: dts: mediatek: mt8192: Add thermal nodes a=
nd thermal zones")
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
>
> That's better - but while I can agree about setting a general temperature
> for that, I still have a few questions and requests:
>
> 1. Why is this 68=C2=B0C? Was that value provided by MediaTek, or was it =
calculated?
>   1b. If this was calculated, please, can you explain how?
>
> 2. The power allocator documentation also says that the governor works go=
od
>     when a "sustainable dissipatable power" parameter is fed to it throug=
h the
>     `sustainable-power` devicetree property (with that being strictly boa=
rd
>     specific and never SoC-global, as that depends on the form factor and=
 on
>     the cooling method of the machine), can you please also add the right
>     sustainable power indication to the Chromebook devicetrees?
>     In the MT8192 specific case, that's mt8192-asurada.dtsi.
>
> 3. I just noticed that MT8192 is not the only one that would be affected =
by
>     the issue that you're describing in this commit; can you please perfo=
rm a
>     similar change on the others, if parameters are known?
>
> Thanks,
> Angelo
>
> > ---
> > Changes in v2:
> > - Clearify the reason of adding another passive trip point
> > - Link to v1: https://lore.kernel.org/r/20240410-upstream-torvalds-mast=
er-v1-1-852e903f0cec@chromium.org
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 40 +++++++++++++++++++++++=
+++++++++
> >   1 file changed, 40 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8192.dtsi
> > index 05e401670bced..08d8bccc84669 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1959,6 +1959,11 @@ cpu0-thermal {
> >                       thermal-sensors =3D <&lvts_mcu MT8192_MCU_LITTLE_=
CPU0>;
> >
> >                       trips {
> > +                             cpu0_thres: trip-point {
> > +                                     temperature =3D <68000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> >                               cpu0_alert: trip-alert {
> >                                       temperature =3D <85000>;
> >                                       hysteresis =3D <2000>;
> > @@ -1989,6 +1994,11 @@ cpu1-thermal {
> >                       thermal-sensors =3D <&lvts_mcu MT8192_MCU_LITTLE_=
CPU1>;
> >
> >                       trips {
> > +                             cpu1_thres: trip-point {
> > +                                     temperature =3D <68000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> >                               cpu1_alert: trip-alert {
> >                                       temperature =3D <85000>;
> >                                       hysteresis =3D <2000>;
> > @@ -2019,6 +2029,11 @@ cpu2-thermal {
> >                       thermal-sensors =3D <&lvts_mcu MT8192_MCU_LITTLE_=
CPU2>;
> >
> >                       trips {
> > +                             cpu2_thres: trip-point {
> > +                                     temperature =3D <68000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> >                               cpu2_alert: trip-alert {
> >                                       temperature =3D <85000>;
> >                                       hysteresis =3D <2000>;
> > @@ -2049,6 +2064,11 @@ cpu3-thermal {
> >                       thermal-sensors =3D <&lvts_mcu MT8192_MCU_LITTLE_=
CPU3>;
> >
> >                       trips {
> > +                             cpu3_thres: trip-point {
> > +                                     temperature =3D <68000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> >                               cpu3_alert: trip-alert {
> >                                       temperature =3D <85000>;
> >                                       hysteresis =3D <2000>;
> > @@ -2079,6 +2099,11 @@ cpu4-thermal {
> >                       thermal-sensors =3D <&lvts_mcu MT8192_MCU_BIG_CPU=
0>;
> >
> >                       trips {
> > +                             cpu4_thres: trip-point {
> > +                                     temperature =3D <68000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> >                               cpu4_alert: trip-alert {
> >                                       temperature =3D <85000>;
> >                                       hysteresis =3D <2000>;
> > @@ -2109,6 +2134,11 @@ cpu5-thermal {
> >                       thermal-sensors =3D <&lvts_mcu MT8192_MCU_BIG_CPU=
1>;
> >
> >                       trips {
> > +                             cpu5_thres: trip-point {
> > +                                     temperature =3D <68000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> >                               cpu5_alert: trip-alert {
> >                                       temperature =3D <85000>;
> >                                       hysteresis =3D <2000>;
> > @@ -2139,6 +2169,11 @@ cpu6-thermal {
> >                       thermal-sensors =3D <&lvts_mcu MT8192_MCU_BIG_CPU=
2>;
> >
> >                       trips {
> > +                             cpu6_thres: trip-point {
> > +                                     temperature =3D <68000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> >                               cpu6_alert: trip-alert {
> >                                       temperature =3D <85000>;
> >                                       hysteresis =3D <2000>;
> > @@ -2169,6 +2204,11 @@ cpu7-thermal {
> >                       thermal-sensors =3D <&lvts_mcu MT8192_MCU_BIG_CPU=
3>;
> >
> >                       trips {
> > +                             cpu7_thres: trip-point {
> > +                                     temperature =3D <68000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> >                               cpu7_alert: trip-alert {
> >                                       temperature =3D <85000>;
> >                                       hysteresis =3D <2000>;
> >
> > ---
> > base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
> > change-id: 20240410-upstream-torvalds-master-40aeff5416c7
> >
> > Best regards,
>
>

