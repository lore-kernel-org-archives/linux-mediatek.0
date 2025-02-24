Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FAFC021A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 10:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33I10h+7nHN9WWkfMc3v+GlsOaYaEyXk/K9NAesnYxA=; b=sqAq+YT7LMDdLbx/p6PxSnEjIv
	OQaiWcRQX6Y9pXxqqEtIXQIqaHP7TmdC3t9mAcyiKIYRbb4aADLd6IrXLvWtK7q5S4kNAa/AQCEEE
	gGD6KmBOB2yOM865+bQ/GuEYMIuGUW2kPImbxs5JxSYXyWoHzIXbV1A2jW3nfHyrZSiupNP74WgjB
	Gs04XShOgBa8N/+k+7snh8bvFk0NTHb0rLXADThi+76x9T3V3+23ml1bsm9sgm8TWpiMeNfR3Mcb4
	W0HIqpqTz+OJete4eLPG+0uNJC8NUKpgJNolIEwdE5LyYLr7r76A6k3qJ09qJgnFTf+DjiSsIQ2YJ
	NY45kjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW5V-0000000DDuA-11Bd;
	Mon, 24 Feb 2025 10:53:25 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW34-0000000DD28-3rss
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Feb 2025 10:50:56 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3072f8dc069so44673631fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Feb 2025 02:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740394253; x=1740999053; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33I10h+7nHN9WWkfMc3v+GlsOaYaEyXk/K9NAesnYxA=;
        b=O9EwDsoRETUTm1ev5ZQ7HQ/Fknky8INDmJJW+qhrFDVMPFBbPJ2OfL4R9Gs1+dvMiU
         dCAU82kmDEQA1ZHADUa73AmxQ/82BtzkcX/9fCNBzyRhPlOx0Pox799sgS/D2bdFikAp
         XB3jKEp/xhG3+8ZFhvCB3hKtREkrG2GcUdVPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394253; x=1740999053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33I10h+7nHN9WWkfMc3v+GlsOaYaEyXk/K9NAesnYxA=;
        b=eBLeqGg+EUyeduafGK2uc6FUOG99H4n/gTyhd5teSrOeHZ0nc4AKlegbAv1bkvWaJ4
         8WNmbqfrUwetj7U9hrh1cacH1nh1Ec108KpqR1fHzNWoPW5gMLBMR9Gbzr7YxJG0Gk2v
         ZHyFsHX6hm1Qi7vRmmlvNDwgx3bzjQKkHaF/2J7qujvlteU3gzPUoNpufILkiA5eQB91
         cmEoF2OjyL+5esbZDqnLZdZsZLjOr3oObk7ykPAjM+Kc6jbkypNBT0YBinUVMgie/CAr
         yIYB/Jcg07GTsTQJzmGYYRuLTXtR1mlxuDhgLtTsOMABzOhoDnvFbA+HrNHSontKMXy2
         9Yng==
X-Gm-Message-State: AOJu0Yxe78feWsW/cRwoyuXI8Jp5Qt1C5mIr6nK5mTys/9QMKjEl/scD
	TOIbPo0P24O9mbydYx/RnR15EV/OcAIT91rXU2hfcC6KZqytZbCVxLX/ot2JxBF2gUvDCWCA+yK
	SuH98DZiiP2ruAM3RUX6uaB6rOI1JMC0j3j4c
X-Gm-Gg: ASbGncvIf6hIxshfY6anhosY3q8rOmnKZAQNqhFGPMoltbMf1NppDJoXz/QMiPgvgt/
	FGWCtFys/+q/pYHEBnaT7PsojDPKRvpC+1N6dA8bRf86+ct1kHahIO7BGKI/cOsh/meMoHoPhBh
	Oart1w6cj+HU9Pn4LutAb8MK1X7NLbqmNYPcA=
X-Google-Smtp-Source: AGHT+IHNRMFdVG+U7OWDssiE+FdC7MFPSlPh3k/wUhdWTrMt1I2HXTRNphSxg61+hQ7uwUEjQWDTi1xNW22wWxWU8i0=
X-Received: by 2002:a2e:8197:0:b0:308:f3f7:49bc with SMTP id
 38308e7fff4ca-30a59895e21mr41620201fa.16.1740394253010; Mon, 24 Feb 2025
 02:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com> <20250220110948.45596-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250220110948.45596-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Feb 2025 18:50:41 +0800
X-Gm-Features: AWEUYZm0UHtGw-8b7DN3edPwKb-1ZcVXmj8EE7bXKkQWur4lNuL40yg5sa6u8YU
Message-ID: <CAGXv+5EBiYwjNeocGh0ZjWi5mzOZr_CfS6H+7au5vgQgeigUfg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] arm64: dts: mediatek: mt8188: Add base display
 controller graph
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, pablo.sun@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_025054_993122_B20C8894 
X-CRM114-Status: GOOD (  14.90  )
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

On Thu, Feb 20, 2025 at 7:13=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The display related IPs in MT8188 are flexible and support being
> interconnected with different instances of DDP IPs and/or with
> different DDP IPs, forming a full Display Data Path that ends
> with an actual display output, which is board specific.
>
> Add a common graph in the main mt8188.dtsi devicetree, which is
> shared between all of the currently supported boards.
> All boards featuring any display functionality will extend this
> common graph to hook the display controller of the SoC to their
> specific output port(s).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # On MT8188 Ciri (int. and ext=
.)

> ---
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 140 +++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index c226998b7e47..4437b1820f26 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -2868,6 +2868,23 @@ ovl0: ovl@1c000000 {
>                         iommus =3D <&vdo_iommu M4U_PORT_L0_DISP_OVL0_RDMA=
0>;
>                         power-domains =3D <&spm MT8188_POWER_DOMAIN_VDOSY=
S0>;
>                         mediatek,gce-client-reg =3D <&gce0 SUBSYS_1c00XXX=
X 0x0000 0x1000>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       ovl0_in: endpoint { };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       ovl0_out: endpoint {
> +                                               remote-endpoint =3D <&rdm=
a0_in>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 rdma0: rdma@1c002000 {
> @@ -2878,6 +2895,25 @@ rdma0: rdma@1c002000 {
>                         iommus =3D <&vdo_iommu M4U_PORT_L1_DISP_RDMA0>;
>                         power-domains =3D <&spm MT8188_POWER_DOMAIN_VDOSY=
S0>;
>                         mediatek,gce-client-reg =3D <&gce0 SUBSYS_1c00XXX=
X 0x2000 0x1000>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       rdma0_in: endpoint {
> +                                               remote-endpoint =3D <&ovl=
0_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       rdma0_out: endpoint {
> +                                               remote-endpoint =3D <&col=
or0_in>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 color0: color@1c003000 {
> @@ -2887,6 +2923,25 @@ color0: color@1c003000 {
>                         interrupts =3D <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         power-domains =3D <&spm MT8188_POWER_DOMAIN_VDOSY=
S0>;
>                         mediatek,gce-client-reg =3D <&gce0 SUBSYS_1c00XXX=
X 0x3000 0x1000>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       color0_in: endpoint {
> +                                               remote-endpoint =3D <&rdm=
a0_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       color0_out: endpoint {
> +                                               remote-endpoint =3D <&cco=
rr0_in>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 ccorr0: ccorr@1c004000 {
> @@ -2896,6 +2951,25 @@ ccorr0: ccorr@1c004000 {
>                         interrupts =3D <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         power-domains =3D <&spm MT8188_POWER_DOMAIN_VDOSY=
S0>;
>                         mediatek,gce-client-reg =3D <&gce0 SUBSYS_1c00XXX=
X 0x4000 0x1000>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       ccorr0_in: endpoint {
> +                                               remote-endpoint =3D <&col=
or0_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       ccorr0_out: endpoint {
> +                                               remote-endpoint =3D <&aal=
0_in>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 aal0: aal@1c005000 {
> @@ -2905,6 +2979,25 @@ aal0: aal@1c005000 {
>                         interrupts =3D <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         power-domains =3D <&spm MT8188_POWER_DOMAIN_VDOSY=
S0>;
>                         mediatek,gce-client-reg =3D <&gce0 SUBSYS_1c00XXX=
X 0x5000 0x1000>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       aal0_in: endpoint {
> +                                               remote-endpoint =3D <&cco=
rr0_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       aal0_out: endpoint {
> +                                               remote-endpoint =3D <&gam=
ma0_in>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 gamma0: gamma@1c006000 {
> @@ -2914,6 +3007,23 @@ gamma0: gamma@1c006000 {
>                         interrupts =3D <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         power-domains =3D <&spm MT8188_POWER_DOMAIN_VDOSY=
S0>;
>                         mediatek,gce-client-reg =3D <&gce0 SUBSYS_1c00XXX=
X 0x6000 0x1000>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       gamma0_in: endpoint {
> +                                               remote-endpoint =3D <&aal=
0_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       gamma0_out: endpoint { };
> +                               };
> +                       };
>                 };
>
>                 dither0: dither@1c007000 {
> @@ -2923,6 +3033,21 @@ dither0: dither@1c007000 {
>                         interrupts =3D <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         power-domains =3D <&spm MT8188_POWER_DOMAIN_VDOSY=
S0>;
>                         mediatek,gce-client-reg =3D <&gce0 SUBSYS_1c00XXX=
X 0x7000 0x1000>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       dither0_in: endpoint { };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       dither0_out: endpoint { };
> +                               };
> +                       };
>                 };
>
>                 disp_dsi0: dsi@1c008000 {
> @@ -3005,6 +3130,21 @@ postmask0: postmask@1c01a000 {
>                         interrupts =3D <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         power-domains =3D <&spm MT8188_POWER_DOMAIN_VDOSY=
S0>;
>                         mediatek,gce-client-reg =3D <&gce0 SUBSYS_1c01XXX=
X 0xa000 0x1000>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       postmask0_in: endpoint { };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       postmask0_out: endpoint { };
> +                               };
> +                       };
>                 };
>
>                 vdosys0: syscon@1c01d000 {
> --
> 2.48.1
>
>

