Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgNCPn+Czft5XsldyjFNf7mAGdonjrD6d1W++KdSAWg=; b=Nw5d8zwMnpuQD/
	JLGD0Ux3x4cnCmEg+ZxIuFjlBUhmYoVwO6+VYbgX2rwgZV3zCuicuUlewJMeoD/NyARNT0cf3dd0e
	wRWrRSWNc0h3FKUw19n14jWxwEW9cSIvSUHBDItbhpsSHYkjauBOF613CZpsqAlyt0jyFLR++bX/w
	FN9fEWs6zCsASxNZ603OPFq0IXGYZ9gC/hLaSQ2gLe7tiI8pVn6MYyGBFS8gzj/IWVyNpgzFxmgDK
	RlENCEWVX2YrfRPichswAmsyggEoQYOeJY58QEV1jRC5e1keBTKrx0ramFoNA/E7G7yy24ffgXe39
	pVk6uzRqYv4G2e5ytaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ6hm-00BOim-A6; Tue, 29 Mar 2022 07:55:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ6hj-00BOiI-Ek; Tue, 29 Mar 2022 07:55:53 +0000
X-UUID: b7cffa761c174ba591e3307b24f44915-20220329
X-UUID: b7cffa761c174ba591e3307b24f44915-20220329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1887318357; Tue, 29 Mar 2022 00:55:45 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 00:45:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Mar 2022 15:45:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 15:45:41 +0800
Message-ID: <e4edbb8d599fe202aa89f4dea88e6addfbeb4e0d.camel@mediatek.com>
Subject: Re: [PATCH v4 17/22] arm64: dts: mt8192: Add dpi node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Tue, 29 Mar 2022 15:45:41 +0800
In-Reply-To: <019b1a59-7531-75cf-3b86-d2798ca9823a@gmail.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-18-allen-kh.cheng@mediatek.com>
 <019b1a59-7531-75cf-3b86-d2798ca9823a@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_005551_537161_D13A42C6 
X-CRM114-Status: GOOD (  16.50  )
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

Hi Matthias,

On Fri, 2022-03-25 at 16:24 +0100, Matthias Brugger wrote:
> 
> On 18/03/2022 15:45, Allen-KH Cheng wrote:
> > Add dpi node for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 71ad3adeed51..a77d405dd508 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1236,6 +1236,17 @@
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
> > +				 <&mmsys CLK_MM_DISP_DPI0>,
> > +				 <&apmixedsys CLK_APMIXED_TVDPLL>;
> > +			clock-names = "pixel", "engine", "pll";
> > +			status = "disabled";
> 
> We are missing the output port node here.
> 
> Regards,
> Matthias
> 

We will add output port in mt8192-asurada.dtsi (inlude mt8192.dtsi) for
board level.

Do we need to add any futher information in binding?

Thanks,
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
