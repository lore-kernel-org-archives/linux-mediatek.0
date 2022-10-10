Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A73C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 11:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aS1mdgah/Fyjm9ltIWVV0rPFhI+rHtBAM1fJSGrm+Ig=; b=kia0Gc0aXKw7FfoJYHKSanu+ju
	9VYZCKMlD0PE/pRXuBN/mJ/b1d7xtx22qPJfKX8MyCkLlbtBa1w8duovQKGes8lPeDFsBfTJo343/
	l5gSQ+yu54YBL3HjlX72us7FUPHGqinJIPnId1KKp6qGOTo5p7RUVST9F5vwD4t5XHBIr8dWOduvB
	4MXnCzw5B69lh0r96pBJ+3d/txXrP0qFgCdNtX9NWGCtCuWDUq2G4tSh+QSr6bZrf3vbr7mnfcIFx
	OdIR8aJ5YlXrv9pL4sMPphWcT+NfZEZrtkJa8RAyQ+jaZGEFLkTu60SQgluWVsA9XO+w6ZAYZFAiV
	jv5/sAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohrG0-000gOR-6r; Mon, 10 Oct 2022 11:47:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohrFp-000gLG-2e; Mon, 10 Oct 2022 11:47:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 23B6966022A5;
	Mon, 10 Oct 2022 12:47:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665402441;
	bh=7tuh7nNoMmOTC8qASx41d6YAap5Q04ANum0eL2sT7cg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K/FhvlBlG72ChQicSlXdO8lwTUkOREPEwjtokn6anOxhxLmFaeEz5VtF9F44pbpwU
	 kaQHKZaYgD43S0I0lmkC084+gORg1sNtW7mcHyQD4Cv/pJl/y5dpmskHblM7egL4XK
	 WZoUEpORhFb2flqRsO421UkWnJ8EPtuourLcqSwITMhP1FIMEvv54IpzLkK98NfiqC
	 hiaZXxtsKV4aX53M/aLzt+COaE7KK0lARzWbkw1Epo/b2/mN5pwtLE+UO3bBxOtG0U
	 lCaGiTAzPlF/FVSlx6AMuohJ3YkHGXjV8NsGTz8BCzThnLvn/POE+Ofebr3ooN91sN
	 +/nps6Ggx09NA==
Message-ID: <6c889c7e-4c5a-a201-e37c-bf95b6826584@collabora.com>
Date: Mon, 10 Oct 2022 13:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 05/10] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Fix interrupt count
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-6-y.oudjana@protonmail.com>
 <0769c6c8-567d-68c0-323a-9aaee1241e13@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <0769c6c8-567d-68c0-323a-9aaee1241e13@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_044729_361639_64D62610 
X-CRM114-Status: GOOD (  15.22  )
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

Il 10/10/22 13:13, Krzysztof Kozlowski ha scritto:
> On 07/10/2022 08:58, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> The document currently states a maximum of 1 interrupt, but the DT
>> has 2 specified causing a dtbs_check error. Replace the maximum limit
>> with a minimum and add per-interrupt descriptions to pass the check.
>>
>> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   .../devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>> index 73ae6e11410b..a3a3f7fb9605 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>> @@ -47,7 +47,10 @@ properties:
>>   
>>     interrupts:
>>       description: The interrupt outputs to sysirq.
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: EINT interrupt
>> +      - description: EINT event_b interrupt
> 
> Is second interrupt really optional or you just wanted to silence the
> warning?
> 

The event_b interrupt exists (and fires on certain events, if configured to do so),
but it's currently unused.

It's really optional.

> Best regards,
> Krzysztof
> 



