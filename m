Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BC0C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 17:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rep8VyTcjsWcrm+FThgLtYbfi7P7h/NdS4LzD6Gp4P8=; b=lvKJ8qZyhLFTjTooUhc5rsFFDy
	Tg4yNQMGDDjaw6XDLqweDRd0LlMGiGZixm6qLERkBBlpYTfIAFmbaxQLBQHNESJL1UjMxjZyDQD9B
	umYxUKLzdLG+5AaRpun6xC6kIpHw+RJnuWQSlbLA62mDBxC7AX9bQE2LHyIpIzGtbXu303XaXVKj1
	mzgWxw/V7KB0nC2ASMecDdzn6w1Z+9SaUO+FNDjjIHr8PpgNt2f0D4IH6+Q1h6pPpYouceApQjcjs
	oJgzmIIBxZ2YdjC3GlO/8qjP+wEzjtEmDecoM7ZbPOQmABa51ky3z2Hcy77r+vL8jEpnAIZ43+ueg
	ihUVLklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYhn-006GdB-K4; Thu, 19 Jan 2023 17:28:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYhb-006GXs-JO; Thu, 19 Jan 2023 17:27:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id b7so2581417wrt.3;
        Thu, 19 Jan 2023 09:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rep8VyTcjsWcrm+FThgLtYbfi7P7h/NdS4LzD6Gp4P8=;
        b=WJgf21ry6TlFf5Y6YMfxpJne08KYwcuUhC32BlwUCcPAKWFXnVQ2z8yY7DmD8cF5eZ
         DY+iw3liZhQrsffELrC36VGLh4ZdTehIRCXDh7K+ldCJkXYFl0UUv0rV85qqnK6FtJqL
         dehY6Ty2Y5cHUtA0ovEIyBwTVVnKp25QIqQUVX6szGvgo9vjsycywrpHKs2b9yYtYEMo
         fpW61YK6nTak8QXJMaiBlMUmty8juEl2sAMhmPsfLkiB31FmmHudG5t2HKCYPX9y/0XQ
         CDry8mr73Sa+/Mm44k0EW/e+32Miq6ucY/OCR2cxUR7TMJ3HmG7sw4xz4PcAw6R3FlMJ
         jr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rep8VyTcjsWcrm+FThgLtYbfi7P7h/NdS4LzD6Gp4P8=;
        b=3BoVNDoJmbiArVjr+S9e/EUjMo3YyrOheLMy5GHnyOPxU8TNphBA6TLBIrhmEoMzFe
         6bQFI9HsXKwcTrcv45x0vzXFLYNS3WrSsRmKbFi3oZzClhVLjhOQU72g4K+Pmpp3UQXi
         +5cXH5JReZdkNTMdt81qlh9pbKgJzzBYM/p06Ph0gua8zkpMHgz6dwpmI6HqNNFckmQy
         /gnS+0dM1qSLe0lH5+2DF3RZks9ZWr3zEaMK7MgBBDIK3gNX2GNpg2BNyp43NQg/9mbd
         Us8fFCGOkI1mU7l7slpwzbvFnhYiCqELgzWVdoMgkmW4sbaloCXEJPSsUg5/KTQOFKc9
         Z3LQ==
X-Gm-Message-State: AFqh2koPIgUspu3bKPOw8VYWecVTt4ZdZBHde6Pltoj/QVRG0Z80VPxG
	1Q/1sRtrIjVG8WeouD8R6Tg=
X-Google-Smtp-Source: AMrXdXuChxw61VMVEQM/MTbeOkF17U8tlsZJK1Zg0jN2XZ5VWzfqvo0MONbPGa1zXHC449UlMcuwvA==
X-Received: by 2002:adf:e109:0:b0:2bd:e547:943a with SMTP id t9-20020adfe109000000b002bde547943amr10047432wrz.14.1674149267942;
        Thu, 19 Jan 2023 09:27:47 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600000cb00b002be53aa2260sm87773wrx.117.2023.01.19.09.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 09:27:47 -0800 (PST)
Message-ID: <51b63da0-2aea-f351-d737-66e832a80a18@gmail.com>
Date: Thu, 19 Jan 2023 18:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: i2c-mt65xx: add binding for
 MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org
References: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
 <20221122-mt8365-i2c-support-v2-1-e4c7c514e781@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221122-mt8365-i2c-support-v2-1-e4c7c514e781@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_092751_716541_70432313 
X-CRM114-Status: GOOD (  13.77  )
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



On 19/01/2023 18:08, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 I2C controllers.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 421563bf576c..72ae2e01cf22 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -41,6 +41,10 @@ properties:
>                 - mediatek,mt6797-i2c
>                 - mediatek,mt7623-i2c
>             - const: mediatek,mt6577-i2c
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-i2c
> +          - const: mediatek,mt8168-i2c
>         - items:
>             - enum:
>                 - mediatek,mt8195-i2c
> 

