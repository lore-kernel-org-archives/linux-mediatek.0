Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51248C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q18/Ed4T8GStZk15GEcB47v5vCjiaTS4iyhypSPJu1c=; b=TiHbEGeBajF8J3QKQS9961sujd
	EjPoXCc9B3aSxGAiWp21Qsgvjf9jn0zrahKLaeI9a+/Z7VNIppA2RnWw07Mhe9IXT0U8UwvtEPSSk
	WfJHUWstzrQQjjp918uWJ/Dbyuw9Y8FAp6dymSaVFqBeVkKwLJrGiuxKAw/X41M/Y8CKQHgt9wrk0
	40T4xZ8PPV3aICnNXJ+BMyzhniPw9QH7ZNP4dZkmU7nSASBpc6OyLZfQmN99KPWVMxqgX9Xldhj+F
	x21KWqF86REwlgGRlHUgVPp6TSpwSCzW2N5UctEnw29G4qqB4dxkUfT61OEpY7kwnmzu5j4scVGmC
	mreticmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pND0G-00C0TL-Qh; Wed, 01 Feb 2023 13:18:20 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pND06-00C0LA-4P; Wed, 01 Feb 2023 13:18:11 +0000
Received: by mail-ej1-x62a.google.com with SMTP id dr8so29734417ejc.12;
        Wed, 01 Feb 2023 05:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q18/Ed4T8GStZk15GEcB47v5vCjiaTS4iyhypSPJu1c=;
        b=JmXFrwpatuTq3LWhLPd7SSN+VgTLrGv+Pu0GTsto+GV3gVuqhNQzDP0DAYx8jkcH7H
         9uYGH4EqNmL7p8U28TW3R6zVUxJy38aQjFuUn3fo35iHwDM160C47Lz/2jdw8eN/cERU
         USFpn+VWil/vlRk99jIox78vAyUngLoi9nzE3q7N1tdxjsa5Xk7jl6ehiqsfFzj+cumV
         mit4XvpMf/fXrIAv5/bCFI3Av7S25h9AbQ+64EEG3a8zJlpt17StKkBFvBV3ee+UyPvd
         /pA8a2JjvkSZKdXerzJ9n2CGPmK1gF0wovbttM4oKYkA9LD94QarxUF8OWnpGCY/nK5a
         +ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q18/Ed4T8GStZk15GEcB47v5vCjiaTS4iyhypSPJu1c=;
        b=kwnefQq3ZuP7Fo6ENF4Gz/hWHwpmxhhUye0hpOKePqp9UD6Ai5WfqEzU0ruleWm3by
         bH69EkJ75YEN4OMH9iRA0E4mKwBmf/yrs2I35OmpGsPFjqOI3NLJeNJThKsfB5M4jKbP
         Kb1WjksB4fIiIk4tdbSs9OEgBWij4460qdKP8tKdhCAY5/rD9ViBSY4zNFDJboljpKhK
         PenGcXLRkiEadQEDJR5V1LmAniknh1M6e24+iK3M6d1zNArq9ZBBpJoRQ025s4ixjL3b
         fvCQNwKUMdvOqzSjwIM4Mz+oD1LmIuABPCatfLQQtJ9+jjGf15O0q0f/0U0J9ff/XbXc
         Cy8w==
X-Gm-Message-State: AO0yUKVv640WIQ8ENCrgcX3/2xvqtRzlwlMEjxxYTYmapFYIGo+i05yi
	irMu01FV2p/lHDgxVknLq1I=
X-Google-Smtp-Source: AK7set9lneu1cp3XEMIAG3dTmb/E4Cbk7JJqwigXvxQL2oOBvz03WVsu3DzW8iGx9S4B1h+zd2Mcrw==
X-Received: by 2002:a17:906:c2d3:b0:7c1:1e5a:ed10 with SMTP id ch19-20020a170906c2d300b007c11e5aed10mr2260655ejb.8.1675257464189;
        Wed, 01 Feb 2023 05:17:44 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z16-20020a170906435000b007b935641971sm9946719ejm.5.2023.02.01.05.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 05:17:43 -0800 (PST)
Message-ID: <8b9e509c-2ff8-7948-17a8-54c2d98713cb@gmail.com>
Date: Wed, 1 Feb 2023 14:17:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5] arm64: dts: mt8173-elm: Switch to SMC watchdog
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Evan Benn <evanbenn@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220729053254.220585-1-treapking@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220729053254.220585-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_051810_207509_532EF686 
X-CRM114-Status: GOOD (  19.01  )
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



On 29/07/2022 07:32, Pin-yen Lin wrote:
> Switch to SMC watchdog because we need direct control of HW watchdog
> registers from kernel. The corresponding firmware was uploaded in
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Applied, sorry for the delay!

Matthias

> ---
> 
> Changes in v5:
> - Remove redundant new line.
> 
> Changes in v4:
> - Rename the watchdog node (smc_watchdog -> watchdog)
> - Correct the patch summary (mt8173-oak -> mt8173-elm)
> 
> Changes in v3:
> - Remove /delete-node/ and create a new node for SMC watchdog.
> 
> Changes in v2:
> - Move the modifications to mt8173-elm.dtsi and add some comments.
> 
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index e21feb85d822..abe3140cfcc6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -161,6 +161,18 @@ hdmi_connector_in: endpoint {
>   			};
>   		};
>   	};
> +
> +	watchdog {
> +		compatible = "arm,smc-wdt";
> +	};
> +};
> +
> +/*
> + * Disable the original MMIO watch dog and switch to the SMC watchdog, which
> + * operates on the same MMIO.
> + */
> +&watchdog {
> +	status = "disabled";
>   };
>   
>   &mfg_async {

