Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB50EC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9x9Y7Lscjv3IRaOwyapAgh2Goom3SOk7RoeAsBUce4=; b=Pp+vG8iH1osWsC
	uKjZNiqrstG+qMNhXy0tfN9SMyHMks+zUdCmGRk7x5L18bcxNyuz7NmEvFmn+piC8HyF4l+XRaKkk
	QGZm+9wPesCJ/ogWWAAms7fGO3wrGzzdnk3sWkxy+GxJPv5fANacf+4fKFxLRf4BWy50T/HvqUVpN
	v3JEMwdckmcs0niaQsRJfDJCBsoVabWxGNQ1tBOkacFAvbaMqW7v1ZPxevk1x2e/wrZCryTCq0WYO
	3qG9CIgtJERmaWxMLat93yDTXQ7luC1nVRfG+yvj1VGknCGrGnniVErzqxpz2VWV48urdRoOjd/+H
	mC5y1i3IcKAYit2t9GVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niCzR-0045z1-42; Sat, 23 Apr 2022 10:27:45 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niCzO-0045yH-CG
 for linux-mediatek@lists.infradead.org; Sat, 23 Apr 2022 10:27:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id y20so20764442eju.7
 for <linux-mediatek@lists.infradead.org>; Sat, 23 Apr 2022 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AOUrFgUwEuSpl6hTV/7bP18cU2LpXkIHI0vQtR+kpsQ=;
 b=JEiQJmqMDGCqggdXD4BezkGTOz5F3qCD4m3GAg3ePRWI/RRoT0QSNSX95ctQ6kzQut
 g5jOVBWpjAJQGAqOkOL9aAZ9FuROaxU8HqphApfcAHxn09TJYnKuX0T4ZWI7H7HygJrD
 jPAtxY5q7Vx3zUWF6S3ukoN9CvGB9gwwbBomJMWE0GxpD6px1TiPDWuXietPy/j/Wsaa
 jcx4ZrTbocsJazpmAiUVUPLSXLl/1esrBNdqF6DKTM5VPpknkrindHs3GSoBsJ9t7l3o
 xQSfCp8xVQujmjj5k2dhjKJRr4UxR/ODPnRViMKXhvShPxO5HfYoMhdp9BTbE4CQvZst
 b0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AOUrFgUwEuSpl6hTV/7bP18cU2LpXkIHI0vQtR+kpsQ=;
 b=R0W+EnaH2EdsadT6j/rtLHSNxoE7ZH7bOyrq3Yd0ye5wvtyQQkP1F/sn22LZrBdGX6
 mSU5ABR9qS4UJOzk5uICdPBfRhoQgFy9CO5fzRc/laRPZs3BFh/U13fYlQGQEZJ7CDAv
 NFwsXDeFHqf6wtIqifWLVIgs2QzBaFNK5KjDqaztqqlU8RH7mqbYcMX6lneBuy/Um2O0
 OR7RdKKNq3S+lY7vXsbgeq/zrH5FJLGs9d7Vycu29aIskWrWtgu7PntHPeuchCaD9e/O
 tQk6wULHZ5jT4g1nK1XuC/iSLfVAFMABUjdRR1NsuD82v66rbgEnIHJXefjsd/wDg+b2
 iEOQ==
X-Gm-Message-State: AOAM533ydlwQZ5XFBQi6J7W+KMvwif689XHXBHV1fl1a8NEd3t4yzZqV
 Sb/qMVTRTe7dYP+6j1AGdDWAkQ==
X-Google-Smtp-Source: ABdhPJyi1WNeP7McWIYi/L5chkoHfrjRyvJMkmxFVMT6CRqoVF5RVabad+9jTEezRQLCDdaaSzi2KA==
X-Received: by 2002:a17:907:2d08:b0:6f0:2c6b:df52 with SMTP id
 gs8-20020a1709072d0800b006f02c6bdf52mr7411533ejc.210.1650709660435; 
 Sat, 23 Apr 2022 03:27:40 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 n13-20020a170906724d00b006cedd6d7e24sm1545928ejk.119.2022.04.23.03.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 03:27:40 -0700 (PDT)
Message-ID: <288f55f3-b3ed-32b8-9a44-652f3d53617d@linaro.org>
Date: Sat, 23 Apr 2022 12:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 11/17] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8192-sys-clock
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-12-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422060152.13534-12-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_032742_465086_C24AC29E 
X-CRM114-Status: GOOD (  15.62  )
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

On 22/04/2022 08:01, Rex-BC Chen wrote:
> We will use the infra_ao reset which is defined in mt8192-sys-clock.
> The maximum value of reset-cells is 2. Therefore, we add this patch to
> define it.

Remove entire last sentence, does not make sense in the commit.

> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> index 5705bcf1fe47..28ebcecc8258 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> @@ -29,6 +29,9 @@ properties:
>    '#clock-cells':
>      const: 1
>  
> +  '#reset-cells':
> +    maximum: 2

Why this is a maximum? Usually this is const, so how do you use it (with
what values)?

> +
>  required:
>    - compatible
>    - reg


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
