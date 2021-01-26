Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C96C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:54:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C71522220B
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C71522220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HRwpuMPTZMCZ+nMZSXqy0gQ0P1PBSnFqvqFUdpNRqQk=; b=IwcHqeomujNpByTzLi9nKOJwH
	YlfvO3x5RArmGQRQCe0HE6ZIYXuB/NNFe4o6tyPMC9ajIN0si5btt0soJbcXuoMHxaq1nra2v5t9v
	fIlZm0sPdulwofffwxgWeTUJo2mw/ihy3o9qJLa6BMpOoZHugFVF4Av/hEmAGoYYu2dwDNF7JpqYu
	FnM8K4J3VCCLOeoalbE6LzC9oGd1+TbjdTmD6hZowmul0Lt2j/b9o5SMJvq3GhNpF2HwhC4jXws4P
	THlLZIVTL+567UPVF9a5ytd8xGjSRKAeJQhEWDS+STb9cGq8aivflewMsF2CfhXSpiCUxExwvJ+Er
	TiN+onlrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4K6z-00071p-GB; Tue, 26 Jan 2021 08:54:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4K6w-00070l-VR; Tue, 26 Jan 2021 08:54:08 +0000
X-UUID: f19c70a70a37441c9d6e179125c919d6-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=04ladyiJRe/ET+NLC+Ueie0MAKsGM3sYbgSIARsb4xc=; 
 b=YSUPBTfbQa76KZzMk95NDS6n2/4nROcdNjMn/ZYrxa6+CQc6FUpg7EuiFrD7MuUVc1A8qnp+O1T1hMAubBKWvnjdFKOSI8RGUgCn32wAyBmqKdR3GSVgR/FLh/oiehv0OMHXeUiJtiXR7iBfIFucTZoZUvBpxNYg5NNNakTSApE=;
X-UUID: f19c70a70a37441c9d6e179125c919d6-20210126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 94517710; Tue, 26 Jan 2021 00:54:03 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 00:44:01 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 16:43:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jan 2021 16:43:59 +0800
Message-ID: <1611650639.20687.2.camel@mtksdaap41>
Subject: Re: [PATCH 2/3] arm64: dts: mt8173: Separating mtk-vcodec-enc
 device node
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Irui Wang <irui.wang@mediatek.com>
Date: Tue, 26 Jan 2021 16:43:59 +0800
In-Reply-To: <20210121061804.26423-2-irui.wang@mediatek.com>
References: <20210121061804.26423-1-irui.wang@mediatek.com>
 <20210121061804.26423-2-irui.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_035407_229156_09ADF37A 
X-CRM114-Status: GOOD (  16.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, srv_heupstream@mediatek.com,
 Alexandre Courbot <acourbot@chromium.org>, Tomasz Figa <tfiga@google.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-21 at 14:18 +0800, Irui Wang wrote:
> There are two separate hardware encoder blocks inside MT8173.
> Split the current mtk-vcodec-enc node to match the hardware architecture.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> 
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 60 ++++++++++++------------
>  1 file changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 7fa870e4386a..d667b296c512 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -1459,13 +1459,10 @@
>  		};
>  
>  		vcodec_enc: vcodec@18002000 {
> -			compatible = "mediatek,mt8173-vcodec-enc";
> -			reg = <0 0x18002000 0 0x1000>,	/* VENC_SYS */
> -			      <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> -			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> -				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> -			mediatek,larb = <&larb3>,
> -					<&larb5>;
> +			compatible = "mediatek,mt8173-vcodec-avc-enc";
> +			reg = <0 0x18002000 0 0x1000>;	/* VENC_SYS */
> +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> +			mediatek,larb = <&larb3>;
>  			iommus = <&iommu M4U_PORT_VENC_RCPU>,
>  				 <&iommu M4U_PORT_VENC_REC>,
>  				 <&iommu M4U_PORT_VENC_BSDMA>,
> @@ -1476,29 +1473,12 @@
>  				 <&iommu M4U_PORT_VENC_REF_LUMA>,
>  				 <&iommu M4U_PORT_VENC_REF_CHROMA>,
>  				 <&iommu M4U_PORT_VENC_NBM_RDMA>,
> -				 <&iommu M4U_PORT_VENC_NBM_WDMA>,
> -				 <&iommu M4U_PORT_VENC_RCPU_SET2>,
> -				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> -				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> +				 <&iommu M4U_PORT_VENC_NBM_WDMA>;
>  			mediatek,vpu = <&vpu>;
> -			clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
> -				 <&topckgen CLK_TOP_VENC_SEL>,
> -				 <&topckgen CLK_TOP_UNIVPLL1_D2>,
> -				 <&topckgen CLK_TOP_VENC_LT_SEL>;
> -			clock-names = "venc_sel_src",
> -				      "venc_sel",
> -				      "venc_lt_sel_src",
> -				      "venc_lt_sel";
> -			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
> -					  <&topckgen CLK_TOP_VENC_LT_SEL>;
> -			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>,
> -						 <&topckgen CLK_TOP_VCODECPLL_370P5>;
> +			clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +			clock-names = "venc_sel";
> +			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
>  		};
>  
>  		jpegdec: jpegdec@18004000 {
> @@ -1530,5 +1510,27 @@
>  				 <&vencltsys CLK_VENCLT_CKE0>;
>  			clock-names = "apb", "smi";
>  		};
> +
> +		vcodec_enc_lt: vcodec@19002000 {
> +			compatible = "mediatek,mt8173-vcodec-vp8-enc";
> +			reg =  <0 0x19002000 0 0x1000>; /* VENC_LT_SYS */
> +			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> +				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> +				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> +			mediatek,larb = <&larb5>;
> +			mediatek,vpu = <&vpu>;
> +			clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +			clock-names = "venc_lt_sel";
> +			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +			assigned-clock-parents =
> +				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
> +		};
>  	};
>  };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
