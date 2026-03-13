Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFF0105F784
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlE92pMBDxcqf7pEJi1EWDiZ3PurhMMxo1VeKrJwWqs=; b=NhBAJTJaGykcckPgXRv2yG4kv/
	w/ayM+/0nEzbocFAUuwQO8TDZRo1Ak/abZhB4nTeLCpUAAepml9GefqyKRtB03QL/0njiNqC0i+/h
	ajYgi5SLjWf6xUUmaft0LZuOnMBdIm9odEUWpUcoZ+C2Um6PuKnbTgMZ4mURAne7okYYuPsHAkHSC
	fhfF8IIOrqI7PR/ZGYa/p8tx1M+EXJP27QQtChh7w11N/QR+xTid6M4BcJVJFb8cQTx/TD8+8A+t1
	BbYjMh8KERFv7k79OHMlxaPuCEM0uzJbdcWMkOG/03UPOS1nk6ndo+VM6hPi/x2QOyW2wLog6h+xD
	7KjUWX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z06-0000000HPKe-1lFf;
	Fri, 13 Mar 2026 09:40:10 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z04-0000000HPJt-0lJ1
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Mar 2026 09:40:09 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8cd71fb9f06so131999585a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Mar 2026 02:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773394806; cv=none;
        d=google.com; s=arc-20240605;
        b=MI7XC2gzBeNVHRKcCdEGYle8jqMViv0FgsqHi02xSeWwBJHgfFOqfI+HFAATCmgThf
         szfO987Gji2DcqWgc53/fdLPQmNkAuoT/Qh+Z88iDWJsKJLAhT9LL1tqyHU8V/+1IvZ6
         IJJRBODldpdLCkHPIZmZBRhPTDedoH1iaG/8jefYxYoODWr/tTlZGR3TK9vzmirbyOyZ
         1PZMgneryKKpV5WaVA2klqV/eRQM/MLNjRN5Aq9+dGigil5bPCEH5iC8Us+C69GEicVA
         OUJARJvxFDGMZDynANuIG9HSCNKRUNPaycb0WBJ/QjkaXEXnLZjNPehS4r9/xbP9gkkM
         D1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dlE92pMBDxcqf7pEJi1EWDiZ3PurhMMxo1VeKrJwWqs=;
        fh=T4+jvckiYfGPyHYPjVVehhwK0L2Px100cctPMabZhM8=;
        b=V2FTBBJ5oIU+HboiuZgCuLg1t45t+bDjsaf8Kkj74ectM/P6+aseu1y7BCvU+9MSF+
         P09ZMTH83XY8Xj7osa2XWRt2Tz2UyGXbu8sQ8PUV47NoZaRbKCcvZ0YoFReXedLED/6B
         bY2W5S9l74XOIt9CUnIoqR8DoZV52I3vyzGTA8XM+BZh6KhcFlmI8vJOs/gXUv+HV6JX
         f8AjHeR6NBZkUiWCQEBadAE6RNASxui5MlofP8WbQ35lLbQI38Gvu+Xd2BgpvNbKhaaJ
         98T/KXeiIUU1nWzCwciagmX8BiVX15biH8p/ChUnvUhDy+BSsHcW5J/1oC0wY31Yu6vT
         ug5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773394806; x=1773999606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlE92pMBDxcqf7pEJi1EWDiZ3PurhMMxo1VeKrJwWqs=;
        b=T6k00z/lYMWFW0AVnwAceEWvNmDFDRfZmdMhgl4yMDnv/H5MgeAEj0caO7uy3KB1UW
         Fd+5KPLRP2yTDbzk0Q+saiczVS+zxW/M+jURB++ZqOaJcd3M5s54yhXoXqdSHTnQzRof
         thpqOrs83zMztNaMBUsm/b8WzEf38zydyhYKxPHYECUWvyyeMFRgwf3ssrlEf7Sn2eoZ
         FCUWhhALxERh+vrkRFFokXgXdfxGS0zqPFL2g8H1pl7Aw0twZtBETA7cfAOx1Vk4TQmz
         FegPFMg+w3209aur1mAEjXHAfnGt/hPLrysWJlg1i/siCUguarWqE9jMEGO9vmNd8m2n
         WgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394806; x=1773999606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dlE92pMBDxcqf7pEJi1EWDiZ3PurhMMxo1VeKrJwWqs=;
        b=S32o5R+IZPTttU06ZhOx2bkFomhD/A90U02LGtvNoFhz2W+M7VMkbcO63CP081zyBP
         1jflR7WuD1kuee2sb+YfA+8MmAt5yDMgv3nCKmpnJf4OP1oBtAgbCQCvGXShHb5byWN5
         si7DExJzpJNYZltW+12ZWaYQcL2A9CV5hmqTgo2zZKoIP86xJgSGizjvnZFFJU+49kpE
         cGf2+bPe5acHUDdKBl2ZbjFSp2ld0XJn83VS+UtboSHSGYQfezooIXmY1rYVCbVmHZKT
         GQQ5gq5Z1qltDNwnAOzwBLpApRliE0ysUp1id5qr0H3Dsmtk1Meu7s66t1lX4xAgtLSL
         GJZg==
X-Forwarded-Encrypted: i=1; AJvYcCV4hQYnSTRPDl872nxsfpBhYZdV2WcuRU7K+JhSY8lZhuqvsA0DoiZcmpnYH8EW7CQglMyluoIFXt0LvUmeYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ7jxDO4Kzsm6EFcDwba9HJavkWpdUYNpJaVhgSZX966XRz1f8
	uPAtJDB+nAddZIoBU70uTfNrUu7DZr2d+FN6HZY3uwPdH4q7Xsx0+GzCdKxlbncLZ0xSu7ch/l/
	/scd7ysF6Iu2k0JMXnV4nDG/bLQeRSVI=
X-Gm-Gg: ATEYQzyBu8AorQM+EcypIaKHLS3RNKVHrgsDMSunRPMxHpGvjM5JB1IJCTaLiiAPKf4
	Pdn5H2smoaQ6b6NLPoNK9hFyZImstvi/cWTPEShLZnLeuERCVgajy1+n0un6GT8e5FeRhejdp+A
	QsTx52yNCv+UrlN7Nh4YKK9l+RUHv8EiD93d6/pfmJidQwi7s0MnZsYerHJtSt/9m+K4qW45uR4
	9zwUDMX6pY6OoeWB0ZzJR86OdJxQa1YDZA3nKxIgd9WmOj6r58pXHt2FlehwDaS25Si8ya1sBEv
	mt7CzYU3yz0LCAItTyvXBhND8OACF55azw==
X-Received: by 2002:a05:620a:690d:b0:8cd:8f18:d1c4 with SMTP id
 af79cd13be357-8cdb5b3203amr295554085a.56.1773394806425; Fri, 13 Mar 2026
 02:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260305185116.781184-1-akkun11.open@gmail.com> <20260305185116.781184-3-akkun11.open@gmail.com>
In-Reply-To: <20260305185116.781184-3-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 13 Mar 2026 18:39:54 +0900
X-Gm-Features: AaiRm513Z0tfTZUa8grZ-svVd-KIsw6SByNnlN-BN7-Nvit_VHPm6CosTcm2fXM
Message-ID: <CAKr_iV7GRaiXp8VFVEAo8VHoPQzcD6Z=Av38R6_fAs5t7aQkDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: mediatek: mt6589: add basic support for
 Lenovo B8000-F
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_024008_248715_FB1AE6DA 
X-CRM114-Status: GOOD (  19.92  )
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

On Fri, Mar 6, 2026 at 3:51=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmail.=
com> wrote:
>
> Lenovo YOGA Tablet 10 (Wi-Fi) - B8000-F is a tablet which belongs
> to the "blade" product family. It is powered by MT8125 SoC,
> which is the tablet version of MediaTek MT6589, and has 1GB RAM.
>
> Like other devices in the "blade" family, it uses a framebuffer
> initialized by the bootloader at a consistent memory address and size.
> This patch adds basic support including UART and simple-framebuffer.
>
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  arch/arm/boot/dts/mediatek/Makefile           |  1 +
>  .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 15 ++++++++
>  .../dts/mediatek/mt6589-lenovo-blade.dtsi     | 37 +++++++++++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
>  create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi
>
> diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/medi=
atek/Makefile
> index 37c4cded0eae..b67b94b7cbd0 100644
> --- a/arch/arm/boot/dts/mediatek/Makefile
> +++ b/arch/arm/boot/dts/mediatek/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D \
>         mt6582-prestigio-pmt5008-3g.dtb \
>         mt6589-aquaris5.dtb \
>         mt6589-fairphone-fp1.dtb \
> +       mt6589-lenovo-b8000-f.dtb \
>         mt6592-evb.dtb \
>         mt7623a-rfb-emmc.dtb \
>         mt7623a-rfb-nand.dtb \
> diff --git a/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts b/arch/=
arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
> new file mode 100644
> index 000000000000..47bb6ab1fe72
> --- /dev/null
> +++ b/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
> + */
> +
> +#include "mt6589-lenovo-blade.dtsi"
> +
> +/ {
> +       model =3D "Lenovo YOGA Tablet 10 (Wi-Fi)";
> +       compatible =3D "lenovo,b8000-f", "mediatek,mt6589";
> +};
> +
> +&uart0 {
> +       status =3D "okay";
> +};
> diff --git a/arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi b/arch/a=
rm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi
> new file mode 100644
> index 000000000000..3a6e0d8c8a64
> --- /dev/null
> +++ b/arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "mt6589.dtsi"
> +
> +/ {
> +       chosen {
> +               framebuffer0: framebuffer@bf600000 {
> +                       compatible =3D "simple-framebuffer";
> +                       memory-region =3D <&framebuffer_reserved>;
> +                       width =3D <1280>;
> +                       height =3D <800>;
> +                       stride =3D <(1280 * 2)>;
> +                       format =3D "r5g6b5";
> +               };
> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x40000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +
> +               ranges;
> +
> +               framebuffer_reserved: memory@bf600000{
> +                       reg =3D <0xbf600000 0xa00000>;
> +                       no-map;
> +               };
> +       };
> +};
> --
> 2.52.0
>

Hi,

Please ignore this patch for now.

I found that the panel on the Lenovo YOGA Tablet 8 is 800x1200,
which is incompatible with the current simple-framebuffer configuration.

I will fix the Device Tree in v3.

Best regards,
Akari Tsuyukusa

