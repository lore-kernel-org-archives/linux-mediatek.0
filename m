Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E5DC32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 08:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yc8eh2ppDZZcDWiITniWISunAPkC/g7sS7I8UZwuluQ=; b=KY0ELEqxdcZ5x1QqV1irUzXIJJ
	5G9U17hB7PGARxSQtMl/JWF7kgjZ8+zgwy+7bdZIi/XV941/yuOcA/drhKqOfsV0PIzEiqPx7HleE
	hbbE1kCwd4zVsoLkSHM8ML8ZHKMaviAabTvPgBnpvjlRwS4MeDHM6ZOinQeZy0q+4iLj9DCogKC/q
	m6ucKog7OTyCwTldu0PLoT+qUIBfvMNxvVTp4ILcwzZFFch5XEFk9ObO6gNEcMUvdLIDgfKLfmmSj
	8Zz5ExaNGfEYh0pFWj6K5KfGl0fNfUE3kuVqV5ImigWJS7Ca34VLDgUtZy5H0tKtyOIWB9MMYeh9v
	qowIFT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjVT-003BA5-UQ; Mon, 26 Sep 2022 08:30:27 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjVN-003B6v-CU
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 08:30:26 +0000
Received: by mail-lf1-x133.google.com with SMTP id o2so9613502lfc.10
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 01:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yc8eh2ppDZZcDWiITniWISunAPkC/g7sS7I8UZwuluQ=;
        b=zpbdWAHHJu56K2xc8KOgyLKSj8qOfxEsKQI+kac9U7+4w9tMwjeWo4o35q4Vk0jxWu
         FbJYxVRWgJkVtwq7T9/9mqc1ibZvXSE1BL9vhvk5ihjtffFKmoXmuIqq/DlEBoAdq/39
         +zsmubOMQvjhn0p6cN8frRKED8F5R883zIGZwHlfXZXzppVxgvS/L6PP1kj9bdCb53Nh
         l39isR4HHmGCNScNZfJM62TvFV1TD4e3sbDCUruQ8nZWFIfbLRM+7U4L40mrwtkPAl6b
         7qOuFZALtHXONa4Sa7O3R2cd/FPqeYwrv3nkNli9Y+F264fTFvWPpN+uGQ0xdh8ilANV
         Bn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yc8eh2ppDZZcDWiITniWISunAPkC/g7sS7I8UZwuluQ=;
        b=I2c308jo3AP6jqVbZdaUuGYVWcHzZ3RhPk12aLOsy7OZai02cx6Z6HUpIhPcvMQ8oz
         QaXCkkYrXWAWy44BcrKBMLFpM/YfT532sc/7SI3TYDom6d9pw0jF1qOl/G4j+t5ATWx+
         b5sSpXY2sbHGrOyMU0wUbtRYf8ZcYXcVzU7EtRluE0NQz0UOaItQ0fRaMZHn1g6OmrHj
         dE9GNfdGXzC+mNJDR+gDZN08+yuYMhik+gh2V+iUfCcdgrLBupYHiClWiZ3/Y8avwKBW
         7SZTcum8KR9xKlOwBcQx15lYXEmnVzr8jKmObvfqyM9trZea5bloIPrePtbV/Xkzg7gO
         WQ5g==
X-Gm-Message-State: ACrzQf10ZXc+G+W2QgC/VWeqSMWgc8E7uNfP53hdmQEmdytliydCIfQx
	PSdyIEa30tiHbJ2yWnHhLqdWgQ==
X-Google-Smtp-Source: AMsMyM4Lzz4cmKCm4wv5NBgqln7unwSID9Ng2e832jbMYlUh2kXSCavmOuKZy9aDB1F8rZiWx8s8sg==
X-Received: by 2002:a05:6512:1315:b0:492:cbc8:e10d with SMTP id x21-20020a056512131500b00492cbc8e10dmr7972243lfu.41.1664181019045;
        Mon, 26 Sep 2022 01:30:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm2292842ljd.30.2022.09.26.01.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:30:18 -0700 (PDT)
Message-ID: <263a2ca5-089e-3ca5-7eea-f09c542d0e7b@linaro.org>
Date: Mon, 26 Sep 2022 10:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: phy: Add compatible for Mediatek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunfeng.yun@mediatek.com, kishon@ti.com,
 vkoul@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1664180045-19095-1-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1664180045-19095-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_013021_461685_C81FE234 
X-CRM114-Status: UNSURE (   7.44  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26/09/2022 10:14, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi-phy for MediaTek MT8188 SoC.
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


