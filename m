Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E926C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3xZ+pGm6Eh54OOIAnto8Xj/lUh4U9VaeSI/1fR7wf0=; b=DcZSmY6FR+uYZq
	7Hmhr8HmCuuGMXcc8Mmflg0uwzIODq0v18mmE/CKwUvbLRyhNdQDP3GbbleTgBC+Dx9P6HexPxhYU
	pXEQfQDz/6idYW0qxd9jAYbYGXtRfeT6aOZlXBbk3PIgFI9pUVOZbxyGVtGXC7GwiMaQUo9GC+Hs7
	qfaz6sL80jMdkCM/NgU1snQq/cUmrGTif58eHrM8f0W/lZ2CrapAlUJcJd/uEu6slS5I8rXjtyrlZ
	SfuNwPeptoZ/vyffwytpLFQcNs5ej/Sti+SrSBiImVxQ4ch02fPotxE7ZWz70Txl1nNPintsR72V6
	PxpHUYzDfuLv7W4/GvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhtAn-000ZIA-30; Fri, 22 Apr 2022 13:18:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhtAZ-000ZDR-Ka; Fri, 22 Apr 2022 13:17:57 +0000
Received: by mail-wr1-x42c.google.com with SMTP id b19so10996552wrh.11;
 Fri, 22 Apr 2022 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k8r+yfkaeQZMDq9HKQ53kc2pMzWynvXz7/9ViLHoyIg=;
 b=MjiXU0m3KVdIl4giHmSj2IO9ORa+VB0l+jEmNLgyFJ5s6WGpUN19kYaEjy+7QUv86V
 ctm/1TSApZueL9zCTWzeq03iuKHpBwmJkNmaGXIP1q1qzOj5aTd+S99uUtWvJzZbpxFJ
 FzkZEcmQsv4DLnuryI1gocHLfnCZZHkXv+MTCFOrjuH/huZCkmRd1tRftlLARuPfGiUa
 m3JObwCfSh+7VNJVtaSG0W3kRltYLpQRK8A4vZBb2baMb6VbwRWs0LLTHpVJXmy2wdy/
 OmeT+wTBcy0frRSKe3irtf4jG559wb7/Yk94EVje9yJOVN1HkR+abw7n8KXiHGvmwZuM
 fuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k8r+yfkaeQZMDq9HKQ53kc2pMzWynvXz7/9ViLHoyIg=;
 b=VCyHmYK2owSLSYp4iUjxt0qo46wnHX1G9eUOhO14zRVxS+XjPTkXnixcwTibfO7tzY
 WsGt/Dzfwhpbd86tTRWVG98chtltZ6MkTpijVzBzHBBGLjvtXv/FxbzGpwdv9p+maHHn
 mjv8eq37GHG787cHkti3XoAcrZIXwJSF/FNoww9QsXqHn37IHpAwOYsv3VA+B52mf/Fb
 rfyOIULz0su2CsHWtPcVU/NI5dcMai6qPJNijzifDfEtZKEr1rxw3G8+KC+LM7d8mwag
 2XRX0NH0M2nBWpMYpysxw43Qx7Zd397Gd3yvoLareGqCw6DuHS1r4pjP6p/aj4K3X7MQ
 3nfA==
X-Gm-Message-State: AOAM531vOMRtPL4eztyLdCHAQyGmiTdW2kFzbSmElQAGoFTUrK9xpijw
 cYd6dtql4YFUG4dEi7MEtwA=
X-Google-Smtp-Source: ABdhPJyq0tB3OynhCktMQm8k9iio8P+tjNQKjHOjKu/G2Orjw95W8o7cYREafb4kJkQ9T55R9gCyvg==
X-Received: by 2002:a5d:6d08:0:b0:20a:88bf:6d6e with SMTP id
 e8-20020a5d6d08000000b0020a88bf6d6emr3773883wrq.152.1650633474164; 
 Fri, 22 Apr 2022 06:17:54 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a056000188200b0020aa2581c7fsm1979130wri.104.2022.04.22.06.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 06:17:53 -0700 (PDT)
Message-ID: <e2fa86e4-5949-81db-5ecc-1aa5dc0a4e79@gmail.com>
Date: Fri, 22 Apr 2022 15:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] dt-bindings: timer: mediatek: Convert binding to YAML
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220422131317.25410-1-allen-kh.cheng@mediatek.com>
 <20220422131317.25410-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220422131317.25410-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_061755_747104_44A4A22E 
X-CRM114-Status: GOOD (  18.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/04/2022 15:13, Allen-KH Cheng wrote:
> Convert Mediatek timer devicetree binding to YAML.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   .../bindings/timer/mediatek,mtk-timer.txt     | 42 ----------
>   .../bindings/timer/mediatek,mtk-timer.yaml    | 79 +++++++++++++++++++
>   2 files changed, 79 insertions(+), 42 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>   create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> deleted file mode 100644
> index 6f1f9dba6e88..000000000000
> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -MediaTek Timers
> ----------------
> -
> -MediaTek SoCs have two different timers on different platforms,
> -- GPT (General Purpose Timer)
> -- SYST (System Timer)
> -
> -The proper timer will be selected automatically by driver.
> -
> -Required properties:
> -- compatible should contain:
> -	For those SoCs that use GPT
> -	* "mediatek,mt2701-timer" for MT2701 compatible timers (GPT)
> -	* "mediatek,mt6580-timer" for MT6580 compatible timers (GPT)
> -	* "mediatek,mt6582-timer" for MT6582 compatible timers (GPT)
> -	* "mediatek,mt6589-timer" for MT6589 compatible timers (GPT)
> -	* "mediatek,mt7623-timer" for MT7623 compatible timers (GPT)
> -	* "mediatek,mt8127-timer" for MT8127 compatible timers (GPT)
> -	* "mediatek,mt8135-timer" for MT8135 compatible timers (GPT)
> -	* "mediatek,mt8173-timer" for MT8173 compatible timers (GPT)
> -	* "mediatek,mt8516-timer" for MT8516 compatible timers (GPT)
> -	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers (GPT)
> -
> -	For those SoCs that use SYST
> -	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
> -	* "mediatek,mt8186-timer" for MT8186 compatible timers (SYST)
> -	* "mediatek,mt8192-timer" for MT8192 compatible timers (SYST)
> -	* "mediatek,mt8195-timer" for MT8195 compatible timers (SYST)
> -	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
> -	* "mediatek,mt6765-timer" for MT6765 and all above compatible timers (SYST)
> -
> -- reg: Should contain location and length for timer register.
> -- clocks: Should contain system clock.
> -
> -Examples:
> -
> -	timer@10008000 {
> -		compatible = "mediatek,mt6577-timer";
> -		reg = <0x10008000 0x80>;
> -		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> -		clocks = <&system_clk>;
> -	};
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.yaml
> new file mode 100644
> index 000000000000..be7eb09275f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/mediatek,mtk-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoCs timers bindings
> +
> +description:
> +  MediaTek SoCs have two different timers on different platforms,
> +  - GPT (General Purpose Timer)
> +  - SYST (System Timer)
> +
> +maintainers:
> +  - Fengquan Chen <fengquan.chen@mediatek.com>
> +  - Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> +
> +properties:
> +  $nodename:
> +    pattern: '^timer@[a-f0-9]+$'
> +
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt6577-timer
> +      - const: mediatek,mt6765-timer
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-timer
> +              - mediatek,mt6580-timer
> +              - mediatek,mt6582-timer
> +              - mediatek,mt6589-timer
> +              - mediatek,mt7623-timer
> +              - mediatek,mt8127-timer
> +              - mediatek,mt8135-timer
> +              - mediatek,mt8173-timer
> +              - mediatek,mt8516-timer
> +          - const: mediatek,mt6577-timer
> +      - items:
> +          - enum:
> +              - mediatek,mt7629-timer
> +              - mediatek,mt8183-timer
> +              - mediatek,mt8186-timer
> +              - mediatek,mt8192-timer
> +              - mediatek,mt8195-timer
> +          - const: mediatek,mt6765-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: clk13m
> +      - const: bus
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

Are we missing clocks here?

Regards,
Matthias

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@10008000 {
> +        compatible = "mediatek,mt6577-timer";
> +        reg = <0xd4014000 0x100>;
> +        interrupts = <13>;
> +        clocks = <&coreclk 2>;
> +    };
> +
> +...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
