Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E955AC7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 19:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYmCHe0UBx3C/dX8F6gPo606NtkPLb/fdOD1RWdJzkg=; b=y2k1A9wHwu+PKGVgo05pgy6qiZ
	IS44fV45kAiiO7jUnSAcSN0CQs1JOXYLJFptbWqkN7cQyOWkdrj01HVbByLyzb9SPg8ZMXnGwL+Kz
	QhJJSDhW6BWs9Izv/mZuqTqalnziWu8kC89D27nijveJzn5D81WvhPX8ANaSSQjOFoW0MVXlz+GUB
	jFz7DuVMDkNQ0hUx+4qjLQ1JlnLHTQ17ruXRXaFAAqyFLH1u0YVgqcCbyCR+2RnzpboDEYvQbB0zG
	dPXy/VwbnXSY6zIQoH9c4wbAeVVbvPKa8NoWrJcc923JwsWiKwpDkSkJmEIO1Z9K9iTmOEH4hxFLR
	zxOc/cJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzMyd-00At1f-1L;
	Wed, 17 May 2023 19:38:23 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzMya-00At0D-2p
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 19:38:22 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9661047f8b8so207526766b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 12:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684352298; x=1686944298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYmCHe0UBx3C/dX8F6gPo606NtkPLb/fdOD1RWdJzkg=;
        b=bbeQg4UD9JQf6erRpGuPGkJefSXLT4EZPw4GEbdgBk0mXwtrOrR9bcUXhDi2lPmrN2
         SY7yGEyaW4rOcHsYnmhfbfOIS6WJ1P72cT7qjNOpW9e9rc3FGcQFKOsbTXyqHZrtQ899
         lqRpczEhCKHYqw4X4HXrLygrQOA/mDNmvSVqGhyLDEWHWAB/zQr8JeHGMe+cc++jTX3+
         eSn13zJdh+MYPqS1jaJc+8KRvKuuUOk4u1xn97NQgP9w5RgbAMncMp8edZUiMeKMhSn8
         2tX7xLkDwu4v49tQ/OTjPCt9qR94Xz6440yAu01sLictaBqTjYddsFD9G6rN0sIRFkMS
         RaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684352298; x=1686944298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rYmCHe0UBx3C/dX8F6gPo606NtkPLb/fdOD1RWdJzkg=;
        b=Z1ugIdT4UeeWrrsyjblWmU7g4rri5Isiqnc8R0jqMDbxHKDmDocHxlBUH1j/9z6PGZ
         KOA/sHeZ8vtbYLVcD79Ca+EpN/My5Do97t2UPlUhPhfPZxj/+zMNbcTF8XiAgyv+ZrPp
         dwmrlAhR0QW+xPC0CDaYWwR/yNd6/7T3sVtsR2567LI2tn+0iPZWsaRNLfud/ylivZc+
         NyO/8fEtrvlsKVYbZSvV4xAtV9xO/ZQ8WJhk+S4gnkIkiYgTZqVbM69O69Aa8GscuGu5
         3qT06jSAEaka8lx8235nwG4adtjGVXBLQaElYZhvmoZgVAr4wDov61ROfNQCOooCHbP1
         yhJA==
X-Gm-Message-State: AC+VfDyg6c+v+7LA1FZmx7Zhrg6CYxYC+sVaC7zdTAi4IqUhlgHM9ox4
	GqTFpd1YYmHtqb6oirl49ZbtBg==
X-Google-Smtp-Source: ACHHUZ6obEbka8NNsbD0h9cxmp9F7B27iNr6Z+hy4ts3KoIhfXd8UU80M7LYR8OdkLm5EMLFayAcTw==
X-Received: by 2002:a17:907:97d0:b0:96a:2210:add8 with SMTP id js16-20020a17090797d000b0096a2210add8mr25616124ejc.8.1684352297680;
        Wed, 17 May 2023 12:38:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7a:e7cc:21b3:c435? ([2a02:810d:15c0:828:d7a:e7cc:21b3:c435])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709067ccf00b0094f23480619sm12833636ejp.172.2023.05.17.12.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 12:38:17 -0700 (PDT)
Message-ID: <f0469fcb-a1ef-77a2-a8ab-40ab8d91bff7@linaro.org>
Date: Wed, 17 May 2023 21:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jstephan@baylibre.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, nbelin@baylibre.com,
 bero@baylibre.com
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517145237.295461-8-abailon@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_123820_914513_0E863698 
X-CRM114-Status: GOOD (  19.55  )
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

On 17/05/2023 16:52, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Reviewed-by: Julien Stephan <jstephan@baylibre.com>

There are so many errors in this patch... that for sure it was not
tested. Reduced review, except what was already said:

> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> new file mode 100644
> index 000000000000..6f432d3ea478
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AI Processor Unit DRM
> +
> +properties:
> +  compatible:
> +    const: mediatek,apu-drm

drm is not hardware. Drop everywhere or explain the acronym. If you
explain it like Linux explains, then: drm is not hardware.

> +
> +  remoteproc:
> +    maxItems: 2
> +    description:
> +      Handle to remoteproc devices controlling the APU

Missing type/ref. Does not look like generic property, so missing vendor
prefix.

> +
> +  iova:
> +    maxItems: 1
> +    description:
> +      Address and size of virtual memory that could used by the APU

So it is a reg?

> +
> +required:
> +  - compatible
> +  - remoteproc
> +  - iova
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apu@0 {

Where is reg? @0 says you have it...

> +      compatible = "mediatek,apu-drm";
> +      remoteproc = <&vpu0>, <&vpu1>;
> +      iova = <0 0x60000000 0 0x10000000>;

Why would you store virtual address, not real, in DT? Let's say you have
some randomization like KASLR. How is it going to work? Drop, it is not
hardware property.

Best regards,
Krzysztof


