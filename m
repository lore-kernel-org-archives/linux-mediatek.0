Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79904ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KRGHi5QO3WPnDzOkycHTFaQ6rn1LlFLCXaq4LIPA2o=; b=Ln8njZGYnX5uGcePqVN1bqNlRY
	fvNiaAsUKLUT56G82gCQLkOlQltfbXjnTnJBFqS8PxbMeBE1zUiyDadfXZORBernBPXKV9xeZ+qMi
	XToE1X+0J6JxhYy0K/9st5+im1Swz9OMIKhfzN8LcclRXVn1IuYs9i12XxFGYsRkeLRNT4pIcd1gz
	NmvTQJgRAWAJj+4xQvwRMnIjRd5/T0IumQXPUEC3WB0KEWQPtDjttBhRUf6RApUZ/0ZMUh7snH5xY
	wpsaGn4LtYeaE0Cl2UElpWoQsT5ex92xMHJuJX5Lgb0kVSh7ldgg4vRii1ocOnPz92O4MdfBc6Y1z
	1crLxldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obety-003Hrh-Dt; Fri, 23 Sep 2022 09:23:18 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obetv-003HpD-PJ
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 09:23:17 +0000
Received: by mail-lf1-x131.google.com with SMTP id i26so18798477lfp.11
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Sep 2022 02:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6KRGHi5QO3WPnDzOkycHTFaQ6rn1LlFLCXaq4LIPA2o=;
        b=nr19Q9adKvfDHJX1/MuKtdcCmb+W2G4kH9i+60wOK18TE2mFjrQb+Zhxkd4iaZDLYw
         UljVVMKI9OZEOTsuDxxGAT5c/UFL8XR67rS6OWaaw9r4B8Qgmujg/irw+c6WkX8QZbyS
         uc4dhF5ciBcdB6NnytStFtuQlGW/MCd6onKxK6cu8Ue6qxkAAec6dFtEW27xIKGPCGf+
         RJUnMQeiGSrQ6DmPFstmf9gOAdikqtf/ykVZrUAvavkQBmcQrXPZk3kubgEHf9sxAbjQ
         KYQt8AkzYu1LGEoaUIe2emDFYd9Atk9KwGWgew5BnOESRBgIDVIrqORDZrcToYmUVGlb
         5d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6KRGHi5QO3WPnDzOkycHTFaQ6rn1LlFLCXaq4LIPA2o=;
        b=22sIS2qpiL+6ciig9g5qNYBKItma60+a15Ac36zChWRDSy0/YjYLbSclmArBx7Yhax
         HfScCASsTXp0NWT60GLGZtJBkGmlnwLrXaNR+jARBDT6w7ManVh6VSHLcV/afbAXRo4n
         4gOu6Y/pITl8mVe8Id/4w0tMie3be8RYVqr5qLaWeGRsMcgBYMt6mzFqB/N7WiTETn/2
         wsldRrQ602SEnXPuGK1rYlbaNeBqhDLJDgVvBI91rtX16R10/LCM+k1STp/qQhO94rau
         ryFAe2fTIO+CWt4Y8etVLrTn6URlqQKowMGxMDYMm0vJHI7/xTWaGpLO+BG3N8r2ovGp
         SEeg==
X-Gm-Message-State: ACrzQf13mHdbGmuUzw6llMD1djZIoVnTVO4SRdqZsmiah/3b/t5eU7ZS
	hsAQQrLwq5pPI/pGghKj6rSxJg==
X-Google-Smtp-Source: AMsMyM5CQWggSmYXQq0F3Di+/pXRM3IYsH2YikO+/Bi2/zu7pZyr6nxphxgrV9sWndQW0zsNvXqCvQ==
X-Received: by 2002:a05:6512:1320:b0:488:8fcc:e196 with SMTP id x32-20020a056512132000b004888fcce196mr2715533lfu.602.1663924994025;
        Fri, 23 Sep 2022 02:23:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020ac25f4b000000b00499b1873d6dsm1349862lfz.269.2022.09.23.02.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 02:23:13 -0700 (PDT)
Message-ID: <29f9fbd3-a266-e947-5dad-27181d3945e3@linaro.org>
Date: Fri, 23 Sep 2022 11:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [resend PATCH v4 2/2] dt-bindings: net: snps,dwmac: add clk_csr
 property
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Christophe Roullier <christophe.roullier@st.com>
References: <20220922092743.22824-1-jianguo.zhang@mediatek.com>
 <20220922092743.22824-3-jianguo.zhang@mediatek.com>
 <04b9e5ef-f3c7-3400-f9df-2f585a084c5d@linaro.org>
 <8007b455dd18837c06ab099a6009505e7dddc124.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8007b455dd18837c06ab099a6009505e7dddc124.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_022315_867216_BD2AF300 
X-CRM114-Status: GOOD (  15.07  )
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

On 23/09/2022 03:48, Jianguo Zhang wrote:
> Dear Krzysztof,
> 
> 	Thanks for your comment.
> 
> On Thu, 2022-09-22 at 17:07 +0200, Krzysztof Kozlowski wrote:
>> On 22/09/2022 11:27, Jianguo Zhang wrote:
>>> The clk_csr property is parsed in driver for generating MDC clock
>>> with correct frequency. A warning('clk_csr' was unexpeted) is
>>> reported
>>> when runing 'make_dtbs_check' because the clk_csr property
>>> has been not documented in the binding file.
>>>
>>
>> You did not describe the case, but apparently this came with
>> 81311c03ab4d ("net: ethernet: stmmac: add management of clk_csr
>> property") which never brought the bindings change.
>>
>> Therefore the property was never part of bindings documentation and
>> bringing them via driver is not the correct process. It bypasses the
>> review and such bypass cannot be an argument to bring the property to
>> bindings. It's not how new properties can be added.
>>
>> Therefore I don't agree. Please make it a property matching bindings,
>> so
>> vendor prefix, no underscores in node names.
>>
>> Driver and DTS need updates.
>>
> We will rename the property 'clk_csr' as 'snps,clk-csr' and update DTS
> & driver to align with the new name in next versions patches.

Thanks!

Best regards,
Krzysztof


