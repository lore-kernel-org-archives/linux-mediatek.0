Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6767AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 04:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yxghOszZBjdFVKydnhCMznf8HYGqQap4xfJ9PbbAtA=; b=DEb7Fms9gtNVu4/tLAGLgPIstL
	H3jdrLiR6QT5JeA7ZFDFNBhDojg3+drzjCbLzxIcuWy0LMgCQRMNiPXpRBs1skdW+CC2i1r9KTK1O
	1ZXU9C+btPDxpLdgXQ5CmvGlheHsCwIxjj3NcU1kSn70c4Ko4YOBHfMoyncyPNpujv8msTDdMOGLO
	pHibri23POaopC8ulKO/oEMCdi1OtP/OH3o1AcbOe2RdadK6CGAbdSTAVzq0QDFD8bwl6id8NYaMh
	PBcP7pHgPsQBnTlNZ4xzbC9kyZwukze7Xzi00fY/TF00PcpL7DKRbUIHdmbiAfGdvioiwXBs4+bd8
	n25+ci6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8E5c-004gX2-FZ; Mon, 04 Jul 2022 04:53:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8E5P-004gQF-BY; Mon, 04 Jul 2022 04:53:30 +0000
X-UUID: a5f1298b7ea546babd8dc99d10363d6f-20220703
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:e529fb5c-4895-478e-bd31-dc6248513eb6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:2f1f84d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a5f1298b7ea546babd8dc99d10363d6f-20220703
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 204571670; Sun, 03 Jul 2022 21:53:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 4 Jul 2022 11:52:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Jul 2022 11:52:40 +0800
Message-ID: <d76f77e50adbf44afbb1c32d8b30c7ee543beafb.camel@mediatek.com>
Subject: Re: [PATCH v20 3/4] arm64: dts: mt8183: add Mediatek MDP3 nodes
From: CK Hu <ck.hu@mediatek.com>
To: Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
	<roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Date: Mon, 4 Jul 2022 11:52:40 +0800
In-Reply-To: <20220630091408.6438-4-moudy.ho@mediatek.com>
References: <20220630091408.6438-1-moudy.ho@mediatek.com>
	 <20220630091408.6438-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_215327_429741_FEC7D357 
X-CRM114-Status: GOOD (  16.60  )
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

Hi, Moudy:

On Thu, 2022-06-30 at 17:14 +0800, Moudy Ho wrote:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 79
> +++++++++++++++++++++++-
>  1 file changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 9485c1efc87c..938f0c4b7525 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1691,6 +1691,50 @@
>  			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> 0 0x1000>;
>  		};
>  
> +		mdp3-rdma0@14001000 {
> +			compatible = "mediatek,mt8183-mdp3-rdma";
> +			reg = <0 0x14001000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> 0x1000 0x1000>;
> +			power-domains = <&spm
> MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +				 <&mmsys CLK_MM_MDP_RSZ1>;
> +			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> +			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
> +				 <&gce 21 CMDQ_THR_PRIO_LOWEST 0>;
> +		};
> +
> +		mdp3-rsz0@14003000 {
> +			compatible = "mediatek,mt8183-mdp3-rsz";
> +			reg = <0 0x14003000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> 0x3000 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> +		};
> +
> +		mdp3-rsz1@14004000 {
> +			compatible = "mediatek,mt8183-mdp3-rsz";
> +			reg = <0 0x14004000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> 0x4000 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> +		};
> +
> +		mdp3-wrot0@14005000 {
> +			compatible = "mediatek,mt8183-mdp3-wrot";
> +			reg = <0 0x14005000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> 0x5000 0x1000>;
> +			power-domains = <&spm
> MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_MDP_WROT0>;
> +			iommus = <&iommu M4U_PORT_MDP_WROT0>;
> +		};
> +
> +		mdp3-wdma@14006000 {
> +			compatible = "mediatek,mt8183-mdp3-wdma";
> +			reg = <0 0x14006000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> 0x6000 0x1000>;
> +			power-domains = <&spm
> MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_MDP_WDMA0>;
> +			iommus = <&iommu M4U_PORT_MDP_WDMA0>;
> +		};
> +
>  		ovl0: ovl@14008000 {
>  			compatible = "mediatek,mt8183-disp-ovl";
>  			reg = <0 0x14008000 0 0x1000>;
> @@ -1809,7 +1853,33 @@
>  			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&spm
> MT8183_POWER_DOMAIN_DISP>;
>  			mediatek,gce-events =
> <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
> -					      <CMDQ_EVENT_MUTEX_STREAM_
> DONE1>;
> +					      <CMDQ_EVENT_MUTEX_STREAM_
> DONE1>,
> +					      <CMDQ_EVENT_MDP_RDMA0_SOF
> >,
> +					      <CMDQ_EVENT_MDP_RDMA0_EOF
> >,

This event is sent from MDP_RDMA0 to GCE, so move this event to
MDP_RDMA0 node.

> +					      <CMDQ_EVENT_MDP_RSZ0_SOF>
> ,
> +					      <CMDQ_EVENT_MDP_RSZ1_SOF>
> ,
> +					      <CMDQ_EVENT_MDP_TDSHP_SOF
> >,
> +					      <CMDQ_EVENT_MDP_WROT0_SOF
> >,
> +					      <CMDQ_EVENT_MDP_WROT0_EOF
> >,
> +					      <CMDQ_EVENT_MDP_WDMA0_SOF
> >,
> +					      <CMDQ_EVENT_MDP_WDMA0_EOF
> >,

This event is sent from MDP_WDMA0 to GCE, so move this event to
MDP_WDMA0 node.

> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_0>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_1>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_2>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_3>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_4>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_5>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_6>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_7>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_8>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_9>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_10>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_11>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_12>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_13>,
> +					      <CMDQ_EVENT_ISP_FRAME_DON
> E_P2_14>,
> +					      <CMDQ_EVENT_WPE_A_DONE>,

This event is sent from WPE_A to GCE, so move this event to WPE_A node.

Regards,
CK

> +					      <CMDQ_EVENT_SPE_B_DONE>;
>  			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX
> 0x6000 0x1000>;
>  		};
>  
> @@ -1834,6 +1904,13 @@
>  			power-domains = <&spm
> MT8183_POWER_DOMAIN_DISP>;
>  		};
>  
> +		mdp3-ccorr@1401c000 {
> +			compatible = "mediatek,mt8183-mdp3-ccorr";
> +			reg = <0 0x1401c000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX
> 0xc000 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_CCORR>;
> +		};
> +
>  		imgsys: syscon@15020000 {
>  			compatible = "mediatek,mt8183-imgsys",
> "syscon";
>  			reg = <0 0x15020000 0 0x1000>;


