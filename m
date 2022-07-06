Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEF2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CD6qBSGMwwhziKw7AqsMm4SoHVzEtoIvWOjnoFjfKS0=; b=w/QFi6cK+PZS5wIjIxpya+11tI
	2+0OD+vQfhKUZ+I+IiqHWDqHie1sCY0tHXa8pzEHuuNBGqw3KREdc9gchYHgXh6Wl09R8hT58AVUv
	1nnzUd4mxAZiQvsJEUX4GOdRsnInCvgBheHgEJfCnRRdbqon5rxpT2toCGwiXdpCY1HSlaCGJFOdX
	xYrJ61zbqDdFNUA+fBG6i7lx6uD+Xq5ja9QbJKN9eK7nzJjf08SMaA4mfKTmSRry0L2iLcyCmlP+U
	zd7OHM7oqPKmkJYSdypsVq5XI1SlplMu2SZodz83wAYI0pRP1JFnQCu1NisAhKQQpcVIsRpULH5dV
	ww6l5DCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93if-009n0Y-2h; Wed, 06 Jul 2022 12:01:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93iQ-009mtt-UT; Wed, 06 Jul 2022 12:01:12 +0000
X-UUID: 30de24a1603744a8ac0bcad31c9164d6-20220706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:569aeb10-f23c-49da-8e7e-1468024033ff,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:8410c5d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 30de24a1603744a8ac0bcad31c9164d6-20220706
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 542843085; Wed, 06 Jul 2022 05:01:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 6 Jul 2022 20:00:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 6 Jul 2022 20:00:32 +0800
Message-ID: <eec6aee5cd023fff6d986882db0330e1ab85a59d.camel@mediatek.com>
Subject: Re: [PATCH v1 08/16] arm64: dts: mt8195: Add power domains
 controller
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Weiyi Lu
	<weiyi.lu@mediatek.com>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 6 Jul 2022 20:00:32 +0800
In-Reply-To: <3b65405d-167f-a0c7-d15e-5da6f08d99b3@linaro.org>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
	 <20220704100028.19932-9-tinghan.shen@mediatek.com>
	 <3b65405d-167f-a0c7-d15e-5da6f08d99b3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_050111_053316_6BAACF31 
X-CRM114-Status: GOOD (  20.35  )
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

Hi Krzysztof,

After discussing your message with our power team, 
we realized that we need your help to ensure we fully understand you.

On Mon, 2022-07-04 at 14:38 +0200, Krzysztof Kozlowski wrote:
> On 04/07/2022 12:00, Tinghan Shen wrote:
> > Add power domains controller node for mt8195.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 327 +++++++++++++++++++++++
> >  1 file changed, 327 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 8d59a7da3271..d52e140d9271 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -10,6 +10,7 @@
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/phy/phy.h>
> >  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> > +#include <dt-bindings/power/mt8195-power.h>
> >  
> >  / {
> >  	compatible = "mediatek,mt8195";
> > @@ -338,6 +339,332 @@
> >  			#interrupt-cells = <2>;
> >  		};
> >  
> > +		scpsys: syscon@10006000 {
> > +			compatible = "syscon", "simple-mfd";
> 
> These compatibles cannot be alone.

the scpsys sub node has the compatible of the power domain driver.
do you suggest that the compatible in the sub node should move to here?

> > +			reg = <0 0x10006000 0 0x1000>;
> > +			#power-domain-cells = <1>;
> 
> If it is simple MFD, then probably it is not a power domain provider.
> Decide.

this MFD device is the power controller on mt8195. Some features need 
to do some operations on registers in this node. We think that implement 
the operation of these registers as the MFD device can provide flexibility 
for future use. We want to clarify if you're saying that an MFD device 
cannot be a power domain provider.



Best regards,
TingHan





