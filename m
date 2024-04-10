Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B9FCD1296
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gW38Gh9I29r84lVoZWwktFq4DHYBoJff/etd3Fj/TJA=; b=2g8zhHKheMo4/k0GbB1GX3CT7W
	hb4vBLYnmutxu3+k7tUz9/NQPAd5CkYtdN9irVsOnOyP0GL0JEG7Nkn4TsyqtgswAQgnfiSnW6jq9
	H5uMboi1yjMLIEYwNpyjsOVj4GVTR7lJV3W7chwAG7mkGR123eIyGGck2mqJHShv1nE3yfxT7W/LI
	gkLqYPWQ40KzGLPM1nry720mVU/OqtEGJftVegP3vLz/paqHuguye0FPQlcuT3nc2buFipCG1+V99
	reSLtod0QQSbrc/llv3U/T9AL5D/A/Wq2G98d/Xk0BIpnvVycvXFEtzo4UCLbbe+tJKcnGZaSt12R
	zqUWuZ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTJv-00000005rAb-3sCy;
	Wed, 10 Apr 2024 08:28:39 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTJq-00000005r4K-1c5d
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 08:28:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so7294555a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 01:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712737711; x=1713342511; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gW38Gh9I29r84lVoZWwktFq4DHYBoJff/etd3Fj/TJA=;
        b=XgS7A0a7hMtIGyZ0dajCPJ5F03fSQBCZOiWiwl3j7EaLRhwnwOdgwYpZxOAUyiv6+D
         iLdtGoR+nspKddEqm9AnADZIbeeqUNbhBOnlacDsvDKpvap6z/nvAJW8Z7s9Gc9rknQK
         e7mJjf/bpzGPAkV2IdgCHiVnFraEKXkQz0Nbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712737711; x=1713342511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gW38Gh9I29r84lVoZWwktFq4DHYBoJff/etd3Fj/TJA=;
        b=h/1QCD+Ei/yjQ/m9+w9SvoVML8yQyTG/1x14n9Sti3AafXSy51dq+U/gxxkvmGeEp8
         5DzdiTlFC+nGwB1mF6N5yZ2LQLPINphyavnbSQjkMm+QPsyoBIEEmUz66l/H9Sd931E2
         Tml4cbqweDAfdkworn3zglkr8HnNE7hb2VdkJOMrrNO/AJhIFTuwhNhwbEeUFEfsrT+F
         oUQMoYnor7wSnx6D0XGLgM+ZHi+3m+HcAy1KNdtrDMkL9bo5T5TfUqoYGj+dHQ36hTHO
         k0hmzLjTWHrLvdGK8um9TRmmx1GChMOfy6trTp9n0jGRIg/vs8zJVfw16S0gbjAIjvU5
         mgtw==
X-Forwarded-Encrypted: i=1; AJvYcCW0/57hrZkmkZgD8PWINxzXwATPPL9LiHARzdf+wIjWt4v+9gIhXJsgObvTqLiMa1zrYnVVh9+9WWtzDKbM+8/5iacwcokLdvVVRiFY8ZsHZOsb
X-Gm-Message-State: AOJu0YxnqANhGfrbisLW4lGj7hhxCObEHPsSf2RCTk3r5KQGWIvcI0Uf
	3q+NPdetmw+fBBzV8cP/dXfpUXC/MyBr69nINdqOyCO5z2yP069es+oJxI63giMRm4L650rpsOu
	i1g==
X-Google-Smtp-Source: AGHT+IFC4pa/ItnJWWBNO3/kj3uagQd8C+mhn9rdiiiXu5y2/ZbDfQiEnj7BqwngiR2hvobWAKEV5A==
X-Received: by 2002:a17:907:1c95:b0:a51:dd36:9a37 with SMTP id nb21-20020a1709071c9500b00a51dd369a37mr1801096ejc.17.1712737710973;
        Wed, 10 Apr 2024 01:28:30 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id se1-20020a170906ce4100b00a51a9d87570sm6413682ejb.17.2024.04.10.01.28.30
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 01:28:30 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a51969e780eso793114466b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 01:28:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2/3tIccQQfFKHKU949/Ppcvo4ghXYbNCaBRsR6OQrqXP+9y8qozIrFMb46kZQzaqmf9Nhka6IHTX/HnMMavfIm0uFWMYtsJte2t+SfGIUGzzL
X-Received: by 2002:a17:907:a41:b0:a51:dd18:bd21 with SMTP id
 be1-20020a1709070a4100b00a51dd18bd21mr1452940ejc.16.1712737710124; Wed, 10
 Apr 2024 01:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240410-upstream-torvalds-master-v1-1-852e903f0cec@chromium.org> <c3d05b3e-f784-4606-9634-52dc6feee318@collabora.com>
In-Reply-To: <c3d05b3e-f784-4606-9634-52dc6feee318@collabora.com>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 10 Apr 2024 16:27:53 +0800
X-Gmail-Original-Message-ID: <CAHc4DN+N7oLNiiVL-T+T0dEr2nipph5f2q5zu37NowPQC+=mkw@mail.gmail.com>
Message-ID: <CAHc4DN+N7oLNiiVL-T+T0dEr2nipph5f2q5zu37NowPQC+=mkw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192: Add missing trip point in
 thermal zone
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
X-CRM114-CacheID: sfid-20240410_012834_644900_C8008EFA 
X-CRM114-Status: GOOD (  21.11  )
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

According to the document
(https://docs.kernel.org/driver-api/thermal/power_allocator.html),
there should be two passive trip points. It seems that the switch-on
temperature will be 0 if we only have one trip point, which hurts
performance. I'll send v2 to explain this more clearly.

Regards,
Hsin-Te


On Wed, Apr 10, 2024 at 3:43=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 10/04/24 08:20, Hsin-Te Yuan ha scritto:
> > Add the missing passive trip point which is expected by kernel.
> >
> > Fixes: c7a728051f4e ("arm64: dts: mediatek: mt8192: Add thermal nodes a=
nd thermal zones")
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
>
> Sorry, I don't understand what you're trying to solve here.
>
> All of the thermal zones in mt8192.dtsi already do have a passive trip po=
int
> which is also used in cooling-maps.
>
> Can you please describe the issue?
>
> Thanks,
> Angelo
>
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

