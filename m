Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 02:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gy2ytux/w9C0XwgNd3GjCzaa+hUjmK54OfaiP6kcO8Y=; b=ThNq4zK+K8nSS0WlQbsH789Su/
	z/wcsAxjlObx9Q1sV28MXKRaRjSuP7Qz0cuveVudNGikKWbflAbsaw5ssWmxBEJP50qzA6kL8WrPR
	X8tiqhzSk/0xoCMZ4GPepFbTX5Q3Ze225foiq15qH6HAhCcSgROJjDJAYXx7ljwu6jGEAPPsgIEqV
	j1nr0TIABXSI5fHVVCEBXmNmH2WwJr0FxF6uQk0LPzb8/YVZglsFk3SGIPbfWiVFt/r68JG8u/3Pr
	aLr7qlYuZZXTTTXAhitmwqqSqYZ/KVT8b964yChi6EGnefpX6vaSjDcmlhO4PyuxceBVillHoi5wd
	qdgnYBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oftlC-00Byt4-Jm; Wed, 05 Oct 2022 02:03:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oftl9-00Bys0-Et; Wed, 05 Oct 2022 02:03:45 +0000
X-UUID: 092afcd10596413493a878dee0b4a4ca-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=gy2ytux/w9C0XwgNd3GjCzaa+hUjmK54OfaiP6kcO8Y=;
	b=cO4F98n9Z4Yc82zW8McCfo9Lmx6W0A/emsk8HeQLBOwcJk/UO45fc3nA+TKZSmQm8V2OJgdREtLTNSjx4voEitqoFSfPnXhTZeacuIg+VUkzkljwIx5Vg3L7/GGzvbcg4iYNRobz3kvv0q0dYwCopJoCgW5pWUK8D0usQaSWC+8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:ce1c2fa0-9774-4c3e-a750-9e0809f82ee4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:136a40fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 092afcd10596413493a878dee0b4a4ca-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 118260088; Tue, 04 Oct 2022 19:03:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 5 Oct 2022 09:53:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 5 Oct 2022 09:53:34 +0800
Message-ID: <f6d231ca6e8fbd4e9340e6fff363b29e405efba1.camel@mediatek.com>
Subject: Re: [PATCH v1 2/6] dts: arm64: mt8195: add MMSYS and MUTEX
 configuration for VPPSYS
From: moudy ho <moudy.ho@mediatek.com>
To: Allen-KH Cheng =?UTF-8?Q?=28=E7=A8=8B=E5=86=A0=E5=8B=B3=29?=
	<Allen-KH.Cheng@mediatek.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "Roy-CW Yeh
 =?UTF-8?Q?=28=E8=91=89=E4=B8=AD=E7=91=8B=29?=" <Roy-CW.Yeh@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 5 Oct 2022 09:53:34 +0800
In-Reply-To: <c80af435ec4fec9419c47a73c0bda112ef62c76d.camel@mediatek.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
	 <20221004093319.5069-3-moudy.ho@mediatek.com>
	 <c80af435ec4fec9419c47a73c0bda112ef62c76d.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_190343_524828_215D45BD 
X-CRM114-Status: GOOD (  20.44  )
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

On Tue, 2022-10-04 at 19:46 +0800, Allen-KH Cheng (程冠勳) wrote:
> Hi Moudy,
> 
> On Tue, 2022-10-04 at 17:33 +0800, Moudy Ho wrote:
> > From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> > 
> > Compatible names of VPPSYS0 and VPPSYS1 should be renamed to
> > "mediatek,mt8195-mmsys" to match the description of the binding
> > file.
> > Also, add two nodes for MT8195 VPPSYS0/1 MUTEX.
> > 
> > Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 22
> > ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 905d1a90b406..7f54fa7d0185 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1477,11 +1477,20 @@
> >  		};
> >  
> >  		vppsys0: clock-controller@14000000 {
> > -			compatible = "mediatek,mt8195-vppsys0";
> > +			compatible = "mediatek,mt8195-mmsys";
> >  			reg = <0 0x14000000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce1
> > SUBSYS_1400XXXX 0 0x1000>;
> >  			#clock-cells = <1>;
> >  		};
> >  
> 
> I run "ARCH=arm64 make dtbs check" and some of the tests failed.
> 
> The node name should be 'syscon' from mediatek/mediatek,mmsys.yaml.
> 
> 
> > +		vpp0-mutex@1400f000 {
> > +			compatible = "mediatek,mt8195-vpp-mutex";
> > +			reg = <0 0x1400f000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce1
> > SUBSYS_1400XXXX 0xf000 0x1000>;
> > +			clocks = <&vppsys0 CLK_VPP0_MUTEX>;
> > +			power-domains = <&spm
> > MT8195_POWER_DOMAIN_VPPSYS0>;
> > +		};
> > +
> 
> 'interrupts' is a required property from mediatek/mediatek,mutex.yaml
> 
> 
> >  		smi_sub_common_vpp0_vpp1_2x1: smi@14010000 {
> >  			compatible = "mediatek,mt8195-smi-sub-common";
> >  			reg = <0 0x14010000 0 0x1000>;
> > @@ -1582,11 +1591,20 @@
> >  		};
> >  
> >  		vppsys1: clock-controller@14f00000 {
> > -			compatible = "mediatek,mt8195-vppsys1";
> > +			compatible = "mediatek,mt8195-mmsys";
> >  			reg = <0 0x14f00000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce1
> > SUBSYS_14f0XXXX 0 0x1000>;
> 
> Node name: syscon.
> 
> >  			#clock-cells = <1>;
> >  		};
> >  
> > +		vpp1-mutex@14f01000 {
> > +			compatible = "mediatek,mt8195-vpp-mutex";
> > +			reg = <0 0x14f01000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce1
> > SUBSYS_14f0XXXX 0x1000 0x1000>;
> > +			clocks = <&vppsys1 CLK_VPP1_DISP_MUTEX>;
> > +			power-domains = <&spm
> > MT8195_POWER_DOMAIN_VPPSYS1>;
> > +		};
> > +
> 
> 'interrupts' is a required property
> 
> Thanks,
> Allen
> 

Hi Allen,

Apologies for the failed test, I'll check again by adding dtsb_check
instead of just dt_binding_check .

Thanks & Regards,
Moudy

> >  		larb5: larb@14f02000 {
> >  			compatible = "mediatek,mt8195-smi-larb";
> >  			reg = <0 0x14f02000 0 0x1000>;
> 
> 
> 


