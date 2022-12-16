Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49868C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 12:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTzKBQ744xGAmgAzWVUaSvP9DheiSegLLVxyUIODlVA=; b=jbyAB4wWrl3Hj+F0TKZMhGuBsm
	K8Sodo1cwQhexPBAKYU/ZM+xTZ0Crn7oo/F8Uat/4EmwkdnWR9CqsQDfC/40i+EXr5+zbdxLXs5zX
	xFJ3xB/nShup/gYndy2a8PDo9yebb0lHixNgcxYNKGO20DCcYm8hYp+5r0ogpLw0ofDLjske4GHkJ
	TxaSfSVjtKWs0BbKmCyrBTgb6l/UIoomHskcH0mU0+Q9QsvRbDyja95RPFv5Y2OyuGFaICEqphlzL
	pKjQbE8lQoQSCfmAS/WOOzg4QXAkfw/Os6tfuvGplCjaCAeQRtjg1Yzc+xWkToeqntqoacxopfckw
	gUBK90Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69yW-00Ex5J-Fv; Fri, 16 Dec 2022 12:38:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69yT-00Ex2R-De; Fri, 16 Dec 2022 12:38:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id ja17so1760115wmb.3;
        Fri, 16 Dec 2022 04:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vTzKBQ744xGAmgAzWVUaSvP9DheiSegLLVxyUIODlVA=;
        b=qf/08coKmkgaRJN4AqFrGGIbGeH5HOEITp8/o3H4LIcOzwbLIrZnCNexbYFejspxPS
         cmKKyK2aqtiLV4zBfR+NPuK2PKdjPNu/eKPpNTasV+CriEqBI3C7X5EQuH+EnAn0ZOoH
         ai2EGja3RCF8Y0FSm9kB0EQNYj1cEmnwV9OI7SDPTbibnwGpAdApApPEaKnK5so2Ys8K
         2oGVDSoKyu2LvmoNd64cMqBWsBlhtaDdlZeSjz9uSBjN6Zr7OhsJwqrKKwqE+zC0hp8P
         KE/uOzv9Ox9J4qg9zvCXNL71LdAvzl6S1l7QHjm+7JbY3ESLX4/wWyGQtC38rTED5RNf
         svqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vTzKBQ744xGAmgAzWVUaSvP9DheiSegLLVxyUIODlVA=;
        b=dOga1E5W/soBDClcdSz8Uc87CvQ2IYWizKCivTKU20t/5Lgch5idF9JGOxInOUZMr1
         PTdFauHuLdoTNezqDzGW2CdOko7wCVj88EI5KGiJB1ADXgjuiCC0YTi5T/ca6hswAqwI
         0mF+lsJYSpniC1v1F7Mhw+r/OTl7pB3uCO04QLFQ7nZP++ElKv/Iz+dbFj89YDSDdICx
         SrZEf1863Td6ktPXnEGHmuoZt5HuKL/KZn3BwANUH86yIQU03USsZ86vBoWUUQvloIra
         aS9Z+zVSZICDiBLyWOKpFyeLgkM6l72zzVj9JT3eDknTSxKUPjdb3ucjNP7WxQKH+iAQ
         Konw==
X-Gm-Message-State: ANoB5pnO/J8XTb5ZTDon1v99R2ESkV7nGgwKX/z9jLrGDyJxQ3aJxmG2
	/N8FT24GASd8b/h15T62S6s=
X-Google-Smtp-Source: AA0mqf6F4g4Or5t0Ejs682ICDK27vMb5jniW+WpRxIsXlEFrSNsfluoacS4xbTysO5o9JflSsObJ4A==
X-Received: by 2002:a05:600c:4fc3:b0:3d2:2fa9:cffa with SMTP id o3-20020a05600c4fc300b003d22fa9cffamr11746506wmq.25.1671194277553;
        Fri, 16 Dec 2022 04:37:57 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f22-20020a05600c43d600b003cf6e1df4a8sm2371411wmn.15.2022.12.16.04.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:37:56 -0800 (PST)
Message-ID: <3eabd753-684f-5222-e7f4-a8b688e6623e@gmail.com>
Date: Fri, 16 Dec 2022 13:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 1/6] dt-bindings: mediatek: modify VDOSYS0 display
 device tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lancelot.wu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
 <20221206020046.11333-2-nathan.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221206020046.11333-2-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_043801_509014_94746809 
X-CRM114-Status: GOOD (  14.13  )
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



On 06/12/2022 03:00, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 display device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 1 +
>   .../bindings/display/mediatek/mediatek,postmask.yaml          | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++++
>   8 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index d4d585485e7b..92741486c24d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -31,6 +31,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-aal
> +              - mediatek,mt8188-disp-aal
>                 - mediatek,mt8192-disp-aal
>                 - mediatek,mt8195-disp-aal
>             - const: mediatek,mt8183-disp-aal
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 63fb02014a56..fe444beff558 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -27,6 +27,7 @@ properties:
>             - const: mediatek,mt8192-disp-ccorr
>         - items:
>             - enum:
> +              - mediatek,mt8188-disp-ccorr
>                 - mediatek,mt8195-disp-ccorr
>             - const: mediatek,mt8192-disp-ccorr
>         - items:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index d2f89ee7996f..62306c88f485 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -37,6 +37,7 @@ properties:
>             - enum:
>                 - mediatek,mt8183-disp-color
>                 - mediatek,mt8186-disp-color
> +              - mediatek,mt8188-disp-color
>                 - mediatek,mt8192-disp-color
>                 - mediatek,mt8195-disp-color
>             - const: mediatek,mt8173-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 8ad8187c02d1..5c7445c174e5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -27,6 +27,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-dither
> +              - mediatek,mt8188-disp-dither
>                 - mediatek,mt8192-disp-dither
>                 - mediatek,mt8195-disp-dither
>             - const: mediatek,mt8183-disp-dither
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index a89ea0ea7542..a5c6a91fac71 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -28,6 +28,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-gamma
> +              - mediatek,mt8188-disp-gamma
>                 - mediatek,mt8192-disp-gamma
>                 - mediatek,mt8195-disp-gamma
>             - const: mediatek,mt8183-disp-gamma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index a2a27d0ca038..065e526f950e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -36,6 +36,7 @@ properties:
>             - const: mediatek,mt2701-disp-ovl
>         - items:
>             - enum:
> +              - mediatek,mt8188-disp-ovl
>                 - mediatek,mt8195-disp-ovl
>             - const: mediatek,mt8183-disp-ovl
>         - items:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> index 654080bfbdfb..27de64495401 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> @@ -26,6 +26,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-postmask
> +              - mediatek,mt8188-disp-postmask
>             - const: mediatek,mt8192-disp-postmask
>   
>     reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 0882ae86e6c4..3ade2ece3fed 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -31,6 +31,10 @@ properties:
>             - const: mediatek,mt8183-disp-rdma
>         - items:
>             - const: mediatek,mt8195-disp-rdma
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-disp-rdma
> +          - const: mediatek,mt8195-disp-rdma
>         - items:
>             - enum:
>                 - mediatek,mt7623-disp-rdma

