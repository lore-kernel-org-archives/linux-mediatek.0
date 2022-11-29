Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F62C4321E
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 13:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2pPVev3RCLudXV+llX32MLBUni5nh/cZHxB+M0bkvM=; b=VGg7xKN7BgVlcLCTeqWiiGhKZR
	8DSHwnmZ1d6E4eGMbvmkHbalpAKkvBJ9LGytgs766+hpKtGFVWoHGo7Sogvc3wdXV1oZmn3Q/3lnL
	GYfhlo5ylgbmAlD8TONywTAbMZItn3MwnzeRcryMRzxx3OgKNb1P6COuGfoxQadv1tjueqIRHNMth
	TQmPoQ2bdCTTLn3n/rWkY35qymo7z0uDZpiG+EfTKkIroaoHIozh36irdwwe6cuwHnJ/TBRbOnwXy
	HBowpFxJZ5oWCUn/Uq3sO4myfC3SAuEvMh8oAlYLwiAJp50DvChzmOeLhWT5FyAvxAcskAmbn4OGk
	nMcx41Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p018P-0090oR-Un; Tue, 29 Nov 2022 13:58:53 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p018O-0090mU-0G
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 13:58:53 +0000
Received: by mail-lj1-x232.google.com with SMTP id a7so17159123ljq.12
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 05:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2pPVev3RCLudXV+llX32MLBUni5nh/cZHxB+M0bkvM=;
        b=waDyAGc0fv9NY23aBVzUNd67+z6i2Ph8TR02pjEtX5Gw3qHQxpk4I+q34Asfp8aKNJ
         K+p4L/Ml0yzueqtCa9osb/bhNa/kqof6YmJg2Q5S8Y+0DICAkYA8fMfbkRI8ZnSxYkM4
         InYBUxsj890TCUfs+3S7EDh/6ReIQeF8cKTBHCMk/oaNxo9cWTdc+fxUVG/bOiC6Kiw2
         rgsvViSG2SjV9iykoPSrywu5EBj8dGiO7TYJaJ9JKlPrBdzkxakmpzU0fcl/SVySif7y
         2ZfIsW9Tg0qlbX0ag0PrmhQjv0R9em3kkW1j9A/CTsecvxMHbOKX+DBlFKq36PmtG5EH
         BnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2pPVev3RCLudXV+llX32MLBUni5nh/cZHxB+M0bkvM=;
        b=juNetTnPuQn8mfGo0Mf6owT7lUMwx32t66CSFkCSqxFRoIPAk+pco5ovjBTC07p5jZ
         JoPk67GAb40gYVS20OsZWvvbc1IpmmWMlBZBiQW80wvbVgOZqgY0nAF1a6LbRtsfErph
         OIHoptThkwjBqKaQ0p9em00ZYD8khBzBGv1pdGasOcCk2FHO35T0GnqXPItt7kzwif4P
         lfkN/x+Ix17UZFMs6jglVghfd0leFyqMhAthKgEuSqzPi6fFQB4DptV6Vo1NJDXRqmpi
         IMHfP4g7ahle0lU78z2ANiBYeMMvoupmeyU4OMVazG9iTO/g4no5r+rPsCLT66pMS98R
         Y25A==
X-Gm-Message-State: ANoB5plYSBpNTdvDb0mTY8cq2RAmDhgIWnOukagiYbq/03kw3FRZzmLy
	m27RXE4Zq8ct2bR16+Bs/ZMo8g==
X-Google-Smtp-Source: AA0mqf5RacO/5cMNhLm9XvyvLvezEAskC3Cmkn9WrJJSxE0ZF2oNEfvjLLTyegDa4KnVOBnfDjlaqw==
X-Received: by 2002:a05:6512:13a5:b0:4ad:70f0:c7c with SMTP id p37-20020a05651213a500b004ad70f00c7cmr17467048lfa.190.1669730329197;
        Tue, 29 Nov 2022 05:58:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0026fc8855c20sm1548349ljc.19.2022.11.29.05.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 05:58:48 -0800 (PST)
Message-ID: <bf91aac5-7d9a-245f-7c97-b8be901cf538@linaro.org>
Date: Tue, 29 Nov 2022 14:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 2/2] dt-bindings: pwm: mediatek: Convert pwm-mediatek
 to dt schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 krzysztof.kozlowski+dt@linaro.org
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 robh+dt@kernel.org, matthias.bgg@gmail.com, john@phrozen.org,
 sean.wang@mediatek.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
 <20221128112028.58021-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128112028.58021-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_055852_142153_0DB39429 
X-CRM114-Status: GOOD (  10.09  )
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

On 28/11/2022 12:20, AngeloGioacchino Del Regno wrote:
> This converts pwm-mediatek.txt to mediatek,mt2712-pwm.yaml schema;
> while at it, the clock names were clarified as previously they were
> documented as "pwmX-Y", but valid names are "pwmN" only.
> Also, the example was changed to use "mediatek,mt2712-pwm" instead
> for consistency with the schema filename.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


