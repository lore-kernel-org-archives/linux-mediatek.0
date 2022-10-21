Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020FEC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 02:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDqNridPu4b3DWNOWE26l4CoQc8TEaUuVi755eJfbfM=; b=KazGcfqGDHLkyQJudAV86Mjwc9
	M1FLs5Muo5WUYGELpUC0tm07rHrbVk3LDoA8wDoYbRP3bQLJe//NnTHHtNZNMBxyAv5z+JOHKpenu
	fj1dV8bkKqwGjPQDm+8NMmfyf6LhRDbJfM16x1LQiJ73EjseVmHlKgZ28pKd4cPWEGoG1Yp0moBkJ
	yCbST+1M3zrP2cV+42OAd13vz53hfP6jgLsqCxYQR5YzzLFULSzfqQCUzdC1pjVgocx73tnHyJzIe
	Sd9+mecW8zJGKCwNWCo5++KZNAMk8ea4bF/LAYOwTYkkLMAXEUZtceRIFPOY40j82L780UxiqDiFv
	88CkwpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhkI-004S3v-Vj; Fri, 21 Oct 2022 02:26:50 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhkG-004S1w-2E; Fri, 21 Oct 2022 02:26:49 +0000
Received: by mail-ot1-f42.google.com with SMTP id f4-20020a9d0384000000b0066208c73094so1049949otf.0;
        Thu, 20 Oct 2022 19:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDqNridPu4b3DWNOWE26l4CoQc8TEaUuVi755eJfbfM=;
        b=WhNtWA0uebp3eDmvvMW8FJ/58aQKwfTBO4P1ueZAlzhu0arHRCmxbzE/YPYDEfGSDt
         XnEwk2pizf4+qIbSjrontRIDd5tdJ9hwHYBeo4CBg5XYhI0AEAbDMAeYWazxscgM/d/C
         2B5Pfyp7uRJ5khLua79ixoY+ZT97my583d+B1tZltIFKei2ce5jidrnsZOhOZdinQHpw
         qw3cOs4f2F1ktz2kvJka+lG8LgkczY6Tc85FA2gk3b9vK8mpfg91ECoHWyYC83Wh947L
         zbMgr6lThGvSn4Ua8vpBJwzDQOheUZw6lhowsfSMMSKzylhxrIhVUYPvx+svIaMH9Wl/
         cF/A==
X-Gm-Message-State: ACrzQf2veedfMpi1HAXIvrWu3w0Y4O7SCUlU4/AVA8l180r992c34Wly
	rKzOJOG1n8k9nRY7QSyOKA==
X-Google-Smtp-Source: AMsMyM5OG4SV586ygEDXiK/8qNiWP4nSMoSliVuOWl6DkOZEHBeJLUj3wFt/tL+Svde26yJzL0U3aw==
X-Received: by 2002:a05:6830:6611:b0:662:2725:d309 with SMTP id cp17-20020a056830661100b006622725d309mr136812otb.293.1666319206599;
        Thu, 20 Oct 2022 19:26:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x7-20020a056870e38700b0013297705e5dsm9487908oad.28.2022.10.20.19.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 19:26:46 -0700 (PDT)
Received: (nullmailer pid 2198615 invoked by uid 1000);
	Fri, 21 Oct 2022 02:26:47 -0000
Date: Thu, 20 Oct 2022 21:26:47 -0500
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: mediatek-gen3: Support mt8195
Message-ID: <20221021022647.GA2195154-robh@kernel.org>
References: <20221020111925.30002-1-tinghan.shen@mediatek.com>
 <20221020111925.30002-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020111925.30002-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_192648_123857_7AE7FCEE 
X-CRM114-Status: GOOD (  17.30  )
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

On Thu, Oct 20, 2022 at 07:19:23PM +0800, Tinghan Shen wrote:
> From: Jianjun Wang <jianjun.wang@mediatek.com>
> 
> In order to support mt8195 pcie node, update the yaml to support new
> properties of iommu and power-domain, and update the reset-names
> property to allow only one 'mac' name.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml         | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index c00be39af64e..af271018b134 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -70,14 +70,21 @@ properties:
>      minItems: 1
>      maxItems: 8
>  
> +  iommu-map:
> +    maxItems: 1
> +
> +  iommu-map-mask:
> +    maxItems: 1

This is not a array. It needs a value. Must be 0 if iommu-map only has 1 
entry? Or you only support 1 downstream device?

> +
>    resets:
>      minItems: 1
>      maxItems: 2
>  
>    reset-names:
> -    minItems: 1
> -    items:
> -      - const: phy
> +    oneOf:
> +      - items:
> +          - const: phy
> +          - const: mac
>        - const: mac
>  
>    clocks:
> @@ -107,6 +114,9 @@ properties:
>      items:
>        - const: pcie-phy
>  
> +  power-domains:
> +    maxItems: 1
> +
>    '#interrupt-cells':
>      const: 1
>  
> -- 
> 2.18.0
> 
> 

