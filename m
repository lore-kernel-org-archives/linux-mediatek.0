Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F82C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 17:16:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BEC261C81
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 17:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BEC261C81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUcpRanGR1PA/dSRZBqeecK9v1BMXWqNLNh/2/4ipGI=; b=IJmVF8Ar9VGBrX
	iYEQatGaFxyArsQGCot3NS16Q/dY6OoNiNRyweAs9LNPWUUHH68DLCCphsqF/rVFmrOMU6m1LXjRC
	qXknQg//iwOSkDTzQP+SKyvuacQ+6BUvFq/Jr4dmPHDtOFivLMrY3dSzqsTGhQhbZe0CT5stTbvV1
	F9BDM3bs7pkrwfKEYPebvtPa02+VcyRJbJQ56R/LorKIH5W2z7wmkmjxXD73tUVv8R86p/RVdZLA1
	RBuVrC63b1W+fFfpAouruiM/hozQAxfX2tggv+NvxeaBRokkA05bGCj0ZqJGKpDaxooFvuQJMr6NE
	F5wCn16RBegE0oHdY+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loUTr-005SZG-Vs; Wed, 02 Jun 2021 17:16:35 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loUSz-005SEE-JR; Wed, 02 Jun 2021 17:15:47 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so2038552otu.6; 
 Wed, 02 Jun 2021 10:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d2P63p4K4tBbBNr6gzzyoobg6+9o+75MMsESMYhqw5U=;
 b=PjZYHWH3R1cebBiFiwVwsVmDOqofTHlLc6LYDofx7r0lwhAo2mFlt15MO3DOMhXI0N
 gaVn9CrtZIA50H9xus71kThz+5la1BcDBhL5+IhLRcSNuDMcyDbsBA7d4DxnrZ9JYeJt
 U+/MMBFMMdWvtBaLzI+yxgEqbn5GE58UOPXGutllaz0iBkIFCSs3TI6ApUglIJCKbd78
 LjEGQAutOSg+aPjf5TG0NVp6E+PivJfJyg2eFEmbRzOHlYQ8GDumJgIqVR5p3XEIw6lH
 AQsUZVDtqNL4MJrc+nU+hILqX+gnSPmfo5lYj4UAsVvs0LtDzL1OHt6/z9qAKrPa3izO
 Y4zA==
X-Gm-Message-State: AOAM531TJ2+Ce3NQsMxOFU8BRbmgq+L5Boaa6CZBJxuiCAs5dhp+KOWu
 o5Mf2knYEXl0EhUTpXClbA==
X-Google-Smtp-Source: ABdhPJzubxDrWafAbYqjvQAbpPEO4M+at2huZAVG/AuATI9X3ACKx69dKULHBJ+UhEZfl/ZgFTvhBg==
X-Received: by 2002:a9d:61cb:: with SMTP id h11mr25361198otk.19.1622654140147; 
 Wed, 02 Jun 2021 10:15:40 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l12sm117608otr.16.2021.06.02.10.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:15:39 -0700 (PDT)
Received: (nullmailer pid 3596346 invoked by uid 1000);
 Wed, 02 Jun 2021 17:15:38 -0000
Date: Wed, 2 Jun 2021 12:15:38 -0500
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v9 02/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of mdpsys controller
Message-ID: <20210602171538.GA3590339@robh.at.kernel.org>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-3-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524122053.17155-3-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_101541_694327_E2D25EAF 
X-CRM114-Status: GOOD (  18.78  )
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

On Mon, May 24, 2021 at 08:20:33PM +0800, Chun-Jie Chen wrote:
> This patch adds the new binding documentation of mdpsys controller
> for Mediatek MT8192.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mdpsys.yaml         | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
> new file mode 100644
> index 000000000000..22252c322c03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mdpsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MDPSYS Controller
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek mdpsys controller provides functional configurations and clocks to the system.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-mdpsys
> +      - const: syscon

What makes this a syscon? Please add some description about what it 
provides other than clocks.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mdpsys: syscon@1f000000 {

If primarily a clock controller:

clock-controller@...

> +        compatible = "mediatek,mt8192-mdpsys", "syscon";
> +        reg = <0x1f000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
