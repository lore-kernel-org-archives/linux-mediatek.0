Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE21C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 19:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OYSGRWE6FiNYEJq4CnoTkXsE+VZfA15rUqtVgbhIaM=; b=lXaY3n4Ll39f7LIPdaBOK634c4
	ZD/6wd+wdZfe58jkSs8IzAu0Z/4grncnnfqleFEvyFNo09abcVGLLDfHjvOww4IgXtKj3lOfOnGFT
	bjap0yEydkcwBeZhhy3RFiD8igDmkz+XxXNShLJMEpUHr7eyBXA+cICOdmV+Z7483vuOvT29HisVa
	gLtJ1g/cVk7Y6rDrMAeaQW/hykcnYg1ypcV1yQhZbM+NJ8SIPkwRkOAwbRG6Clhcg55W2AVa1d3bn
	KSDtANpx3HsJWHXEpgw7qDlte7tF2Lw1BSmz71RdSQhHay/+tE5uA3fyz8qPNPe9DxbW+gadLlmt+
	3oO9NHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5Bv5-007XsT-TN; Sat, 25 Jun 2022 19:58:15 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5Bv2-007Xqn-J9
	for linux-mediatek@lists.infradead.org; Sat, 25 Jun 2022 19:58:14 +0000
Received: by mail-ed1-x529.google.com with SMTP id o9so7783236edt.12
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Jun 2022 12:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6OYSGRWE6FiNYEJq4CnoTkXsE+VZfA15rUqtVgbhIaM=;
        b=pI9zO9494ah2JfX794h4yCpf3NSPANue/0Oj68Ks/XZG1Pa1gD0fmd5n0kAkT64bha
         ZUINPjhPAk8L8QQyR7p26pAPWFnXGLcD0Jfa0gVYuhTnbx22TCS/8bF/sEtG4RG4EEty
         Xd5Hzph1eggOtuK4tUg6//XPa2po/nu/Ok9Qhs3BJAMDS+Djj6AAXXwZR/4e6NPhZUbg
         yRu+OAZRYnO8INkVa6uDQsMyO0Yhx5Ih9j4Nl7UlCmkE3E2tlS/leXrnW0TVNpLFuERJ
         XkX8PGW1egQ10tdmuFgdXKxhg10I4BfI/dX+CR241pY4KvhInus8putiCrRRfJzp/gST
         fr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6OYSGRWE6FiNYEJq4CnoTkXsE+VZfA15rUqtVgbhIaM=;
        b=oAfWStwWH76EI1OFnUI0Odhe+rFHOuctPHBwy43snFK0+5xrLdyhpm+EFBFmvU6iso
         iAQjVsc53yxnMTVm8JS4of76AIkseEuARswru+pfXk6s7JGbE1/aXD43P2bS3I03hdFv
         iagEqkz5ujpmx9D1lih1XvOAyLMqREq9WOeRBCKtruz50n7bZ7OUqj2u/0Y9UA6whCxj
         9gZWJmCtyUO7WKoVkY6yO/HGJYDWgm2S6pYzaJt4zpJWCGj1ale2c+Ymd3LMWEaTwT5m
         H4mWeAu7/QpHP2expJmcUYsUFYnY/id0HhfH3Ows8SRvFqksH8fymCjKg/QnLPV0/8Ia
         RB4w==
X-Gm-Message-State: AJIora/IBGIcxk83OsbFmKXA9Cs3Ms3Jvo856Hc+R8ElnzkTihbOSePf
	1y2gZRtQCpfeeTgwldMhkRU7eQ==
X-Google-Smtp-Source: AGRyM1vPCotBygRwDE42Qng9nZ0Zryg+aZrbL44lLPrBOHgnnnMslwk52LUPs3mmcexth6LAcd1Rew==
X-Received: by 2002:aa7:c486:0:b0:435:5d50:ab39 with SMTP id m6-20020aa7c486000000b004355d50ab39mr7004006edq.104.1656187090221;
        Sat, 25 Jun 2022 12:58:10 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d3-20020a1709063ec300b0072629cbf1efsm2943546ejj.119.2022.06.25.12.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 12:58:09 -0700 (PDT)
Message-ID: <89b6a40b-eb6b-eba5-78c3-6b5f35bed717@linaro.org>
Date: Sat, 25 Jun 2022 21:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] MIPS: dts: correct gpio-keys names and properties
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220624170740.66271-1-krzysztof.kozlowski@linaro.org>
 <ZVVZDR.R2QT2GMTT9WS1@crapouillou.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZVVZDR.R2QT2GMTT9WS1@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_125812_660209_EB205FE5 
X-CRM114-Status: GOOD (  15.78  )
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

On 24/06/2022 20:40, Paul Cercueil wrote:
> Hi Krzysztof,
> 
> Le ven., juin 24 2022 at 19:07:39 +0200, Krzysztof Kozlowski 
> <krzysztof.kozlowski@linaro.org> a écrit :
>> gpio-keys children do not use unit addresses.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> See: 
>> https://lore.kernel.org/all/20220616005224.18391-1-krzysztof.kozlowski@linaro.org/
>> ---
>>  arch/mips/boot/dts/img/pistachio_marduk.dts   |  4 +--
>>  arch/mips/boot/dts/ingenic/gcw0.dts           | 31 
>> +++++++++----------
>>  arch/mips/boot/dts/ingenic/rs90.dts           | 18 +++++------
>>  arch/mips/boot/dts/pic32/pic32mzda_sk.dts     |  9 ++----
>>  .../boot/dts/qca/ar9132_tl_wr1043nd_v1.dts    |  6 ++--
>>  arch/mips/boot/dts/qca/ar9331_dpt_module.dts  |  4 +--
>>  .../mips/boot/dts/qca/ar9331_dragino_ms14.dts |  6 ++--
>>  arch/mips/boot/dts/qca/ar9331_omega.dts       |  4 +--
>>  .../qca/ar9331_openembed_som9331_board.dts    |  4 +--
>>  arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts   |  8 ++---
>>  10 files changed, 37 insertions(+), 57 deletions(-)
>>
>> diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts 
>> b/arch/mips/boot/dts/img/pistachio_marduk.dts
>> index a8708783f04b..a8da2f992b1a 100644
>> --- a/arch/mips/boot/dts/img/pistachio_marduk.dts
>> +++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
>> @@ -59,12 +59,12 @@ led-1 {
>>
>>  	keys {
>>  		compatible = "gpio-keys";
>> -		button@1 {
>> +		button-1 {
>>  			label = "Button 1";
>>  			linux,code = <0x101>; /* BTN_1 */
>>  			gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
>>  		};
>> -		button@2 {
>> +		button-2 {
>>  			label = "Button 2";
>>  			linux,code = <0x102>; /* BTN_2 */
>>  			gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
>> diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts 
>> b/arch/mips/boot/dts/ingenic/gcw0.dts
>> index 4abb0318416c..5d33f26fd28c 100644
>> --- a/arch/mips/boot/dts/ingenic/gcw0.dts
>> +++ b/arch/mips/boot/dts/ingenic/gcw0.dts
>> @@ -130,89 +130,86 @@ backlight: backlight {
>>
>>  	gpio-keys {
>>  		compatible = "gpio-keys";
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
> 
> Are you sure you can remove these?

Yes, from DT spec point of view, DT bindings and Linux implementation.
However this particular change was not tested, except building.

> 
> Looking at paragraph 2.3.5 of the DT spec, I would think they have to 
> stay (although with #address-cells = <0>).

The paragraph 2.3.5 says nothing about regular properties (which can be
also child nodes). It says about children of a bus, right? It's not
related here, it's not a bus.

Second, why exactly this one gpio-keys node is different than all other
gpio-keys everywhere and than bindings? Why this one has to be
incompatible/wrong according to bindings (which do not allow
address-cells and nodes with unit addresses)?


Best regards,
Krzysztof

