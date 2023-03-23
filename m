Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F40AC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFjdhGVAVLmJfJbsLJg+MW5XxCNPSaPcqy98LHLK7ZA=; b=nbff9/nb6/NirH/vEN5Fa5swUM
	MTGaf5xaxEZ6dwVUhFLIm4t5A2XvZymg0ZPpZBRO7+foRjxqqLH2MWHTlJmBshNyza7DevUGdUF6n
	ICXv90B2dwnFQvckUE8c7+ad021hFlVLgZqtIfc8KBAUOOgEyI7RBGOjK3DpQ/k+nuqhU3LH90G5w
	vakGkbJmH9CWGZABSjLoVuvy0+jIFOrspvxMpVN+slipqR39//EUikaC7MOcqTnoSAajlU7hMutqw
	Ap6+D9cByC55Rc4Z966LwJG2AHqJDwlZcnuWiILb+xAEf8z/WXTCcOgs0U2AUsvlvL9eHDCpYB/e0
	uaHoE8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFRH-0016s7-11;
	Thu, 23 Mar 2023 07:32:47 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFRE-0016pb-14
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Mar 2023 07:32:45 +0000
Received: by mail-ed1-x535.google.com with SMTP id eg48so82520397edb.13
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Mar 2023 00:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679556760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFjdhGVAVLmJfJbsLJg+MW5XxCNPSaPcqy98LHLK7ZA=;
        b=Qs1Qji3UzVhAmRyICBZM7AUUwfUec3hvzWeWsVmRWN47ioJozTpJZg4G/C6yy/KfYs
         faoMBCAQXI6CMN4Rle2lVxdoM+7MUI2H3lbWyjOdLf5OMEK7OL7/DHKXqR7sSyuJIpJF
         k60P/Dy5KiWC15xPc68Zf8tDFwD6ISVJ+IO/N0Z3BTM0UfBoCTrsNNZwGkbhUYXfid0L
         YMuZbMMk91j+Ng8dOpc0PeDLsb/oYuwkU+/VAWPPk0nqP5RnMX9I26u14hSHsfeoaDkg
         2E1ajJ5kOdct7OeBlX/8f703PXW2wDrQEaGXUCyualhaAafWTFwrf2AT9rzFct6Fwodu
         wi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679556760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFjdhGVAVLmJfJbsLJg+MW5XxCNPSaPcqy98LHLK7ZA=;
        b=fqM7R9kyJt1CNLgix6u7O+GO8DtmvtWD0IhfIgLH8s7eLTeqJN0BOHwAx1+TZ90M7a
         ZTsgOPlxp25Fw/e2hy6Wpi5T33FZJLYGCrugMjLP1a3mfOGrNExhCcoYV+ahiB06DfCi
         3ckJC384W3mtqbLcwkkVxLsP51dEI01xPGtC5hGQCypVHHJSzENt9eXyBHqEZPH0xP/P
         k7oQpH/4fZhqhWXr7TUIR/hcJgic4IE44xVFrxPmbtIB/usiHNalsjtPvl6JscmYXCu2
         EakMxt1x4DXv22Nr6xk2vCYgVAE/gpTy3CaCcbft0xiJkM59ZI6bAgxipE451UDnp1dm
         BSHw==
X-Gm-Message-State: AO0yUKXu23XusCcH038Q40XzLFKLmDi3R185YWDgn/ET9pXYG8lEcrqL
	NouNVeqYOdfYCSp1w6d2yCVnHA==
X-Google-Smtp-Source: AK7set9pJbJnwcfSZN0TWiCnaqZcp1FZoWDB0fQIp2VGCLFec6jWw3j1RyKtbIhjTH3JMu1dRWjSBg==
X-Received: by 2002:a17:907:d410:b0:930:af80:5b9b with SMTP id vi16-20020a170907d41000b00930af805b9bmr11459345ejc.1.1679556760757;
        Thu, 23 Mar 2023 00:32:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id m20-20020a170906259400b0092b8c1f41ebsm8207595ejb.24.2023.03.23.00.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 00:32:40 -0700 (PDT)
Message-ID: <48aac8ec-f7f9-1ea2-7b98-1172c04edf47@linaro.org>
Date: Thu, 23 Mar 2023 08:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: arm/soc: mediatek: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230322173501.3970991-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173501.3970991-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_003244_372173_D9C7208F 
X-CRM114-Status: UNSURE (   8.45  )
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

On 22/03/2023 18:34, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


