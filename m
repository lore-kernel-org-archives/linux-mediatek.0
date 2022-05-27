Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CF6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 May 2022 09:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjV0p8Tn2dASMinr5d/VZt1VSxKuZpEq7bSa3CNLku8=; b=p43dk2gwimuhhu
	aoN2mQqww6YMLKX8S740oXslEDlPQ04ECKsPMIjQX4OkUo3r+5anCplkFZrcFQPKL2qMq5aJTL4qj
	GmLdbEhGvg2U1OXapCszV/3NBAywgmMDEW0lMnbThSRIdybIabCuyzz6Tqj6EHp9DOUpZ42wpWozq
	a2U+AtO9fCGlPVILMRJyydE8YOTLx0U2hVaHv9UyfqwTN50Ca8zDl4vJYUVBo+Au8i4fajEXpbQUV
	RHPCCo2gAcfVHyhE9WOzIBYbFdIiHMzvybESFTZN8lRsOfpkbk3gPx3oVZN90r4YRUInX23uwEjIi
	odBCVBZgovtjfM/FCXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuWAh-00HARP-AE; Fri, 27 May 2022 09:22:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuWAe-00HAQj-QM; Fri, 27 May 2022 09:22:14 +0000
X-UUID: 5012ecd83080478382aae17911aedd2f-20220527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:4f74c49c-e6f9-45f6-a545-90061712255a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:866ab847-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 5012ecd83080478382aae17911aedd2f-20220527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1383275097; Fri, 27 May 2022 02:22:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 May 2022 02:15:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 27 May 2022 17:15:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 27 May 2022 17:15:54 +0800
Message-ID: <665fbe316c2a57f9ba7cf4c4c1a6918a6eda10e2.camel@mediatek.com>
Subject: Re: [PATCH v16 3/4] dts: arm64: mt8183: add Mediatek MDP3 nodes
From: moudy.ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
	<roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Date: Fri, 27 May 2022 17:15:54 +0800
In-Reply-To: <8a0f7ab0-e814-0908-d4b3-99540994db3e@collabora.com>
References: <20220520083006.27789-1-moudy.ho@mediatek.com>
	 <20220520083006.27789-4-moudy.ho@mediatek.com>
	 <8a0f7ab0-e814-0908-d4b3-99540994db3e@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_022212_913077_A01F9159 
X-CRM114-Status: GOOD (  19.09  )
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

On Mon, 2022-05-23 at 17:31 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/05/22 10:30, Moudy Ho ha scritto:
> > Add device nodes for Media Data Path 3 (MDP3) modules.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 79
> > +++++++++++++++++++++++-
> >   1 file changed, 78 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index fc6ac2a46324..5b6c18f51787 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -1389,6 +1389,50 @@
> >   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0 0x1000>;
> >   		};
> >   
> > +		mdp3_rdma0: mdp3-rdma0@14001000 {
> 
> Are these phandles necessary?
> I don't think that any machine will ever override these... and in
> case this will be
> needed in the future, we can always add them later.
> 

Hi Angelo,

Thanks for the suggestion, I'll remove the phandle in next version.

Regards,
Moudy
> > +			compatible = "mediatek,mt8183-mdp3-rdma";
> > +			reg = <0 0x14001000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0x1000 0x1000>;
> > +			power-domains = <&spm
> > MT8183_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> > +				 <&mmsys CLK_MM_MDP_RSZ1>;
> > +			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> > +			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
> > +				 <&gce 21 CMDQ_THR_PRIO_LOWEST 0>;
> > +		};
> > +
> > +		mdp3_rsz0: mdp3-rsz0@14003000 {
> > +			compatible = "mediatek,mt8183-mdp3-rsz";
> > +			reg = <0 0x14003000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0x3000 0x1000>;
> > +			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> > +		};
> > +
> > +		mdp3_rsz1: mdp3-rsz1@14004000 {
> > +			compatible = "mediatek,mt8183-mdp3-rsz";
> > +			reg = <0 0x14004000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0x4000 0x1000>;
> > +			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> > +		};
> > +
> > +		mdp3_wrot0: mdp3-wrot0@14005000 {
> > +			compatible = "mediatek,mt8183-mdp3-wrot";
> > +			reg = <0 0x14005000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0x5000 0x1000>;
> > +			power-domains = <&spm
> > MT8183_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_MDP_WROT0>;
> > +			iommus = <&iommu M4U_PORT_MDP_WROT0>;
> > +		};
> > +
> > +		mdp3_wdma: mdp3-wdma@14006000 {
> > +			compatible = "mediatek,mt8183-mdp3-wdma";
> > +			reg = <0 0x14006000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0x6000 0x1000>;
> > +			power-domains = <&spm
> > MT8183_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_MDP_WDMA0>;
> > +			iommus = <&iommu M4U_PORT_MDP_WDMA0>;
> > +		};
> > +
> >   		ovl0: ovl@14008000 {
> >   			compatible = "mediatek,mt8183-disp-ovl";
> >   			reg = <0 0x14008000 0 0x1000>;
> > @@ -1513,7 +1557,33 @@
> >   			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
> >   			power-domains = <&spm
> > MT8183_POWER_DOMAIN_DISP>;
> >   			mediatek,gce-events =
> > <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
> > -					      <CMDQ_EVENT_MUTEX_STREAM_
> > DONE1>;
> > +					      <CMDQ_EVENT_MUTEX_STREAM_
> > DONE1>,
> > +					      <CMDQ_EVENT_MDP_RDMA0_SOF
> > >,
> > +					      <CMDQ_EVENT_MDP_RDMA0_EOF
> > >,
> > +					      <CMDQ_EVENT_MDP_RSZ0_SOF>
> > ,
> > +					      <CMDQ_EVENT_MDP_RSZ1_SOF>
> > ,
> > +					      <CMDQ_EVENT_MDP_TDSHP_SOF
> > >,
> > +					      <CMDQ_EVENT_MDP_WROT0_SOF
> > >,
> > +					      <CMDQ_EVENT_MDP_WROT0_EOF
> > >,
> > +					      <CMDQ_EVENT_MDP_WDMA0_SOF
> > >,
> > +					      <CMDQ_EVENT_MDP_WDMA0_EOF
> > >,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_0>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_1>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_2>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_3>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_4>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_5>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_6>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_7>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_8>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_9>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_10>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_11>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_12>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_13>,
> > +					      <CMDQ_EVENT_ISP_FRAME_DON
> > E_P2_14>,
> > +					      <CMDQ_EVENT_WPE_A_DONE>,
> > +					      <CMDQ_EVENT_SPE_B_DONE>;
> >   			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX
> > 0x6000 0x1000>;
> >   		};
> >   
> > @@ -1538,6 +1608,13 @@
> >   			power-domains = <&spm
> > MT8183_POWER_DOMAIN_DISP>;
> >   		};
> >   
> > +		mdp3_ccorr: mdp3-ccorr@1401c000 {
> 
> Same comment applies here too.
> 
> Cheers,
> Angelo
> 
> > +			compatible = "mediatek,mt8183-mdp3-ccorr";
> > +			reg = <0 0x1401c000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX
> > 0xc000 0x1000>;
> > +			clocks = <&mmsys CLK_MM_MDP_CCORR>;
> > +		};
> > +
> >   		imgsys: syscon@15020000 {
> >   			compatible = "mediatek,mt8183-imgsys",
> > "syscon";
> >   			reg = <0 0x15020000 0 0x1000>;
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
