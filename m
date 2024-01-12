Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD05C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 07:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WW6jGJjARLyzmvJo/Ejz9ZPhSP+j9ZHeaKbDRm9v9fQ=; b=SXUFgNS0JyMI1Ke7zYU7Y929Ud
	gSYcfvPif4WXIpljlZO7uX9CfxKj8Iov1vCAYvBglfaEfE6l0auig5KL4a0a9hARJn190FkHEiYOx
	AYg9wFxl+51TQY0nQFitbRm3t+bl+CGIOLrPNweSUlbUTkYHwcy/pC25x4V+qL+nr5YuIqifv5gGn
	TSrQ4BI/o4pybehzKBOIOK3/xLghmIONhkC72CW+wFFM96b3r6sWxy2DtgXsYox/LNIprkoCzX+2j
	Ey1T9vUptCxqZYt8m5U5GJE5cczoyAfhP3EdxeLx/cUF39PkwjzSpOykvvDzglgw//AD/wXtFW1Q9
	9YU9rYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOBqN-00249C-0M;
	Fri, 12 Jan 2024 07:20:43 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOBqK-00248V-1I
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jan 2024 07:20:41 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2cd928a1d58so9980091fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jan 2024 23:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705044036; x=1705648836; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WW6jGJjARLyzmvJo/Ejz9ZPhSP+j9ZHeaKbDRm9v9fQ=;
        b=wdXaN/qHSPlFv40bpx+bYDX3p8NBENWf2XLuz/tmjh44Pd9pmvjtgOtj3bMxfG7E2F
         xpmxfSIoaO80oEcWT9xDaKyJmyRfW+f92bsKm4twDOq5+22cX8hRXSGAaK4b/FqZNa5C
         gThowHAyjJ4c41LKy4SAWKAxvWd+qdOL+gVAXPe49xR/dCTP5A/h6HYxVyWsA7pFDUXy
         MqVvS5xO0WoQSASqVeIsX2KjVW2UwE2Gi7RMpdmFebfyfgEIJ34Y4h7LN9iDqrUlbM9w
         phRjDKeWRW/2YqN/n8D1s+TfH4al6IaMBNhE3mdhxXqAm/tWyhgTpZdioGJG2OwO+A40
         ekOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705044036; x=1705648836;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WW6jGJjARLyzmvJo/Ejz9ZPhSP+j9ZHeaKbDRm9v9fQ=;
        b=BLOFxakUyE0xFwsFROJwOZSFhW/XSaURc484pN3X9FzXeTONhcRGO1Ohj+r7aqb71n
         xP89svMd2R0oTE9N5nhHDrYAC4wPok5HrhiHL9jgumRxU+PSE5v9fN/v+zur8UIgjmYb
         HmJ9Htme5Krf/5tKexCbVfxkCxyI8TVvsuTuCtlvnrNiiKjz1Wk6FeSHUXp+MLyBIrsJ
         Z0ECaEfHjZic0cIWpB6Yh4yK0UxdMEagIU/SRcgbeyHB0CixI91syC2ewOQyARFG3TLP
         cQsemj57z7kIRyPAqGQ+S35y1CG/9huRu476PtngfuUbN3rDgPQ6z1wYFmnOIeasPGcZ
         U25g==
X-Gm-Message-State: AOJu0YywcaehNWMNciicNnG8js+cwIpb9I4Ya4l7UOaVe17Xgsoa3u5o
	Rhk1D0B6O1r4Yl60zwsFBBn1RQEj8hvSGg==
X-Google-Smtp-Source: AGHT+IFEoThE0z4x+glmztfLbhGTbSb7RJhGRSWmlaS1LMAaccFBHO2vJ4Iui8hgUeBoGwx1LsJouQ==
X-Received: by 2002:a2e:aaa3:0:b0:2cd:690d:5d37 with SMTP id bj35-20020a2eaaa3000000b002cd690d5d37mr398220ljb.29.1705044036312;
        Thu, 11 Jan 2024 23:20:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d474c000000b00336aac53e75sm3021620wrs.97.2024.01.11.23.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 23:20:35 -0800 (PST)
Message-ID: <f9301f2c-8996-41ee-903a-372411e1d6f9@linaro.org>
Date: Fri, 12 Jan 2024 08:20:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240110063532.14124-1-jason-jh.lin@mediatek.com>
 <20240110063532.14124-2-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240110063532.14124-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_232040_441473_7164BFA3 
X-CRM114-Status: GOOD (  23.27  )
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

On 10/01/2024 07:35, Jason-JH.Lin wrote:
> Add mediatek,gce-props.yaml for specific GCE properties for both
> Mailbox Providers and Consumers.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/mailbox/mediatek,gce-props.yaml  | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> new file mode 100644
> index 000000000000..aac776b74e88
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Global Command Engine common propertes for both Mailbox Providers and Consumers.

That's way too long. Please observe coding style wrapping. Just MediaTek
Global Command Engine Common Propertes
(pay attention to capitalization)

> +
> +maintainers:
> +  - Houlong Wei <houlong.wei@mediatek.com>
> +
> +description:
> +  The Global Command Engine (GCE) is used to implement a Command Queue (CMDQ)
> +  driver using the Linux Mailbox framework. The GCE is an instruction based,
> +  multi-threaded, single-core command dispatcher for MediaTek hardware.
> +  We use GCE Mailbox binding to define GCE core properties for GCE Mailbox Provider.
> +  A device that uses the CMDQ driver to confige its hardware registers by requesting

configure?

> +  the Linux Mailbox Channels in the GCE Mailbox Controller is a Mailbox Consumer.
> +  This binding defines the common GCE properties for both Mailbox Providers and Consumers.

Last four sentences: a lot of text yet absolutely no meaning. I still do
not understand why same property is shared between provider and consumer.

Also, wrap according to Linux coding style.

> +
> +properties:
> +  mediatek,gce-events:
> +    description:
> +      Each gce-events is an event id corresponding to a specific hardware event
> +      signal sent to GCE. The event id is defined in the GCE header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +      CMDQ client drivers have two usage of GCE event signals,
> +      one is sfotware tokens and the other is hardware events.
> +      Software tokens refer to GCE event signals triggered by drivers.
> +      e.g. software drivers append GCE commands to set a GCE event after specific
> +      GCE commands. Or CMDQ client driver uses the CPU to write the event id
> +      into GCE register to trigger the GCE event corresponding to the event id.
> +      Hardware events refer to GCE event signals triggered by hardware engines.
> +      e.g. When OVL fetches all the data in the frame buffer, OVL will send

There is no full stop before "e.g." and no new sentence. Please run this
through grammar check, like Google, ChatGPT or human.

> +      a frame done irq and send a frame done GCE event via hardware bus directly
> +      at the same time.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 1024


Best regards,
Krzysztof


