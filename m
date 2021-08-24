Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F189C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 14:40:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0325E611C9
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 14:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0325E611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uk2j/gKG+GrZWN5wKwYuFABHD7Lc8I+6YZzrtUmSK8I=; b=Bj2Oopkr0ZAq/J
	+6Cd1McnFHHo8VYOaKZXw9/VwHX4vecqeqmGRIoAEWcQt3/uV6Et9XqcJaT78+UVCdZ+ym923gy64
	KuQl8/1MzJ91L1Hhtv0frRgvVkpCvrlYSwrtTsXjjmjlzkYUF/vxKufv+C0xjNE/SpcZ1EiipOrec
	CCw1/x5ibYlRqSFIIgd2gU+L07KgJrYCVA41ns1F8HEm2ADQccLj4cRh1DbJZz00e4f57tMFMp5Kr
	EMqxKtzvPSe4XmkYZZOvOxndxeX/6p87LVgmjOWOqPf/6SIDlN+nIOBh6CYKYhnxVdOmskZ3fn6th
	M7jzyjz123VKSvG8tM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIXbH-003YIn-Vt; Tue, 24 Aug 2021 14:40:28 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIXbC-003YFv-4Q; Tue, 24 Aug 2021 14:40:26 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso25942101otu.7; 
 Tue, 24 Aug 2021 07:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Db5yqDC7zDMI6lAlEXopDZgJg3DaWYgaFCxZGGAfV98=;
 b=AkKxtbg6/Vp26P8KFUp3XkJH2esDKv89zZUvCXP1GCM03XMvs0lb65JDK43d3U+NI5
 m2mtwGadH4HKoYBHwNTWkv1c+6HwHzW0uL7c+EsCgPibbHInUUGnEM0Z8VMrlB1xukFz
 ngPou95unjpYJszD7kROZ8r+NcoF/ytvLiho1wSCVp/VUNM+wL3VeHn9Q90BiFhj2iTW
 +fgyN04PETjdTENne8d2jxthER6VxQPoUsEPOI3+XUZKhsxuK7Bbd1ahztwZuV2PoceO
 Q2Wn2M4+5Ur0uaMlI2M5pZuarJlZAsRd9HAE7XHcn1HB/ofAiMjZhd4rd2gbDRgLDUUH
 j8Sw==
X-Gm-Message-State: AOAM533YfUPfl/ZM18J+TZe8GJVJVXjTPSXrcp4yrjSv6y7OEtPeP2vI
 n93Ddkz/6gAODXkilkvjUQ==
X-Google-Smtp-Source: ABdhPJxL8lFhvCs4+YAUBK3GXu3cNTYj1yhOTdCkzQWFU8HyHnTwBYORe7LWGVm8SsTIOZPAj9OoXg==
X-Received: by 2002:a54:4789:: with SMTP id o9mr2986623oic.50.1629816021257;
 Tue, 24 Aug 2021 07:40:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l8sm4147035oom.19.2021.08.24.07.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:40:20 -0700 (PDT)
Received: (nullmailer pid 409340 invoked by uid 1000);
 Tue, 24 Aug 2021 14:40:19 -0000
Date: Tue, 24 Aug 2021 09:40:19 -0500
From: Rob Herring <robh@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rex-BC.Chen@mediatek.com,
 TingHan.Shen@mediatek.com
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Add support for MT8195
Message-ID: <YSUE08dgiGhFsjwH@robh.at.kernel.org>
References: <20210820023521.30716-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210820023521.30716-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_074022_245537_2C186EA5 
X-CRM114-Status: GOOD (  16.47  )
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

On Fri, Aug 20, 2021 at 10:35:21AM +0800, Jianjun Wang wrote:
> MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.

If it is the same, then 8192 should be a fallback compatible. 'The same' 
means the current driver for 8192 will work unchanged.

> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 742206dbd965..dcebb1036207 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -48,7 +48,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8192-pcie
> +    oneOf:
> +      - const: mediatek,mt8192-pcie
> +      - const: mediatek,mt8195-pcie
>  
>    reg:
>      maxItems: 1
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
