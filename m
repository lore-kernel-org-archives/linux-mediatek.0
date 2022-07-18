Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CECAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQCf01R8FDGSi3ujxTj9GGbfmIZAuUcf4db7o6FQwNs=; b=qG4wDOKdjbPa5XFLR52vXgQago
	33ECwUL1jd2QVA5UWtU0j1t+VWqCVc1qDQczYrLPXIIisFs+SF0lmwq8cOWhN07VNpV0spBGEAZ7k
	+rVuZbTfjWmE2rMC0aT6hnZlGgOFZ0jS54hYWvn329yP7e6PIzisP7d4l5eSDG3PXtR/yKXhqMOcL
	+TsZO0V3MMpJyfDJZnU1pvEw9k/qpRxH3kfkb15zpgRBdoatqZTxiw+Q01NbsDM8/39GN3sXH3BCG
	nkIs/IE2KyEkiPmUIVg8sNF4fP4sQhY66frGoAcwwOaZ9HOB+QX3LQh+/QtIsQb4cxOil+SP9Snzj
	02ZTlbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDTEi-00GV1Y-Av; Mon, 18 Jul 2022 16:04:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDTEU-00GUuA-CG; Mon, 18 Jul 2022 16:04:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h17so17804618wrx.0;
        Mon, 18 Jul 2022 09:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DQCf01R8FDGSi3ujxTj9GGbfmIZAuUcf4db7o6FQwNs=;
        b=lK8n/Z7kwUd8iVx3jExD8J3JH9ui1a0qLDRuUSwgT79sJHtXpllECNqoyPiue8mBAK
         h5H48oY1A/CgoSjIOm3K0kDCxNvdQCR3H3SzKfcmBGPssYZU9EGPyeMmMyGqkjY60YQu
         /ZIMGEZxAFdLHJENR56VZJfrpC28i2dnF2YkdZ7utsOaCFHb+xTnWBP1XZaZctbW5oJj
         lTqTiFhxgbg0QuUhcUz5/z5TRKqFG43AnRrYvnESgzGeDpBete2+DZ+TnfuaeAv+GJNv
         u/rjoEBtOvmWNWDE2HYQSwhslK+YK37BSj00GnHVegxPsFPxI2zWqtHHGyPyJAx6OTuI
         Ebkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DQCf01R8FDGSi3ujxTj9GGbfmIZAuUcf4db7o6FQwNs=;
        b=iMsu9zHD7tfdHwkItARCRXVSjQOgpTyEkBTMNYuxOHW0nzrYXrVJ07ZWriyMyzLSeb
         pena4x+q/3BROx88pgNTmaxk69LJKZZVbxKRQoNpunUBDPRuhw3P76YMzr8q2Wlq1itt
         sjIol8K4mN3PlTzLUDxlqMxFjZuDmTnnfPw5RpJCeRXjjEOLj87wSi3jaCrG3MZ0bAFC
         SWAfVk0diCwFQlCSnX8qwVIpr8PV20G0EY7/WG2o6uh1RpllabcF3rWqE7cIneApcQTt
         zOPZ/Es/eJthFzsabjNH/Pr4SaRRnx780dGqjSMUtcACHudxDnt8AF+oCDdA44Fpo0y0
         iMfA==
X-Gm-Message-State: AJIora8u47IZdUcKnxVKqy38xGGPeBC1yc9Dbbqd36HYw7ywfqX5TGoU
	fIP27v8VS1HYeltL+tKIWyuySj4oIQJKbg==
X-Google-Smtp-Source: AGRyM1uGmhdJOb6JH9Z96ICgqDkOVFee8KCCyYuj0S2hemKTbLOSjnvczlEZxSE1rDCAU4uWzvZ4+A==
X-Received: by 2002:a5d:584b:0:b0:21d:bd2e:42a7 with SMTP id i11-20020a5d584b000000b0021dbd2e42a7mr22311759wrf.192.1658160267673;
        Mon, 18 Jul 2022 09:04:27 -0700 (PDT)
Received: from [192.168.0.14] ([37.223.147.254])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c35d200b003a2d0f0ccaesm20527536wmq.34.2022.07.18.09.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 09:04:26 -0700 (PDT)
Message-ID: <4fcc64d9-060e-6568-6eb7-d74c520593b0@gmail.com>
Date: Mon, 18 Jul 2022 18:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] dt-bindings: watchdog: mediatek: Convert binding
 to YAML
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220714125044.20403-1-allen-kh.cheng@mediatek.com>
 <20220714125044.20403-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220714125044.20403-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_090430_472777_F7FAE682 
X-CRM114-Status: GOOD (  19.47  )
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



On 14/07/2022 14:50, Allen-KH Cheng wrote:
> Convert Mediatek watchdog devicetree binding to YAML.
> 

You are also fixing the fallback compatible here.

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   .../bindings/watchdog/mediatek,wdt.yaml       | 64 +++++++++++++++++++
>   .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ------------
>   2 files changed, 64 insertions(+), 42 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,wdt.yaml
>   delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,wdt.yaml
> new file mode 100644
> index 000000000000..cb90d89b9f5d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,wdt.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/mediatek,wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediatTek SoCs Watchdog timer
> +
> +maintainers:
> +  - Runyang Chen <runyang.chen@mediatek.com>
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
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

missing mt6582-wdt, mediatek,mt7623-wdt and more.
I'd advise split this up in two patches. One fixing the fallback compatible and 
the second one converting to yaml (or the other way round). In any case make 
sure you have all compatibles in the end.

Regards,
Matthias

> +              - mediatek,mt6797-wdt
> +              - mediatek,mt7622-wdt
> +              - mediatek,mt8516-wdt
> +              - mediatek,mt8173-wdt
> +          - const: mediatek,mt6589-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  mediatek,disable-extrst:
> +    type: boolean
> +    description: disable send output reset signal
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +
> +    watchdog@10007000 {
> +        compatible = "mediatek,mt8186-wdt";
> +        reg = <0x10007000 0x100>;
> +        mediatek,disable-extrst;
> +        #reset-cells = <1>;
> +    };
> +
> +...
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

