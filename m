Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649ACC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKW6CVfdiVcKOlVrCdWthABuRy5PpI7KcCv16cmfRas=; b=s+nUE6JAsT8XB+
	6N6xCQaGTz3TQxeZxZFnWhG38Fpy5dACrcaGi9x4UgR+kCbFixYdXhsiFOkQdL9ca8ozBEQZ/x3/j
	7H1AbN1z2OpAV15Zm582KMc64fyvPnfNKynInxlG625yrZAG+OJxcO5WDbNMzCgnoLo5oHW/FgGlN
	PWJ6lsrjdgG3eqX6lmNsnVf1ZZPAKapAtttK10ck86or4vRyAsydXkeK1SNeK9lCkXTUfSG1IUK95
	eKuTXSFeDjoosCVCwzF/umYF8yHkWxXppD8WTmpQUwZ5nblMYrwp/L3AiwdHOPRqhRpPVVMPv6Hjb
	P9gADWz4MG6lOcmjwQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNQT-00Bupv-JD; Thu, 09 Mar 2023 21:03:49 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNQL-00BuoC-OX; Thu, 09 Mar 2023 21:03:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678395811; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iUtNpgy7wTPxrPi44CtDxe9pL384jteIpM1fm+A98ORXPdq+UaPSKDykCx3EQXEGSz+L4bKr8DXtXfEKsHJdqX0+hajKIQiSd0GheN/cMnR5Khx/lFV8Br5ijZUQ+7nVWL3yY+H0h1CX6slim3gKSUBejO+tGW/qy0YshEA8Oxc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678395811; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=pKW6CVfdiVcKOlVrCdWthABuRy5PpI7KcCv16cmfRas=; 
	b=icpvHqeFQc83D9F+ipYP+chSTw4pPC2vXawJQ2lH/mKR7UwprFpwG6h9KVY+KZXrwAKGuXvt9Rn+Mw2p4JuhOsRRem0cMRuDudhwpUubipLQS1SsCBh32fSmeMBzEIrC4/aQvtrrQuH4kxYCWxQQH0rd4qfMtYnjdS64aU7yews=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678395811;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pKW6CVfdiVcKOlVrCdWthABuRy5PpI7KcCv16cmfRas=;
	b=fngNA3Q/fEZCSjXlSDhe+7kagjEII/8DPv7AJTBWY1Vqx1TmEp5/rYJEHb+xgKYx
	2nRPYvJlRro7O4D2Ep1m5ICFA5LmXRZac9NN+GeTQ0r7YFxzyDZFvOSsrYWnfVvko/p
	Am/dfZq20vEyLyy3LH5G5R7lYO0vh2E6Gcv1WowE=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1678395808981366.07781513789814; Thu, 9 Mar 2023 13:03:28 -0800 (PST)
Message-ID: <a53a4792-c9e5-fce9-ac37-cc0a64447813@arinc9.com>
Date: Fri, 10 Mar 2023 00:03:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 19/20] dt-bindings: pinctrl: mediatek: mt7620: split
 binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-20-arinc.unal@arinc9.com>
 <61539204-afbf-f504-dfe7-237824dc0d6c@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <61539204-afbf-f504-dfe7-237824dc0d6c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_130341_877718_01A80D79 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9.03.2023 12:54, Krzysztof Kozlowski wrote:
> On 03/03/2023 01:28, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> The MT7628 and MT7688 SoCs contain different pin muxing information,
>> therefore, should be split. This can be done now that there are compatible
>> strings to distinguish them from other SoCs.
>>
>> Split the schema out to mediatek,mt76x8-pinctrl.yaml.
>>
>> Remove mediatek,mt76x8-pinctrl from mt7620.
>>
>> Deprecate ralink,mt7620-pinctrl. The reason is, the DTs for mt76x8 which
>> use this string will incorrectly match the pin muxing information for
>> mt7620. There's a new string, mediatek,mt7620-pinctrl, which makes the
>> deprecation possible.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../pinctrl/mediatek,mt7620-pinctrl.yaml      | 380 +--------------
>>   .../pinctrl/mediatek,mt76x8-pinctrl.yaml      | 450 ++++++++++++++++++
>>   2 files changed, 459 insertions(+), 371 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
>> index 11530b29d52b..38b71c74b9a0 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
>> @@ -11,16 +11,13 @@ maintainers:
>>     - Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>   
>>   description: |
>> -  MediaTek MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
>> +  MediaTek MT7620 pin controller for MT7620 SoC.
>>     The pin controller can only set the muxing of pin groups. Muxing individual
>>     pins is not supported. There is no pinconf support.
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt7620-pinctrl
>> -      - mediatek,mt76x8-pinctrl
>> -      - ralink,mt7620-pinctrl
> 
> I see removal, not deprecation.

I thought deprecation meant removing a string with explanation on the 
patch log, as I remember from my conversation with you and Rob on this 
patch series.

https://lore.kernel.org/linux-devicetree/87c9bf7e-f290-7d38-0844-7a7243688f5a@arinc9.com/

I won't have to deprecate this now that we straightened things out but 
I'd like to know the proper way to deprecate compatible strings regardless.

Arınç

