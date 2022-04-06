Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED71C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQUJThmjOyLV8iB+NYfF04PR5eFCsCQ80UalKTsrckA=; b=Lb1rCQaZvPJjDn
	MyQ9mIIxBaHnmYmtIRkrkPoxkypxd2Y6IjgsEdZAzYh7+Gj4BXCgGmOGNl9RSw4CBJ44VvHciHKT1
	n3KC1ftaAvx0kHTkaTajTXgdztzx5wSHiSPh6MtEYVwwmXf0DiH/0nBbHax+tgyO0MZ0sdYPP5zKn
	D5K6p/iB7Oi3GVGCZDEjrwCfyRh4oa4W80utWRE63hDS/udmioT+tQ6L0bnS6kqTkrgFSLnhgqism
	lhmzHqIQUoEKdoL3oQNJDDFsECrX71LVwbKOkYIyTLrNAjNG2qUefj1Xibe5dZ1IFaa68C3B7wtvD
	KBPH//lyycDU994n85DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc0jT-004bjY-4g; Wed, 06 Apr 2022 08:09:39 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc0jI-004bgN-DU
 for linux-mediatek@lists.infradead.org; Wed, 06 Apr 2022 08:09:29 +0000
Received: by mail-ej1-x633.google.com with SMTP id r13so2602514ejd.5
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Apr 2022 01:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gqfp2NecHKAauwLOTljdIkk3Q50Ea/cnQshb9luki8c=;
 b=pq64m81I9e0FH9yQUKk/b5lS1MJbaIuBPVWf6sECtzwzZFgInsOH1N8r0J0en4Trgt
 2i/0wmYGWjMXO4UC9k29DuFFahF9A14Xvyxtho8hoedHO+uXjXscOsZXdj2v7F1Gy0uD
 5sNFE5XDk7MMuKryD+pqoyMFkQ4GScqGCn8jOeI/fsrIlwlXbbb4Jn7KS/uL/7sgcH7j
 ijZ5xsxpsLX7EYTtyBVbp/eR777mDnOz3RhkjN16PA21fC11SHJBR1u6H3Wla5bN7xOj
 JofDFb57WhI0avtetitOMQsDxbncGK66ZvxEevs0o3qcIwv1F2cihVKsIqUr7e6RqM2g
 th4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gqfp2NecHKAauwLOTljdIkk3Q50Ea/cnQshb9luki8c=;
 b=ydH2fTq3Vz2cMtDzUG/JoKoS3KZtkcfZB52L7dGbJfCsVtXI37xF0wp0EvVxiENou5
 iPuySPRx8M5l5TdCBB6uyKELxCiY6ZPFfRXdO7EJXQa3BJYYhrxwslo90avDbGJ/we2D
 AxfVQUN+AnRmwnevDLJEq5NXMJRnCNmMTZKtAkpCVZYasB0P0WxWcRag36G7y1lXqrVE
 LTQXAe3OgzJxzEePLwqmJOS3rvgAw8sEy3lQn94beCJulaOd5aUCCHfoaZu5OtXrKcfl
 eIjFDydLTO34jNrHHeULl5A4e/jH/sep5NyzSmTc830hnyewURKO+7A0bY7ieqqbjU+Q
 Sujw==
X-Gm-Message-State: AOAM533hi3WEgFuYKuWFEIt/aqBz+QtO6ld9RjvoWwXRo+p//KwnHOd5
 NkNUkxCWsQ8eXl9rshxTHsFRjA==
X-Google-Smtp-Source: ABdhPJwH3PNpR6dqUQ+vOs+ZdjHnyaVifmMlmZRc/y2sBXE1G1a1mHU1WSHCKWCZHNDIpUvpgD2iig==
X-Received: by 2002:a17:906:9744:b0:6da:9e49:9fe3 with SMTP id
 o4-20020a170906974400b006da9e499fe3mr7146911ejy.319.1649232566546; 
 Wed, 06 Apr 2022 01:09:26 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 k14-20020a170906128e00b006e4b67514a1sm6372095ejb.179.2022.04.06.01.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 01:09:26 -0700 (PDT)
Message-ID: <d0bffa9a-0ea6-0f59-06b2-7eef3c746de1@linaro.org>
Date: Wed, 6 Apr 2022 10:09:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 04/14] dt-bindings: arm: mediatek: document WED binding
 for MT7622
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-5-nbd@nbd.name>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220405195755.10817-5-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_010928_485737_1A8413E3 
X-CRM114-Status: GOOD (  20.09  )
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

On 05/04/2022 21:57, Felix Fietkau wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Document the binding for the Wireless Ethernet Dispatch core on the MT7622
> SoC, which is used for Ethernet->WLAN offloading
> Add related info in mediatek-net bindings.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Thank you for your patch. There is something to discuss/improve.

> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 50 +++++++++++++++++++
>  .../devicetree/bindings/net/mediatek-net.txt  |  2 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml

Don't store drivers in arm directory. See:
https://lore.kernel.org/linux-devicetree/YkJa1oLSEP8R4U6y@robh.at.kernel.org/

Isn't this a network offload engine? If yes, then probably it should be
in "net/".

> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> new file mode 100644
> index 000000000000..787d6673f952
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Wireless Ethernet Dispatch Controller for MT7622
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek wireless ethernet dispatch controller can be configured to
> +  intercept and handle access to the WLAN DMA queues and PCIe interrupts
> +  and implement hardware flow offloading from ethernet to WLAN.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt7622-wed
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      wed0: wed@1020a000 {

Generic node name, "wed" is specific. Maybe "network-offload"? Or
"network-accelerator"? You probably know better what this device does,
so maybe come with some generic name?

The same in DTS patch.

The bindings themself look ok.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
