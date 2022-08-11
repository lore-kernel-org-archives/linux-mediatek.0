Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C5CC19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 10:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eslh2ICT1A2pYV00+C3KHTnl2CWed4tgcm8YDqRAs9U=; b=nqx9GwG9PK+CYqgVaPUruuwR+H
	czMvLpNal3KNnplN/kFWlk2Iq19N+AZy0gPbCYmguBBdwjiqALN0clJnsHpMJuV02nkfunFiyyLVe
	0nZa/Si5einU+BojxTyjfI54E1mB2dhh3MJUzXrjGYZ1XTEh5KxoH6L+GS3n8P9Er1VKpJkWOA7Tm
	EmbsrZp7qmzbblmeJ8rfW7ZTkyw90w7PGPXRUuSb2QuVK+ZP6ZwIUzG1WLR6SVmm/Ydefp6gJg2xQ
	zt0dwzhB1K+K3VgT+vC48miRh7dUyQBTrS4yEKLdy+cdZFG8ga2zEtKR4fHmwzybWIw3/kfsUx0fk
	DCx7oxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5gn-00BJhL-Kz; Thu, 11 Aug 2022 10:45:21 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5gb-00BJc6-TT
	for linux-mediatek@lists.infradead.org; Thu, 11 Aug 2022 10:45:11 +0000
Received: by mail-lj1-x235.google.com with SMTP id x9so15187280ljj.13
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Aug 2022 03:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=eslh2ICT1A2pYV00+C3KHTnl2CWed4tgcm8YDqRAs9U=;
        b=GqnLYktSFa5SwXk0/8vV6Z6fF55KrRJLLAny9/RxRKMgNQLH9cJeyQYeM9C8ItPACh
         rkLKgHS4OkUrUBB03XS4SXfK74r0S0L9DXA+7uwuqcD9Vxn3idOoWMApFysXOnHV4VKQ
         tYWShlbn1sIO8oNggNyhnHVLEP4cgishdHssrlGlA3+EzliXuLMJCqsRAdV3mX7QkpYH
         A+QSnsfmLk+VwOgYvmddzqu9dl0bpCs6cB+26tuCuPw+lbB7Kf4my+gKi9qoFGO9DOGx
         oJcSviaYy8+V6lsyVpTIySfzGxMxm21UalGfzC5tN2ZiePgDnLKmBPzvXQ08HpSmEj2j
         k5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=eslh2ICT1A2pYV00+C3KHTnl2CWed4tgcm8YDqRAs9U=;
        b=Pfg70dcsJgoDwvZ4uRpUb1Ua9E1zBzma1Vi69qZ5SzpIxVV/1I2VLRJyaZ8pggY4gB
         ejx0zxyAd7BGPItGKS+0ZsFPkcuTBXgfT0NNA/ME+iFwzJ3HyYUdby6/DuYNd44egcu8
         G2R8GqunMTI2EXNDDscP5faZDnHHClIplTyTHCs7uvIOR/G2zSpxm0eUKRqTbQ09E7nJ
         c/oGb/i9xNvmvYxQMBh69HUri5BpgOFa7XA92lALDFB6GkxjmyjTDtFRy1UbC/z9vgqo
         phqWZybHyPbdJ+fX8IlJZ3GhfgOWtdISzOPtgzsGU/xGqItEdDBX2tAmO2ti4u1tgzFp
         ItGA==
X-Gm-Message-State: ACgBeo0KdhAWMCCHoNC9muKd81wwg7WjozrVLlPMFltaeA5viZ1SbqsE
	7ABwAJgInFWbwqWNlEXapc9jvw==
X-Google-Smtp-Source: AA6agR5phn8uFnKNoEM0rjbJ3VEqU9sWyXPAGlcDWFEIJMFGBG9IfV5Tiu82kg5VwaTIVoHboTfXdw==
X-Received: by 2002:a2e:6101:0:b0:25d:eb9d:4c79 with SMTP id v1-20020a2e6101000000b0025deb9d4c79mr10374539ljb.354.1660214707390;
        Thu, 11 Aug 2022 03:45:07 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id f10-20020a056512360a00b0048b27215fb3sm669556lfs.41.2022.08.11.03.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 03:45:06 -0700 (PDT)
Message-ID: <918f80ba-d138-1c56-648e-60ad84eee3c1@linaro.org>
Date: Thu, 11 Aug 2022 13:45:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add MT8365 power domains
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20220725081853.1636444-1-msp@baylibre.com>
 <20220725081853.1636444-2-msp@baylibre.com>
 <bbdde7ce-4512-2e61-5e1a-e22e5cb91184@collabora.com>
 <20220811101443.eevyf5xnctmo5y4f@blmsp>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811101443.eevyf5xnctmo5y4f@blmsp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_034510_024657_B05A9E9E 
X-CRM114-Status: GOOD (  12.15  )
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

On 11/08/2022 13:14, Markus Schneider-Pargmann wrote:
>>> +++ b/include/dt-bindings/power/mt8365-power.h
>>
>> Please rename this file to add the vendor prefix.
>>
>> mediatek,mt8365-power.h
> 
> Thank you for your feedback.
> 
> There are currently 12 'mt*-power.h' files without vendor prefix in that
> directory. I can change it, but it seems very inconsistent.

Which is not really argument to keep old style instead of preferred
vendor,device.h.

Best regards,
Krzysztof

