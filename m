Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C183CC12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 09:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 849A1600CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 09:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 849A1600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAvgOSHo115j8fhtaSpKDpsM9Jt7KUbwO4ZufGMlG64=; b=w03iSz839+ESvURxET7xbwf0s1
	KQ/9ExD92LY2nlQUaDjE6fzvInOtioSyu48dajAuog9rU1VNTUggdZfXR7qLW/j679rfzWxdAS+mE
	2/bkh1jjeGhiatu+UQQSbsLS/Hr2OFIrEJAVqW2gx9n92lAZ/3fEf+JHNd0tmkyfCfJ96WpKpKEPZ
	yAGxnRHxYYrpQOStOl0PrEC+LdgbCryS6XO305UroodN112WmmA5jGzig3g8MYWfPMRGy7+HbsxwJ
	XpHMc0bU3HdykrVL8CvBTp4DA4SD7sltP7JAljjtRH7MPbVQGnkh7jKXhfxli3BadTigYaWLeMM6G
	SzhXK9ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5PDb-0090eZ-31; Mon, 19 Jul 2021 09:05:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5PDN-0090b6-3S; Mon, 19 Jul 2021 09:05:31 +0000
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown
 [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 00DF41F42371;
 Mon, 19 Jul 2021 10:05:26 +0100 (BST)
Subject: Re: [PATCH v2, 04/14] dt-bindings: media: mtk-vcodec: Separate video
 encoder and decoder dt-bindings
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Collabora Kernel ML <kernel@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
 <20210717081233.7809-5-yunfei.dong@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <aa7b0ea8-293d-5844-6b52-522983d58b44@collabora.com>
Date: Mon, 19 Jul 2021 11:05:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081233.7809-5-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_020529_473161_0DF3D0E4 
X-CRM114-Status: GOOD (  27.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, new dt-binding files should be yaml files.

Thanks,
Dafna

On 17.07.21 10:12, Yunfei Dong wrote:
> Decoder will use component framework to manage hardware, it is big
> difference with encoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v2: Remove useless code for this patch.
> ---
>   ...vcodec.txt => mediatek-vcodec-decoder.txt} | 62 ++--------------
>   .../media/mediatek-vcodec-encoder.txt         | 73 +++++++++++++++++++
>   2 files changed, 79 insertions(+), 56 deletions(-)
>   rename Documentation/devicetree/bindings/media/{mediatek-vcodec.txt => mediatek-vcodec-decoder.txt} (56%)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
> similarity index 56%
> rename from Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> rename to Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
> index c44a6e6943af..7c6e608df8a9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
> @@ -1,26 +1,20 @@
> -Mediatek Video Codec
> +Mediatek Video Decoder
>   
> -Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
> -supports high resolution encoding and decoding functionalities.
> +Mediatek Video Decoder is the video decode hw present in Mediatek SoCs which
> +supports high resolution decoding functionalities.
>   
>   Required properties:
>   - compatible : must be one of the following string:
> -  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
> -  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
> -  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
>     "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> -  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
>     "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
> -- reg : Physical base address of the video codec registers and length of
> +- reg : Physical base address of the video decoder registers and length of
>     memory mapped region.
>   - interrupts : interrupt number to the cpu.
>   - mediatek,larb : must contain the local arbiters in the current Socs.
>   - clocks : list of clock specifiers, corresponding to entries in
>     the clock-names property.
> -- clock-names: avc encoder must contain "venc_sel", vp8 encoder must
> -  contain "venc_lt_sel", decoder must contain "vcodecpll", "univpll_d2",
> -  "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel",
> -  "vdec_bus_clk_src".
> +- clock-names: must contain "vcodecpll", "univpll_d2", "clk_cci400_sel"
> +  "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
>   - iommus : should point to the respective IOMMU block with master port as
>     argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>     for details.
> @@ -84,47 +78,3 @@ vcodec_dec: vcodec@16000000 {
>                                <&topckgen CLK_TOP_VCODECPLL>;
>       assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
>     };
> -
> -vcodec_enc_avc: vcodec@18002000 {
> -    compatible = "mediatek,mt8173-vcodec-enc";
> -    reg = <0 0x18002000 0 0x1000>;
> -    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> -    iommus = <&iommu M4U_PORT_VENC_RCPU>,
> -             <&iommu M4U_PORT_VENC_REC>,
> -             <&iommu M4U_PORT_VENC_BSDMA>,
> -             <&iommu M4U_PORT_VENC_SV_COMV>,
> -             <&iommu M4U_PORT_VENC_RD_COMV>,
> -             <&iommu M4U_PORT_VENC_CUR_LUMA>,
> -             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> -             <&iommu M4U_PORT_VENC_REF_LUMA>,
> -             <&iommu M4U_PORT_VENC_REF_CHROMA>,
> -             <&iommu M4U_PORT_VENC_NBM_RDMA>,
> -             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> -    mediatek,larb = <&larb3>;
> -    mediatek,vpu = <&vpu>;
> -    clocks = <&topckgen CLK_TOP_VENC_SEL>;
> -    clock-names = "venc_sel";
> -    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> -    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> -  };
> -
> -vcodec_enc_vp8: vcodec@19002000 {
> -    compatible = "mediatek,mt8173-vcodec-enc-vp8";
> -    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> -    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> -    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> -             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> -             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> -             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> -             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> -             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> -             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> -             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> -             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> -    mediatek,larb = <&larb5>;
> -    mediatek,vpu = <&vpu>;
> -    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> -    clock-names = "venc_lt_sel";
> -    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> -    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
> -  };
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
> new file mode 100644
> index 000000000000..81c47fd44958
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
> @@ -0,0 +1,73 @@
> +Mediatek Video Encoder
> +
> +Mediatek Video Encoder is the video encode hw present in Mediatek SoCs which
> +supports high resolution encoding functionalities.
> +
> +Required properties:
> +- compatible : must be one of the following string:
> +  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
> +  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
> +  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
> +  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
> +- reg : Physical base address of the video encoder registers and length of
> +  memory mapped region.
> +- interrupts : interrupt number to the cpu.
> +- mediatek,larb : must contain the local arbiters in the current Socs.
> +- clocks : list of clock specifiers, corresponding to entries in
> +  the clock-names property.
> +- clock-names: avc encoder must contain "venc_sel", vp8 encoder must
> +  contain "venc_lt_sel".
> +- iommus : should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +  for details.
> +- dma-ranges : describes the dma address range space that the codec hw access.
> +One of the two following nodes:
> +- mediatek,vpu : the node of the video processor unit, if using VPU.
> +- mediatek,scp : the node of the SCP unit, if using SCP.
> +
> +
> +Example:
> +
> +vcodec_enc_avc: vcodec@18002000 {
> +    compatible = "mediatek,mt8173-vcodec-enc";
> +    reg = <0 0x18002000 0 0x1000>;
> +    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> +    iommus = <&iommu M4U_PORT_VENC_RCPU>,
> +             <&iommu M4U_PORT_VENC_REC>,
> +             <&iommu M4U_PORT_VENC_BSDMA>,
> +             <&iommu M4U_PORT_VENC_SV_COMV>,
> +             <&iommu M4U_PORT_VENC_RD_COMV>,
> +             <&iommu M4U_PORT_VENC_CUR_LUMA>,
> +             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> +             <&iommu M4U_PORT_VENC_REF_LUMA>,
> +             <&iommu M4U_PORT_VENC_REF_CHROMA>,
> +             <&iommu M4U_PORT_VENC_NBM_RDMA>,
> +             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> +    mediatek,larb = <&larb3>;
> +    mediatek,vpu = <&vpu>;
> +    clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +    clock-names = "venc_sel";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> +  };
> +
> +vcodec_enc_vp8: vcodec@19002000 {
> +    compatible = "mediatek,mt8173-vcodec-enc-vp8";
> +    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> +    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> +    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> +             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> +             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> +             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> +             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> +             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> +             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> +             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> +             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> +    mediatek,larb = <&larb5>;
> +    mediatek,vpu = <&vpu>;
> +    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +    clock-names = "venc_lt_sel";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
> +  };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
