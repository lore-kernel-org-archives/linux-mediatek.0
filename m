Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE1DC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0bIa8wyTi8rbAcSZxWhCurl6ZK0Xte2iA5Q836GnBQ=; b=m9dcSTX9NhzvxN
	yeWESmLYu1j+ACRb+CqRBFHIABxNQ1et0WUvDkZOsR1XthrmBTw8kW+/fibmsO0RGIGD17bCz4HhY
	cszwOuoT+jRjAT+yAfiOw8wa6pj5sdFKiwNF2+EZT9MbfkTDHZdnTMC/1XvYdPZ1S9Wy0LL4CMkgE
	GFCBiDBVuO+ogwgv6EjmKW9ehDOGp5bWvP7/rvxAkG6Oz78vC3O+Hiu3doY0uRywfNpo/Pd6uNw0k
	OGx4C8R7CNI8MQX8y50Ymx/YwuKWR1WfZLmI+5xRdoq128bqgUG2wwxSaI0nGZTLOz/pL6Mgn+3/V
	d/Sim0vqln2YZaxaExFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okoda-007lOx-8I; Tue, 18 Oct 2022 15:36:14 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okocX-007kUZ-3n
	for linux-mediatek@lists.infradead.org; Tue, 18 Oct 2022 15:35:11 +0000
Received: by mail-qt1-x835.google.com with SMTP id a24so9849317qto.10
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Oct 2022 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0bIa8wyTi8rbAcSZxWhCurl6ZK0Xte2iA5Q836GnBQ=;
        b=dKkNYSYmqsNvyoNglHA29uVahhFDihXll/UUBpziWBkT9xPuazvfnr71TBYlvqe9w8
         XSAikAIB4RkBfh3PZC9NoohzDSUNmPfj4KJoSMIcscWs88HWvGsG6078gw8PY/r++GFE
         xVGZaU/EtYOlFiDBoU0emIo7nr9/Skx0UUA2vZmegdCUpWOBdeZfFpuDiL0YHWYCD/OP
         t1rC7uijzyiN91/i+Gq4ObhWwjFL/GSyvYyuVU2S3c5aEJJgbLdXaUrWV0oVmbag8fdF
         OXeLLptMDmaw6Ty/AUdYhvLiPFQOXYLzgOCII09MUnXq4qYrUrvGq+GDt5DsUyL3A4CC
         jsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0bIa8wyTi8rbAcSZxWhCurl6ZK0Xte2iA5Q836GnBQ=;
        b=ES6fT7t7R2+hfB2oMUPWq77RNM94w2+FiY2RI/w3Bm7GpBfkOSWx9zXdPvjwdgIPcs
         5IVGsT6aEHo90UMdMnfD4Msp8aK+Ou+6LJ/nE6uFoXWMJToZT7aVXrhWAaVHdELPkcuq
         5rqSrIdtOQXijlX8uhI9/kVS/ZfgTrZXM/eZEt7MqelBk0Y6gb4WPbiGFHCS5FhLUDmJ
         ak3TPKzJde0nwlx/6r2f7I6wbzfiW1fW3pUot4/65cm6vmcBbsb8GTtzgno8VZ0gGWBr
         1mjarNUtQlCnJo6Ve0OI1yrYoo5/+XfibuKeK/tBVtGtrkmY44pIyaKDlOMLHDOK7kwf
         /xhA==
X-Gm-Message-State: ACrzQf1CJql3YL6CFME4kY3F4mWGPZMdNlbtUCUF/44BimthtJF7uzF0
	s/JCj7n2GYVpB75PWfxMelSm1Q==
X-Google-Smtp-Source: AMsMyM4FoTodLhR6r4cs+duQkTco0qem4q2FGg/JDNLCynJiZ54JLd68bW+8p2Tqy2nqvzgOS5r2qw==
X-Received: by 2002:ac8:5b56:0:b0:39c:db95:ac4 with SMTP id n22-20020ac85b56000000b0039cdb950ac4mr2538109qtw.299.1666107307125;
        Tue, 18 Oct 2022 08:35:07 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id k2-20020a05620a414200b006bba46e5eeasm2787991qko.37.2022.10.18.08.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 08:35:06 -0700 (PDT)
Message-ID: <684c5659-0691-6534-1602-6c0a53e6e503@linaro.org>
Date: Tue, 18 Oct 2022 11:35:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC v1 02/12] dt-bindings: PCI: mediatek-gen3: add support for
 mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221017104141.7338-1-linux@fw-web.de>
 <20221017104141.7338-3-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017104141.7338-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_083509_230489_502C84FA 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/10/2022 06:41, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7986.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> mt7986a.dtsi misses clock-names which are now required since support of
> MT8192/MT8188/MT8195. This change also introduces a 6th clock which is
> now needed for all pcie-gen3 dts.
> 
> i do not know how to map the clocks to the names...
> 
> mediatek-pcie-gen3.yaml:
> 
>   clock-names:
>     items:
>       - const: pl_250m
>       - const: tl_26m
>       - const: tl_96m
>       - const: tl_32k
>       - const: peri_26m
>       - enum:
>           - top_133m        # for MT8192
>           - peri_mem        # for MT8188/MT8195
> 
> mt7986a.dtsi:
> 
> 	clocks = <&infracfg CLK_INFRA_PCIE_SEL>,
> 		 <&infracfg CLK_INFRA_IPCIE_CK>,
> 		 <&infracfg CLK_INFRA_IPCIE_PIPE_CK>,
> 		 <&infracfg CLK_INFRA_IPCIER_CK>,
> 		 <&infracfg CLK_INFRA_IPCIEB_CK>;

Maybe the clock is not required on mt7986?

Anyway, for the bindings:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


