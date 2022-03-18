Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B8EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nx/V0d9Vq/Yomu2ym+jtijyoGJxY/DdxgLvPGJVWKvg=; b=kFnHNYIpvxZ0Rx
	2ZkN9WRRRQeHmUHnLZqCKgwLDcOYMG1TRBFtlYpJFCUjDb8XgYvioKSvA9B5ttFNUyTj0U1wXTnxa
	wbxz10f6lsRy+4oBY0DuM+PDDRMff9HjTRrwZZEMfLUPFcnSZNNdrmvTMq68HawUaJRpBzryAs0Xb
	5mb7NRI2oixiIScMOE6QCe3LNL3MlEq2BSyCzOTU+Wg7zBRyphzD/qHBny9SCUFdVRrj2qGeeuVn4
	MsWxoGqHWpqmvOb2kacL7Co2CsZ7PEPaaUlNqdxeqAgALJ/s/h504EJ57MacQOV7h3VZ7OnSNo9xn
	Zi2YMdEbJ/iLmNo1dCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVBWR-001Wxc-Kx; Fri, 18 Mar 2022 12:15:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVBWP-001Wvu-5y; Fri, 18 Mar 2022 12:15:58 +0000
X-UUID: 0560481926b94d22b81e6748e3c1492d-20220318
X-UUID: 0560481926b94d22b81e6748e3c1492d-20220318
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1058364113; Fri, 18 Mar 2022 05:15:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 05:15:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 20:15:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 20:15:45 +0800
Message-ID: <0b425a7038cbe91852925d0574f986ca06b29da7.camel@mediatek.com>
Subject: Re: [PATCH v3 19/21] arm64: dts: mt8192: Add dsi node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Fri, 18 Mar 2022 20:15:45 +0800
In-Reply-To: <2c6e0974-1418-82ae-506b-62cd1e5f6d3c@collabora.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-20-allen-kh.cheng@mediatek.com>
 <2c6e0974-1418-82ae-506b-62cd1e5f6d3c@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_051557_259716_A8EA8743 
X-CRM114-Status: GOOD (  17.29  )
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

On Tue, 2022-03-15 at 15:51 +0100, AngeloGioacchino Del Regno wrote:
> Il 04/03/22 14:08, Allen-KH Cheng ha scritto:
> > Add dsi ndoe for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 94f88e52776b..3d16cb0b3ea1 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1327,6 +1327,20 @@
> >   			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> >   		};
> >   
> > +		dsi0: dsi@14010000 {
> > +			compatible = "mediatek,mt8183-dsi";
> > +			reg = <0 0x14010000 0 0x1000>;
> > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			mediatek,syscon-dsi = <&mmsys 0x140>;
> 
> mediatek,syscon-dsi does not exist upstream: here we have proper
> reset controller
> support.
> 
> > +			clocks = <&mmsys CLK_MM_DSI0>,
> > +				 <&mmsys CLK_MM_DSI_DSI0>,
> > +				 <&mipi_tx0>;
> > +			clock-names = "engine", "digital", "hs";
> > +			phys = <&mipi_tx0>;
> > +			phy-names = "dphy";
> 
> On MT8183, we do....
> resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
> 

I'll change it at next version.

Thanks.

Best regards,
Allen

> ...so you need to simply replicate for MT8192. Please do.
> 
> > +			status = "disabled";
> > +		};
> > +
> >   		ovl_2l2: ovl@14014000 {
> >   			compatible = "mediatek,mt8192-disp-ovl-2l";
> >   			reg = <0 0x14014000 0 0x1000>;
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
