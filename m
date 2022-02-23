Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLhIj64I6pwIzkOv4sRztnPBcNKN6m3dSDwceNoVQrI=; b=XcpxLov+2tGPbf
	p4cwEndO0u7rjXzqMOnkQt6CZELgPDcpHrAzj11wGRuKN0H4L1c1YwJFCRxU/OdQwxKu0nf0j02TJ
	lLqICsTsi4C0qF3zYJPLz/rDh4asprBMclst8Tc0S//7Gp3tfzdHXw1A+Vn+hqkghY4hMO0zTDGCm
	hOpUXuNkjpkrz0IC+zVHWeQGkvp/fFCLUwgXgkAFbUpSuefGOACb9UYilC/7H4zDUwqT7FiAesHwz
	QJPc5nxkxuyxtV53kpU7LpAosIxhx6UQJL1IeD6a6SFZZWTxv4mmm5laBD7uDQ8h9zazw34Oa3bHx
	1mHA4vWuilnmBZobES+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMtgV-00F3n1-3X; Wed, 23 Feb 2022 15:36:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMtgG-00F3gm-I7; Wed, 23 Feb 2022 15:35:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 76B041F429B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645630549;
 bh=tP0g/xufzKKvhWPi4v/n2vm5kmuNUItMFZ3CsZ84rbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FsqqG4jtdYxdTUGEACf3J8GFzjVQsjSqjIr4GVNPFl/fgoeETax4lz1Z7FK4i8cgl
 b35wyK80nEnrFeup3RAGiyqzRaAJsdWWB3cpYiIwhe6TZJOc3R7fVVnpJd3p1RGW/2
 +BzBu0YDgwgbqGfy2sdcerbr9H1c1MNl8Gf4+UZn7rZ8ACPV7qWIt6d3NI9/Nv7KDF
 XvPmmIgRM/7oLDCR3PKnThmABiuBbmDOgae+7ekPPodV3CqCaSE/8kiUAjJHburRA+
 1WNfFRS1SFnGCkuNq7x/4aJYWrUl/f1Xo6xR4dXy9tG41OHFyFIt9IsESFNL+bF8KM
 MSHMfwZut4Dbw==
Date: Wed, 23 Feb 2022 10:35:44 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 20/23] arm64: dts: mt8192: Add display nodes
Message-ID: <20220223153544.nmaufqixkchp5zkq@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-21-allen-kh.cheng@mediatek.com>
 <CAGXv+5H8WY6=qvcz1CARfjf5UREH7i7v2Uz99frby5S=eqV6gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGXv+5H8WY6=qvcz1CARfjf5UREH7i7v2Uz99frby5S=eqV6gQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_073552_889102_946B1824 
X-CRM114-Status: GOOD (  16.21  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 22, 2022 at 06:24:29PM +0800, Chen-Yu Tsai wrote:
> Hi,
> =

> On Fri, Feb 18, 2022 at 5:16 PM Allen-KH Cheng
> <allen-kh.cheng@mediatek.com> wrote:
> >
> > Add display nodes for mt8192 SoC.
> >
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 115 +++++++++++++++++++++++
> >  1 file changed, 115 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8192.dtsi
> > index e3314cdc7c1a..026f2d8141b0 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -32,6 +32,11 @@
> >                 i2c7 =3D &i2c7;
> >                 i2c8 =3D &i2c8;
> >                 i2c9 =3D &i2c9;
> > +               ovl0 =3D &ovl0;
> > +               ovl-2l0 =3D &ovl_2l0;
> > +               ovl-2l2 =3D &ovl_2l2;
> > +               rdma0 =3D &rdma0;
> > +               rdma4 =3D &rdma4;
> >         };
> >
> >         clk26m: oscillator0 {
> > @@ -1224,6 +1229,13 @@
> >                         #clock-cells =3D <1>;
> >                 };
> >
> > +               mutex: mutex@14001000 {
> > +                       compatible =3D "mediatek,mt8192-disp-mutex";
> > +                       reg =3D <0 0x14001000 0 0x1000>;
> > +                       interrupts =3D <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH=
 0>;
> > +                       clocks =3D <&mmsys CLK_MM_DISP_MUTEX0>;
> > +               };
> > +
> >                 smi_common: smi@14002000 {
> >                         compatible =3D "mediatek,mt8192-smi-common";
> >                         reg =3D <0 0x14002000 0 0x1000>;
> > @@ -1255,6 +1267,109 @@
> >                         power-domains =3D <&spm MT8192_POWER_DOMAIN_DIS=
P>;
> >                 };
> >
> > +               ovl0: ovl@14005000 {
> > +                       compatible =3D "mediatek,mt8192-disp-ovl";
> > +                       reg =3D <0 0x14005000 0 0x1000>;
> > +                       interrupts =3D <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH=
 0>;
> > +                       clocks =3D <&mmsys CLK_MM_DISP_OVL0>;
> > +                       iommus =3D <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
> > +                                <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
> > +                       power-domains =3D <&spm MT8192_POWER_DOMAIN_DIS=
P>;
> > +               };
> > +
> > +               ovl_2l0: ovl@14006000 {
> > +                       compatible =3D "mediatek,mt8192-disp-ovl-2l";
> > +                       reg =3D <0 0x14006000 0 0x1000>;
> > +                       interrupts =3D <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH=
 0>;
> > +                       power-domains =3D <&spm MT8192_POWER_DOMAIN_DIS=
P>;
> > +                       clocks =3D <&mmsys CLK_MM_DISP_OVL0_2L>;
> > +                       iommus =3D <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
> > +                                <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
> > +               };
> > +
> > +               rdma0: rdma@14007000 {
> > +                       compatible =3D "mediatek,mt8192-disp-rdma";
> > +                       reg =3D <0 0x14007000 0 0x1000>;
> > +                       interrupts =3D <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH=
 0>;
> > +                       clocks =3D <&mmsys CLK_MM_DISP_RDMA0>;
> > +                       iommus =3D <&iommu0 M4U_PORT_L0_DISP_RDMA0>;
> > +                       mediatek,larb =3D <&larb0>;
> > +                       mediatek,rdma-fifo-size =3D <5120>;
> > +                       power-domains =3D <&spm MT8192_POWER_DOMAIN_DIS=
P>;
> > +               };
> > +
> > +               color0: color@14009000 {
> > +                       compatible =3D "mediatek,mt8192-disp-color",
> > +                                    "mediatek,mt8173-disp-color";
> > +                       reg =3D <0 0x14009000 0 0x1000>;
> > +                       interrupts =3D <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH=
 0>;
> > +                       power-domains =3D <&spm MT8192_POWER_DOMAIN_DIS=
P>;
> > +                       clocks =3D <&mmsys CLK_MM_DISP_COLOR0>;
> > +               };
> > +
> > +               ccorr0: ccorr@1400a000 {
> > +                       compatible =3D "mediatek,mt8192-disp-ccorr";
> > +                       reg =3D <0 0x1400a000 0 0x1000>;
> > +                       interrupts =3D <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH=
 0>;
> > +                       power-domains =3D <&spm MT8192_POWER_DOMAIN_DIS=
P>;
> > +                       clocks =3D <&mmsys CLK_MM_DISP_CCORR0>;
> > +               };
> > +
> > +               aal0: aal@1400b000 {
> > +                       compatible =3D "mediatek,mt8192-disp-aal";
> =

> git.kernel.org/chunkuang.hu/c/4ed545e7d10049b5492afc184e61a67e478a2cfd
> =

> suggests that there should be a fallback compatible? Otherwise this
> doesn't probe.

Indeed, the "mediatek,mt8173-disp-aal" compatible should be appended here f=
or
the node to probe.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
