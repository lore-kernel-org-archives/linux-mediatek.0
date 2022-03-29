Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3894C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKpF/rXVIQIyR6ACa1XzIhYmMCI63fIIjf2X74wVYac=; b=XPv8rfvpg4m6Mw
	h/l+8pWbTGwmDz4a4maE2GmruVIg11rIiCUXQdcoh6JdOPUURB8nEUABrNFeVCzM8R+ggk1UVpR9l
	a09U396Is3FZnbbWj5wJCXXmPE6+Jt8UUcmGivagBKa1mP7PaSh3uyPyvnEYbk+3SXuc2/nrHrpCU
	Nr8tw29mRpQodkS7w5Snr92Bl7qiAC2KOa4UwcTQVf35LAIQctIouhj4ej4gytoY7vDxF1o+yzKSy
	Q3zzWbtaXm/Hw7sxCppQOguM/HvHb74eDlJKflSVMh+XXe0vwGsIiuRh4+9r/nsmClnJRrU0EeqrZ
	OKHl0ntLO9uF/ziLRAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ9JQ-00BqVj-FA; Tue, 29 Mar 2022 10:42:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ9JE-00BqSx-5D; Tue, 29 Mar 2022 10:42:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1191604wmb.3; 
 Tue, 29 Mar 2022 03:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f3iBbK5fy2drNJnHSVd6h7L8RLpAs5pbHayacM7gQx0=;
 b=Nt78WXBKY+MY3+gr7xrFbMs04A5JgW4P5Hmd599UBhQBR7XU0sztciOhTjgTLJoBZx
 5/YqXihN7sBYpKymfVax90fPW3K+7HOUrmshJEaPR5X48tPrU6usCZLMe2yYujwCvtsw
 p6YScdT6Eq5nn0msocyNsxo2JWuqJFXPmx54pAaJWbo/ATPgSvuOnFaohfvW5FktMgXd
 5GUdSZx7vH2paIueNF6BeyOLtb98kzSiiKiGC0qu//dXk9j4KoZqsAjmb1d5T2QOeCyP
 BXKGIamIzxi0ScmxTfurAE4jsL7PZtE0ICPQGtYfA4Ov8cnT/BRcHPcrFJU4OM+b9/wG
 0pkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f3iBbK5fy2drNJnHSVd6h7L8RLpAs5pbHayacM7gQx0=;
 b=l7Ahk/ImlNOFaF28TnTpXuAnacj7lt1/eJGAFZpMcvLBGhVyHu6FFrcrP+f7cLQik3
 vLMF67lOUmoofvSG4BXpObl+4yG6W3Fh4VdY5+fqxY0TiRt89fmkFPP/pbDDbuJkAD7E
 ZABOnSRWVDTQpW7S/CsAGgOVbbxN3xY2f4zZ+xAQ7tZW5vjGzg7gvxabvPWpn0S5Kck/
 U7a6P6DpRGmFiwP9fkPQlschI8XTtvP2Mrog7A8GbRsXjmJaWn4V+Ve+InGEfyUZSs63
 MqLuCJ5EfrYY3bAMrbi6G50LQH1C/A95veLnVeS94WPSpzLZ19FSrtUCq5W7xeQ/9W9Y
 nNsQ==
X-Gm-Message-State: AOAM531HLSjRg3VWR/GGDzxTd7EUOSCIs9eJHtFcxglw26PLeWRDNKi4
 /OixFKHrKYfMzRj3t1E2oBE=
X-Google-Smtp-Source: ABdhPJwB/NXK19sx39DAWQg5uHNzUaed7dLgj4bbX1z3ETXRa6KA+QTBRYPZmGbtTluMMiRRs7y9PA==
X-Received: by 2002:a05:600c:3d86:b0:38d:581:89ad with SMTP id
 bi6-20020a05600c3d8600b0038d058189admr5993185wmb.42.1648550562084; 
 Tue, 29 Mar 2022 03:42:42 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c4ed100b0038ca32d0f26sm2099039wmq.17.2022.03.29.03.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:42:41 -0700 (PDT)
Message-ID: <dc80d7f7-7a7b-62fb-fbd6-346dba9fdac5@gmail.com>
Date: Tue, 29 Mar 2022 12:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 01/22] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, airlied@linux.ie,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de,
 jitao.shi@mediatek.com, kishon@ti.com, krzk+dt@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de,
 vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com,
 Markus Schneider-Pargmann <msp@baylibre.com>, Rob Herring <robh@kernel.org>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-2-granquet@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220327223927.20848-2-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_034244_235461_1B7A1261 
X-CRM114-Status: GOOD (  19.36  )
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



On 28/03/2022 00:39, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index dd2896a40ff0..2dba80ad3b18 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>   $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DP_INTF Controller
>   
>   maintainers:
>     - CK Hu <ck.hu@mediatek.com>
>     - Jitao shi <jitao.shi@mediatek.com>
>   
>   description: |
> -  The Mediatek DPI function block is a sink of the display subsystem and
> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -  output bus.
> +  The Mediatek DPI and DP_INTF function blocks are a sink of the display
> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> +  parallel output bus.
>   
>   properties:
>     compatible:
> @@ -23,6 +23,7 @@ properties:
>         - mediatek,mt8173-dpi
>         - mediatek,mt8183-dpi
>         - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dpintf
>   
>     reg:
>       maxItems: 1
> @@ -54,7 +55,7 @@ properties:
>       $ref: /schemas/graph.yaml#/properties/port
>       description:
>         Output port node. This port should be connected to the input port of an
> -      attached HDMI or LVDS encoder chip.
> +      attached HDMI, LVDS or DisplayPort encoder chip.
>   
>   required:
>     - compatible

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
