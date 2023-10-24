Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEC3C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHRbBWy4owH0wLPGHWwFMskchN1xwqqo7kAge+EOJ5o=; b=FeHIYpzxlyJ9PZG/DxLAwelaDK
	/8V6/MmO0UeD95FxmW40QL6BtdQxZRCOCCoSLDMNqVQl2l9ag/C1sLWSXa1SZzWbqX6+Oa4xmvEhm
	1kpiaPIgLJTjgqmJRglsc7ivZbEXBk8C4GdAPCJ13RR/lf5JOU/jHLNbIYj5HoQmNhzQ0XEzUv9Ub
	+0eusNEasmh8tUzJdQ+QnuTmEU6G/Ta0wYfp+t+xzREXNw8i/zJAvRDmnUzCowaMYXWfP6ISez6mF
	fqKWr4b5ja5VxWClkClfez90t6OnFIfIBGcZ/ZkfoNAIvuwwfI73mcrWdOvuikf2LbUlH8mMEiznt
	o4XaA63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDqY-009LHn-1a;
	Tue, 24 Oct 2023 09:37:10 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDqU-009LGm-2R
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 09:37:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5079f9675c6so6694136e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 02:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698140224; x=1698745024; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHRbBWy4owH0wLPGHWwFMskchN1xwqqo7kAge+EOJ5o=;
        b=aM/08VqvYSGu5bN5O5qhF22XKZ89gyJ3kpo/hi0n0Ol5ACN+NKcwR94E7R1Pg1kpWr
         +lsDjiCryhLWBQJx8o8ooqEKyCArD5pfsXkjpD6Y38jSJZcxc2PSQ/bDkt4JZ1/5066K
         ST6zn05te3aqCwz2N+CC/Y28El2tRA6tK8gPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698140224; x=1698745024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHRbBWy4owH0wLPGHWwFMskchN1xwqqo7kAge+EOJ5o=;
        b=ZQ3+gj0Vg/6vvyfNA5HD8nZoYffFwgQAbc8NN1o5jQ4fzAT4x4cI2rPtmRU/viIhoO
         XSgLjOAb2S4vOLiN3KLyoaengz5vYBcKoHMswcSCu+pyegAIfgd4yJIpEQa+njoYYGQY
         0f4RXonbpg51OeSi43eE9AUQeydsVWQBrFLzxBlH0DCQyG9PqRmjtPJmS/UaYnjh3zsM
         jPsOWL4xKB/fPhV+H93jNi1MmoNA6IKSRM6JsuhO2gHs3JUEWCdLBOdYM/ZKDQwEYKCq
         2NJfLB4yxGaivJ5ZWt4Ctj2t5wM1snDeabNg+7J7wmqdaeLvfLoarrztN4VBYHu4ZKAd
         F2ag==
X-Gm-Message-State: AOJu0YyD7iM1bjxnsrUfbYa3xLlLZklHAM6ZoqzGCgYmMoad+feOq0Go
	wi2f97YaMjzsqvbl6ssPtxpAw7VcW23oM/1Qrt37fQ==
X-Google-Smtp-Source: AGHT+IHGVQptyGMQXoofkQqC+IzPV7oxdJqffR5O4goH3KPMBttmhBy2IKngQcwmJqNk00UNW3VT28I49cockoDF/xo=
X-Received: by 2002:a19:3846:0:b0:503:364d:b93d with SMTP id
 d6-20020a193846000000b00503364db93dmr8614267lfj.20.1698140224327; Tue, 24 Oct
 2023 02:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231023083839.24453-1-jason-ch.chen@mediatek.com>
 <20231023083839.24453-5-jason-ch.chen@mediatek.com> <a1846955-e6d9-4217-8c9f-1f20be166f4b@baylibre.com>
In-Reply-To: <a1846955-e6d9-4217-8c9f-1f20be166f4b@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Oct 2023 17:36:53 +0800
Message-ID: <CAGXv+5Gdr4DuiGAZFdVdqjj8Rv2Onq78k+=Mmu0MOe=rxQkr3A@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] arm64: dts: Add MediaTek MT8188 dts and evaluation
 board and Makefile
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Jason-ch Chen <jason-ch.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_023706_822855_352A4F12 
X-CRM114-Status: GOOD (  25.99  )
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

Hi,

On Mon, Oct 23, 2023 at 6:55=E2=80=AFPM Alexandre Mergnat <amergnat@baylibr=
e.com> wrote:
>
>
>
> On 23/10/2023 10:38, Jason-ch Chen wrote:
> > From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> >
> > MT8188 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
> > and 2 CA78 cores. MT8188 share many HW IP with MT65xx series.
> >
> > We add basic chip support for MediaTek MT8188 on evaluation board.
> >
> > Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
> >   arch/arm64/boot/dts/mediatek/mt8188-evb.dts | 387 ++++++++
> >   arch/arm64/boot/dts/mediatek/mt8188.dtsi    | 956 +++++++++++++++++++=
+
> >   3 files changed, 1344 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-evb.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
> > index e6e7592a3645..8900b939ed52 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-s=
ku0.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku176.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-pumpkin.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-evb.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r1.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r5-sku2.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-spherion-r0.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts b/arch/arm64/b=
oot/dts/mediatek/mt8188-evb.dts
> > new file mode 100644
> > index 000000000000..68a82b49f7a3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
> > @@ -0,0 +1,387 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2023 MediaTek Inc.
> > + */
> > +/dts-v1/;
> > +#include "mt8188.dtsi"
> > +#include "mt6359.dtsi"
> > +
> > +/ {
> > +     model =3D "MediaTek MT8188 evaluation board";
> > +     compatible =3D "mediatek,mt8188-evb", "mediatek,mt8188";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +             i2c0 =3D &i2c0;
> > +             i2c1 =3D &i2c1;
> > +             i2c2 =3D &i2c2;
> > +             i2c3 =3D &i2c3;
> > +             i2c4 =3D &i2c4;
> > +             i2c5 =3D &i2c5;
> > +             i2c6 =3D &i2c6;
> > +             mmc0 =3D &mmc0;
> > +     };
> > +
> > +     chosen: chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     memory@40000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0 0x40000000 0 0x80000000>;
> > +     };
> > +
> > +     reserved_memory: reserved-memory {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +             ranges;
> > +
> > +             scp_mem_reserved: memory@50000000 {
> > +                     compatible =3D "shared-dma-pool";
> > +                     reg =3D <0 0x50000000 0 0x2900000>;
> > +                     no-map;
> > +             };
> > +     };
> > +};
> > +
> > +&auxadc {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c0_pins>;
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
>
> IMO, the order should be
>
> clock-frequency =3D <400000>;
> pinctrl-0 =3D <&i2c0_pins>;
> pinctrl-names =3D "default";
> status =3D "okay";
>
> Please apply this to other nodes

Within the MediaTek platform device trees, this ordering seems to be all
over. The one here seems to be the ordering MediaTek likes. The device
trees upstreamed by Collabora folks have:

{
    status =3D "okay";

    clock-frequency =3D <400000>;
    pinctrl-names =3D "default";
    pinctrl-0 =3D <&i2c3_pins>;
}

As long as the ordering sort of makes sense (external bus properties come
after internal properties), I probably wouldn't argue either way.

> > +};
> > +
> > +&i2c1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c1_pins>;
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c2 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c2_pins>;
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c3 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c3_pins>;
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c4 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c4_pins>;
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c5 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c5_pins>;
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c6 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c6_pins>;
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +     bus-width =3D <8>;
> > +     hs400-ds-delay =3D <0x1481b>;
> > +     max-frequency =3D <200000000>;
> > +
> > +     cap-mmc-highspeed;
> > +     mmc-hs200-1_8v;
> > +     mmc-hs400-1_8v;
> > +     supports-cqe;
> > +     cap-mmc-hw-reset;
> > +     no-sdio;
> > +     no-sd;
> > +     non-removable;
> > +
> > +     vmmc-supply =3D <&mt6359_vemc_1_ldo_reg>;
> > +     vqmmc-supply =3D <&mt6359_vufs_ldo_reg>;
> > +
> > +     pinctrl-names =3D "default", "state_uhs";
> > +     pinctrl-0 =3D <&mmc0_default_pins>;
> > +     pinctrl-1 =3D <&mmc0_uhs_pins>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&mt6359_vcore_buck_reg {
> > +     regulator-always-on;
> > +};
> > +
> > +&mt6359_vgpu11_buck_reg {
> > +     regulator-always-on;
> > +};
> > +
> > +&mt6359_vpu_buck_reg {
> > +     regulator-always-on;
> > +};
> > +
> > +&mt6359_vrf12_ldo_reg {
> > +     regulator-always-on;
> > +};
> > +
> > +&nor_flash {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&nor_pins_default>;
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +     status =3D "okay";
>
> Order:
>
>
> #address-cells =3D <1>;
> #size-cells =3D <0>;
>
> pinctrl-0 =3D <&nor_pins_default>;
> pinctrl-names =3D "default";

I think pinctrl-names before pinctrl-* makes more sense. We declare the
names and by extension how many pinctrl-N entries are needed first. The
vast majority of the arm64 device tree files have pinctrl-names before
pinctrl-N. The only platform that exclusively has pinctrl-N before
pinctrl-names is amlogic.

If there's a preference for a particular order platform-wide or tree-wide
then it should probably be documented somewhere?

> status =3D "okay";

I think #address-cells and #size-cells belong at the end of the list,
even after "status", just before any child nodes. They describe
properties or requirements for the child nodes, not for the node they
sit in.

> > +
> > +     flash@0 {
> > +             compatible =3D "jedec,spi-nor";
> > +             reg =3D <0>;
> > +             spi-max-frequency =3D <52000000>;
> > +     };
> > +};
> > +
>
> ..snip..
>
> > +
> > +&pmic {
> > +     interrupts-extended =3D <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> > +};
> > +
> > +&scp {
> > +     memory-region =3D <&scp_mem_reserved>;
> > +     status =3D "okay";
> > +};
> > +
> > +&spi0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&spi0_pins>;
>
> Order:
>
> pinctrl-0 =3D <&spi0_pins>;
> pinctrl-names =3D "default";
>
> Please apply this to other nodes

See above.

ChenYu

> > +     status =3D "okay";
> > +};
> > +
> > +&spi1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&spi1_pins>;
> > +     status =3D "okay";
> > +};
> > +
> > +&spi2 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&spi2_pins>;
> > +     status =3D "okay";
> > +};
> > +
> > +&u3phy0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&u3phy1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&u3phy2 {
> > +     status =3D "okay";
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&uart0_pins>;
> > +     status =3D "okay";
> > +};
> > +
>
> ..snip..
>
> > +             };
> > +     };
> > +};
>
> After that:
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>
> --
> Regards,
> Alexandre

