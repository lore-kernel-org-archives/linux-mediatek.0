Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EF7C982D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtWZWTls5fOJzZ7/HCkTV3sZ8RZyOrzPhtTBtiT5PBg=; b=y8Hwm5Kwf27osi676kY6nQev0+
	KzY3GDFcD7sbBxBdWbDlIGZJYccMBIl2WvF13GA9xywD/38eJO5N28qnQ0aHFWd4rloWzXLeLtjNU
	CKghvdHUshdP9dXPExrRcgC1vMYUt5AdNVXn+N/5CrsakaJAg5l4ccii7YIRGl4gAHphYhmsUuRUZ
	wCVRxzmOhOH3x+/CUZbIbLsoJjh3IMUdkf/ea+MRszWdfTjyWgkY28gvZFJ3v+dCTbRsBq9645Kjt
	6mzXBcP1G31z5L74Xpfuz/xmhasMxGt3++OkWytXmIEvy1QtYANFXFW4TPP+rPqs5Xh7zS08G4m0V
	IqctpskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgmI1-0000000EPZC-3GJq;
	Fri, 16 Jan 2026 16:03:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgmI0-0000000EPYY-007L
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 16:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 149BE601B9
	for <linux-mediatek@lists.infradead.org>; Fri, 16 Jan 2026 16:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5D6C19423
	for <linux-mediatek@lists.infradead.org>; Fri, 16 Jan 2026 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768579386;
	bh=BhtIab84IdoeMyJM4092ElaZLaK1ny/rkG7xxvHmUy0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AOLA+Ql+21Qm4zX9fM7uTmeg39naSFS6NqTTgVNaGJELIKXsl2uTGHZJBHz0kPSrI
	 R4dQa4Z0D1RIGXAx7JIB88WlJ5NUTEDw6fgj2SFfKCPnLppF30pcJEvesw803824sH
	 x8MjEomB/AhV5ONwNp8sn/18+/4cP3kfhZ2xSYVX0ZPHWW/RFXlA1QbmCfzZRJMw9J
	 JU81HLeAX42rAdblxrIjNguU5eED6vudZSXWN+8w3gbBVj2Ab6l0mZhx4Ku+pCGoVR
	 XUm67rkb1gPyUozK+FA5zb5Ybi1Iq6J2ClPC3HJdoRgZDfDAzxLV4savFcErGMjyha
	 CjJ0bgRAs59lw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b876c0d5318so319911566b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Jan 2026 08:03:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1Nc+97YUO0jLXD+RcQM7BE23vow2jjIiUDqpV2thHEdyREz8NxAEad3Qh85fAnITutj7aR/WBBtiib4rPbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFhDBp7UNPvWQ5U1hSMJtACX4S9zQAv2QiDJIgSSdWLureyuxA
	JYACZbIGZu4UjGMIIE9tz1/l8cD+OAhPlX1B66JrdTjvc1go2PVP4LIsavU/z90nebGCHCFOs3E
	Lhsw5Lryi0W2nNUJlVDq4q6gppmlPLA==
X-Received: by 2002:a17:906:fe0a:b0:b87:693:31 with SMTP id
 a640c23a62f3a-b8792feb242mr308189566b.52.1768579383254; Fri, 16 Jan 2026
 08:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com> <20251223-openwrt-one-network-v5-2-7d1864ea3ad5@collabora.com>
In-Reply-To: <20251223-openwrt-one-network-v5-2-7d1864ea3ad5@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Jan 2026 10:02:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLffH-MY+6frA_kxwifUPskLY8eNqtBoOP0O7Dxs=XHLQ@mail.gmail.com>
X-Gm-Features: AZwV_QilotzZl5lJNLcliW_LfwPmw5qv0NdDfcdZ6pytb6giOF_8l_TtUZnUaC4
Message-ID: <CAL_JsqLffH-MY+6frA_kxwifUPskLY8eNqtBoOP0O7Dxs=XHLQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] arm64: dts: mediatek: mt7981b: Add PCIe and USB support
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, 
	Bryan Hinton <bryan@bryanhinton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Dec 23, 2025 at 6:38=E2=80=AFAM Sjoerd Simons <sjoerd@collabora.com=
> wrote:
>
> Add device tree nodes for PCIe controller and USB3 XHCI host
> controller on MT7981B SoC. Both controllers share the USB3 PHY
> which can be configured for either USB3 or PCIe operation.
>
> The USB3 XHCI controller supports USB 2.0 and USB 3.0 SuperSpeed
> operation. The PCIe controller is compatible with PCIe Gen2
> specifications.
>
> Also add the topmisc syscon node required for USB/PCIe PHY
> multiplexing.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---
> V1 -> V2: Keep xhci reg and phys properties in single lines
> ---
>  arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 80 +++++++++++++++++++++++++=
++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/=
dts/mediatek/mt7981b.dtsi
> index 416096b80770..d3f37413413e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -2,6 +2,7 @@
>
>  #include <dt-bindings/clock/mediatek,mt7981-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/reset/mt7986-resets.h>
>
>  / {
> @@ -223,6 +224,55 @@ auxadc: adc@1100d000 {
>                         status =3D "disabled";
>                 };
>
> +               xhci: usb@11200000 {
> +                       compatible =3D "mediatek,mt7986-xhci", "mediatek,=
mtk-xhci";
> +                       reg =3D <0 0x11200000 0 0x2e00>, <0 0x11203e00 0 =
0x0100>;
> +                       reg-names =3D "mac", "ippc";
> +                       clocks =3D <&infracfg CLK_INFRA_IUSB_SYS_CK>,
> +                                <&infracfg CLK_INFRA_IUSB_CK>,
> +                                <&infracfg CLK_INFRA_IUSB_133_CK>,
> +                                <&infracfg CLK_INFRA_IUSB_66M_CK>,
> +                                <&topckgen CLK_TOP_U2U3_XHCI_SEL>;
> +                       clock-names =3D "sys_ck", "ref_ck", "mcu_ck", "dm=
a_ck", "xhci_ck";
> +                       interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +                       phys =3D <&u2port0 PHY_TYPE_USB2>, <&u3port0 PHY_=
TYPE_USB3>;
> +                       status =3D "disabled";
> +               };
> +
> +               pcie: pcie@11280000 {
> +                       compatible =3D "mediatek,mt7981-pcie",
> +                                    "mediatek,mt8192-pcie";
> +                       reg =3D <0 0x11280000 0 0x4000>;
> +                       reg-names =3D "pcie-mac";
> +                       ranges =3D <0x82000000 0 0x20000000
> +                                 0x0 0x20000000 0 0x10000000>;
> +                       bus-range =3D <0x00 0xff>;
> +                       clocks =3D <&infracfg CLK_INFRA_IPCIE_CK>,
> +                                <&infracfg CLK_INFRA_IPCIE_PIPE_CK>,
> +                                <&infracfg CLK_INFRA_IPCIER_CK>,
> +                                <&infracfg CLK_INFRA_IPCIEB_CK>;
> +                       clock-names =3D "pl_250m", "tl_26m", "peri_26m", =
"top_133m";
> +                       device_type =3D "pci";
> +                       phys =3D <&u3port0 PHY_TYPE_PCIE>;
> +                       phy-names =3D "pcie-phy";
> +                       interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-map-mask =3D <0 0 0 7>;
> +                       interrupt-map =3D <0 0 0 1 &pcie_intc 0>,
> +                                       <0 0 0 2 &pcie_intc 1>,
> +                                       <0 0 0 3 &pcie_intc 2>,
> +                                       <0 0 0 4 &pcie_intc 3>;
> +                       #address-cells =3D <3>;
> +                       #interrupt-cells =3D <1>;
> +                       #size-cells =3D <2>;
> +                       status =3D "disabled";
> +
> +                       pcie_intc: interrupt-controller {
> +                               interrupt-controller;
> +                               #address-cells =3D <0>;
> +                               #interrupt-cells =3D <1>;
> +                       };
> +               };
> +
>                 pio: pinctrl@11d00000 {
>                         compatible =3D "mediatek,mt7981-pinctrl";
>                         reg =3D <0 0x11d00000 0 0x1000>,
> @@ -252,6 +302,36 @@ mux {
>                         };
>                 };
>
> +               topmisc: topmisc@11d10000 {
> +                       compatible =3D "mediatek,mt7981-topmisc", "syscon=
";
> +                       reg =3D <0 0x11d10000 0 0x10000>;
> +                       #clock-cells =3D <1>;

This is now a warning as the syscon.yaml binding this compatible is
defined in doesn't allow #clock-cells.

Rob

