Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29640C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 14:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoYD1HeZqxzJnofeUMnEjY7LdMkmo1HYZ+uW66yc8zI=; b=jdP1DClT0Nns3uXfPLO1y2qKSk
	5LyFNqZ7bVE2HFqA8xejMg4r0wsl+0R1Sy+nnT+YMmf2FVflcXVOmxJT2XNCMFANP7v/d45RhT3xP
	ZNY+QkmXEwqPPY97vK+Ob2OhdXBKP9G7Z+8B9bDiSJFg5Sva1I+qz5qkGU8zDcftXquBx3XJcHeQr
	Kw4fUfY3hpzjbPtRp8i1UC1TkAtVbXAXeSSehfDRiJbVxApfvbPuGDtO0q+7uy3+f0GUv5G2tVqqM
	7fSMPyAQLTmi+GyOvRRoxU0IQ554aAC1P3bXcYzN8C0hUxxNO+btt95791KSd84j/urAa6PDPopVD
	22wHOi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzeW3-00DBRQ-15;
	Thu, 18 May 2023 14:22:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzeVz-00DBQG-1F
	for linux-mediatek@lists.infradead.org;
	Thu, 18 May 2023 14:22:00 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so3032834a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 May 2023 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684419715; x=1687011715;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GoYD1HeZqxzJnofeUMnEjY7LdMkmo1HYZ+uW66yc8zI=;
        b=HGV4jjmlsteYJElUtUefnS224Lr+OvMC9jCbexLICYShcmDpIgspCiSW9L3B4wcnqG
         S14/K4bLbRvOJ0myk0FjPEDsZ+ahgME0WdXiPqDWR5e7OaomNpdfh8WAsQPKQsIPHrc8
         +Mak7u6GkCmTK64G1EFj1x1QR25nhDgk8Swj8+tBxx3pN8fnKy8izlV2Brg2N+Qd+Znq
         jGYAUDCwVzonuMxlYhKefH/PrjKztdOOtBBPaqNah5BtMcJ3on8RryvhspF4NckTyPtw
         IYTHwgQHHMUGedJBIz9icwn1r59Y97Ppy2/8Ub14QbM4bJpUiVqe2H7zKtisfOu+/4qN
         BV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684419715; x=1687011715;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoYD1HeZqxzJnofeUMnEjY7LdMkmo1HYZ+uW66yc8zI=;
        b=djOnuGEW3fE2fHd6sfCbG1GHA6519J7AeyA2yefUGAl9FF1lZtz08L4mkHUjzbyZD9
         lvtljODpYfusyKrz51IjZEqBE2lyb9Zo3mwgsaxr534+Im//rbcclmu9nPnJRxf5L79t
         QIjeR8/pXW/tFP2jty82x+IG4fpjArpudgn1EvW66eO2CECH1z7mN+lCbIAQRH/syVSz
         N6jAwX/BZcEO3LbjdKUrj32jRou5gP75NWrBg+Df7HiI4HSgtrRG43R/Ud4gHlJTL9Of
         El4Nbe4+Xt8hm2Dr486gprlIVckHLKFtN7BLoW+bvyUaT8AnW766ExCN0HGaZDOlApnw
         30IA==
X-Gm-Message-State: AC+VfDz5xELOml4Nd4QqH5R8MwtdthUKoOXr7FprsCZAJKNCCvvA4ccB
	Ou9o7OnAfbJs+0Eg3EgGkfYphA==
X-Google-Smtp-Source: ACHHUZ6iHTnxiJx111Ry47T9aO/W4rthzy+KJgvfxS5NqxK/2UvO39aB1FU69KaBi5+TDxXx0wSDzQ==
X-Received: by 2002:a05:6402:516d:b0:50b:c971:c14b with SMTP id d13-20020a056402516d00b0050bc971c14bmr5546801ede.11.1684419715413;
        Thu, 18 May 2023 07:21:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e24:6d1b:6bf:4249? ([2a02:810d:15c0:828:7e24:6d1b:6bf:4249])
        by smtp.gmail.com with ESMTPSA id l16-20020aa7d950000000b0050bc9ffed66sm662448eds.53.2023.05.18.07.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 07:21:54 -0700 (PDT)
Message-ID: <5e0276b7-2c16-13a1-29d3-1936ffc52d23@linaro.org>
Date: Thu, 18 May 2023 16:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: arm: mediatek: add
 mediatek,boottrap binding
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Golle <daniel@makrotopia.org>, Marek Vasut <marex@denx.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Simon Horman <simon.horman@corigine.com>
References: <cover.1683813687.git.daniel@makrotopia.org>
 <f2d447d8b836cf9584762465a784185e8fcf651f.1683813687.git.daniel@makrotopia.org>
 <55f8ac31-d81d-43de-8877-6a7fac2d37b4@lunn.ch>
 <7e8d0945-dfa9-7f61-b075-679e8a89ded9@linaro.org>
 <ZGWRHeE3CXeAnQ-5@makrotopia.org>
 <2048ed2a-ae6f-b425-38e4-4ba973e04398@linaro.org>
In-Reply-To: <2048ed2a-ae6f-b425-38e4-4ba973e04398@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_072159_421843_FD3BF596 
X-CRM114-Status: GOOD (  23.65  )
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

On 18/05/2023 09:50, Krzysztof Kozlowski wrote:
> On 18/05/2023 04:44, Daniel Golle wrote:
>> On Fri, May 12, 2023 at 08:54:36AM +0200, Krzysztof Kozlowski wrote:
>>> On 11/05/2023 17:53, Andrew Lunn wrote:
>>>> On Thu, May 11, 2023 at 04:10:20PM +0200, Daniel Golle wrote:
>>>>> The boottrap is used to read implementation details from the SoC, such
>>>>> as the polarity of LED pins. Add bindings for it as we are going to use
>>>>> it for the LEDs connected to MediaTek built-in 1GE PHYs.
>>>>
>>>> What exactly is it? Fuses? Is it memory mapped, or does it need a
>>>> driver to access it? How is it shared between its different users?
>>>
>>> Yes, looks like some efuse/OTP/nvmem, so it should probably use nvmem
>>> bindings and do not look different than other in such class.
>>
>> I've asked MediaTek and they have replied with an elaborate definition.
>> Summary:
>> The boottrap is a single 32-bit wide register at 0x1001f6f0 which can
>> be used to read back the bias of bootstrap pins from the SoC as follows:
> 
> Is it within some other address space? Register address suggests that.
> 
> In such case you should not create a device in the middle of other
> device's address space. You punched a hole in uniform address space
> which prevents creating that other device for entire space.
> 
>>
>> * bit[8]: Reference CLK source && gphy port0's LED
>> If bit[8] == 0:
>> - Reference clock source is XTRL && gphy port0's LED is pulled low on board side
>> If bit[8] == 1:
>> - Reference clock source is Oscillator && gphy port0's LED is pulled high on board side
>>
>> * bit[9]: DDR type && gphy port1's LED
>> If bit[9] == 0:
>> - DDR type is DDRx16b x2 && gphy port1's LED is pulled low on board side
>> If bit[9] == 1:
>> - DDR type is DDRx16b x1 && gphy port1's LED is pulled high on board side
>>
>> * bit[10]: gphy port2's LED
>> If bit[10] == 0:
>> - phy port2's LED is pulled low on board side
>> If bit[10] == 1:
>> - gphy port2's LED is pulled high on board side
>>
>> * bit[11]: gphy port3's LED
>> If bit[11] == 0:
>> - phy port3's LED is pulled low on board side
>> If bit[11] == 1:
>> - gphy port3's LED is pulled high on board side
>>
>> If bit[10] == 0 && bit[11] == 0:
>> - BROM will boot from SPIM-NOR
>> If bit[10] == 1 && bit[11] == 0:
>> - BROM will boot from SPIM-NAND
>> If bit[10] == 0 && bit[11] == 1:
>> - BROM will boot from eMMC
>> If bit[10] == 1 && bit[11] == 1:
>> - BROM will boot from SNFI-NAND
>>
>> The boottrap is present in many MediaTek SoCs, however, support for
>> reading it is only really needed on MT7988 due to the dual-use of some
>> bootstrap pins as PHY LEDs.
>>
>> We could say this is some kind of read-only 'syscon' node (and hence
>> use regmap driver to access it), that would make it easy but it's not
>> very accurate. Also efuse/OTP/nvmem doesn't seem accurate, though in
>> terms of software it could work just as well.
>>
>> I will update DT bindings to contain the gained insights.
> 
> If this is separate address space with one register, then boottrap
> sounds ok. If you have multiple read only registers with fused values,
> then this is efuse region, so something like nvidia,tegra20-efuse.

Please align together on some common solution. It looks like you are
solving the same problem:

https://lore.kernel.org/all/?q=%22nvmem%3A+syscon%3A+Add+syscon+backed+nvmem+driver%22

Best regards,
Krzysztof


