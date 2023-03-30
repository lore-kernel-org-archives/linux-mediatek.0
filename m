Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B300C761AF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gv8JVciuDxQ0wesT323VY8sddT9TR9dSupeai1kGABw=; b=nM+ZriR6liQ0PXDcua6ko45rtT
	s/DvJTY2m4mxQrjGpD2xIcvnZjsoPKtQWh9dV5SI4x5pB0CAJVt4Sd8aQi5i2vwN/HT9shn7MJb7/
	sSq3Mtv5jz7kT8LouuTkMCikCtUdQX1fArfmLnogJLgsZdYtRanevdk1CQEX5nSdbdyqW/gCqx8MW
	T6ZAv/lzOb54xEtESysH0ai1pMgbK4JijowGpVGqprj9NuUSmGIkD9uP3JuNZ5z5laCxZqeC3h3GR
	PDd03nPCTKMDpnH5F33U2oePYqoYcdspCQeI/9A7px8P4CSgIxjBxgzmA3PltvLKwCPA2svNHcPhv
	T58hVT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmko-002txx-1t;
	Thu, 30 Mar 2023 07:31:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phmkm-002tvF-04
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Mar 2023 07:31:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso2966770wmo.0
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Mar 2023 00:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680161480;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gv8JVciuDxQ0wesT323VY8sddT9TR9dSupeai1kGABw=;
        b=zSozlUjEPWi4/jPhKpPD0C6ryndKS450YaiCkk5K6zfzdIkAgtnLWUJuqip8reAA+G
         m8KkCUhyj8NceK3K4vNBbB3vCjptyYz0hDyaYEQk/BGeBbu9xzDi3teEqOZLy2Os7Gtk
         0DJcwLVFAacIyewhxbY2yA6qQ7BpDyJFnav0KjjJYRDzBOyynQV4MZO8ndEnlquJQtmp
         uqab2pc6lcF0XsEH7nwODf8J2bSQnKOyKpECAkVtxh3eArxE9o9iXaeK1CzBkDLakEzV
         u3dkqQKfLey/rKeaXjTYhziIsNYZ//fq7v7pSZN1tfvFHNbqcgU06PUaSU7olCpsiWfD
         u1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680161480;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gv8JVciuDxQ0wesT323VY8sddT9TR9dSupeai1kGABw=;
        b=P2jE+Pa+3jug5oNQ9naL2KBX/cMiyygtq3CWoWeRPgMrSUbCa+ajYzXx0qy2TVbOjJ
         4VjptC3mL+bZzHpnCAOeR3BdXYduQtWzz3rKZtAXuL71gAtQ1WKkt2bjavtTs6nDO7Qn
         eBXucA+gGS8L8hDEQUX+HbumnQOKkr+fVQos+2UkD4wccCgsq0FC/fmi8hfipLaZxnBS
         U7CCOsTJ8GVoCKQ+tmztxTzbfU2TcyQ+EuNGhJJAVYZIF4hSZLksucpd2LmwkcTuPzTH
         jfDdrF6YYbKJuss5ZfiPMYOJuKzFnGk8iRa9nxJVRfD4aYMfW03lgz3qHu4oSPfdr/Ml
         U9PA==
X-Gm-Message-State: AO0yUKVO9tPv1FjmM50+GAROifxlGUbV8b96tMvL2S94B1orymlLuQ/y
	zZj/4WJTvKcJAmPWzv2VsBympg==
X-Google-Smtp-Source: AK7set/8syKQO2oLKnczLLSt+e88iWzGJM51xpz2K8yppyOXjZwYcbmpU/VbsF2MocQQGOy4acHhtg==
X-Received: by 2002:a1c:7516:0:b0:3ef:3ce6:7c69 with SMTP id o22-20020a1c7516000000b003ef3ce67c69mr16845825wmc.8.1680161480232;
        Thu, 30 Mar 2023 00:31:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f? ([2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f])
        by smtp.gmail.com with ESMTPSA id l10-20020a1ced0a000000b003ee1acdb036sm4833807wmh.17.2023.03.30.00.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:31:19 -0700 (PDT)
Message-ID: <c63d6fb5-fcc4-3370-7b4b-f46846136d19@linaro.org>
Date: Thu, 30 Mar 2023 09:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: rng: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230327170153.4105594-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230327170153.4105594-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_003124_056021_DCBC6B3D 
X-CRM114-Status: UNSURE (   9.94  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27/03/2023 19:01, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 4 ++--

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml | 4 ++--
>   Documentation/devicetree/bindings/rng/mtk-rng.yaml           | 4 ++--
>   Documentation/devicetree/bindings/rng/ti,keystone-rng.yaml   | 2 +-
>   4 files changed, 7 insertions(+), 7 deletions(-)
> 

<snip>


