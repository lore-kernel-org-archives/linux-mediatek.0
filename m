Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643CBC12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 23:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3099861377
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 23:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3099861377
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/iL1bLi5giL0l5J7MgYjzWAS0tvZt2+kpacwL5KlV4=; b=2r50fHRhr42ueA
	sL1YayDLajggz6MkGgcPHSp3g9DiB0jfByoKvWMW+mJ/B2T1tWDdPhCkzWNprPKDHz3NplWnts3lq
	cY2ycUXNvCR8FPxdcmSd5KyBJHaroWUxGopTG62lXo/USAPhwoMkhBEM3W6EC3vC1DArVmRhGrbUS
	ljny7H5LSFa37AuFf+m1X5EpzCUMC4MQL57/ll6MgrDgexzt1HMsfIoSIDVfw3YdhjsaOJRab+ArX
	clhlO4oZ+KNDCnkShb4RCyXeJPwenUav227+qjYHJx0aA28JbUzI4Q5pXCnfSQWNUEuZmcndCvMPp
	ScMjTarkgn+nsfMgQoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3oes-00GRNn-P8; Wed, 14 Jul 2021 23:51:18 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3mDg-00FKLB-N6; Wed, 14 Jul 2021 21:15:08 +0000
Received: by mail-il1-f177.google.com with SMTP id e2so3005027ilu.5;
 Wed, 14 Jul 2021 14:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=syAXapfi/1thpY4jHBRfGcWzIDr/Y3HxhpyKckHASlE=;
 b=jxmXX+ACEvpnChj8AsgEUKwD8lD8UtrqxzxadeWPYGJUOIyfjXIGbD5olsIyAr8HPz
 zFSbeLWkNHHpVRtObome/qkGx4Gl6TxxKDM/tdWPtmBawAu+CR31WKZjBeiGmZUazyI1
 ZDUp7+Nvh5VyoCqxa6nuEtlOX8Hd5FSb16fMbynCZ6FeJkspljqDM9o358dgUAlLx9NW
 Ma2ua94PJdczNYmyxmeblS2MeZoQwFb/NetLNOO7gZTZSCq3stfIunwLnQnTZ1lJmgbE
 eMBZXRXo1aRptT4sOOW5oyFG4YrfMMH4KRNuTgPbFK8tC9uXx1w/qskRgFfjr2zno08f
 90JQ==
X-Gm-Message-State: AOAM532QiTkUliLaLF6ujI5RNHNu6HBj8Tqe+a4Hw6W6Wa0lbs+YVDmb
 xAbSpX3GWORztMXNIRaAhw==
X-Google-Smtp-Source: ABdhPJyMeqk2FAY7bitNJyippP/0WZgYEXD6g1bDCjmESNtNzj4EVp5q3IV9YBKg+MrxY8yXpakmdw==
X-Received: by 2002:a92:d8c5:: with SMTP id l5mr7989064ilo.79.1626297303292;
 Wed, 14 Jul 2021 14:15:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id x9sm1692459iov.45.2021.07.14.14.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 14:14:49 -0700 (PDT)
Received: (nullmailer pid 3536623 invoked by uid 1000);
 Wed, 14 Jul 2021 21:14:44 -0000
Date: Wed, 14 Jul 2021 15:14:44 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com
Subject: Re: [PATCH 02/24] dt-bindings: mediatek: mt8195: Add binding for
 infra IOMMU
Message-ID: <20210714211444.GA3531980@robh.at.kernel.org>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
 <20210630023504.18177-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630023504.18177-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_141504_904431_313A372B 
X-CRM114-Status: GOOD (  23.21  )
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

On Wed, Jun 30, 2021 at 10:34:42AM +0800, Yong Wu wrote:
> In mt8195, we have a new IOMMU that is for INFRA IOMMU. its masters
> mainly are PCIe and USB. Different with MM IOMMU, all these masters
> connect with IOMMU directly, there is no mediatek,larbs property for
> infra IOMMU.
> 
> Another thing is about PCIe ports. currently the function
> "of_iommu_configure_dev_id" only support the id number is 1, But our
> PCIe have two ports, one is for reading and the other is for writing.
> see more about the PCIe patch in this patchset. Thus, I only list
> the reading id here and add the other id in our driver.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml         | 14 +++++++++++++-
>  .../dt-bindings/memory/mt8195-memory-port.h    | 18 ++++++++++++++++++
>  include/dt-bindings/memory/mtk-memory-port.h   |  2 ++
>  3 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 9b04630158c8..6f3ff631c06b 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -79,6 +79,7 @@ properties:
>            - mediatek,mt8192-m4u  # generation two
>            - mediatek,mt8195-iommu-vdo        # generation two
>            - mediatek,mt8195-iommu-vpp        # generation two
> +          - mediatek,mt8195-iommu-infra      # generation two
>  
>        - description: mt7623 generation one
>          items:
> @@ -129,7 +130,6 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - mediatek,larbs
>    - '#iommu-cells'
>  
>  allOf:
> @@ -161,6 +161,18 @@ allOf:
>        required:
>          - power-domains
>  
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            items:
> +              enum:
> +                - mediatek,mt8195-iommu-infra

This is saying all items are 'mediatek,mt8195-iommu-infra'. Other 
schemas prevent that, but really this should be:

compatible:
  contains:
    const: mediatek,mt8195-iommu-infra

> +
> +    then:
> +      required:
> +        - mediatek,larbs
> +
>  additionalProperties: false
>  
>  examples:
> diff --git a/include/dt-bindings/memory/mt8195-memory-port.h b/include/dt-bindings/memory/mt8195-memory-port.h
> index 783bcae8cdea..67afad848725 100644
> --- a/include/dt-bindings/memory/mt8195-memory-port.h
> +++ b/include/dt-bindings/memory/mt8195-memory-port.h
> @@ -387,4 +387,22 @@
>  #define M4U_PORT_L28_CAM_DRZS4NO_R1		MTK_M4U_ID(28, 5)
>  #define M4U_PORT_L28_CAM_TNCSO_R1		MTK_M4U_ID(28, 6)
>  
> +/* infra iommu ports */
> +/* PCIe1: read: BIT16; write BIT17. */
> +#define M4U_PORT_INFRA_PCIE1			MTK_IFAIOMMU_PERI_ID(16)
> +/* PCIe0: read: BIT18; write BIT19. */
> +#define M4U_PORT_INFRA_PCIE0			MTK_IFAIOMMU_PERI_ID(18)
> +#define M4U_PORT_INFRA_SSUSB_P3_R		MTK_IFAIOMMU_PERI_ID(20)
> +#define M4U_PORT_INFRA_SSUSB_P3_W		MTK_IFAIOMMU_PERI_ID(21)
> +#define M4U_PORT_INFRA_SSUSB_P2_R		MTK_IFAIOMMU_PERI_ID(22)
> +#define M4U_PORT_INFRA_SSUSB_P2_W		MTK_IFAIOMMU_PERI_ID(23)
> +#define M4U_PORT_INFRA_SSUSB_P1_1_R		MTK_IFAIOMMU_PERI_ID(24)
> +#define M4U_PORT_INFRA_SSUSB_P1_1_W		MTK_IFAIOMMU_PERI_ID(25)
> +#define M4U_PORT_INFRA_SSUSB_P1_0_R		MTK_IFAIOMMU_PERI_ID(26)
> +#define M4U_PORT_INFRA_SSUSB_P1_0_W		MTK_IFAIOMMU_PERI_ID(27)
> +#define M4U_PORT_INFRA_SSUSB2_R			MTK_IFAIOMMU_PERI_ID(28)
> +#define M4U_PORT_INFRA_SSUSB2_W			MTK_IFAIOMMU_PERI_ID(29)
> +#define M4U_PORT_INFRA_SSUSB_R			MTK_IFAIOMMU_PERI_ID(30)
> +#define M4U_PORT_INFRA_SSUSB_W			MTK_IFAIOMMU_PERI_ID(31)
> +
>  #endif
> diff --git a/include/dt-bindings/memory/mtk-memory-port.h b/include/dt-bindings/memory/mtk-memory-port.h
> index 7d64103209af..2f68a0511a25 100644
> --- a/include/dt-bindings/memory/mtk-memory-port.h
> +++ b/include/dt-bindings/memory/mtk-memory-port.h
> @@ -12,4 +12,6 @@
>  #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
>  #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
>  
> +#define MTK_IFAIOMMU_PERI_ID(port)	MTK_M4U_ID(0, port)
> +
>  #endif
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
