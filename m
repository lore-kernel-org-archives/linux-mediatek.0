Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93BFC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 15:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRQrl5U9lMtNgzq+MdqmyJdFN3iRrkVwUAs+rJ7mf28=; b=ODRc8qil1L/vw+UaPtc73ofl8I
	70jNZW7ZSpGd4WIFNt17IvKiP2vgBq1Rbc5AvlKlkalbrlX1B9vUPERbfaeBgOrczkydJELGDIKk9
	L+a8Vs+5wWrS2vW0YAR70JkbhwSzL9oAh6xX2jj7ADyNm9VrwWdeIRSrQmae880N/4S0SxKSnKvW8
	+HMHuEvv7xZ0Vy+S34kKOmWXHnjkJawoJzZ8ij3wwS9WoFevjXJyjDlThV+xcXH+jHiqRVROLDIq8
	GNTKo70Wurlr3ogYXmaUIdPW0vhyzEpUmJ9R3lnGmd9/ULbhBOx50f2WNJqBYCoVen3A4fthDSzcp
	ZVJ2Jpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCov-00DbeW-9p; Mon, 06 Mar 2023 15:32:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCoj-00Dbb3-Ud; Mon, 06 Mar 2023 15:32:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA65961013;
	Mon,  6 Mar 2023 15:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B422C433A8;
	Mon,  6 Mar 2023 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678116719;
	bh=rRHqdKMHPWS/LjhmJ23Rc1dXdnIHUm1Jr8BzRDwRJ+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aSYzF2ecWPWDMaM6cUrTAMbvIsldA4drf9R+JCTEQvmvwViieJhkO01+/M5p98Kuo
	 saMe6/z+BUS9J4uZjhd/5krgzQdNI6x8QKQA8krznQtBcv/qf+MPI4/QIp5Q/9HuUF
	 tcBKeyQR+1FDqCJhMiHFLMB8axxHXDSLAmvHwdw0Li5Njdf2mBoqZ91W/R4FKECexw
	 EI3p/1pFrsqemTCqc/E/dQQuvzlGzQZb0hmDzQykxD1xliTpLrak7gyWalzAhLmnd7
	 wlSnfxNiPhjl+dBU47YD1fXyySt3wCUrbqjbG1SGq7tXvh80IjkFcKaaM4TaabS9YQ
	 xJYyRlkmo5Z/A==
Received: by mail-lj1-f176.google.com with SMTP id x6so10090132ljq.1;
        Mon, 06 Mar 2023 07:31:59 -0800 (PST)
X-Gm-Message-State: AO0yUKXRShTFxXF/a9ySJ4Pbh9s9jSxTC7R1ZINmhJJ1Ct640jGFw3xn
	BwAZMcsPGPp7uWiO20+JQHpnGecNGZjHIlYmlw==
X-Google-Smtp-Source: AK7set8UntwEJ6mrYVsM5Db2la8gI8Llk2OG70nJiG7YKqjsiVHpGpJYhjWb4W9quf1biMBNHaS9hrRgUlcM3rripuo=
X-Received: by 2002:a2e:a0d2:0:b0:296:a59d:c969 with SMTP id
 f18-20020a2ea0d2000000b00296a59dc969mr5890413ljm.5.1678116717143; Mon, 06 Mar
 2023 07:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20221107072413.16178-1-nancy.lin@mediatek.com> <20221107072413.16178-2-nancy.lin@mediatek.com>
In-Reply-To: <20221107072413.16178-2-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 6 Mar 2023 23:31:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY__4R==J+v7etAHyaHokFGRC=phqBzR0oUXizhT2pFDotQ@mail.gmail.com>
Message-ID: <CAAOTY__4R==J+v7etAHyaHokFGRC=phqBzR0oUXizhT2pFDotQ@mail.gmail.com>
Subject: Re: [PATCH v28 1/7] dt-bindings: mediatek: add ethdr definition for mt8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux@roeck-us.net, 
	nfraprado@collabora.com, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
	singo.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_073202_135122_63FBE258 
X-CRM114-Status: GOOD (  22.64  )
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

Hi, Nancy:

I've lost the v29 mail, so I reply in this mail for v29.
I got some message by make dt_binding_check.

/home/chunkuang/git/linux/Documentation/devicetree/bindings/display/mediate=
k/mediatek,ethdr.example.dtb:
hdr-engine@1c114000: mediatek,gce-client-reg:0: [4294967295, 7, 16384,
4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295, 7,
45056, 4096, 4294967295, 7, 49152, 4096] is too long
From schema: /home/chunkuang/git/linux/Documentation/devicetree/bindings/di=
splay/mediatek/mediatek,ethdr.yaml
/home/chunkuang/git/linux/Documentation/devicetree/bindings/display/mediate=
k/mediatek,ethdr.example.dtb:
hdr-engine@1c114000: mediatek,gce-client-reg: [[4294967295, 7, 16384,
4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295, 7,
45056, 4096, 4294967295, 7, 49152, 4096]] is too short
From schema: /home/chunkuang/git/linux/Documentation/devicetree/bindings/di=
splay/mediatek/mediatek,ethdr.yaml

Regards,
Chun-Kuang.

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2022=E5=B9=B411=E6=9C=887=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:24=E5=AF=AB=E9=81=93=EF=BC=9A

>
> Add vdosys1 ETHDR definition.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ethdr.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,et=
hdr.yaml
> new file mode 100644
> index 000000000000..3b11e47a8834
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y=
aml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Ethdr Device
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description:
> +  ETHDR (ET High Dynamic Range) is a MediaTek internal HDR engine and is
> +  designed for HDR video and graphics conversion in the external display=
 path.
> +  It handles multiple HDR input types and performs tone mapping, color
> +  space/color format conversion, and then combine different layers,
> +  output the required HDR or SDR signal to the subsequent display path.
> +  This engine is composed of two video frontends, two graphic frontends,
> +  one video backend and a mixer. ETHDR has two DMA function blocks, DS a=
nd ADL.
> +  These two function blocks read the pre-programmed registers from DRAM =
and
> +  set them to HW in the v-blanking period.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-disp-ethdr
> +
> +  reg:
> +    maxItems: 7
> +
> +  reg-names:
> +    items:
> +      - const: mixer
> +      - const: vdo_fe0
> +      - const: vdo_fe1
> +      - const: gfx_fe0
> +      - const: gfx_fe1
> +      - const: vdo_be
> +      - const: adl_ds
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    items:
> +      - description: mixer clock
> +      - description: video frontend 0 clock
> +      - description: video frontend 1 clock
> +      - description: graphic frontend 0 clock
> +      - description: graphic frontend 1 clock
> +      - description: video backend clock
> +      - description: autodownload and menuload clock
> +      - description: video frontend 0 async clock
> +      - description: video frontend 1 async clock
> +      - description: graphic frontend 0 async clock
> +      - description: graphic frontend 1 async clock
> +      - description: video backend async clock
> +      - description: ethdr top clock
> +
> +  clock-names:
> +    items:
> +      - const: mixer
> +      - const: vdo_fe0
> +      - const: vdo_fe1
> +      - const: gfx_fe0
> +      - const: gfx_fe1
> +      - const: vdo_be
> +      - const: adl_ds
> +      - const: vdo_fe0_async
> +      - const: vdo_fe1_async
> +      - const: gfx_fe0_async
> +      - const: gfx_fe1_async
> +      - const: vdo_be_async
> +      - const: ethdr_top
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: video frontend 0 async reset
> +      - description: video frontend 1 async reset
> +      - description: graphic frontend 0 async reset
> +      - description: graphic frontend 1 async reset
> +      - description: video backend async reset
> +
> +  reset-names:
> +    items:
> +      - const: vdo_fe0_async
> +      - const: vdo_fe1_async
> +      - const: gfx_fe0_async
> +      - const: gfx_fe1_async
> +      - const: vdo_be_async
> +
> +  mediatek,gce-client-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: The register of display function block to be set by gce=
.
> +      There are 4 arguments in this property, gce node, subsys id, offse=
t and
> +      register size. The subsys id is defined in the gce header of each =
chips
> +      include/dt-bindings/gce/<chip>-gce.h, mapping to the register of d=
isplay
> +      function block.
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    minItems: 7
> +    maxItems: 7
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - resets
> +  - mediatek,gce-client-reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +    #include <dt-bindings/memory/mt8195-memory-port.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +    #include <dt-bindings/reset/mt8195-resets.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        hdr-engine@1c114000 {
> +                compatible =3D "mediatek,mt8195-disp-ethdr";
> +                reg =3D <0 0x1c114000 0 0x1000>,
> +                      <0 0x1c115000 0 0x1000>,
> +                      <0 0x1c117000 0 0x1000>,
> +                      <0 0x1c119000 0 0x1000>,
> +                      <0 0x1c11a000 0 0x1000>,
> +                      <0 0x1c11b000 0 0x1000>,
> +                      <0 0x1c11c000 0 0x1000>;
> +                reg-names =3D "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", =
"gfx_fe1",
> +                            "vdo_be", "adl_ds";
> +                mediatek,gce-client-reg =3D <&gce0 SUBSYS_1c11XXXX 0x400=
0 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0x5000 =
0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0x7000 =
0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0x9000 =
0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0xa000 =
0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0xb000 =
0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0xc000 =
0x1000>;
> +                clocks =3D <&vdosys1 CLK_VDO1_DISP_MIXER>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> +                         <&vdosys1 CLK_VDO1_26M_SLOW>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> +                         <&topckgen CLK_TOP_ETHDR>;
> +                clock-names =3D "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0"=
, "gfx_fe1",
> +                              "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_=
fe1_async",
> +                              "gfx_fe0_async", "gfx_fe1_async","vdo_be_a=
sync",
> +                              "ethdr_top";
> +                power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +                iommus =3D <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> +                         <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> +                interrupts =3D <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* d=
isp mixer */
> +                resets =3D <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE=
0_DL_ASYNC>,
> +                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_=
DL_ASYNC>,
> +                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_=
DL_ASYNC>,
> +                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_=
DL_ASYNC>,
> +                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_D=
L_ASYNC>;
> +                reset-names =3D "vdo_fe0_async", "vdo_fe1_async", "gfx_f=
e0_async",
> +                              "gfx_fe1_async", "vdo_be_async";
> +        };
> +    };
> +...
> --
> 2.18.0
>

