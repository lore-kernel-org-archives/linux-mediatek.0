Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pSvickso+xjP5saP8efXvMNhX5H+k95vAykSoJJVdY=; b=0HjTCjGS3A7CWt5qjjZSkpc1UP
	3awcZN9mBTZghmCpX2Dc0zmVMLjYUeHoHvnvVPyJHtnDZvIy9DfNTpyJ3aG5LaFZW97z5AnRw3Fzk
	UXS4OfIuMftA2jlMhWxnEh45YXjP/hSTY8CVr2eK1/fO+XUsU0MCyDbd7D0nv6q03vG77y1OMgnDy
	hgNZFqrgWM6SPDaDLRmf6n8KhAFbDm2GU1PSeaw7VC+On15IsrNb7jCctjcpFME1ZgFEHaiqtxz5A
	bcha6JtM7VWaDWbxf8rgTXAer+pKuhEZImkpgAh9LEqkRvmlUIZesMRqZsNxGwN/AljJzOLvl319U
	1Ov9Pn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmrS-008zdm-JD; Fri, 07 Oct 2022 12:53:54 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmrG-008zcn-S3; Fri, 07 Oct 2022 12:53:44 +0000
Received: by mail-pj1-x1029.google.com with SMTP id h8-20020a17090a054800b00205ccbae31eso7127723pjf.5;
        Fri, 07 Oct 2022 05:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4pSvickso+xjP5saP8efXvMNhX5H+k95vAykSoJJVdY=;
        b=Ua1xRLZ6TqGxaLz7s2IFEr6t8pX3xNBkZ+Icpsp00BbaZd90vT1eLOmtLWzuNOocla
         PwW9V/FztBVwY/C1Dm7nM1s4kMq8pjOfc6lyDmP2aZWH+Puzuf2ijZWtA0Um+IsZPPgv
         0pDUep6oidImMzpDMjdFBtSLtFUHavAX4R7OIh+znxHbsP8flX/tR+ShB06GDL1WcyP7
         dy1zylcDFwtohDWRUAaS8/DxZ4xC90jpYsip2fZtrmrK0UVH7hvPM4G/bDI3cr68X0Ud
         IRCsGv913wxPi/JOzzEOF5H5Kr+wvOUh7BGkEQPL3LvgI8E5Fejin3CtQlN2r4DE4UdP
         Szbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pSvickso+xjP5saP8efXvMNhX5H+k95vAykSoJJVdY=;
        b=5HCkcRPbS3LSCfKabaKlcIHUw3Ri7Ls4gq3VDRyjw5xCdSwIq94eq2SYIENyXQLTdD
         b6/Yf7KybzLweGO138JR3nQDYdvGY4NaLSwL69hEUZ8SkVeD1OEU+zvfbzu7rVrAZcSv
         bYgG2MgGaVVQeeQKf6iuu3yKUASyQ5lPzYNwZsFHERfiVO6krqVEr856d6Z2S52mPXYC
         GlfYdyv27/eanYWlwMy5Jt3CXvpfzzIWrbHucXaDT+OFO2IHDi6WUZd/9UGkOY0PFBN6
         atqoMIWSDaEHWz1znaXubjDyFZji4fev7gwsajnUH3W/55aJAfVFC2LWHHvXHcnf9cGy
         KrZw==
X-Gm-Message-State: ACrzQf0HU5KBrabdiOREb9aR2U/vXpv0ES2viWQgwps651D/p91R/jUb
	P9e9nwIdyqExkKNTQ718XG8=
X-Google-Smtp-Source: AMsMyM5yY0egVUtyRxt7kKLrVc2niCJmEChtOTkK8lcnf67hgWzfvKi+Vp3ZQFRQY8gY/KEC+p9zBg==
X-Received: by 2002:a17:90a:e7ce:b0:20a:c658:c183 with SMTP id kb14-20020a17090ae7ce00b0020ac658c183mr5361370pjb.5.1665147221992;
        Fri, 07 Oct 2022 05:53:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c1-20020a056a00008100b00562657a7b11sm1547574pfj.8.2022.10.07.05.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:53:41 -0700 (PDT)
Message-ID: <65d83f3e-b0ce-c199-c653-c948b9f015b5@roeck-us.net>
Date: Fri, 7 Oct 2022 05:53:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/8] dt-bindings: watchdog: mediatek: Convert mtk-wdt
 to json-schema
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221007093437.12228-1-allen-kh.cheng@mediatek.com>
 <20221007093437.12228-6-allen-kh.cheng@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221007093437.12228-6-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_055342_957506_CD3F8148 
X-CRM114-Status: GOOD (  21.74  )
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

On 10/7/22 02:34, Allen-KH Cheng wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Convert the MediaTek watchdog bindings to schema.
> 
> The original binding only had 4 without a fallback but there is a reset
> controller on the "mediatek,mt7986-wdt", "mediatek,mt8186-wdt" and
> "mediatek,mt8195-wdt". Since there is no reset controller for the mt6589,
> we remove "mediatek,mt6589-wdt" as a fallback.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 77 +++++++++++++++++++
>   .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
>   2 files changed, 77 insertions(+), 42 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>   delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> new file mode 100644
> index 000000000000..6805fbeace11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoCs Watchdog timer
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description:
> +  The watchdog supports a pre-timeout interrupt that fires
> +  timeout-sec/2 before the expiry.
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2712-wdt
> +          - mediatek,mt6589-wdt
> +          - mediatek,mt7986-wdt
> +          - mediatek,mt8183-wdt
> +          - mediatek,mt8186-wdt
> +          - mediatek,mt8192-wdt
> +          - mediatek,mt8195-wdt
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-wdt
> +              - mediatek,mt6582-wdt
> +              - mediatek,mt6797-wdt
> +              - mediatek,mt7622-wdt
> +              - mediatek,mt7623-wdt
> +              - mediatek,mt7629-wdt
> +              - mediatek,mt8516-wdt
> +          - const: mediatek,mt6589-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog pre-timeout (bark) interrupt
> +
> +  mediatek,disable-extrst:
> +    description: Disable sending output reset signal
> +    type: boolean
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        watchdog: watchdog@10007000 {
> +            compatible = "mediatek,mt8183-wdt";
> +            reg = <0 0x10007000 0 0x100>;
> +            interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
> +            mediatek,disable-extrst;
> +            timeout-sec = <10>;
> +            #reset-cells = <1>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> deleted file mode 100644
> index 762c62e428ef..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Mediatek SoCs Watchdog timer
> -
> -The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
> -before the expiry.
> -
> -Required properties:
> -
> -- compatible should contain:
> -	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> -	"mediatek,mt2712-wdt": for MT2712
> -	"mediatek,mt6582-wdt", "mediatek,mt6589-wdt": for MT6582
> -	"mediatek,mt6589-wdt": for MT6589
> -	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
> -	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> -	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
> -	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> -	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
> -	"mediatek,mt8183-wdt": for MT8183
> -	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
> -	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> -	"mediatek,mt8192-wdt": for MT8192
> -	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
> -
> -- reg : Specifies base physical address and size of the registers.
> -
> -Optional properties:
> -- mediatek,disable-extrst: disable send output reset signal
> -- interrupts: Watchdog pre-timeout (bark) interrupt.
> -- timeout-sec: contains the watchdog timeout in seconds.
> -- #reset-cells: Should be 1.
> -
> -Example:
> -
> -watchdog: watchdog@10007000 {
> -	compatible = "mediatek,mt8183-wdt",
> -		     "mediatek,mt6589-wdt";
> -	mediatek,disable-extrst;
> -	reg = <0 0x10007000 0 0x100>;
> -	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
> -	timeout-sec = <10>;
> -	#reset-cells = <1>;
> -};


