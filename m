Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04222C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My8aHx62G4PVWoCSRnX4jTy0TXnCzM6wwrdyv/Uk+ro=; b=gzMXb5iQNl7+IstkVPa2vHGUpI
	+MEGyiqzc037bROK4MY+cYHke6OFegqRESmcy09SpITq0aHUluzY1p64J5t10U2+P2gbM0C57xqWK
	PbZ0YmkJhKFSHq6m49PBWWzQZhAIvYoHyjReJYZLOKLFys6KgAj1Jhm+0E05idSmG570Qr9izGSZA
	A6L17aLx7Eo5cW55cXROUo399IwTZjZRevpQfU7V53SNmxo1MJxDG/00uibiPp7vGZ9rL3I5/CB4S
	hwa1/SDceK5W6roc03XbNPTFIc/qrH5uEZKyvdWboHSE89ZNfRSQLJOJ9k35ztLN3LLy37Bi8Eq2B
	JvPKO5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68kV-00EPt1-RE; Fri, 16 Dec 2022 11:19:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68kS-00EPqM-S9; Fri, 16 Dec 2022 11:19:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id a17so994120wrt.11;
        Fri, 16 Dec 2022 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=My8aHx62G4PVWoCSRnX4jTy0TXnCzM6wwrdyv/Uk+ro=;
        b=CoGWAaBk3rrs7FoMpj4BRthumWNKxG7U8nWWbtuPsg3sfMIRlCqQJTAUoIKmT9slxs
         ameuFgnccTJBYodXKtMeBKw4s+YpeCw09yTcgJcDW+8Z/OXBJApr84gNZPrLnJGWawEc
         sclV1oAAUh7m5u0X6WTVsCMxKFvKW1Yivlgkn77yCqanvrQDn0NH+D9Sl9nj3vwFCMVR
         SN2bbWBJBdM9OV+h0foPWfEtqx1FRddVnC/qwgTDfLbaowMBOJ0eO8djQyAqzzblCncO
         +NiU+pHpsdhfThAIuse7xTN4kWfSISoDaQIdMC6wMjLz8C8+k8JoDc1l+jbD46iKhos6
         0PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=My8aHx62G4PVWoCSRnX4jTy0TXnCzM6wwrdyv/Uk+ro=;
        b=6E6VPbad6dds5bPAry6mYgg0jit6F45HgUbjeJ8FEDusd/VJin7SE1XzoN+pTP2Vyg
         DGTC0x+xd7z108cXbuhDoFCoJj/ty+gWM3lUHcPU70RUvxVcbxon149jGbCMcWu4I5zw
         pLLKpLcjd0hsq+08a0bnJ3eHd+4wNvmpHg0V+6bQxULDJgarbAkhf+zZq/HejK1sMWYm
         ZqsOvJ29x3pDgRzdvDdiIWnLWG7Xu2Z/z/1gcljaU2ZHeruXX/YyDGljA5xrtaAHMfYI
         ksfD0SCNrnJct558oRfu6guEp+Zzt/ewu8g3WzNWgPSLnwVoVV7YFZxLZoDggCztw9ua
         jumA==
X-Gm-Message-State: ANoB5pmBp4m3Hni/XUujIq/eLwwJkK6s9EmVnZ2jP6KfjbSETqzpvvIa
	L2M5G3ocWJkmsXFpu25MfJY=
X-Google-Smtp-Source: AA0mqf6FKkSeIrjm/bY5RymEDP7r7g2Cp/xUOFjN0g7joFhg3HnQcgDfVnSp98htIaDAF9Gt9VZ/jw==
X-Received: by 2002:adf:ea8f:0:b0:242:70f1:2134 with SMTP id s15-20020adfea8f000000b0024270f12134mr28573974wrm.60.1671189566058;
        Fri, 16 Dec 2022 03:19:26 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id d7-20020a5d5387000000b00241e4bff85asm1965790wrv.100.2022.12.16.03.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:19:25 -0800 (PST)
Message-ID: <3c2eacc7-79d3-b961-a472-34938f1d88db@gmail.com>
Date: Fri, 16 Dec 2022 12:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 2/7] dt-bindings: irq: mtk, sysirq: add support for
 mt8365
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 angelogioacchino.delregno@collabora.com, khilman@baylibre.com
References: <20221213234346.2868828-1-bero@baylibre.com>
 <20221213234346.2868828-3-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221213234346.2868828-3-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_031928_939967_89B5CB91 
X-CRM114-Status: GOOD (  13.51  )
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



On 14/12/2022 00:43, Bernhard Rosenkränzer wrote:
> Add binding documentation of mediatek,sysirq for mt8365 SoC.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> index 84ced3f4179b9..3ffc60184e445 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> @@ -25,6 +25,7 @@ Required properties:
>   	"mediatek,mt6577-sysirq": for MT6577
>   	"mediatek,mt2712-sysirq", "mediatek,mt6577-sysirq": for MT2712
>   	"mediatek,mt2701-sysirq", "mediatek,mt6577-sysirq": for MT2701
> +	"mediatek,mt8365-sysirq", "mediatek,mt6577-sysirq": for MT8365
>   - interrupt-controller : Identifies the node as an interrupt controller
>   - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
>   - reg: Physical base address of the intpol registers and length of memory

