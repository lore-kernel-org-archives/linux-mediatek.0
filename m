Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA2FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPXfC+FoP1y/ewnMUZS/JvkzQFnsK2iaW66/2jYwkNg=; b=hZFOR+LIHWLdb5
	Utjm2+BBG5eAtKF5mYDQ1qg1XE1SQ+2zsNOZoTj1YLeB2YnGU/lxvDUdoJmxXAFz4Gz8OJHBqmYCg
	cya4BJOnQL5XRgRLnjgKkXEHn4ku9Fczh8Xb1SpjMGP7QCk3fNy3XO7rOuB2SFUmRzmSLjyfGg12G
	G0ZYU+mZGNBMYTztaWaDq06HGwWLuCOFq+Kv62HImSjycG5EpbN0Nc1cyATUWfmD0vNxy5IswV8VX
	3uflsSUQsYxmZJhcH7NA+0rqbtyEhkGuz7IciyKKZspoIFv3gOs2XT3Tvn9A2QPTIt+tfkcZO9FXL
	z3zGLjkHnqS3+ZHoE/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncVnL-00DJyk-To; Thu, 07 Apr 2022 17:19:43 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncVnA-00DJvZ-Re; Thu, 07 Apr 2022 17:19:34 +0000
Received: by mail-oi1-f170.google.com with SMTP id 12so6281784oix.12;
 Thu, 07 Apr 2022 10:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ktg803HSeOu69hHwdv/GSEMNaBLrm32ku7UIeeZTNoE=;
 b=3tEUp/sR4AmUAJXTY62RII703cnIi91zDmVb7FUHoLJTCFjmmUIbueThXdpMIgz9p5
 ssDfeyfgsSHT0LKlW0s6gXSlxg1Kf33Wnz7f4CZbcatPjr2iobcUwup8HgSVO5YtqwFW
 2u8E9J35YX/CIOmA4v/2Vn5kIoD31tn7ZIuT1RmYIrN0ALekKZAZaVgPAeCy5/89xgBZ
 uA50RjYe/3vU6YsVRMogdUpaRNGFq4oAge1srlj9XCziK3a0ZsSvCqY03CSMOu+9x8OF
 P5c1esNvwXxnJUGXryFKkkNm9tAwOnM/ajAQ87J+M8ZV4aAKafedxOQr1GhAaKUsd5ai
 Rbaw==
X-Gm-Message-State: AOAM531h3Lga5ibN54UD7Uh6njaeBeEReaksVUkRFY/U48GVW8+v0XGd
 wnMBYBA9DaBO9L4sX3l8Gw==
X-Google-Smtp-Source: ABdhPJy3RB++miojvSNpZgfUKy3/Jsrd3acxBFRmHtQUm7UVXoBZujvvsh09xoAZhSAs2J7MN6rRTQ==
X-Received: by 2002:a05:6808:191c:b0:2f9:4621:641a with SMTP id
 bf28-20020a056808191c00b002f94621641amr6157578oib.226.1649351965058; 
 Thu, 07 Apr 2022 10:19:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s26-20020a4ac81a000000b00322a2b5d943sm7471279ooq.37.2022.04.07.10.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 10:19:24 -0700 (PDT)
Received: (nullmailer pid 1475775 invoked by uid 1000);
 Thu, 07 Apr 2022 17:19:24 -0000
Date: Thu, 7 Apr 2022 12:19:24 -0500
From: Rob Herring <robh@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/14] dt-bindings: arm: mediatek: document the pcie
 mirror node on MT7622
Message-ID: <Yk8dHLDG8EHKtl54@robh.at.kernel.org>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-6-nbd@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405195755.10817-6-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_101932_920242_CED0CACA 
X-CRM114-Status: GOOD (  18.97  )
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

On Tue, Apr 05, 2022 at 09:57:46PM +0200, Felix Fietkau wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> This patch adds the pcie mirror document bindings for MT7622 SoC.
> The feature is used for intercepting PCIe MMIO access for the WED core
> Add related info in mediatek-net bindings.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  .../mediatek/mediatek,mt7622-pcie-mirror.yaml | 42 +++++++++++++++++++
>  .../devicetree/bindings/net/mediatek-net.txt  |  2 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
> new file mode 100644
> index 000000000000..9fbeb626ab23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek PCIE Mirror Controller for MT7622
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek PCIE mirror provides a configuration interface for PCIE
> +  controller on MT7622 soc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt7622-pcie-mirror
> +      - const: syscon

This doesn't sound like a syscon to me. Are there multiple clients or 
functions in this block? A 'syscon' property is not the only way to 
create a regmap if that's what you need.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
