Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEB3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 22:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FiE/yNZ7w3T0raGn6AHveBll0JZNwzhtlMO1TRhiaIM=; b=HDGZlObCztrEDZ
	0tzu/eLPk9Yz+WmixvjjnVBUrAre38vUHjkK4S3NDZmy81pV2Hwi288Ryf3j5CY92XZTJPeQFEHDb
	hzcPF6LfB4/c/X4lMnhSnteZ0t6wMiSoo9mlbuK8Ww6z/1JLV0htYaoKGTMqzDijX4fmau07QTki4
	XeUdhylGoUwUIPsWHGqQ/hEv4If+WrII3gwz2AC52CFQOa9PZlEtGynHczCCo3vC0AUafn/IbPNqi
	EHAV4TfeL3uaM2hmK3OTILkwDLLVimwzZGLH5/sXi4ETHBqeNWIxI6UFIMeZfQ5T0CrnsVPBJeOoA
	3SxmMacfOlMltukMB+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMdPf-00BlnG-Ry; Tue, 22 Feb 2022 22:13:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMdPT-00Bll5-O8; Tue, 22 Feb 2022 22:13:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id F3D1B1F441DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645568006;
 bh=q2TRzkQcc6bxTmQ/UE5mgvEoMLViCD8R1DxoR1bUm8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cJeaMIhBX76bNSPu+Z0Vn1AwC1FdJrr2rZ75ydgqwiypbJ/Po6LLAxh+vufAhtn6m
 QjYtQGbR7H2nT8vW4oPbMOBXzYDftTe7IikOAJQTNfjdv7pxOhCZgAgpoxjdmMYu05
 CAnVu90tbDjltLVpQjp0NafZ1+33mJ77qluatWdobByPZxNgFtL7zw3qrczeCJVdaT
 mbAWAOTpjrUcY20z283K/DdeNTbXcqtqqgnWWQUtwZWRDy0n5aHM6kJPDT9SK/r/FN
 R/JfzUW2JNCUBtVeWKGWTeodvYt268u9tGfbBS6nINpwRBkpWfvtnQcJyqk19hM/zk
 UPhHkUqG7fi5Q==
Date: Tue, 22 Feb 2022 17:13:21 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 16/23] arm64: dts: mt8192: Add H264 venc device node
Message-ID: <20220222221321.q5zhe7kbwf6xzafr@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-17-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-17-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_141327_940468_C71BB330 
X-CRM114-Status: GOOD (  14.01  )
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

On Fri, Feb 18, 2022 at 05:16:26PM +0800, Allen-KH Cheng wrote:
> Adds H264 venc node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 40887120fdb3..936aa788664f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1342,6 +1342,29 @@
>  			power-domains = <&spm MT8192_POWER_DOMAIN_VENC>;
>  		};
>  
> +		vcodec_enc: vcodec@0x17020000 {

The node address shouldn't have the '0x' prefix. Please drop it.

> +			compatible = "mediatek,mt8192-vcodec-enc";
> +			reg = <0 0x17020000 0 0x2000>;
> +			iommus = <&iommu0 M4U_PORT_L7_VENC_RCPU>,
> +				<&iommu0 M4U_PORT_L7_VENC_REC>,
> +				<&iommu0 M4U_PORT_L7_VENC_BSDMA>,
> +				<&iommu0 M4U_PORT_L7_VENC_SV_COMV>,
> +				<&iommu0 M4U_PORT_L7_VENC_RD_COMV>,
> +				<&iommu0 M4U_PORT_L7_VENC_CUR_LUMA>,
> +				<&iommu0 M4U_PORT_L7_VENC_CUR_CHROMA>,
> +				<&iommu0 M4U_PORT_L7_VENC_REF_LUMA>,
> +				<&iommu0 M4U_PORT_L7_VENC_REF_CHROMA>,
> +				<&iommu0 M4U_PORT_L7_VENC_SUB_R_LUMA>,
> +				<&iommu0 M4U_PORT_L7_VENC_SUB_W_LUMA>;

Please fix indentation:
			iommus = <&iommu0 M4U_PORT_L7_VENC_RCPU>,
				 <&iommu0 M4U_PORT_L7_VENC_REC>,
				 <&iommu0 M4U_PORT_L7_VENC_BSDMA>,
				 <&iommu0 M4U_PORT_L7_VENC_SV_COMV>,
				 <&iommu0 M4U_PORT_L7_VENC_RD_COMV>,
				 <&iommu0 M4U_PORT_L7_VENC_CUR_LUMA>,
				 <&iommu0 M4U_PORT_L7_VENC_CUR_CHROMA>,
				 <&iommu0 M4U_PORT_L7_VENC_REF_LUMA>,
				 <&iommu0 M4U_PORT_L7_VENC_REF_CHROMA>,
				 <&iommu0 M4U_PORT_L7_VENC_SUB_R_LUMA>,
				 <&iommu0 M4U_PORT_L7_VENC_SUB_W_LUMA>;

> +			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
> +			mediatek,scp = <&scp>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_VENC>;
> +			clocks = <&vencsys CLK_VENC_SET1_VENC>;
> +			clock-names = "venc-set1";
> +			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
> +		};
> +
>  		camsys: clock-controller@1a000000 {
>  			compatible = "mediatek,mt8192-camsys";
>  			reg = <0 0x1a000000 0 0x1000>;
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
