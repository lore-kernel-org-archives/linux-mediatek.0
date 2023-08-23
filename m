Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4EFEE49AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BqnoaQrc+k/EGaIhjvlmrLzZhJHDQjGpktA3aeLEYU=; b=ERqLK0Q6yMLetJeiq9GXPaU1j5
	mrqQjrFbRWo23v0iZ8yu/8jrlIIpr515lmWaWB4216/2cTpG9i13hENkRuZADB+nsYqFg4+OwI6eP
	aAaZIYMg2TDpCh5lOjtoSnl91bHwxdchn2szyOwg8Q1GPLvGkXRgym6V30uGJF5S7jwW2j4gOsApU
	Zgx7ZPWInSxtPGmesFV538Ppjf4HjMbHfLXaawuSOer/pYTMmUzDYc5F10E3Fcmgqtbm8TKnwNsz4
	884HSgaOXRSYlY6nzmsECPp/Sst9Bqu2v48/T5GHGOMuCK2E0f1h9QZYYwunib9aNal2kp+qsk1Ps
	Gtm9B9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYj0H-00HXjR-0x;
	Wed, 23 Aug 2023 08:14:13 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYj0D-00HXiF-0n
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 08:14:10 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-44ac277f2fbso1848757137.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Aug 2023 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692778448; x=1693383248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BqnoaQrc+k/EGaIhjvlmrLzZhJHDQjGpktA3aeLEYU=;
        b=Lxd1xBz4QhTQBil+19Nth+mmfytAAWGErXLm7pP3QMD3JbyPH3q26Ux4lJypdghqNH
         wpPkhIsgoio8g/OPXqHrBJrUgkHCPJiS2PZTvqcPEKcG5hWADioTJakWZiBDgoI1VfSn
         pHP+eXlPlWLoG3z4MfdhtQYtGBI4nflQCHOjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692778448; x=1693383248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BqnoaQrc+k/EGaIhjvlmrLzZhJHDQjGpktA3aeLEYU=;
        b=Ob09FKWlECiCrzb4k0I6hj+teYeqLg06rU7dKLUALeTAT0RuyWu009d0QMLd7h9skJ
         mn0BxpdUAbnASPSeYbQwKQJTweRhngP+g21SYVUKw4Ys/EB170fcqxrq6Lf0GTpyZHEy
         R+yoabZLmPI4YUKHSoUV3tV+arn+T65Yx9P3u90kmAjXXqXxT4hIV+bFPtXnIJ/Wb8FD
         Ju5EwuGGCnjK+iHJ0AuHYWpWeBcmCo0j/neohO/3FLVBXo/WtOa7n1Sy0VNxpOvGOzIQ
         KgrCUSdT+nYk1ojMZVKLJ5Nxf0CzmkpJcptOYCmV3OjkCj5K/K2gySHFPjAJ9GlPGy4N
         rKZw==
X-Gm-Message-State: AOJu0Yy+GxHVjaV5ov3WMDFcDG7CbypmHX8Gf4kZ6JmVQQb2MnRv4t1K
	K6st/rUwLpuahpVT5xNmVdU5quqsFgsubZqN+yAt2Q==
X-Google-Smtp-Source: AGHT+IH4+6ztIqeKvjoE4Y07evhyiEKAgLnuWl8fEl2206g85MjP70+R3xLs9H41CAsIZm89sGQsPoMer8AWCZBvYeQ=
X-Received: by 2002:a05:6102:18c:b0:44d:3ba7:b617 with SMTP id
 r12-20020a056102018c00b0044d3ba7b617mr7906256vsq.32.1692778447964; Wed, 23
 Aug 2023 01:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230822084520.564937-1-wenst@chromium.org> <20230822084520.564937-4-wenst@chromium.org>
 <5ad5ff92-1367-ba96-b126-da80511a2769@linaro.org> <CAGXv+5Gc+R-hUJi5gm8an+dkq3JMD2JGwP4kDakKaHbAX2P0gQ@mail.gmail.com>
 <e1c69599-a894-4cc8-123b-f4654b08412d@linaro.org>
In-Reply-To: <e1c69599-a894-4cc8-123b-f4654b08412d@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 23 Aug 2023 16:13:57 +0800
Message-ID: <CAGXv+5GL+Ltn-X-Hzxj7Wz_ztPVkCfo=WV6XdXGw_-j6ZhCF6w@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] regulator: dt-bindings: mt6358: Convert to DT schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_011409_302362_DC15591E 
X-CRM114-Status: GOOD (  22.23  )
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

On Wed, Aug 23, 2023 at 1:48=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/08/2023 05:54, Chen-Yu Tsai wrote:
> >>> +
> >>> +    regulator {
> >>> +        compatible =3D "mediatek,mt6358-regulator";
> >>> +
> >>> +        buck_vgpu {
> >>> +            regulator-name =3D "vgpu";
> >>> +            regulator-min-microvolt =3D <625000>;
> >>> +            regulator-max-microvolt =3D <900000>;
> >>> +            regulator-ramp-delay =3D <6250>;
> >>> +            regulator-enable-ramp-delay =3D <200>;
> >>> +            regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
> >>
> >> mt6397?
> >>
> >> Both cases look a bit confusing.
> >
> > There's only two regulator binding header files, mt6397 and mt6360.
> > They seem to correspond to the two classes of PMICs that MediaTek has.
> > I believe the two header files and thus the macros are meant to be
> > shared?
>
> Defines have specific model name, so they do not look like meant to be
> shared. If all the values of the binding match, they can be shared, but
> then this should be mentioned in the binding plus it should be used in
> the driver. I don't see your driver patches add include of this header.

Indeed. AFAICT the original raw values 0 and 1 just map directly to the
register bitfield values. And those are common across the series of PMICs.
I'll look into cleaning it up.

ChenYu

> > MT6397 and co refer to their AP PMICs, i.e. PMICs that are companion
> > chips to the SoC and provide most of the power rails a system needs,
> > along with things like RTC, audio codecs, etc.. The MT6358 and MT6366
> > belong to this class.
> >
> > MT6360 and possibly others refer to their charger PMICs, which integrat=
e
> > a battery charger, USB type-C PD stuff, LED drivers, and a handful of
> > regulators.
>
>
> Best regards,
> Krzysztof
>

