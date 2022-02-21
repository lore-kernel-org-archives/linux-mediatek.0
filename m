Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFDCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nj80RCl5b3BiV7cUcpTS1nYs1qURxVQ0ZOQ6XH3Q9D8=; b=n2F6aHBZeQUzSB
	ePTkdEL9iotXnmcACqV/WoG81r+xEvAFunwxf+b38Rz7SZ2yPPNCa2w0V5y6oshNWYZAaAWviNwp5
	5Q0HHOWOY6AvM+ft2E8DNALLA1udDANYxmhOoOo0GjsXjF51GtGEzr4t9ourfG2LTVajUoMY3Lesh
	XZCrlxA+Bd2e7fncj6JmlCpAEYcA3GkyEOehOQBT3Ioref+QEfzQH8ATU1PFw3sRpTQ6/A19Jr12m
	9ZxQH90duzQ65P9rqIm+qZjdUonX6BfaNJmwjstU3sQDhtmPkxuL5wb+Ns+n6FrLJUpLtaAZJ8L9Y
	u2fnzkbGqXxUkmpEzwCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8z9-005zkt-Mm; Mon, 21 Feb 2022 13:44:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8VM-005pj8-VP; Mon, 21 Feb 2022 13:13:30 +0000
X-UUID: 2510ee3092b24f188fc7a09520848adb-20220221
X-UUID: 2510ee3092b24f188fc7a09520848adb-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1899356144; Mon, 21 Feb 2022 06:13:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 05:13:26 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 21 Feb 2022 21:13:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 21:13:24 +0800
Message-ID: <9cd48fb4ab7c32802323211fdc7406c4a4365c74.camel@mediatek.com>
Subject: Re: [PATCH v2 18/23] arm64: dts: mt8192: Add dpi node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 21 Feb 2022 21:13:24 +0800
In-Reply-To: <0c28ee90-6dc0-9230-1feb-7c0c2cde24c1@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-19-allen-kh.cheng@mediatek.com>
 <0c28ee90-6dc0-9230-1feb-7c0c2cde24c1@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_051329_076724_2DAEB113 
X-CRM114-Status: GOOD (  15.51  )
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
> > Add dpi node for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 543a80252ce5..55bcbf72a366 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1242,6 +1242,16 @@
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> >   		};
> >   
> > +		dpi0: dpi@14016000 {
> > +			compatible = "mediatek,mt8192-dpi";
> > +			reg = <0 0x14016000 0 0x1000>;
> > +			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&mmsys CLK_MM_DPI_DPI0>,
> > +				<&mmsys CLK_MM_DISP_DPI0>,
> > +				<&apmixedsys CLK_APMIXED_TVDPLL>;
> > +			clock-names = "pixel", "engine", "pll";
> 
> Please, for the same reason explained for mipi_tx0:
> 
> 			status = "disabled";
> 
Hi Angelo,

Thsi is the same problem with mipi_tx0.

I will update in next version.

Many thanks,
Allen

> > +		};
> > +
> >   		iommu0: m4u@1401d000 {
> >   			compatible = "mediatek,mt8192-m4u";
> >   			reg = <0 0x1401d000 0 0x1000>;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
