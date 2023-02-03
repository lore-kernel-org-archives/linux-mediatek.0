Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686D1C05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 21:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M3uCygjl6A7JEgAG4k6+cW+0sg8+m53vsWpI9AOYpU=; b=r9FcF5W+RPu6GwqW058IswoH9E
	d5AYzvAMLad0A/qi99NcEOQk413HxmEMz82CScjL7VwYHgpAcKQLR8TpMC0QloC9+vKWprRZLS8q2
	iI42b0umJqNQnzHqlekgc1laZ0iY2Qdqe5RMKCRXQa61VaOu+UVLJ93BPWNeAthnNjC7T5IdTTZI7
	CurFF2vAg7terG2OISEN4oP51CJy8PQYqqTU+7gw/la+T0MT4jh0CqUFWXvIQiCuOc1e+6ErPpkkX
	LlZuEwubywyR9+t34d5MflEC9RnQi27+lDs1spGC4cdo8vxfqXQvCGCVg+BZmoz/VGpJWSS8VJ/w6
	xMSeJnvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO3HA-003bTw-09; Fri, 03 Feb 2023 21:07:16 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO3H3-003bQm-2A; Fri, 03 Feb 2023 21:07:10 +0000
Received: by mail-oi1-f169.google.com with SMTP id r205so5244603oib.9;
        Fri, 03 Feb 2023 13:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1M3uCygjl6A7JEgAG4k6+cW+0sg8+m53vsWpI9AOYpU=;
        b=bK8kVSgp46hHtz9lE/IRAn37f9noCiZ6tRhJkf7RLKjqXtX6iZOFsgRcWmBafe9gNy
         /PqeSdPv7IyOLHRG1Jv/Sk6KFic9hZo7QQo1YGmzDFIOYFb/FmI/tvWczxXkCIV5FX/A
         EJRiT1yvzsQMJI7soFaRjN//dGi00xYD2D/cNWveK39Q8FaDBx6bXxvEa9afgDpmYWZd
         HOKohKJ+PjNJC8jHodW8+9fA4TsssYLzD5RsKkES7hfAvAksAd7gPZqvidfMJUY2FTpy
         vBWEPGr+C3zwVQHTGQumPR5EoiJ+iBICMGW+njCjTdv7ygykwfE3C9tsqdFLVbDWx8Ob
         6Ovg==
X-Gm-Message-State: AO0yUKVXQvHKuDuC7mRV4Emx5hymJwdgcJdTx6oSZQKHGKeaSA2/fXsd
	zrqEvgrHOU16Vt2aZl4Cqg==
X-Google-Smtp-Source: AK7set+H/nG7YyvidvAYYh3VYdVW5g3Srm/T1GZeEAdyv/8iFdAFcD9Vzx0MLXCuqnk5RWAl3H/0OQ==
X-Received: by 2002:a05:6808:1187:b0:35e:d286:2317 with SMTP id j7-20020a056808118700b0035ed2862317mr6590582oil.25.1675458415510;
        Fri, 03 Feb 2023 13:06:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m38-20020a05683032a600b0068d56f93d73sm1598677ott.26.2023.02.03.13.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 13:06:55 -0800 (PST)
Received: (nullmailer pid 893142 invoked by uid 1000);
	Fri, 03 Feb 2023 21:06:54 -0000
Date: Fri, 3 Feb 2023 15:06:54 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: mmio: new binding for MMIO
 accessible NVMEM devices
Message-ID: <20230203210654.GA877968-robh@kernel.org>
References: <20230201064717.18410-1-zajec5@gmail.com>
 <20230201064717.18410-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230201064717.18410-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_130709_140265_C95202A3 
X-CRM114-Status: GOOD (  22.51  )
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

On Wed, Feb 01, 2023 at 07:47:14AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> With the NVMEM layouts binding in place we should now use:
> 1. NVMEM device access bindings
> 2. NVMEM content description bindings
> 
> This binding allows describing NVMEM devices that can be MMIO accessed.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../devicetree/bindings/nvmem/mmio.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mmio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mmio.yaml b/Documentation/devicetree/bindings/nvmem/mmio.yaml
> new file mode 100644
> index 000000000000..27e3f6142769
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mmio.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/mmio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MMIO access based NVMEM
> +
> +description: |
> +  This binding describes simple NVMEM devices that can be accessed by using MMIO
> +  (memory-mapped I/O access).
> +
> +  It's a generic solution for providing NVMEM content access. The way of
> +  handling actual content may be device specific and can be described using a
> +  proper layout.

Please add some guidance based on the discussion about when this should 
and shouldn't be used. Specifically, anything with potential write 
accesses should use a device specific compatible and not the generic 
one.

> +
> +maintainers:
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    const: mmio-nvmem
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-io-width:
> +    description: |
> +      The size (in bytes) of the IO accesses that should be performed
> +      on the device.
> +    enum: [1, 2, 4, 8]
> +
> +required:
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nvmem@10000 {
> +        compatible = "mmio-nvmem";
> +        reg = <0x10000000 0x10000>;
> +    };
> -- 
> 2.34.1
> 

