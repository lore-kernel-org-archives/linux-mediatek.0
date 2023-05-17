Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8E6C77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUZxK878WWwa8+El0+lNFY+QXkRVXfNrvEurY+MA+qM=; b=yKKRzYBGpRJ/5A1ZRK+nqHS26C
	nbPKtsfBcIHiFP5XzeFAk83XNnXfWyVS7LdSb+P58rQ3JP3Pc20dcwc3xZIbDP+70j0KBeY644NzN
	MnbSt4pOlSo4/uoQEOhI8CDVr44sFfzi6l/cL1STg+mL8x7P+3j0QdDpfe6hx9R1fXbyXE88J7Xkq
	AVYeuE4FwWTJ8zGfk8SCK2zk4i1w5IENIFHYqmQFDHQlROQ0Ogxj7IBIcAJecvG+wdKs6OESY1uuT
	FRkeR2wfTSFKkURSoeUmkiJAIOvWjkSx+L7WpEQW8JPW8SHOS/ewd04Kwzc0tS6LD+WPaAc9QiAoO
	tm0ATquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCjA-008u65-0X;
	Wed, 17 May 2023 08:41:44 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCj6-008u5D-0o
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 08:41:41 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc570b4a3so857654a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 01:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684312896; x=1686904896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUZxK878WWwa8+El0+lNFY+QXkRVXfNrvEurY+MA+qM=;
        b=bBy8nLsLvo2UC1Vbh6qJ2TLwFfrYyM2z2E/otQSOfBQZOShZUCwUDXkzfOaOuoZEhU
         OBeYWerJNOHy9gkVcZtFGovcOrUGU4SD7ikdxOziLtNPU3B3A6yIakHr8cB4i8MkmbYR
         W0BxyaL8t2CDLf38KeseB7VMQ00HAQhZdUM1bjJEERFqCgdfI7MaTQ9057i6RFZKSvh8
         bp50hbkiflDdpKEDuYQyr88kKZP1LqlHpvcchKHAByarGFCm88phMKisjVtxPlZiw16L
         sZOKzc5AsPOXyd2TIVaykbDLdKMCH4k44zQ/7+1HKiGqpD9vyJNeKF3OeU5wKw9hnRLo
         9Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684312896; x=1686904896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUZxK878WWwa8+El0+lNFY+QXkRVXfNrvEurY+MA+qM=;
        b=XhTTf26qykmCSt4kSOZtTu+Wj36eoUkuMp1jMcoscmMtHDwkRKsGvS1Ue5eJqmtYzU
         YrR4cafLhT8yix0G+/Wt3CO2l4HIA/oYb0Q1q8+hUV1xWXv6N4JZXTDcX17npN4lcnZW
         Jj3u3eH2z8pZozYnNklZoMpByLlA4FoM8sIljmviJSyZIR5i5R9MIrzLU3Ommc4P9gIQ
         Jq3ZB0xBitEbO3tmmwrD3OW/q8kcvgN/mnlJ/msGjnszIRHBVQ/x9oA5xZP4o1zYel5S
         +hdRHsnigGiSxL9DZR5amasAnrRCuAeM2lOBeiMwKNVdbCFAA1+TPxaXEq3qMIyU3GRk
         rjiA==
X-Gm-Message-State: AC+VfDwwn7zcPTROjKA/bik6Eg5xb7/IiCvIuvrKOmh1Ydp/Wfs68+jn
	2ybV++vCd9C/fRGo3m3famLWhQ==
X-Google-Smtp-Source: ACHHUZ4X3mrKVkrJMCaJ9WdmHLTHtWPOpptSnrOnoRmnWSlWiXUhp7yx0KJz1Er++grYX6XxpUrjug==
X-Received: by 2002:aa7:df0d:0:b0:510:b4c7:d17 with SMTP id c13-20020aa7df0d000000b00510b4c70d17mr1466284edy.12.1684312896455;
        Wed, 17 May 2023 01:41:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id o9-20020aa7dd49000000b005106975c7a1sm2739689edw.23.2023.05.17.01.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 01:41:35 -0700 (PDT)
Message-ID: <42ca8c57-5211-72ff-4f55-ed2c2886dac9@linaro.org>
Date: Wed, 17 May 2023 10:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] clk: mediatek: mt8365: remove the max clock number
 defines
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v1-0-142077a1732b@baylibre.com>
 <20230517-fix-clk-index-v1-2-142077a1732b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517-fix-clk-index-v1-2-142077a1732b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_014140_291353_B898CDCA 
X-CRM114-Status: GOOD (  10.48  )
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

On 17/05/2023 10:28, Alexandre Mergnat wrote:
> Since we swap to the generic MTK probe function [1], the *_NR_CLK
> defines used to know the number of defined clocks are no longer
> necessary. This patch remove all *_NR_CLK.

Please do not use "This commit/patch", but imperative mood. See longer
explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> [1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
>      mtk_clk_simple_{probe,remove}()")
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

And what about other users of bindings?

Best regards,
Krzysztof


