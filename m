Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 07:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZVB2LqBbotBu12G25q227qqchCuDeGkQQnUNr3C1U8=; b=F+ET6hn/Z+bD03
	yzN0M7MF2vKR5pJ2ISgDHzEFfpEtjhmrX2uaLgyM1sC786M7aw4fzJeQp+2E0sDkiYCNpA8fPTzy5
	CJZ7roseJGHpGq/0JzCU1hvj2BMBRUdMabloMYfQBTlIdYAo0Zz5dKceZPx6qvsLFvDwyolerzc1O
	kO9Yctzg4gtRwdPrAorq9Uw6F/LddDtB3GVgWWQVo3f30IKCJYXIwtuo8E5mq2rA4BqZWkUh6Kd3p
	/YfSGOaX/Fhze3Xp7mk5IqNdYMY6iDWHsGnrgQ5XhuH7AhobDI3hRZBkdLf331dDmhwUeRwkss6cq
	kkfOrrwij309orqzzkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ5qs-00BFcJ-3K; Tue, 29 Mar 2022 07:01:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ5qp-00BFaN-78; Tue, 29 Mar 2022 07:01:12 +0000
X-UUID: 88fd3b666cf24191b109e67835122f3a-20220329
X-UUID: 88fd3b666cf24191b109e67835122f3a-20220329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2092592003; Tue, 29 Mar 2022 00:01:05 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 23:51:22 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Mar 2022 14:51:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 14:51:20 +0800
Message-ID: <6ab86a35394879cf35fd9d780f8b7ab1695c931b.camel@mediatek.com>
Subject: Re: [PATCH v4 22/22] arm64: dts: mt8192: Add pwm node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Tue, 29 Mar 2022 14:51:16 +0800
In-Reply-To: <51f8baea-6562-1d6b-c409-9c362f0b2fc5@gmail.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-23-allen-kh.cheng@mediatek.com>
 <51f8baea-6562-1d6b-c409-9c362f0b2fc5@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_000111_303967_3846663B 
X-CRM114-Status: GOOD (  22.49  )
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

On Mon, 2022-03-28 at 13:10 +0200, Matthias Brugger wrote:
> 
> On 18/03/2022 15:45, Allen-KH Cheng wrote:
> > Add pwm node for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index f0f0f067c023..ea98b2230f18 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -625,6 +625,17 @@
> >   			status = "disabled";
> >   		};
> >   
> > +		pwm0: pwm@1100e000 {
> > +			compatible = "mediatek,mt8183-disp-pwm";
> > +			reg = <0 0x1100e000 0 0x1000>;
> > +			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> 
> Binding description is missing interrupt property. Remeber that the
> DT should 
> describe the HW, so we need to update the binding description.
> I just wonder what the IRQ signals, as it is not used by the driver.
> Definitely 
> a good candidate to make the commit message more sound. So please add
> it there.
> 
> Thanks!
> Matthias
> 

For interrupt property, we will send anther patch to update binding
and add some information for IRQ into commit message in next version. 

Thanks,
Allen

> > +			#pwm-cells = <2>;
> > +			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>,
> > +				 <&infracfg CLK_INFRA_DISP_PWM>;
> > +			clock-names = "main", "mm";
> > +			status = "disabled";
> > +		};
> > +
> >   		spi1: spi@11010000 {
> >   			compatible = "mediatek,mt8192-spi",
> >   				     "mediatek,mt6765-spi";


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
