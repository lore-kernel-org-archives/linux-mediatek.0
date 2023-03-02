Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22F3C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 10:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUcOfchS4C2fgxhPjvGjSCiIN/7y7uTOoaWrQDYPRTM=; b=Tzbi8tKLs+dN/1
	Ytg8tzgugxGg0Ej9unfgWH2OimTMiaQz35URo5rRjVhvEgniUzoFTj4HRmMRHLYLm/ggoGRx+IjRK
	H1AzN3Vg3b7HKmH3/loQAuR7OUkZouiKNbSnZBn8ytOqjzRp0ZUn1vPtCfOFDRxOlv31D+u6UkuQw
	Mgolp+qesvlWOKu0FVFU9AWB4gXMwWk2KjT9M6tsNObE1h1ux9J4S3/U6wXpmcGfQOVsIyDZWaAEf
	egRzg5H42bCLvT62o8GqWfUIvbG3vSGtIPvN+tv1YZadC/69f0m6eThBMOooX2Ho5wXi8EpYojXo3
	xOb7ZmdPCQiFwwkXFtTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgT6-001jzS-JW; Thu, 02 Mar 2023 10:47:24 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgT3-001jyt-Al; Thu, 02 Mar 2023 10:47:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1677754035; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c2ZehWxZUtp/cl4T5HNT9vLkzpL5ZwhAJLPiij4+5DTFylmtKpIj/tkT2gErnjGXFessHP1oP/FEub2sFkX6ELT0iu/R5yHXQYsUAQPOZM3jnpkgd4ELTVJwLDYUBw/kYN8i5OZi1jAT5bKwn061+neWje2ZCZAcfaeRZ3mrcOs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1677754035; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UUcOfchS4C2fgxhPjvGjSCiIN/7y7uTOoaWrQDYPRTM=; 
	b=I54FU9r9Q+ybNILluTJpCNr5r7Y6HsASeCWFBbE4PjnMoVk8u3wwVumSQTBxNQCuD17z+BpQ6d2UUBje+2vLGxyExel+TbYrkDSHdrgc2YUqP0AVTRa5w6haDkghwCODghjto5CRefiUZm+T0tp2KbwNWRSZ/oSM2jxa9A+4C7g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677754035;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UUcOfchS4C2fgxhPjvGjSCiIN/7y7uTOoaWrQDYPRTM=;
	b=A0A3gKeO6HpQ6VZt5x+Be4cJ3ia0MXGxzuevNkr6FkDoh/8oj88j9epiI175TUDM
	kx2jOgtkNul1YxLnHPtWbDQqlqSOjjBVyb2/oRi9SGbhDuRPBSLsPF6VHERd64cyde7
	NIwvdDHiCp/splvG6QbuE2OutO/DPpCer5zXQZ68=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1677754033173751.0132443007599; Thu, 2 Mar 2023 02:47:13 -0800 (PST)
Message-ID: <b48e0a5e-dd45-8b8a-4ee3-357a0985ca9c@arinc9.com>
Date: Thu, 2 Mar 2023 13:47:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new
 compatible strings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-8-arinc.unal@arinc9.com>
 <20230227173333.GA496999-robh@kernel.org>
 <d7aea90f-d077-3a41-996c-804c95d72e24@arinc9.com>
 <20230301024431.GA251215-robh@kernel.org>
 <ae3346de-140f-f181-b6a3-ccaa694e1548@arinc9.com>
 <11d3c806-04b6-da54-65f1-c0bd154affbc@linaro.org>
 <a9acd3b4-2b03-86c0-711c-a3840aeab574@arinc9.com>
 <1aae7ac9-c83d-71b4-4fce-325f02fcd722@linaro.org>
 <89588f69-9cf0-e7a4-b976-5ce87d42e296@arinc9.com>
 <2ccb573d-39f4-cb80-7a3e-63a60c2bc0a8@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <2ccb573d-39f4-cb80-7a3e-63a60c2bc0a8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_024721_642877_BCD4CB06 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-gpio@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2.03.2023 13:29, Krzysztof Kozlowski wrote:
> On 02/03/2023 11:22, Arınç ÜNAL wrote:
>>>>
>>>> ## Incorrect naming
>>>>
>>>> MT7620, MT7621, MT7628, and MT7688 SoCs are incorrectly called Ralink,
>>>> introduce new ralink->mediatek compatible strings to address it.
>>>
>>> So this part was addressed by Rob - we don't do it, because it does not
>>> matter. Ralink is now Mediatek, thus there is no conflict and no issues
>>> with different vendor used.
>>
>> I think Rob was rather addressing that updating compatible strings based
>> on acquisition or marketing whims is not permitted. This condition does
>> not apply here as these SoCs were never Ralink.
>>
>> I understand your point that Ralink is now MediaTek but still, calling
>> these SoCs Ralink would be a bit misleading, don't you think?
> 
> Misleading yes, but also does not matter. At least matter not enough to
> justify ABI break, so you would need to deprecate old ones and keep
> everything backwards compatible. You still would affect 3rd party users
> of DTS, though...

I intend to do just that. Introduce new mediatek strings, keep the old 
ones so it's backwards compatible, therefore don't break the ABI.

Instead of deprecating old strings, I intend to introduce the checks I 
mentioned, on the schema, so the pin muxing bindings only apply if the 
DT has got a string that won't match multiple schemas. This way it 
shouldn't affect 3rd party DTs.

Arınç

