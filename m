Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12460C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HF+73ogBzWs8DDzLDd+FEDAjvGpR1m7S0//62sPrjlY=; b=gDhFXHzn8J33TE
	dK90I6uO+Zqp/70D6nfLywuDPWL6lgv6WbURitybKhGzPqB0l3wf8hnHLdf03IF7NanC0Q1dfNnLC
	Z5Y2/FTfhUpJ+mubMwnO1XuY8h73HAKsedPwVWE0HOnKNazKIk1HdYF7VhwGc58qgX7etGSpJI9Ul
	LCKCwN+aIkkXSXmPsw0cdkcG21u/oHSl8ZWQixhLbsHz9sdx4vTM2BknIRfvAaEwkshBbzcQ48tDE
	vTQHkTO0BarrgTgmAhNikTKBm7JWmL1GV795dH81UIhZ8vbBlN7IotvFoJ3UX15283nru2JA82DRB
	8SRCi42MitHgw3TOYY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAEW-00G91r-51; Mon, 21 Nov 2022 17:05:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAEJ-00G8ta-82; Mon, 21 Nov 2022 17:05:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id i12so16953264wrb.0;
        Mon, 21 Nov 2022 09:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HF+73ogBzWs8DDzLDd+FEDAjvGpR1m7S0//62sPrjlY=;
        b=OUJgA3S2aZb+ri5c3O7yA7l0Mjtqeek0zbSx7dMRR9INwoh3Bdflde+TnimyTyAlMD
         GB0XTN4B0TSg02dFqLy+Bp7sWpzaIOk5Ys6kcO9S/8/zHbsy7Bbp29MtAS1y40+mtp1Y
         7QZmQEXPIZpRD7fp9zHn9nBbcbqXXZ/XKmk9xl4OIC/50zW5eCJNgtHTZeXtx1XJwWg4
         X2NTGKcUqNZxWvvXSuSELljBI0zh7LxkYWCJQTuVe5HqLkj5J90eobBQkI3bnXbq8n4k
         0xlDf2RO2QbztOGNtjdjjzxhJ6yaZkglY+Bp2tiKlZliK19Vj2EDwLqTlmGIN/oFGPzy
         IR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HF+73ogBzWs8DDzLDd+FEDAjvGpR1m7S0//62sPrjlY=;
        b=6Fd+EvGZU5yCWKWRYdvfvtoMMf0CkYdeg2OejEVbAZVxtaAU12kVji6ipMN4TSd6ul
         upmPlsgL2bJvmUU3+t1GhnvuZtmtjjQ6zvThOa1PjMraycr3UlPcmKi7l9cdDW8WBPWk
         f/vSLk8DoB0eWFHgJT23S193MoEpZ/7FWMFzvntC75Ws3S3vCj1LWl+fYwlvZnyXXtvq
         WvuF8MMWEIj2tuOIVwe8IIBrBxNgThZ9MxDIKnjeInuK/Yy0C3bPsNt3mgOD+RquvPk7
         yWVGK0MfRFkYC75YrpGpPC0VKNVp43+ObTqtMXtenPHckQihF1+v/5hicx1jscU3gSfw
         ScLQ==
X-Gm-Message-State: ANoB5pnOH59Wwxle6uM6yNgAaGdnpKEaov/f5SxKLa4zDaOBi/mx+LbN
	5qY/bxFU+CPKe/CusV/NNKM=
X-Google-Smtp-Source: AA0mqf53nBW4skLAA48WXUrRkzCcN0nS6afComO+HSp5ZD0DW3QxL/O4VQJJ/fjiaY6TMjLwbNDEDw==
X-Received: by 2002:a05:6000:910:b0:236:56a9:65cc with SMTP id bz16-20020a056000091000b0023656a965ccmr11771192wrb.563.1669050302593;
        Mon, 21 Nov 2022 09:05:02 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y15-20020a1c4b0f000000b003cf7292c553sm14233688wma.13.2022.11.21.09.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:05:01 -0800 (PST)
Message-ID: <df18d619-1914-6dcf-a0be-647ed8cd703b@gmail.com>
Date: Mon, 21 Nov 2022 18:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 03/11] dt-bindings: usb: mtk-xhci: add support for
 mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221118190126.100895-1-linux@fw-web.de>
 <20221118190126.100895-4-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221118190126.100895-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_090511_374683_2BA408EE 
X-CRM114-Status: GOOD (  12.87  )
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
>   Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 939623867a64..a3c37944c630 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -28,6 +28,7 @@ properties:
>             - mediatek,mt7622-xhci
>             - mediatek,mt7623-xhci
>             - mediatek,mt7629-xhci
> +          - mediatek,mt7986-xhci
>             - mediatek,mt8173-xhci
>             - mediatek,mt8183-xhci
>             - mediatek,mt8186-xhci

