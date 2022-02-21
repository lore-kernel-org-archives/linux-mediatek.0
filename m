Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BD7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WhLMgf0IOMhfSH57zeWTMdfli5JLtx/Hco6MOtZI+Y=; b=xguUMocq12Zuno
	eX3umI32x/GTpnR58l2QK2GjYzYeZgo4zQVZnKC+4UeagOxQdaerwDmtSRMOmFnQU60VxZYGmo9Od
	vqwcbRgLXa6k4C2k8BPA8cboh4SlK0xwYrC/5SfnGtF8h41Xyr2+A4m7QIzSW6JB4phOMKqhIBrMo
	1q3Q+7RmFzvIENS7sHQn/AmENvBGpLScY65lZ5BdWM2Dlsr3yilPSrH3u8YBgmtyxJQ5oc7EB3QNI
	5a2OqUlyz6Is0hxi1mlEe/9k1gTF0CulTP/YMJyx3nMluOXGdSFxIjtpnu13VSPDmY/3Sj0UzDyrP
	NmY3AJUYGQ0MVh66+i/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9Ar-0064BV-PB; Mon, 21 Feb 2022 13:56:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8iz-005uGI-8F; Mon, 21 Feb 2022 13:27:34 +0000
X-UUID: f2a22a9e3f9f497095bb26c11e0ffee3-20220221
X-UUID: f2a22a9e3f9f497095bb26c11e0ffee3-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 796421345; Mon, 21 Feb 2022 06:27:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 05:17:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 21 Feb 2022 21:17:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 21:17:28 +0800
Message-ID: <29dae90eb130fd8e217a379744b944fd0dc23671.camel@mediatek.com>
Subject: Re: [PATCH v2 23/23] arm64: dts: mt8192: Add pwm node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Mon, 21 Feb 2022 21:17:28 +0800
In-Reply-To: <b28ca906-efa8-9f6e-8364-b053c1fead2e@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-24-allen-kh.cheng@mediatek.com>
 <b28ca906-efa8-9f6e-8364-b053c1fead2e@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_052733_353378_8F9F2A8F 
X-CRM114-Status: GOOD (  16.26  )
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
> > Add pwm node for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index df884c48669e..c0fc723fdf0a 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -642,6 +642,16 @@
> >   			status = "disabled";
> >   		};
> >   
> > +		pwm0: pwm@1100e000 {
> > +			compatible = "mediatek,mt8183-disp-pwm";
> > +			reg = <0 0x1100e000 0 0x1000>;
> > +			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			#pwm-cells = <2>;
> > +			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>,
> > +				 <&infracfg CLK_INFRA_DISP_PWM>;
> > +			clock-names = "main", "mm";
> 
> Depending on the machine, some displays may not be using this PWM
> node, so:
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
> >   		spi1: spi@11010000 {
> >   			compatible = "mediatek,mt8192-spi",
> >   				     "mediatek,mt6765-spi";
> > 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
