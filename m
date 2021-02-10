Return-Path: <SRS0=P5Ae=HM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7E7C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 22:55:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52C4264EBB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 22:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52C4264EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TDO6X66fGJP4lUOmH5QjfkgVZEZ9o5AoWYBaC4QO1nk=; b=jiEI9dDD/NdbjZ6VsjHg/MqoD
	yseJ9cQxrTIz3x1UstW631e92DwifuqrMm86I+N7bE2wtZlrBz69wSbiBEk9HPTZH83U1iTdALhdd
	GaLtvAcgGON8QZLLwNFR7aGf/TQ5X4rCdTvseV+9tVCBhQIFTlO2cGcRcSwhLn3upJqEDuAKvRYod
	o1pCJmLzPamG1R7m9f55aZkootRuqBydF8U8D2TSSnJuVFkfnnoBmJoay4+3HfxYDqEtwjCKMC/ER
	LfHL9PVBAKd8LdwEk3R/CPxbSjOit7qNkoLzj4UYztMELVMrHvbQm1FUvnlbjcTsMvztssVfjv7j1
	JSaOUbn4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9yOE-0001K1-0O; Wed, 10 Feb 2021 22:55:18 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9yO7-0001Ib-67; Wed, 10 Feb 2021 22:55:12 +0000
Received: by mail-ot1-f54.google.com with SMTP id l23so3443003otn.10;
 Wed, 10 Feb 2021 14:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w1YK7UNTu1HB40IxkkqVRuEb+aW6wO4/KWDnve1zAtI=;
 b=Wv+7/wYjer82y0r/tiNmkouuEr+kAIMH+OVgNuEiK12mRLJ1rpkNYlaHcMQKAmfpTs
 dUnBqQlg8M1iOkuKCB767kfppH7cT4fBBxxF2r4oDB/U5NKTZReiyh0p+SKcUHWkqyP3
 HDLxgNq9aTGvJEUZQmuoMmc9lLbGWlpk6xWe8tGYuSEUdiHup0Ekc614fO7ow3T3Aida
 gg/KPsamTuyrwiKM5pD6qR/fGmUFna/gBg+L4Xzl9pKHMxMiPsQ7EmscR9arLHYoWysa
 LjmsDJeDmi4uFpQMybkSyqpCO+nbOKLPUpg9r92FRO2UDDFIqzUKKeBmCHo2955zTp16
 H2Ow==
X-Gm-Message-State: AOAM530qrkLjneuWdiwpSNPDW/E3u7+xas/Zv0OtNi/TzsjQLDQng6qL
 rcMCHYD6OdrPi7vauGPgow==
X-Google-Smtp-Source: ABdhPJzumyrQ1giKRY0y9McaknWrNANEdMLFRDns2459jtzKfyWuRGrA0MEhtV2VvNn0xyldNSZDMw==
X-Received: by 2002:a9d:12c1:: with SMTP id g59mr2602649otg.116.1612997708883; 
 Wed, 10 Feb 2021 14:55:08 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p67sm777226oih.21.2021.02.10.14.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:55:08 -0800 (PST)
Received: (nullmailer pid 2967891 invoked by uid 1000);
 Wed, 10 Feb 2021 22:54:12 -0000
Date: Wed, 10 Feb 2021 16:54:12 -0600
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: media: mtk-vcodec: Add binding for
 MT8192 VENC
Message-ID: <20210210225412.GA2966579@robh.at.kernel.org>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
 <20210203083752.12586-4-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203083752.12586-4-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_175511_299703_40A3DA59 
X-CRM114-Status: GOOD (  16.96  )
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
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, srv_heupstream@mediatek.com,
 Alexandre Courbot <acourbot@chromium.org>, devicetree@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, linux-mediatek@lists.infradead.org,
 Fritz Koenig <frkoenig@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 04:37:50PM +0800, Irui Wang wrote:
> Updates binding document for mt8192 encoder driver.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../bindings/media/mediatek-vcodec.txt        | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index e4644f8caee9..c7fac557006f 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -9,6 +9,7 @@ Required properties:
>    "mediatek,mt8173-vcodec-avc-enc" for mt8173 avc encoder.
>    "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
>    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> +  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
>  - reg : Physical base address of the video codec registers and length of
>    memory mapped region.
>  - interrupts : interrupt number to the cpu.
> @@ -128,3 +129,28 @@ vcodec_enc_lt: vcodec@19002000 {
>      assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
>      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
>    };
> +
> +vcodec_enc: vcodec@0x17020000 {

Don't add an example just for a new compatible.

> +    compatible = "mediatek,mt8192-vcodec-enc";
> +    reg = <0 0x17020000 0 0x2000>;
> +    iommus = <&iommu0 M4U_PORT_L7_VENC_RCPU>,
> +             <&iommu0 M4U_PORT_L7_VENC_REC>,
> +             <&iommu0 M4U_PORT_L7_VENC_BSDMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_SV_COMV>,
> +             <&iommu0 M4U_PORT_L7_VENC_RD_COMV>,
> +             <&iommu0 M4U_PORT_L7_VENC_CUR_LUMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_CUR_CHROMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_REF_LUMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_REF_CHROMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_SUB_R_LUMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_SUB_W_LUMA>;
> +    interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
> +    dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +    mediatek,scp = <&scp>;
> +    power-domains = <&scpsys MT8192_POWER_DOMAIN_VENC>;
> +    clocks = <&vencsys CLK_VENC_SET1_VENC>;
> +    clock-names = "venc-set1";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
> +};
> +
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
