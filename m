Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D596ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V4ISJ1pSA6PqL2bSlrt/KFVdLf7Qresglb+Otewhw8=; b=Y11Lrmve5DP1WepeEn4b4vDHpl
	zZNp+Yugy2N5W9xwDCfK5xeItE0ZCZQ5LClf6T6Yj/jT8ylJZydomnaLJYZOo3ZMgvDZGQqpb/p9Y
	8gI4ixBuLWnDDLo8pofw1nQz1ep8gF2BYJ+4pwj/SgDxMn3Djl0oy+0QCBPk/AyzIj6Q8/lMStWXZ
	H55J8Gn0F5gIaKKiAjhrY9nFFzf5ocXUYnWb6FzkEycYVcJCk9WMJo0XhoQGyIoPoQaOWiW7I6/cJ
	J4/Q72uhkR9rW5X9FaWgxd3wlRfyZCGkN8u9DoH0/Lzn82PcwFB+gz1CLrnoQ7WTHNxq5M04aEl86
	cYxeAMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkSn-004Cvv-P8; Thu, 15 Sep 2022 08:43:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkSl-004Cv5-H5; Thu, 15 Sep 2022 08:43:12 +0000
X-UUID: a1b2141050954199810bf977b8d31073-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=2V4ISJ1pSA6PqL2bSlrt/KFVdLf7Qresglb+Otewhw8=;
	b=gYXijqSQhE3/J/2NToiB2wQqFbam+DeNvKZLztSmC+CHfRSniaQBDPctaznvMYslFNdZt5Ftlpl+g+esEnIedIoLcbwWvAOh8ZLY00WMrXuLrmXwOWl7AQ9v4OJUIw+MPtTg70XkG4zqayzhi9/1mgPO/hxqYYRZZKWxJHX30mU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:07f51d07-d435-4715-b8d1-86420b79ca4b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:1059c05d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a1b2141050954199810bf977b8d31073-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1575881947; Thu, 15 Sep 2022 01:43:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 15 Sep 2022 16:32:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 15 Sep 2022 16:32:31 +0800
Message-ID: <7cec789d6d54f4bb85e9129d39a3da52e26293dd.camel@mediatek.com>
Subject: Re: [PATCH 1/4] arm64: dts: mt8195: Add dp-intf nodes
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 15 Sep 2022 16:32:31 +0800
In-Reply-To: <f882ab40-b9bf-3f38-d62e-c175135383c3@collabora.com>
References: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
	 <20220915075849.1920-2-rex-bc.chen@mediatek.com>
	 <f882ab40-b9bf-3f38-d62e-c175135383c3@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_014311_595521_6AEACC49 
X-CRM114-Status: GOOD (  16.88  )
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

On Thu, 2022-09-15 at 16:13 +0800, AngeloGioacchino Del Regno wrote:
> Il 15/09/22 09:58, Bo-Chen Chen ha scritto:
> > Add dp-intf0 and dp-intf1 nodes for MT8195.
> > 
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 23
> > +++++++++++++++++++++++
> >   1 file changed, 23 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 905d1a90b406..93e6a106a9b8 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -2155,5 +2155,28 @@
> >   			clock-names = "apb", "smi", "gals";
> >   			power-domains = <&spm
> > MT8195_POWER_DOMAIN_VDOSYS1>;
> >   		};
> > +
> > +		dp_intf0: dp-intf@1c015000 {
> 
> Please keep the devicetree nodes ordered by mmio.
> dp_intf0 goes between mutex@1c016000 and larb@1c018000.
> 

Hello Angelo,

Thanks for your review.

I think it should be merge@1c014000 and mutex@1c016000?
I will move dp-intf@1c015000 between them.

> > +			status = "disabled";
> 
> status = "disabled" across the entire mt8195.dtsi nodes is always at
> the end.
> Please keep consistency.
> 

OK, I will modify this in next version.

BRs,
Bo-Chen

> > +			compatible = "mediatek,mt8195-dp-intf";
> > +			reg = <0 0x1c015000 0 0x1000>;
> > +			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&vdosys0  CLK_VDO0_DP_INTF0>,
> > +				 <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
> > +				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
> > +			clock-names = "engine", "pixel", "pll";
> > +		};
> > +
> > +		dp_intf1: dp-intf@1c113000 {
> > +			compatible = "mediatek,mt8195-dp-intf";
> > +			reg = <0 0x1c113000 0 0x1000>;
> > +			interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			power-domains = <&spm
> > MT8195_POWER_DOMAIN_VDOSYS1>;
> > +			clocks = <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
> > +				 <&vdosys1 CLK_VDO1_DPINTF>,
> > +				 <&apmixedsys CLK_APMIXED_TVDPLL2>;
> > +			clock-names = "engine", "pixel", "pll";
> > +			status = "disabled";
> > +		};
> >   	};
> >   };
> 
> 


