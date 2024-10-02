Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04751CF31AD
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reIIFD4dhOrzs8q6FtBVVX+tUcITJKz5kVNTiFQ34Mc=; b=MLppcT06cn9SBDwZSwqQwKIeCY
	PxTRm0QvsKJktg2f7UiUll2gXEM+fKJHbo1VoNgx4Gcpn+Z2Z8BVF6ea85D0RibvCA5m/KA4HHygh
	wkyP929fb1eOcB6ps5RgvHQtjXlOdxapIjpDuljVq3GLZGLoFULqv9clVdK+lN8Nk4JQr40znnbc7
	hQG+XxOtayCQqj/lvZhPaCSToba7ZLsuAkEgrM32U2m7XSkxyhPmSV+OQlyYmZQ87c0gEVkHBxfCx
	ZToZBkv6Wo7U13bITf0CQrUSvnG59gKO46kHvZfNhn9+lBv+8+zdsys9hBs6IB8nWjYD9iD1kg+Sd
	WK1MJUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvj9-00000005LVZ-4C4Z;
	Wed, 02 Oct 2024 09:33:00 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvj7-00000005LTl-0bSR
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 09:32:58 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3a0cb892c6aso296365ab.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 02:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727861576; x=1728466376; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reIIFD4dhOrzs8q6FtBVVX+tUcITJKz5kVNTiFQ34Mc=;
        b=DLAtA0etOB1xbS2JqYhjJLLJPWQzSGasng5THN84wkdd4TQj1ZPgv554mSapxVt1zV
         PyZscoYTfHf4zrZrbirSKu/6MYNGqmPQ/4ngbCyyoBfY+6p2aAYNbFou9cjgVKWHCJI9
         iBvbmSPv5JaDvQfcG7KHuwA/Uc7Hjnxf0aCanpwL/6FrSBRecVL2Ik7XPlEaKYY4VOus
         wUYbAduEFz0zB9tSRSGIxmKAGKHhyEOFKFuxdyESJ0zlfzJTven+E5zsQ60qHF3fFcKC
         a6MinZKVaUkgjHwtbKrioYPYsRC67b9lNIbgOEheWR1pDCDD8heZbyFmAZy2SORdtYKs
         uM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727861576; x=1728466376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reIIFD4dhOrzs8q6FtBVVX+tUcITJKz5kVNTiFQ34Mc=;
        b=ul9ESmUaYw0ID4MdJyuPFwTKoLVtJYmZXoL+r1Amq9AGDPXNSbZ3B/91JdtxfL8yHj
         M3Yf3vy5bOIfs1wV/sks4xDrpBelcZWOZAQYTRg37CtHuXKPUMFIiyJKko2dQ+TsH/Vn
         utHUFzH0SlBcEJqBhFeGd2w/ujLAIKzt6Jv4jvQq8tLbdFFiol8U+N7wINW9Z4Spj/gk
         PbOKGSFiHSHlac2r1+ucTw/YWprkWsfF7/GOhTIbZ3PugMX8aFoh37QbM4bzGVzPLnDs
         UiGae6GDQvntiNGq3yaC+XKcS+m5ujWIjxXgXJcbsZCpFmbFYtHmX53MTmKTcjx9eqUF
         pHfw==
X-Forwarded-Encrypted: i=1; AJvYcCUwTGsH9AFgThL1JRR/3Lsmu6EBtr309fgeRYirjgTpm20YJl8xPd2g/lIJ4DJbpSDkC8PPnO2pN0om30IxCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/TN/BKnvd/9sahuFGC0plkUmKg+iX4RAEBy4UtsZOj1+XvsIL
	9SFXSJsuNnPO/YaAOXYSgMLiTQ/bD54VhTZcyzojkdEToyj50GE4d9EFCrwOnhnR8y8Tnd7q9d7
	0V7R6AUdh9NyLIAajrVPtq4JMoPKdTx5BStqq
X-Google-Smtp-Source: AGHT+IE3APdtH1jNA08H3S8Xg6GgEHqc53p2GGTlE9H+BquiDOFveHXhwDpKCXrQWQD9qZ+I5N3M9LKhEIefU/AF02g=
X-Received: by 2002:a05:6e02:1d99:b0:3a0:9cb6:cb with SMTP id
 e9e14a558f8ab-3a3674e5cefmr2500335ab.7.1727861575920; Wed, 02 Oct 2024
 02:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240927122940.4190949-1-jakiela@google.com> <20240927122940.4190949-2-jakiela@google.com>
 <2c5614f7-0ada-453a-bd81-2f0054a919a0@collabora.com> <CAODvyLQ0pUUvBtfk7Pj05vwTkjEnCkfBY4-EG0okQB972tLC-g@mail.gmail.com>
 <b7032557-0b7c-4329-9762-14bda341e79c@collabora.com>
In-Reply-To: <b7032557-0b7c-4329-9762-14bda341e79c@collabora.com>
From: =?UTF-8?Q?Albert_Jakie=C5=82a?= <jakiela@google.com>
Date: Wed, 2 Oct 2024 11:32:44 +0200
Message-ID: <CAODvyLQ=DkN4F2wSiTA+2C9Mwy0eoOGn8_LNyHfC1E8THzG0rQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediate: Introduce MT8186
 Chinchou/Chinchou360 Chromebooks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, wenst@chromium.org, rafal@milecki.pl, 
	hsinyi@chromium.org, nfraprado@collabora.com, sean.wang@mediatek.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023257_190467_6CC03CF6 
X-CRM114-Status: GOOD (  24.69  )
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

Without `compatible` override:

```
chinchou360-rev1 ~ # dmesg | grep mt8186_mt6366
[    8.998560] mt8186_mt6366 sound: ASoC: Parent card not yet
available, widget card binding deferred
[    9.020741] mt8186_mt6366 sound: ASoC: Failed to add route
Speaker(*) -> Speakers
[    9.028523] mt8186_mt6366 sound: snd_soc_bind_card:
snd_soc_dapm_add_routes failed: -19
[    9.070269] mt8186_mt6366 sound: error -ENODEV: Cannot register card
```

With `compatible` override:
```
[    9.110380] mt8186_mt6366 sound: ASoC: Parent card not yet
available, widget card binding deferred
[    9.131681] mt8186_mt6366 sound: ASoC: driver name too long
'sof-mt8186_rt5650' -> 'sof-mt8186_rt56'
```




On Tue, Oct 1, 2024 at 1:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 01/10/24 13:13, Albert Jakie=C5=82a ha scritto:
> > Deleting `compatible` property will not allow the sound card to probe, =
so I
> > override it with proper compat.
> >
>
> The inherited `compatible =3D "mediatek,mt8186-mt6366-rt1019-rt5682s-soun=
d"` from
> mt8186-corsola.dtsi should allow that to probe correctly.
>
> Can you please share the log of the error(s) that you're seeing?
>
> Thanks,
> Angelo
>
> > On Mon, Sep 30, 2024 at 11:23=E2=80=AFAM AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com> wrote:
> >
> >> Il 27/09/24 14:29, Albert Jakie=C5=82a ha scritto:
> >>> The MT8186 Chinchou/Chinchou360, also known as the Asus Chromebook
> >>> CZ12/CZ11 Flip, is a clamshell or convertible device with touchscreen=
,
> >>> stylus and extra buttons.
> >>>
> >>
> >> You have a typo in your commit title `mediate` -> `mediatek`
> >>
> >>> Signed-off-by: Albert Jakie=C5=82a <jakiela@google.com>
> >>> ---
> >>> Changes in v2:
> >>> - PATCH 2/2: Remove sku2147483647, remove duplicate nodes, add model
> >>>        and remove uneccecery nodes from sound card.
> >>> - Link to v1:
> >> https://lore.kernel.org/all/20240925080353.2362879-2-jakiela@google.co=
m/
> >>>
> >>> ---
> >>>    arch/arm64/boot/dts/mediatek/Makefile         |   3 +
> >>>    .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
> >>>    .../mediatek/mt8186-corsola-chinchou-sku1.dts |  34 ++
> >>>    .../mt8186-corsola-chinchou-sku16.dts         |  28 ++
> >>>    .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 432 ++++++++++++++=
++++
> >>>    5 files changed, 515 insertions(+)
> >>>    create mode 100644
> >> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
> >>>    create mode 100644
> >> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
> >>>    create mode 100644
> >> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
> >>>    create mode 100644
> >> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> >>>
> >>
> >> ..snip..
> >>
> >>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dts=
i
> >> b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> >>> new file mode 100644
> >>> index 000000000000..96cc3c267c20
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> >>> @@ -0,0 +1,432 @@
> >>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >>> +/*
> >>> + * Copyright 2023 Google LLC
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +#include "mt8186-corsola.dtsi"
> >>> +
> >>> +/ {
> >>
> >> ..snip..
> >>
> >>> +
> >>> +&sound {
> >>> +     status =3D "okay";
> >>> +
> >>> +     compatible =3D "mediatek,mt8186-mt6366-rt5650-sound";
> >>
> >> Why did you keep the compatible string override?
> >>
> >>> +     model =3D "mt8186_rt5650";
> >>> +
> >>
> >> Regards,
> >> Angelo
> >>
> >>
> >>
> >>
> >>
> >
>
>

