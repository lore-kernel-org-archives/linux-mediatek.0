Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E11C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 04:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cn/YFGwdDnEHGHGktgMn7Nc60aP/okuaEDQoMRJaZHk=; b=akpZXH9BbEBrc+9XGtxt8Anf2k
	Fgz7bemeCgnlSuZLOGItebYv7qdki4Cd+7LKXMBFM0rgl9YImSLdTLuFPoNyT0ykuPvA/wcBBgtCt
	zuKaJKZhvlxFdLCZec17K49L/wI17xhEz9WV0R4w3DoeBnU0t3Nlu8gz6u1CXGqM7ED1/7yN3OhNQ
	C26UJzd/2aZf74BNmDE8QHqPOc9H0v9K+fME5Fc6/kxr/5hkiYdFCn3sXbgMroZ98nBhEyLoxO6Av
	nFn6MYT7pLmapB9NKPZufUdKJsGlWE0A/TqTSrOtcCIQhDjxggW1KDNxo+CXkL6dryJCKgGgO5zwn
	lb/ivRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8wEb-005eaB-Ma; Wed, 06 Jul 2022 04:01:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8wER-005eVb-2b; Wed, 06 Jul 2022 04:01:44 +0000
X-UUID: ba57000dbf4c405795fecbc43698afeb-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:026bc7e4-e655-4881-b599-d20822436c5e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:28298663-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ba57000dbf4c405795fecbc43698afeb-20220705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2004308232; Tue, 05 Jul 2022 21:01:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 6 Jul 2022 12:01:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 6 Jul 2022 12:01:08 +0800
Message-ID: <1fa0c99d7f22d32e668a5a14501e305b588317ec.camel@mediatek.com>
Subject: Re: [PATCH v1 16/16] arm64: dts: mt8195: Add display node for
 vdosys0
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Yong Wu" <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, "Weiyi
 Lu" <weiyi.lu@mediatek.com>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Date: Wed, 6 Jul 2022 12:01:08 +0800
In-Reply-To: <84ce9b03-9edd-9ef1-aec1-127b34c23021@collabora.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
	 <20220704100028.19932-17-tinghan.shen@mediatek.com>
	 <84ce9b03-9edd-9ef1-aec1-127b34c23021@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_210143_169648_58C7D468 
X-CRM114-Status: GOOD (  16.49  )
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

On Mon, 2022-07-04 at 12:44 +0200, AngeloGioacchino Del Regno wrote:
> Il 04/07/22 12:00, Tinghan Shen ha scritto:
> > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> > 
> > Add display node for vdosys0 of mt8195.
> > 
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 109 +++++++++++++++++++++++
> >   1 file changed, 109 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 724c6ca837b6..faea8ef33e5a 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1961,6 +1961,7 @@
> >   		vdosys0: syscon@1c01a000 {
> >   			compatible = "mediatek,mt8195-mmsys", "syscon";
> >   			reg = <0 0x1c01a000 0 0x1000>;
> > +			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
> >   			#clock-cells = <1>;
> >   		};
> >   
> > @@ -1976,6 +1977,114 @@
> >   			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
> >   		};
> >   
> > +		ovl0: ovl@1c000000 {
> > +			compatible = "mediatek,mt8195-disp-ovl",
> > +				     "mediatek,mt8183-disp-ovl";
> 
> This fits in one line, please fix, here and all of the other instances of that.
> 
> > +			reg = <0 0x1c000000 0 0x1000>;
> > +			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
> > +			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
> > +			mediatek,gce-client-reg =
> > +				 <&gce0 SUBSYS_1c00XXXX 0x0000 0x1000>;
> 
> Same for gce-client-reg.
> 
> Regards,
> Angelo

Ok, I'll update in next version.

Thanks,
TingHan


