Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB39C46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWZiFupZmDV7/chy9twlz/bKtxk28a/BQ1OZ+FIK00Q=; b=OaqvFGbETz0n2ZGA/VI1lJGrl6
	/6ar2Kw6YdTsbpat2Dmhz4zoAlXubrOduP6cTjcwSIKgK9GJecW7pN1kp0nqmz5pnI3GNKCZ4mv6N
	mqZAXD3834hYwYTWQW11ePSDvvXIfr7K6Zbs+WXJwL0xe001lL8IaRVIrdfLFCpRrwKNgZx4CipfT
	fCfUvdscaBRiN6YHYLlRxF10CdhB9XkIzIb3DQ/4AT4d2YqjUwnDQn0VAHl7vj/SMYYOK49SAaLDR
	+Ujk/jrCMCgP4ebTBhAcBPlMyM6az0TnrwWST4Bh9h11Q9kYmfzxXCCNnWJwpdCLfTKWy5okr96hy
	zO5W4OMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03gO-00ACJx-UB; Tue, 29 Nov 2022 16:42:08 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03gL-00ACGH-Dn
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 16:42:06 +0000
Received: by mail-lf1-x132.google.com with SMTP id c1so22904476lfi.7
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWZiFupZmDV7/chy9twlz/bKtxk28a/BQ1OZ+FIK00Q=;
        b=j3EsDtkRr80dfR/xeJF6gwYP1e2sFcIhQ0oQxLHTXGRJMj/Bmz6c7p2NFqU7z7QWo1
         biaxP/5qvxiT1oMtwIETJvlry+NdYKhI1LiZsQlnXQlVpDfGYzKbfFbjXGbJ2vmfUOxm
         YhOJGMmSCtbXYaw5JSVRR2qWhbjifompBrqmVbMvW6H8L9SrVWDZagp5r2/LzDK7B5EG
         xUOAPKWgj3Zunrr3jWYwAzeV9cF4+rJqeRWkkh+4nwTHSgJQjUkOtHs2oI21xd0xZsJK
         YLW6LWbjiecVovrgfTN1M+dkkMEeztmHmxD3b1t5rp3+wvMwamvASvUsASBPUvcReqLI
         njNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWZiFupZmDV7/chy9twlz/bKtxk28a/BQ1OZ+FIK00Q=;
        b=xXa/uy7X1HdsYfogmrtWP8hhWFf79cA+ghw2WDUmLnXjO42qHQs+R7nDwtZHRVIV7W
         0GCQK9wn0lbI2RJ/1KDprMVZIo6M+ZUu8cxaWytYfgM2ZjhrTRg+95hOdanZbh1IhZnh
         XnvwJ+rX6iHyMIfJWo/CSf9fSijJzbURJnVFdXH+Svs83mle1oQSZUbaG2qWgkHwaUh9
         QGxePr8n3/ZVxdF+GCtjYrSOwtOW+OAZqPwk7zCJnxxGFVY2gL0iTPBlEHbx1a0Jgzhw
         VK6cIfr90ZGXw6zKWRgZo+BrK1rY+MdL0cXqWGuOVaUm78n81BL7J3tnFIIuohAihOsi
         pXxw==
X-Gm-Message-State: ANoB5pnmjgWWrY5/em1RG3NeTuZPYRNsMKmqtrRk4dBEPeW841bGo/Ah
	rT11MwwEw01OyPC70ZdXY8c0ow==
X-Google-Smtp-Source: AA0mqf6bs+MHPq8y/pL1cJ9bImpeUwmQ9PU7zQoTQbWZQI9Y71CuCT3zsDhIG8N1gXr1WdkMo53Jlw==
X-Received: by 2002:ac2:4e82:0:b0:4ac:9f25:21c2 with SMTP id o2-20020ac24e82000000b004ac9f2521c2mr16017549lfr.519.1669740120942;
        Tue, 29 Nov 2022 08:42:00 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d13-20020ac244cd000000b004b48e0f619asm2271574lfm.48.2022.11.29.08.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 08:42:00 -0800 (PST)
Message-ID: <4299d2eb-7724-ced4-dd68-0f0734725e6b@linaro.org>
Date: Tue, 29 Nov 2022 17:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lancelot.wu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
 <20221129143503.16638-3-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129143503.16638-3-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_084205_491231_19E51FD0 
X-CRM114-Status: GOOD (  13.24  )
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

On 29/11/2022 15:34, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 0711f1834fbd..3e7fb33201c5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -47,6 +47,10 @@ properties:
>            - const: mediatek,mt2701-mmsys
>            - const: syscon
>  
> +      - items:
> +          - const: mediatek,mt8188-vdosys0

Why this is not part of previous enum?

Best regards,
Krzysztof


