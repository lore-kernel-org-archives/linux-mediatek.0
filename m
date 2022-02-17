Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B28C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReivR/9c5UyV3dylzJZuPZGKSvEFWQ4lyHMqRS8bC1w=; b=z4I4IrMTCQ9N27
	3R4F6wv32UbET9YV1I1C0LhSoz5NCrxGuHS/wDcEjXMFDiW6NLVFuUHmTANGIJCrMNsq+lWICUjjZ
	lBkqLD82lWo9u/5iFI+9iobVqisBsqsfxwPMIM9pryWnaf2LiLja748+1FGH39Q+0xx7cvN18AIPy
	PN7zfbo4tLJJKEqDCOX1sZBSl6YsCZKTxrhFPBiW5fdEdYdaxLjYXLpOBr7jGu0QV/sfuKpEI8F1e
	udG5KG/Pg2ii4zYvGPL4zsdHK4kyFb7vkAjlQzshimkXWR4aMi387qkQkj/0FsdQRkjOEYhDNaB1r
	GxCFc05nXeTDY6pmjy1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKdVK-009nOC-N0; Thu, 17 Feb 2022 09:55:14 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKdVI-009nN7-6q
 for linux-mediatek@lists.infradead.org; Thu, 17 Feb 2022 09:55:13 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 64FF540934
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Feb 2022 09:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645091710;
 bh=xqg/Xc9CYuc87DkKuqIherW4tETRFmrI7ZElb+EIvLo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=GAORvpRRPrf+vkRusRc1QHGiTjSY2YIwdOg8Bx25a6357VBpJ15+MWJvxnX5f6smz
 f0i31p/nEyEfIjWxcH27J4JRq0G0VV2hPYzJKXe1Z6COWXZw2OxuX9ZD0d+VN624xH
 /03upjP8G+6lJmg7nosEzLz6V+5bpYXqh4KEujTg57bEwIvShqcikNS1Bk/xrZ42W9
 619hfaDTKYO9RoTFKUJPeC3PgEyF8AFRUiG+msaImy6JGXNRZxCU3kHNnjDtly4/Lk
 m4BGkHUPTf26rlDQuQ7TV+8w67/vT5WqtVG0/SgOF1nA0rG0hxiMSslGqviPcD5J+s
 A9A7s37j/kNsQ==
Received: by mail-ej1-f70.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso1250203eje.20
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Feb 2022 01:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xqg/Xc9CYuc87DkKuqIherW4tETRFmrI7ZElb+EIvLo=;
 b=W28gUvE017ukW44BbrUNxlnECiE4Tdb2BFi1MQYvTNGwLCQzAs+AKBGKYBpVVlnxnB
 17GaOAGKxRiM6x7uoRJM8q0COWA0owxP/cQ3WvuySakPwmfeYLjNfv8TUyeaZynMfamS
 lcDpUlVB6ICB9Hp0qYQ19sQSuOSijfKVnUP9kRHq8mt4tYlLmhUf/TLFtMdOxsPlbJt9
 mn6qar/sX3h2L9Tas3YRsMA8F2X15nkSZ+iIIlHEqiaS8l9VmM9cHAa07lGj9LQrGGK5
 uU82Vo0vufg1BiRlsdYOi2HjUUf717YuhzQ7ll27A652x9kDomvn/TslK/S7QdGh3bwb
 Ia3A==
X-Gm-Message-State: AOAM530dRvseVsGosOzywOxLVp6e1Yd0Zcm2IY4pAdKD/0ch5iCTmqPI
 GLb1D0XNdnv0P32j1gp13iWmdJG8Q5Uftt85Aly/gFsi9Ejpb5ccyfBo2WW8yJYhfa7pi9t5yEb
 OXduqnC6a2h02BxvwyYmlgARUCyul/5mex0sUIlLC8kkggyxonw==
X-Received: by 2002:a05:6402:1d51:b0:412:86c3:7580 with SMTP id
 dz17-20020a0564021d5100b0041286c37580mr1702424edb.353.1645091709972; 
 Thu, 17 Feb 2022 01:55:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVqiLRT5dbOU5Ly6LY4l8kChFX+8DIMSGvlA48+vjFgCFmMOBcgpltkyZQ5jhMw4Nm2YxMLw==
X-Received: by 2002:a05:6402:1d51:b0:412:86c3:7580 with SMTP id
 dz17-20020a0564021d5100b0041286c37580mr1702390edb.353.1645091709625; 
 Thu, 17 Feb 2022 01:55:09 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id 1sm964379ejm.186.2022.02.17.01.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 01:55:08 -0800 (PST)
Message-ID: <535d7d37-c2c5-d0e9-85af-ae91cbccd0d2@canonical.com>
Date: Thu, 17 Feb 2022 10:55:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] dt-bindings: dma: Convert mtk-uart-apdma to DT schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 vkoul@kernel.org
Cc: robh+dt@kernel.org, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 long.cheng@mediatek.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220217095242.13761-1-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220217095242.13761-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_015512_391896_EA05BDBE 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On 17/02/2022 10:52, AngeloGioacchino Del Regno wrote:
> Convert the MediaTek UART APDMA Controller binding to DT schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v3: Removed anyOf condition
> v2: Fixed interrupt maxItems to 16, added interrupts/reg maxItems constraint
>     to 8 when the dma-requests property is not present
> 

Awesome, thanks!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
