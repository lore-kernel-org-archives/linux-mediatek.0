Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 20:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzARt3SUylprTdvbWfGQj5lJEtQuB8YwyDUa4X1Y/TQ=; b=Por9H/lIE0oJo6uGJpA1ZYhpdS
	QhmW7GFr5uz2H2MbI3uNRnySXqr5k1RvLsyZ4a35LYeIShgJOaYRyWcBMSH3YKH51hXBwc6xZVe9O
	QpEVMwAsV6Wtk3D4T1r0HoezJI6MiioisoOsvc1zgyK11XtwnZZ818sYeUGMknZzr/sBxcRE6A9fE
	m1XbwcLmBhLkUEoA0R7plCIhnR3mVB5OTcHxh6MCr0vrPYYdzNo/+zAdjEOAK2ar5V3PAQ2SfVsPK
	KdlIFm6XFiBamgs2ZfSl3SzB3ACMFrcb3fSjy4qnQqMsa99lVraCFVdwldp2xJ4AZ0g7EZFJHClhY
	oh797OQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pYC-002k3h-LI; Tue, 05 Jul 2022 20:53:40 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pTl-002i2U-Cp; Tue, 05 Jul 2022 20:49:06 +0000
Received: by mail-io1-f43.google.com with SMTP id z191so12285545iof.6;
        Tue, 05 Jul 2022 13:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mzARt3SUylprTdvbWfGQj5lJEtQuB8YwyDUa4X1Y/TQ=;
        b=nMWO4fA18Ts5V6D4QiGo19cDHAs0JvH/FWD/2Lky0scgOUIBIUXQsirmS4PZ+exEmV
         PforQvjLJ0iVD5uTQEFYZKmXJZS5uaqRPLQiegmnN24823SRICL3iChoXoNy/rIu8/Rv
         ffb5YQg4OnUP7sQf0hKsDxdVamuqcKe8sjiZOM7zEe8iPW9D1xHI2RAQB/BeiLvxFNh1
         Jg4r5YBt7jBZ3LRYtRyxGjtauijMUaIY2R8GtqBvs+WIy8cQYujgaYj8/oeFo8cWI0Z6
         ZM05viFGPp7CPTLeuT7wQ+nxY7Bw0TLg59OVI/uQYl2YnwGU4rrQvkYUTFUWQpi5C67N
         pIoQ==
X-Gm-Message-State: AJIora9/dHD90zF6gSS8+s+hPlHHg7nTTjMkm/y255535h7CcUlS8gnU
	E3MlpF77orBQqw0JXacibA==
X-Google-Smtp-Source: AGRyM1t3Q/lWtfZuyq003ElF5s7OUqIiDA2Wq5dxaxnoKjRtLzsbmHFJ7CK7VeOkWtDkrsMgCyJuvQ==
X-Received: by 2002:a6b:f718:0:b0:675:54cb:dda with SMTP id k24-20020a6bf718000000b0067554cb0ddamr20639324iog.114.1657054144601;
        Tue, 05 Jul 2022 13:49:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a9-20020a92c709000000b002dc133c9468sm2578869ilp.6.2022.07.05.13.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:49:04 -0700 (PDT)
Received: (nullmailer pid 2598242 invoked by uid 1000);
	Tue, 05 Jul 2022 20:49:02 -0000
Date: Tue, 5 Jul 2022 14:49:02 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 01/16] dt-bindings: iommu: mediatek: Increase max
 interrupt number
Message-ID: <20220705204902.GA2596733-robh@kernel.org>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704100028.19932-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_134905_531328_3B4FA782 
X-CRM114-Status: GOOD (  14.25  )
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

On Mon, Jul 04, 2022 at 06:00:13PM +0800, Tinghan Shen wrote:
> mt8195 infra iommu has max 5 interrupts.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/iommu/mediatek,iommu.yaml    | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 2ae3bbad7f1a..27eb9f6aa3ce 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -91,7 +91,8 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5
>  
>    clocks:
>      items:
> @@ -175,9 +176,18 @@ allOf:
>                const: mediatek,mt8195-iommu-infra
>  
>      then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>        required:
>          - mediatek,larbs
>  
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 5

5 is already the max.

minItems: 5


