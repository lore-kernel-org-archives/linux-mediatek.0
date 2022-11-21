Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCC7C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLhvLLxdnr82yFgkcTDUhrmPJ/2i+VJZ5fXC3LePZUI=; b=NiDeOOmPPjfNTo
	ZOzOynzcTflpC630vcoDpREdk+HRfAP+tOL130rsvCJF+vfEO3lBHbdToFU310tynaP0ZR4SQVwym
	FtZMV6a/nCT/r06X4msw2kFMozmb7OX8KJIq5+bEZ6LZUuwYZcI7+t8bS+27qfCClwxlk7CPLys+m
	BopQI6G2K2O4Cuz0xRzVhVH9/b7PAOVC1PAvb2FTJjoyqeD+96Iwx6ISNozCXYMzet4Hksw2NQWoU
	eAHEHdaLzLRwnjj6Mou7fr14q9UMcI6189ZgWIRFQly/mkuBpjM2AxHYmwwSxYtm+frOBlFjSh9x4
	whdYqhygW9m82pXuaI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAEG-00G8vi-IQ; Mon, 21 Nov 2022 17:05:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAEE-00G8qS-6x; Mon, 21 Nov 2022 17:05:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so9481551wmi.3;
        Mon, 21 Nov 2022 09:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PLhvLLxdnr82yFgkcTDUhrmPJ/2i+VJZ5fXC3LePZUI=;
        b=gcABP5CoXN7ynrdgJn1f4C4bB7+xxVA/eSyGbcs3RWFf/rp0Rjfau7KV0Jpg1/Aa9Z
         SxJAcOcIL3CKcI9sQOk4/lsN09MhXCSkLT2fz/LlzK3BSU0vzdQn9e+hosHVqEsIXbeZ
         FxbHCOPsEp7kXVLkrGq6fzl3wwyW76s0gjTN1NnV8xRLKUfvlfogAKrJ5IkdBWOSYwnG
         zfPhsv2CYFcbpXegykj6P9p15t7KcwdchTdcglmhQMfZLbFQ/E49IeB5kBr+ShCZAey1
         sciCIOvUUMwRLtBqx5diwGlWHcRAKVhN+ikOMOcFxrSvuw5XBpBWcpz6fc3OtNB0I0+w
         bv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PLhvLLxdnr82yFgkcTDUhrmPJ/2i+VJZ5fXC3LePZUI=;
        b=ixpIXS1CmhOkq5NHzBfqUWw8IdDRUdJEKbWHHFdQG+GCRUk1BvKzNq6V2OGZOba6by
         OPn2JtkfkUReQ5BJd66glGqX33CTXgJDtpaUnuwBpkEXflpK56Iq9W7HWFV0Mxqs1bw9
         AAkkTzSEYM5S76oi6jOVb29z+UyBEpR3JxQ5+Aae5BMhwZNMrEqhmdBeo9rJ9TYwTRnj
         mscSEQYyFbr21NLSyVhIsdh79cBXxIGD/V7NYMy5ghxzEkMvnwY18+SbRGdHd54DT22S
         1X9hixg3orfudodV9Ie6wrMJvPhpuRuBLTYXXR9c1q6MXY0F6LApjxZNgOPURmxb1RCW
         70uA==
X-Gm-Message-State: ANoB5pksX1pXc6A1Wlj8dtUdUhqoc96fJ0Fhp944AhDxwVYFs7Vz6Nfw
	AJ2RvSq+FUiszH7UfW6IYIM=
X-Google-Smtp-Source: AA0mqf7jXBGPovWHgEF0yL5d09f1cRbLRadoicFFPQ5P6vSaIEjcofGj5md04kELqxA0my3TLDwuQA==
X-Received: by 2002:a1c:7318:0:b0:3cf:cb16:f24a with SMTP id d24-20020a1c7318000000b003cfcb16f24amr16687766wmb.182.1669050295782;
        Mon, 21 Nov 2022 09:04:55 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b003c6f1732f65sm21161090wmp.38.2022.11.21.09.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:04:54 -0800 (PST)
Message-ID: <a002bf30-2f39-48a7-d339-bc4740e9e2d8@gmail.com>
Date: Mon, 21 Nov 2022 18:04:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 02/11] dt-bindings: phy: mediatek,tphy: add support for
 mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221118190126.100895-1-linux@fw-web.de>
 <20221118190126.100895-3-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221118190126.100895-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_090506_285359_FEAD6EF7 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/11/2022 20:01, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7986.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index 5613cc5106e3..230a17f24966 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -79,6 +79,7 @@ properties:
>             - enum:
>                 - mediatek,mt2712-tphy
>                 - mediatek,mt7629-tphy
> +              - mediatek,mt7986-tphy
>                 - mediatek,mt8183-tphy
>                 - mediatek,mt8186-tphy
>                 - mediatek,mt8192-tphy

