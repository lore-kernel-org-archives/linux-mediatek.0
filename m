Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440AEC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gu2BxNIuijIF1Juvej7fHAZo9d8DyE5aHPWFVjJ3oo=; b=f0TvKEciHyhNPfwnpCduNwsneA
	a6B7l04iWH7W4Z9YkMPmRyDl2mmGulohImVGx3fRQKqQEuR0SOL3xjJzLBRFhN4YH+zdOCFtIHSb9
	IF1u1vDChFy0FEKqUQhbz6eE/ujZBVQRu4MMVujSdOqcXA5+aCGxlTUotrife3bkcDatvJ0jbrB81
	RRzvkf1uMoSc6HVEqqbXoDaKDFpuHXNPAKf9LQXibh1s2hintR8HSNK9M12503x8QsolIfl1XMgUk
	YmA65l1auqN25wD4mUqkB4XTWmAPdpkFqqx20N27lmIutNHv1WSzdTJRPdLlW/38XGw/e3ue3/5r8
	E6rvnRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3z9U-00AILH-VI; Wed, 22 Jun 2022 12:08:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3z9I-00AIIh-4R; Wed, 22 Jun 2022 12:07:59 +0000
X-UUID: 95218065ea6840ad80b2453e7bd96150-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:8d479821-2ef8-4018-80e4-8ecdba2b29b0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:ae6ec12d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 95218065ea6840ad80b2453e7bd96150-20220622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 417099821; Wed, 22 Jun 2022 05:07:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 05:06:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 22 Jun 2022 20:06:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 20:06:10 +0800
Message-ID: <9a02f733ffcffd03d173bd7d0daac1802b7dcff3.camel@mediatek.com>
Subject: Re: [PATCH v6 16/16] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chun-jie.chen@mediatek.com"
	<chun-jie.chen@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>,
	Runyang Chen =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?=
	<Runyang.Chen@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 22 Jun 2022 20:06:10 +0800
In-Reply-To: <3a587e20-f991-adf8-fe4e-a09caa1e14c7@gmail.com>
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
	 <20220503093856.22250-17-rex-bc.chen@mediatek.com>
	 <3a587e20-f991-adf8-fe4e-a09caa1e14c7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_050756_225905_79BD25DB 
X-CRM114-Status: GOOD (  20.45  )
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

On Wed, 2022-06-22 at 19:08 +0800, Matthias Brugger wrote:
> 
> On 03/05/2022 11:38, Rex-BC Chen wrote:
> > We will use mediatek clock reset as infracfg_ao reset instead of
> > ti-syscon. To support this, remove property of ti reset and add
> > property of #reset-cells for mediatek clock reset.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> My understanding is that using the old DTS with a newer kernel
> wouldn't 
> introduce a regression, correct?
> 
> Applied, thanks!
> 

Hello Matthias,

yes, because there is no user for this infra reset controller in
upstream mainline.

In addition, could you also help to give us some suggestion for Nancy's
series?

Thanks for your big support!

[1]: 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=651900

BRs,
Bo-Chen

> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 13 +------------
> >   1 file changed, 1 insertion(+), 12 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index b57e620c2c72..8e5ac11b19f1 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -10,7 +10,6 @@
> >   #include <dt-bindings/interrupt-controller/irq.h>
> >   #include <dt-bindings/phy/phy.h>
> >   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> > -#include <dt-bindings/reset/ti-syscon.h>
> >   
> >   / {
> >   	compatible = "mediatek,mt8195";
> > @@ -295,17 +294,7 @@
> >   			compatible = "mediatek,mt8195-infracfg_ao",
> > "syscon", "simple-mfd";
> >   			reg = <0 0x10001000 0 0x1000>;
> >   			#clock-cells = <1>;
> > -
> > -			infracfg_rst: reset-controller {
> > -				compatible = "ti,syscon-reset";
> > -				#reset-cells = <1>;
> > -				ti,reset-bits = <
> > -					0x140 18 0x144 18 0 0
> > (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* pcie */
> > -					0x120 0  0x124 0  0 0
> > (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* thermal */
> > -					0x730 10 0x734 10 0 0
> > (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* thermal */
> > -					0x150 5  0x154 5  0 0
> > (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* svs gpu */
> > -				>;
> > -			};
> > +			#reset-cells = <1>;
> >   		};
> >   
> >   		pericfg: syscon@10003000 {


