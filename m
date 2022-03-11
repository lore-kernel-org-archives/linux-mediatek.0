Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A31C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 01:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKa/75aiVpH/iDQJAKRkj0+wgMgLvmVBIPZ1kwRBB3E=; b=GnukjtM91KB/2k
	xTd4uArjuFTYgY7chH9BDejmyabPyTBYpGvTiGf3uBIKJzjRI6iUOMbGg06naZS+Rr+1PXRBMAgGl
	vyfZfAAgbDgtptSoibm4UyUFLdP7nQSauXat5sh6gD+eH6E/wkJPW0hXzS6qp/3BmeIEwhPoJjSQj
	pybu/KWRg+8s1MwNth9d/W+OaiSRgMUrlnwu46Zo9ZKfvkCDHtAx+LZevP0mLWDXYZrKoYR/xngki
	ToWyCLLXkY+U63Hj6thNS7vkgxEXJlZj82ty5ojjsvdH1kuX9laf1+H9NAgGngfHNzRDBXt5jDoCX
	vfqZPCdMR9aky6yhFb0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSUQj-00EX4t-MX; Fri, 11 Mar 2022 01:50:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSUQX-00EX2x-5Z; Fri, 11 Mar 2022 01:50:46 +0000
X-UUID: 03fd05da0af647ce8115e7077bb54ec0-20220310
X-UUID: 03fd05da0af647ce8115e7077bb54ec0-20220310
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2013685090; Thu, 10 Mar 2022 18:50:40 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 17:50:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Mar 2022 09:50:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Mar 2022 09:50:37 +0800
Message-ID: <b9c16bac0268fd8646b3e359f07303cd1c7d9041.camel@mediatek.com>
Subject: Re: [PATCH v14 22/22] arm64: dts: mt8195: add display node for vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 11 Mar 2022 09:50:37 +0800
In-Reply-To: <b9404776-b5c7-7321-f352-1995dafa1565@collabora.com>
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-23-nancy.lin@mediatek.com>
 <b9404776-b5c7-7321-f352-1995dafa1565@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_175045_247329_AB1ABA20 
X-CRM114-Status: GOOD (  16.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Angelo,

Thanks for the review.

On Thu, 2022-03-10 at 11:53 +0100, AngeloGioacchino Del Regno wrote:
> Il 10/03/22 04:55, Nancy.Lin ha scritto:
> > Add display node for vdosys1.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 223
> > +++++++++++++++++++++++
> >   1 file changed, 223 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index dbca699bba05..e650ec759235 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> 
> 
> ..snip..
> 
> > +
> > +		ethdr0: ethdr@1c114000 {
> > +			compatible = "mediatek,mt8195-disp-ethdr";
> > +			reg = <0 0x1c114000 0 0x1000>,
> > +			      <0 0x1c115000 0 0x1000>,
> > +			      <0 0x1c117000 0 0x1000>,
> > +			      <0 0x1c119000 0 0x1000>,
> > +			      <0 0x1c11A000 0 0x1000>,
> > +			      <0 0x1c11B000 0 0x1000>,
> > +			      <0 0x1c11C000 0 0x1000>;
> 
> Hello Nancy,
> looks like you partially forgot to use lower-case hex here...
> 
> 0x1c11a000 0x1c11b000 0x1c11c000
> 
> > +			reg-names = "mixer", "vdo_fe0", "vdo_fe1",
> > "gfx_fe0", "gfx_fe1",
> > +				    "vdo_be", "adl_ds";
> > +			mediatek,gce-client-reg = <&gce0
> > SUBSYS_1c11XXXX 0x4000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0x5000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0x7000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0x9000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0xA000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0xB000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0xC000 0x1000>;
> 
> ...and here too: 0xa000 0xb000 0xc000
> 
> Please fix that, after which, you can add my
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

OK, I will fix it. Thank you.

Regards,
Nancy
> > +			clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> > +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> > +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> > +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> > +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> > +				 <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> > +				 <&vdosys1 CLK_VDO1_26M_SLOW>,
> > +				 <&vdosys1
> > CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> > +				 <&vdosys1
> > CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> > +				 <&vdosys1
> > CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> > +				 <&vdosys1
> > CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> > +				 <&vdosys1
> > CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> > +				 <&topckgen CLK_TOP_ETHDR>;
> > +			clock-names = "mixer", "vdo_fe0", "vdo_fe1",
> > "gfx_fe0", "gfx_fe1",
> > +				      "vdo_be", "adl_ds",
> > "vdo_fe0_async", "vdo_fe1_async",
> > +				      "gfx_fe0_async",
> > "gfx_fe1_async","vdo_be_async",
> > +				      "ethdr_top";
> > +			power-domains = <&spm
> > MT8195_POWER_DOMAIN_VDOSYS1>;
> > +			iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> > +				 <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> > +			interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH
> > 0>; /* disp mixer */
> > +			resets = <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> > +				 <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> > +				 <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> > +				 <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> > +				 <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
> > +		};
> > +
> >   	};
> >   };
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
