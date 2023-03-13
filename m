Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161EEC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrX4MQ5XyBI1qENC+vHtgVhDAPGJCUWnJ6ds1ecooMI=; b=cHp4w0S3gCaz3T/fRulScXJWG2
	iJdcpmxKVB3dx1NoxemAeOpfEDEfpzGAjzENfIJA+DuuNvK988UziwyJi8UR2t0jFC1BqDjbN0/dt
	Jh6aX804AE93B94aQgJ2JzIcXnY6R2ln7vHS4oFblqCG60qe1IJm9Wmo81fRrTxCBviDSKAyL5v9k
	Qo1cMdAWpPqjJk6lYxUv/5KZm0bE2nkq5gg4GQW/Pj3NkTHi1z+W6jcp2R1ZgitiS67/9vbUkG+SW
	N6IbJeSdzhQXpLUPxD5SWyb0/6AmG4rgLbfdjy1ABQEd/nkxjcoAthpD6Ey7FbWdGykc1bK4Qngr2
	dOYPsEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgoW-005a6z-Cy; Mon, 13 Mar 2023 11:58:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgiS-005X4A-Rc; Mon, 13 Mar 2023 11:51:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBCD461034;
	Mon, 13 Mar 2023 11:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B67AC433D2;
	Mon, 13 Mar 2023 11:51:42 +0000 (UTC)
Message-ID: <75900e56-b430-8d7d-3a97-336bd3d84a68@xs4all.nl>
Date: Mon, 13 Mar 2023 12:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 02/11] dt-bindings: media: mediatek,jpeg: Remove
 dma-ranges property
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 nfraprado@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, jianjiao.zeng@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Bin Liu <bin.liu@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>,
 Rob Herring <robh@kernel.org>
References: <20230307023507.13306-1-yong.wu@mediatek.com>
 <20230307023507.13306-3-yong.wu@mediatek.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230307023507.13306-3-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_045149_048445_2977070A 
X-CRM114-Status: GOOD (  18.89  )
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

On 07/03/2023 03:34, Yong Wu wrote:
> After commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
> controllers"), the dma-ranges of the leaf node doesn't work. Remove
> it for jpeg here.
> 
> Currently there is only mt8195 jpeg node has this property in upstream,
> and it already uses parent-child node, this property did work. But instead,
> MediaTek iommu will control the masters' iova ranges by the master's
> larb/port id internally, then this property is unnecessary.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Bin Liu <bin.liu@mediatek.com>
> Cc: kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
> Cc: Xia Jiang <xia.jiang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  .../devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml | 7 -------
>  .../devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml | 7 -------
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml   | 5 -----
>  3 files changed, 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> index 71595c013dbb..e5448c60e3eb 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> @@ -26,11 +26,6 @@ properties:
>        Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
>        Ports are according to the HW.
>  
> -  dma-ranges:
> -    maxItems: 1
> -    description: |
> -      Describes the physical address space of IOMMU maps to memory.
> -
>    "#address-cells":
>      const: 2
>  
> @@ -89,7 +84,6 @@ required:
>    - compatible
>    - power-domains
>    - iommus
> -  - dma-ranges
>    - ranges
>  
>  additionalProperties: false
> @@ -115,7 +109,6 @@ examples:
>                       <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA1>,
>                       <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
>                       <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
> -            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
>              #address-cells = <2>;
>              #size-cells = <2>;
>              ranges;
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> index 95990539f7c0..596186497b68 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> @@ -26,11 +26,6 @@ properties:
>        Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
>        Ports are according to the HW.
>  
> -  dma-ranges:
> -    maxItems: 1
> -    description: |
> -      Describes the physical address space of IOMMU maps to memory.
> -
>    "#address-cells":
>      const: 2
>  
> @@ -89,7 +84,6 @@ required:
>    - compatible
>    - power-domains
>    - iommus
> -  - dma-ranges
>    - ranges
>  
>  additionalProperties: false
> @@ -113,7 +107,6 @@ examples:
>                       <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
>                       <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
>                       <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
> -            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
>              #address-cells = <2>;
>              #size-cells = <2>;
>              ranges;
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> index c8412e8ab353..37800e1908cc 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -44,11 +44,6 @@ properties:
>        Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
>        Ports are according to the HW.
>  
> -  dma-ranges:
> -    maxItems: 1
> -    description: |
> -      Describes the physical address space of IOMMU maps to memory.
> -
>  required:
>    - compatible
>    - reg


