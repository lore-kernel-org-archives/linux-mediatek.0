Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C0BC388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:33:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0FCB208B3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WFnATWEk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0FCB208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k2AuXcNBPoyXO+2w6BqsfOxNuJJnZPzc49rpuKE3UzE=; b=WFnATWEk4itK0/GLZgLtLxm+I
	bOmaP6W8kSb2owx/pxPy35TLHV4nB3fdoR51aXsCuqXE1pWuptjzbxjvj34QMI2Q195XkAUfMWnD7
	MIZlLVu2//XouHcrj9oaG2sdWcAJ6mMz7CcUmGJzW6ObG6l8bHuYzumB+oa1hiM88PdV43n7VUzmp
	63zesW/r+YStNUea2muzUDqd/+xyCtonXrh8h0ldyF/otjvx0YphEv//1wVLwzfiWv1lQ6iwGRir6
	zJwGfvXXHD7pZRgpXQQZyTY4W0TFPacGsdFMXnKf/FyPywImNdA1fKlho6GzZPrsYwiATTTsPandp
	BbHA8UPng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcxkP-0001sP-Nb; Wed, 11 Nov 2020 21:33:45 +0000
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcxkM-0001r4-IV; Wed, 11 Nov 2020 21:33:43 +0000
Received: by mail-ej1-f67.google.com with SMTP id o9so4794404ejg.1;
 Wed, 11 Nov 2020 13:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sK4IhYZOOZRYi+a2OxHEj++JSexEzteTRg9o9l5Xmmc=;
 b=Mb2KSbHlqr2oXLvqJVhmqsdwG5CmIF6HBmvRnRyEDhE7haRg4t+xC3GoO6jRgAlmg2
 +GC9/FAQGGuu1OS4uA16BiicMma20tZwnpsQBKlMZRQ80jF5dsIoLidd4EJlDKlgqac8
 3sK1s6AQDq+Sdm+EN+S6Hv6a/7OikSqsnm9KWH3cEE+RbP1FQE8b4qX0jkrq+c429sGR
 VnEYSZYsopQFqLYicObFBEawl6n9sFXBnTho9qQx6AzxWkeUU5EXe0qAeGbdMp1oAX36
 rFsUOhI9S5TF1/co6PcTP0RthkVPrEznYUOVk5K2LkPBRQLqKmx7fl9N5amjBrJpuGaE
 C0Ng==
X-Gm-Message-State: AOAM533WC/RdLs2VBZbWNWFBeLcfCSr6Sl7mPAoV/PQZT+zcf/XkS6t3
 xiRujStpIkqK4WxUzBdAyHQ=
X-Google-Smtp-Source: ABdhPJyWmV5IHVA2ohdCwF8JXc37esFq7vT8fy5Vv2WHPBbGSRTGdwBIKtPRn5OWSNwKiPjundijtg==
X-Received: by 2002:a17:906:ca83:: with SMTP id
 js3mr28371238ejb.42.1605130421152; 
 Wed, 11 Nov 2020 13:33:41 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id y15sm1439123eds.56.2020.11.11.13.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 13:33:39 -0800 (PST)
Date: Wed, 11 Nov 2020 22:33:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 05/24] dt-bindings: mediatek: Add binding for mt8192
 IOMMU
Message-ID: <20201111213338.GD287176@kozik-lap>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-6-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111123838.15682-6-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_163342_767974_58B4FBA6 
X-CRM114-Status: GOOD (  22.63  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel-team@android.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 08:38:19PM +0800, Yong Wu wrote:
> This patch adds decriptions for mt8192 IOMMU and SMI.
> 
> mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> table format. The M4U-SMI HW diagram is as below:
> 
>                           EMI
>                            |
>                           M4U
>                            |
>                       ------------
>                        SMI Common
>                       ------------
>                            |
>   +-------+------+------+----------------------+-------+
>   |       |      |      |       ......         |       |
>   |       |      |      |                      |       |
> larb0   larb1  larb2  larb4     ......      larb19   larb20
> disp0   disp1   mdp    vdec                   IPE      IPE
> 
> All the connections are HW fixed, SW can NOT adjust it.
> 
> mt8192 M4U support 0~16GB iova range. we preassign different engines
> into different iova ranges:
> 
> domain-id  module     iova-range                  larbs
>    0       disp        0 ~ 4G                      larb0/1
>    1       vcodec      4G ~ 8G                     larb4/5/7
>    2       cam/mdp     8G ~ 12G             larb2/9/11/13/14/16/17/18/19/20
>    3       CCU0    0x4000_0000 ~ 0x43ff_ffff     larb13: port 9/10
>    4       CCU1    0x4400_0000 ~ 0x47ff_ffff     larb14: port 4/5
> 
> The iova range for CCU0/1(camera control unit) is HW requirement.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |  18 +-
>  include/dt-bindings/memory/mt8192-larb-port.h | 240 ++++++++++++++++++
>  2 files changed, 257 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index ba6626347381..0f26fe14c8e2 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -76,6 +76,7 @@ properties:
>            - mediatek,mt8167-m4u  # generation two
>            - mediatek,mt8173-m4u  # generation two
>            - mediatek,mt8183-m4u  # generation two
> +          - mediatek,mt8192-m4u  # generation two
>  
>        - description: mt7623 generation one
>          items:
> @@ -115,7 +116,11 @@ properties:
>        dt-binding/memory/mt6779-larb-port.h for mt6779,
>        dt-binding/memory/mt8167-larb-port.h for mt8167,
>        dt-binding/memory/mt8173-larb-port.h for mt8173,
> -      dt-binding/memory/mt8183-larb-port.h for mt8183.
> +      dt-binding/memory/mt8183-larb-port.h for mt8183,
> +      dt-binding/memory/mt8192-larb-port.h for mt8192.
> +
> +  power-domains:
> +    maxItems: 1
>  
>  required:
>    - compatible
> @@ -133,11 +138,22 @@ allOf:
>                - mediatek,mt2701-m4u
>                - mediatek,mt2712-m4u
>                - mediatek,mt8173-m4u
> +              - mediatek,mt8192-m4u
>  
>      then:
>        required:
>          - clocks
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8192-m4u
> +
> +    then:
> +      required:
> +        - power-domains
> +
>  additionalProperties: false
>  
>  examples:
> diff --git a/include/dt-bindings/memory/mt8192-larb-port.h b/include/dt-bindings/memory/mt8192-larb-port.h
> new file mode 100644
> index 000000000000..7437fa62654e
> --- /dev/null
> +++ b/include/dt-bindings/memory/mt8192-larb-port.h
> @@ -0,0 +1,240 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + *
> + * Author: Chao Hao <chao.hao@mediatek.com>
> + * Author: Yong Wu <yong.wu@mediatek.com>
> + */
> +#ifndef _DTS_IOMMU_PORT_MT8192_H_
> +#define _DTS_IOMMU_PORT_MT8192_H_

Not accurate header guard. Shoud be:
_DT_BINDINGS_MEMORY_MT8192_LARB_PORT_H_

Probably you copied it from some other Mediatek headers - all of them
have header guard pointing to different directory.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
