Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC25C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gfijubv01mZGVzHbC70CoXeXFHSitTu3ah+CLJlrtMU=; b=MSmE+NPLsqIdSIvnNXiuyaqq/5
	1xPWaTJGbCufdCLbAdQsPuMFpVQNJ1/cSUVjcUqk3zShvMzQjTkwFgcDI0L9Yi3FJiIfYiTqiQJzW
	/Nw8YfmMOIYx2JSGVzPkskWuRBl+VsLwUFm1S43lugXOdKDojZ5FVWiMm5IXSTzuwUTUBZEzJYYRU
	CwN3NxGjfzJDr3AaUTo5oOPjEFEmcdHn6JmOlDuHIl2TKaV06VwksTCWGkCRILdsxYzVDYdzV92RD
	gzlJF83aA4e2pJzmrFUbuR4L6F3yPVVpeTmdRZ3Q+g2IPWs9eNDvuzkDVph8PQI9GiqAU7EK3OzvD
	icfHRi3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUo8-001moP-1Y; Fri, 24 Feb 2023 09:56:04 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUnn-001mdx-Du
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:55:45 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id j14so20755570vse.3
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gfijubv01mZGVzHbC70CoXeXFHSitTu3ah+CLJlrtMU=;
        b=YN6gwgAtMOuJN4hv+VJMZWdMyQlkH1J3uJbZKe7L8CUovbBPCiOb/QeBlZNK1354U4
         ujsWLINYib0s5gkjzt3PyGiagaPxr9LGFjhQf7djo66Hw/r3KfNk/OgaczGkPyinK3Sy
         CxTUlpc3LalSB/OWaNRej75eiCNec+Q7e43+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gfijubv01mZGVzHbC70CoXeXFHSitTu3ah+CLJlrtMU=;
        b=fmpJ9q/5inzxQ+PPhgdEVyNbjuUh/Q011svBBFVTwVVJO6hSDIgnhSHdncCnJXMwUG
         4/NatC3rkxCSNv25LmNbWEyKS6isBiDurTBmtzZNmYs60h/K0FPBEXfp2FesPj0XATB0
         4p4ZqOApdQb8jCmeOal8C2pkjyAtoFdAELKEWAAdS5LczVxz1NxlV7OoLmfQACNN6DyY
         WNyc1yUsTzldVREGiK9m77PyBDN3YqHrYi4pvAhcUOxsBc5LBNZCTd/k1+UQHQCp24ic
         YPgffqsW0BjnTq9kljKoxvmwUPbNNWMix4M6y5Xbd5NqkhJd76sZ452EvvZ5mttfJCMC
         m0Kg==
X-Gm-Message-State: AO0yUKWraglfMCuzEuLscD2rdjbABWUQ4ittC4TYwSaD5gKviRKhY8hK
	Xv8qcef71edpUQyxab8LZSWejQDGkoGgDebx9bPh4A==
X-Google-Smtp-Source: AK7set+BLbWM4vwOZ/kL8dEafMsH9ImLZl2f7DMC/6vh5cp8DYQMfIz7ULzLSZcck+JM3pbxpwKK5dbEbgLEwPp5Iaw=
X-Received: by 2002:a67:d21c:0:b0:402:999f:51dd with SMTP id
 y28-20020a67d21c000000b00402999f51ddmr2196895vsi.3.1677232542557; Fri, 24 Feb
 2023 01:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:55:31 +0800
Message-ID: <CAGXv+5H4a686nZPWjd7yFXSDCjttg0OPz1VD_8ppGASKgTWc7g@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] arm64: dts: mediatek: mt8192: Add GPU nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015543_504365_192B2699 
X-CRM114-Status: GOOD (  15.24  )
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

On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> The MediaTek MT8192 includes a Mali-G57 GPU supported in Panfrost. Add
> the GPU node to the device tree to enable 3D acceleration.
>
> The GPU node is disabled by default. It should be enabled by board with
> its power supplies correctly assigned.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> [nfraprado: removed sram supply, tweaked opp node name, adjusted commit m=
essage]
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> [wenst@: disable GPU by default; adjusted prefix; split out board change]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 109 +++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 87b91c8feaf9..2a3606f68ae4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -312,6 +312,91 @@ timer: timer {
>                 clock-frequency =3D <13000000>;
>         };
>
> +       gpu_opp_table: opp-table-0 {
> +               compatible =3D "operating-points-v2";
> +               opp-shared;
> +
> +               opp-358000000 {
> +                       opp-hz =3D /bits/ 64 <358000000>;
> +                       opp-microvolt =3D <606250>;
> +               };
> +
> +               opp-399000000 {
> +                       opp-hz =3D /bits/ 64 <399000000>;
> +                       opp-microvolt =3D <618750>;
> +               };
> +
> +               opp-440000000 {
> +                       opp-hz =3D /bits/ 64 <440000000>;
> +                       opp-microvolt =3D <631250>;
> +               };
> +
> +               opp-482000000 {
> +                       opp-hz =3D /bits/ 64 <482000000>;
> +                       opp-microvolt =3D <643750>;
> +               };
> +
> +               opp-523000000 {
> +                       opp-hz =3D /bits/ 64 <523000000>;
> +                       opp-microvolt =3D <656250>;
> +               };
> +
> +               opp-564000000 {
> +                       opp-hz =3D /bits/ 64 <564000000>;
> +                       opp-microvolt =3D <668750>;
> +               };
> +
> +               opp-605000000 {
> +                       opp-hz =3D /bits/ 64 <605000000>;
> +                       opp-microvolt =3D <681250>;
> +               };
> +
> +               opp-647000000 {
> +                       opp-hz =3D /bits/ 64 <647000000>;
> +                       opp-microvolt =3D <693750>;
> +               };
> +
> +               opp-688000000 {
> +                       opp-hz =3D /bits/ 64 <688000000>;
> +                       opp-microvolt =3D <706250>;
> +               };
> +
> +               opp-724000000 {
> +                       opp-hz =3D /bits/ 64 <724000000>;
> +                       opp-microvolt =3D <725000>;
> +               };
> +
> +               opp-748000000 {
> +                       opp-hz =3D /bits/ 64 <748000000>;
> +                       opp-microvolt =3D <737500>;
> +               };
> +
> +               opp-772000000 {
> +                       opp-hz =3D /bits/ 64 <772000000>;
> +                       opp-microvolt =3D <750000>;
> +               };
> +
> +               opp-795000000 {
> +                       opp-hz =3D /bits/ 64 <795000000>;
> +                       opp-microvolt =3D <762500>;
> +               };
> +
> +               opp-819000000 {
> +                       opp-hz =3D /bits/ 64 <819000000>;
> +                       opp-microvolt =3D <775000>;
> +               };
> +
> +               opp-843000000 {
> +                       opp-hz =3D /bits/ 64 <843000000>;
> +                       opp-microvolt =3D <787500>;
> +               };
> +
> +               opp-866000000 {
> +                       opp-hz =3D /bits/ 64 <866000000>;
> +                       opp-microvolt =3D <800000>;
> +               };
> +       };
> +
>         soc {
>                 #address-cells =3D <2>;
>                 #size-cells =3D <2>;
> @@ -1266,6 +1351,30 @@ mmc1: mmc@11f70000 {
>                         status =3D "disabled";
>                 };
>
> +               gpu: gpu@13000000 {
> +                       compatible =3D "mediatek,mt8192-mali", "arm,mali-=
valhall-jm";
> +                       reg =3D <0 0x13000000 0 0x4000>;
> +                       interrupts =3D
> +                               <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
> +                               <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
> +                               <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;

Nit: Move the first entry to the same line as the property, and align
the following lines' angle brackets?

Same for the power-domains.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +                       interrupt-names =3D "job", "mmu", "gpu";
> +
> +                       clocks =3D <&apmixedsys CLK_APMIXED_MFGPLL>;
> +
> +                       power-domains =3D
> +                               <&spm MT8192_POWER_DOMAIN_MFG2>,
> +                               <&spm MT8192_POWER_DOMAIN_MFG3>,
> +                               <&spm MT8192_POWER_DOMAIN_MFG4>,
> +                               <&spm MT8192_POWER_DOMAIN_MFG5>,
> +                               <&spm MT8192_POWER_DOMAIN_MFG6>;
> +                       power-domain-names =3D "core0", "core1", "core2",=
 "core3", "core4";
> +
> +                       operating-points-v2 =3D <&gpu_opp_table>;
> +
> +                       status =3D "disabled";
> +               };
> +
>                 mfgcfg: clock-controller@13fbf000 {
>                         compatible =3D "mediatek,mt8192-mfgcfg";
>                         reg =3D <0 0x13fbf000 0 0x1000>;
> --
> 2.39.2
>

