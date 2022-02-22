Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E99C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 23:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/P9yenJLYYGtHm6cPOKM+dh4ZFOLRCbwSTc8eGtGh4=; b=yq/gxRJpVNeD9t
	OuJYafDZub45yEVZmiH8y9oU41QK+Y/0NYp3tms9M836hePZuz60dkRxPhC1VRTaeYrG+TnP0s+Tr
	jQOS5FmYkNMgX2R8w1d00eCC+1zKzwVF6Di0nXC+aTf2qY7V6sen/BkRxxXfUCgO0JVKrI5QVp8QC
	q/jWV71dc5TJvC7LUS5rOOrIq190blPLThG3KxDlXzVzHq52y2npGHNV3EIj2EKzRXZCucBaiBYJK
	ymilIRuzYWAOYyk+PZlsuMbSPj5PUsXUPLfgvPI3eZbnFUQvCUX2YPRSP2vAzej4G1EHXdTptbAEN
	LIjaFzTokxFHUAPEeIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMeWh-00BuEl-H9; Tue, 22 Feb 2022 23:24:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMeWU-00BuCu-Sg; Tue, 22 Feb 2022 23:24:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 3901E1F437CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645572285;
 bh=Y99Kgv35NWklxSCIAVoRoJB52jvRTFhn5NbAZVxgVIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k89Zla47G5rHXIFtgcXqP2eULMzjER8Soov6YODpH/uPXBC5HubzP6ZlILYQ24Zde
 TqjPAFYy1BV/7MCF7laeurtK/6IzNDOrA+iXIaJ5JpUgQOPmCU7avNLQ4xpvWtcIGF
 eHx2nuRaf+BlmGFuTMg+bE9yvj0HaGhzqIPGUrm1WdQOkNVi8DzPrsfTk5KpXMlsR3
 iIdL2aZcbQKhc5bPAdaYzwSYRBApi/eZ72lLIergQ0YDOg5/o93k0NIm13xW4MG9kF
 5QwKyv9TURAlDgsB6C1asYoUACIuCn/Rd8tgAyvR+BGeR4yWrDqY1kCQaKhCif5MEg
 VtvuLLOZxK0jg==
Date: Tue, 22 Feb 2022 18:24:39 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 22/23] arm64: dts: mt8192: Add gce info for display
 nodes
Message-ID: <20220222232439.dhsvnut3phudlsls@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-23-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-23-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_152447_235151_8C291EB5 
X-CRM114-Status: GOOD (  14.68  )
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

On Fri, Feb 18, 2022 at 05:16:32PM +0800, Allen-KH Cheng wrote:
> Add gce info for display nodes.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 1f1555fd18f5..df884c48669e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1226,6 +1226,9 @@
>  		mmsys: syscon@14000000 {
>  			compatible = "mediatek,mt8192-mmsys", "syscon";
>  			reg = <0 0x14000000 0 0x1000>;
> +			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
> +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;

As a side note, the current mmsys dt-binding,
Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml, doesn't
define mboxes or mediatek,gce-client-reg, but looks like there's already a patch
in the ML adding those:

https://lore.kernel.org/all/20220126071932.32615-2-jason-jh.lin@mediatek.com/

>  			#clock-cells = <1>;
>  		};
>  
> @@ -1234,6 +1237,8 @@
>  			reg = <0 0x14001000 0 0x1000>;
>  			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
>  			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
> +			mediatek,gce-events = <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
> +					      <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
>  		};
>  
>  		smi_common: smi@14002000 {
> @@ -1275,6 +1280,7 @@
>  			iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
>  				 <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
>  			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
>  		};
>  
>  		ovl_2l0: ovl@14006000 {
> @@ -1285,6 +1291,7 @@
>  			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
>  			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
>  				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
>  		};
>  
>  		rdma0: rdma@14007000 {
> @@ -1296,6 +1303,7 @@
>  			mediatek,larb = <&larb0>;
>  			mediatek,rdma-fifo-size = <5120>;
>  			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
>  		};
>  
>  		color0: color@14009000 {
> @@ -1305,6 +1313,7 @@
>  			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
>  		};
>  
>  		ccorr0: ccorr@1400a000 {
> @@ -1313,6 +1322,7 @@
>  			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
>  		};
>  
>  		aal0: aal@1400b000 {
> @@ -1321,6 +1331,7 @@
>  			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
>  		};
>  
>  		gamma0: gamma@1400c000 {
> @@ -1330,6 +1341,7 @@
>  			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
>  		};
>  
>  		postmask0: postmask@1400d000 {
> @@ -1339,6 +1351,7 @@
>  			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
>  			iommus = <&iommu0 M4U_PORT_L0_DISP_POSTMASK0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
>  		};
>  
>  		dither0: dither@1400e000 {
> @@ -1348,6 +1361,7 @@
>  			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
>  		};
>  
>  		dsi0: dsi@14010000 {
> @@ -1371,6 +1385,7 @@
>  			clocks = <&mmsys CLK_MM_DISP_OVL2_2L>;
>  			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
>  				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
>  		};
>  
>  		rdma4: rdma@14015000 {
> @@ -1381,6 +1396,7 @@
>  			clocks = <&mmsys CLK_MM_DISP_RDMA4>;
>  			iommus = <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
>  			mediatek,rdma-fifo-size = <2048>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
>  		};
>  
>  		dpi0: dpi@14016000 {
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
