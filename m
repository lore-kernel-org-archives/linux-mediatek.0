Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E52EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKCpmr+d4dg2TpIyMsLTea/+6NG4K23muQva/M/UfUM=; b=0bPcIZCN9C6Bk+
	Y+wr/KJmX7Km5+ER6+XK7U1RSh97UfOxtrB/KpOFERnPt/wFlzHL5iVkamyiY8wpSi/yjMqdRwcc8
	JqSlVirIeED/6YwbB4z4duPJBYB9Yv0oh1nmLE5Ke4FDqbdGLUelI/SMH8EuEfiBp9/wbiNQGCyJy
	UqjD8t2F4BgSIMcMGjTJGli3iLTjPjR/E8YTlEoaeuzfYGHh6dPfD9Lz5/Y5XMX2Vd0pVrGPS6A2A
	RwHd/MvnWaonh/LRNRhYXc2CHGQmN8NzV5rvIgXDddzP9Tn3dA6HCwThtXF+DxAGiSx0vVle7vcL3
	sYVw13xi/sSaeNbo9C5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM91h-0060dV-Ju; Mon, 21 Feb 2022 13:46:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8Wf-005qC1-Vb; Mon, 21 Feb 2022 13:14:51 +0000
X-UUID: d30bc3b2496a4e929b5c6b3e54ad2ccf-20220221
X-UUID: d30bc3b2496a4e929b5c6b3e54ad2ccf-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1208941582; Mon, 21 Feb 2022 06:14:47 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 05:14:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 21:14:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 21:14:15 +0800
Message-ID: <c207c9ab6a85fec8408b83e6ef42ca2c4ef9056a.camel@mediatek.com>
Subject: Re: [PATCH v2 21/23] arm64: dts: mt8192: Add dsi node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 21 Feb 2022 21:14:15 +0800
In-Reply-To: <e04d592f-297e-8c22-356c-7246c3c8ab1d@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-22-allen-kh.cheng@mediatek.com>
 <e04d592f-297e-8c22-356c-7246c3c8ab1d@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_051450_093218_A488E77B 
X-CRM114-Status: GOOD (  15.55  )
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

On Fri, 2022-02-18 at 13:56 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> > Add dsi ndoe for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 026f2d8141b0..1f1555fd18f5 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1350,6 +1350,19 @@
> >   			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> >   		};
> >   
> > +		dsi0: dsi@14010000 {
> > +			compatible = "mediatek,mt8183-dsi";
> > +			reg = <0 0x14010000 0 0x1000>;
> > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			mediatek,syscon-dsi = <&mmsys 0x140>;
> > +			clocks = <&mmsys CLK_MM_DSI0>,
> > +				<&mmsys CLK_MM_DSI_DSI0>,
> > +				<&mipi_tx0>;
> > +			clock-names = "engine", "digital", "hs";
> > +			phys = <&mipi_tx0>;
> > +			phy-names = "dphy";
> 
> ...please:
> 			status = "disabled";
> 
Hi Angelo,

It's the same problem with mipi_tx0.

I will update in next version.

Many thanks,
Allen

> > +		};
> > +
> >   		ovl_2l2: ovl@14014000 {
> >   			compatible = "mediatek,mt8192-disp-ovl-2l";
> >   			reg = <0 0x14014000 0 0x1000>;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
