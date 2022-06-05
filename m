Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F19BC43334
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jun 2022 21:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Na8oD8kseQlNugQP60pKn31I4gUFMAeAbE00SN6gFGs=; b=pJ01QH1YGthlgf
	X27Sr+qHsLWjEYpv1EfpgNETnuXk9y27jO69uwNYh4itBejFNgAvfmM9xeff4twqnyedabdBIQb/3
	UEhTfh5lcKEVJDH9U1SsHNDCXKlBo7bPWW/8+WIYuEgYZoG7EdzkWuevwanL3xYVpfWHOkHBjBQ51
	joL2VYO6HQ1+YYT8e9L2U48Hmqwq+wDM3wyCcakur+91ilofJudmQlxKxFNuDnvD/U27/FKYxybLd
	FPPtlbTq5V9GUwLW3zH4SHKS1B/PbQvsjLzEXBzbM3wKnZJR6BqnqO66vgY9AgtANrd7GJBHtMR8/
	MDkQ80PaWCuYniPETfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxZ0-00FNqs-1D; Sun, 05 Jun 2022 21:13:34 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxYx-00FNqQ-9Z; Sun, 05 Jun 2022 21:13:32 +0000
Received: by mail-qk1-f180.google.com with SMTP id br33so8001169qkb.0;
        Sun, 05 Jun 2022 14:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KpfFSC1M5yGrSdZeqGTbFQEXLC9iY/J8j0nw6v1d9eA=;
        b=kA8fSfxZ+kgqPcwkot2abUHH0iReDR2PWiHy/7pIWQbYTQyF73l9T8YqyHL08jEyqP
         215RiTsMDKia+fRYsyiv8+GcIE7HvXPCKXkUCjNUCpZGNFzpqgak7R+FG9OtZrdffU5V
         qnmHcqkcz3gJtYTkCcG3/XkZI4zx5vvK9zbeiDceK0JnhejhdynHuIjorlTWUL/3xpPP
         /7AD1O00x56TRRScLT5O7RjMwsi02vxZ4dMw/jZaPs5LePvQ8RsopNJxXYwqp9kFS/GW
         wJJo05/X/EYxQnvV/wyGDGGoCUJ6zcjdce3pvdzWIu0+uIWnBb6ABOf20PlBiNUosRaZ
         eXYA==
X-Gm-Message-State: AOAM533qTldBANs7xR8laUspY2BzmqsdDmjKRXEcvWUkhq+lRqWnLTy0
	T+kaXG5KgYPWFiny7g1vgA==
X-Google-Smtp-Source: ABdhPJxj+kVxZu2//p08PSHYzTQNamVKMAVwaHKls0V8bl/cpaDKySLz6Jed2QcRGNYVSKQw1ooWIA==
X-Received: by 2002:a37:97c5:0:b0:6a6:8d77:1b5f with SMTP id z188-20020a3797c5000000b006a68d771b5fmr11485785qkd.216.1654463609916;
        Sun, 05 Jun 2022 14:13:29 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
        by smtp.gmail.com with ESMTPSA id w15-20020a05620a424f00b006a69d7f390csm6411744qko.103.2022.06.05.14.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 14:13:29 -0700 (PDT)
Received: (nullmailer pid 3527763 invoked by uid 1000);
	Sun, 05 Jun 2022 21:13:26 -0000
Date: Sun, 5 Jun 2022 16:13:26 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: iommu: mediatek: add binding
 documentation for MT8365 SoC
Message-ID: <20220605211326.GA3525347-robh@kernel.org>
References: <20220530180328.845692-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220530180328.845692-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_141331_374675_EBA9C90D 
X-CRM114-Status: GOOD (  15.57  )
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

On Mon, May 30, 2022 at 08:03:26PM +0200, Fabien Parent wrote:
> Add IOMMU binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |  2 +
>  include/dt-bindings/memory/mt8365-larb-port.h | 96 +++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt8365-larb-port.h
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 97e8c471a5e8..5ba688365da5 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -77,6 +77,7 @@ properties:
>            - mediatek,mt8173-m4u  # generation two
>            - mediatek,mt8183-m4u  # generation two
>            - mediatek,mt8192-m4u  # generation two
> +          - mediatek,mt8365-m4u  # generation two
>  
>        - description: mt7623 generation one
>          items:
> @@ -120,6 +121,7 @@ properties:
>        dt-binding/memory/mt8173-larb-port.h for mt8173,
>        dt-binding/memory/mt8183-larb-port.h for mt8183,
>        dt-binding/memory/mt8192-larb-port.h for mt8192.
> +      dt-binding/memory/mt8365-larb-port.h for mt8365.
>  
>    power-domains:
>      maxItems: 1
> diff --git a/include/dt-bindings/memory/mt8365-larb-port.h b/include/dt-bindings/memory/mt8365-larb-port.h
> new file mode 100644
> index 000000000000..e7d5637aa38e
> --- /dev/null
> +++ b/include/dt-bindings/memory/mt8365-larb-port.h
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license please.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
