Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C177C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1rmePuyv5bcwntfCsmTcO6YqB2QhQcR4ngZfdM9o6A=; b=QuROLlKgJkq47O
	pIXGAhln6dAEfHFA8DrbNlzGOSZmNCHetREoFnZ0g8cMvsvFBk19r0L/mPWfDgwtGDN89T8OgFnde
	2IoLpdm80nbScuuF1QcMeVUQ3f4cYdnfbHalk2Chk82KzPi19wiDeD3U/4bmmQJo+qWduvaLhJttF
	II2sajj7iTBYkf97TWBqrV8RleN4wP0o87egZ23xrEimeQr05fvybeM3R0pyFPevxla5sXpR4pE85
	au0MHns0d98KJjCRJESAszCc13exPf9gTwS0ZXSu9p3ATvDMHOapPUDWcC6kZCYpqUi5SyIFCZX5n
	31WHg4fC4aWDvMJTGpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnw5-002svD-55; Fri, 25 Mar 2022 17:41:17 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnrb-002rAS-DZ; Fri, 25 Mar 2022 17:36:41 +0000
Received: by mail-ed1-f54.google.com with SMTP id z92so10027957ede.13;
 Fri, 25 Mar 2022 10:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+IQOL/i3pOvSW6gL8acHIjGAB8zIBWe2pJauIvLBYZw=;
 b=rD7qwNqJNVIz6r8rUnAkI0Ssdpv4uEf12JBqw9V1VQyhml6ohwpf41cMnQClghG8x3
 kdbPFecTGbB+lyReBvqTo8B01TOKZGgUIlayyyZLzRM5H8C01u0FRr7Pifc9DlDs1sbI
 3sbdzhqc4bpvehq29U4K/epNpsVpwvELIUwjCjfTDTWcTEU5dJ9esjJoyZmGApt0ExB4
 mIp6OtRB00vr4B1rak9qLUV58tTPjN4mH7HBtBVr6J6w+eQwgQUkofkPqJl0203hpqdH
 8EdMKVHh+5+a1H53OSnfS9a0ypj18HuJIknCe20exFH9EQMc9RBF9ogL+mDnMidKET4o
 yYpQ==
X-Gm-Message-State: AOAM530gKYFHlzq/rP0AO/2Ub3fcAPwIhbz+QhIuxMGqw1Q0UQKuL0bS
 s1HzfeuqUp+tmXBoSGRNMzc=
X-Google-Smtp-Source: ABdhPJxMwXvlpL+4JyEmyf1bVymPZHtcHyRrXsWs0hxmehdLZOEYA6fVeuX2XFBlMV/UWRok9ezgvg==
X-Received: by 2002:a50:9fad:0:b0:419:f22:46db with SMTP id
 c42-20020a509fad000000b004190f2246dbmr14492584edf.354.1648229797742; 
 Fri, 25 Mar 2022 10:36:37 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 g4-20020a170906520400b006e0b798a0b8sm490009ejm.94.2022.03.25.10.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 10:36:37 -0700 (PDT)
Message-ID: <da463ecb-e4ac-6e9c-c3a6-775d5c853807@kernel.org>
Date: Fri, 25 Mar 2022 18:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/22] dt-bindings: mediatek, dp_phy: Add Display Port PHY
 binding
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org, markyacoub@google.com
References: <20220325171511.23493-1-granquet@baylibre.com>
 <20220325171511.23493-4-granquet@baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220325171511.23493-4-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_103639_538242_29E422DC 
X-CRM114-Status: GOOD (  15.13  )
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

On 25/03/2022 18:14, Guillaume Ranquet wrote:
> This phy controller is embedded in the Display Port Controller on mt8195 SoCs.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../bindings/phy/mediatek,dp-phy.yaml         | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> new file mode 100644
> index 000000000000..4180d40f4fa7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2022 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Port PHY binding

Skip "binding"

> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the Mediatek (embedded) Display Port PHY
> +  present on some Mediatek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-dp-phy
> +
> +  regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the Display Port node.

Need a vendor prefix and descriptive suffix (e.g. mediatek,dp-syscon).

> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - regmap
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dp_phy: dp_phy {

Generic node name: just phy. Also underscores shoulk not be in node name.

> +      compatible = "mediatek,mt8195-dp-phy";
> +      regmap = <&dp_tx>;
> +      #phy-cells = <0>;
> +    };


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
