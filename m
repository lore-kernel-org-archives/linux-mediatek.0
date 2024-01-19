Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063EDC4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EjyJdKKx3+Bvs5lDww4YjkjolH/a1SPNPc33swfipo=; b=Ww8LM2ZC/dNvPfvpKHTyNdAezb
	424oeOYcBU4XDOcu4WRWh39IE0cmyGUuyo6K+ma56R0of32G1DU7Mc6O1NGNbkiwwzyYD2ZUimQNY
	ZrxSr3R8QmN0/cqRFDdKIS0Ok5BaqHbQgYtZHRyjEnGfLth/E1B2hkJHxrph0FRXqfJyazAb4TYAN
	mhQBZIn6qocAiprqcvU1RdF2PdjrOOcVSA+7FmTlK3zNQ/E9MIQnXl5IsdLpmdUkmOW+NzmFVvDrT
	6HuO2bn2z511VP0a7M9zvYW2tcO+sNiLvbFiqKNeTETD1YW5FagcFxz8twBlCX2thjZykhNjVXqJ0
	f4y1Lj1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkwT-004wUD-2T;
	Fri, 19 Jan 2024 09:13:37 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkwQ-004wTU-1B;
	Fri, 19 Jan 2024 09:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705655613;
	bh=f8DISqCvdcOoye/zl+qWQ2jDLY06UuVEhG+Srk2JALU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VFkGWdVUFbjtsR450pVSXB6ORnFBiKY/gwb8EQUwm6wIu8ATjqBD883oLkyxOmxwD
	 2Qqt8w7AoX8CwMMMYYmUh7NCnefo3tw7APDsGmjYjTLoDi72m1tIO4MnJqmNpxXTcJ
	 uxCY7C3MWrXeMoHUAofuGQtnI1ZZh5wt3VI2MVpLWlT7rf0BqjycQijWMa6pcXzOZK
	 pDpWKEYrYkuAVG+BWafQEDHLz1SlAUzkofOoo2uTmjpifUBD5z2/IqDwUlqfafgf6K
	 EURO/jp7F62TBa5SQSjRqxd6ao3vIuGnzOvsLKEJZWYx/6X41RzK3x9S4tCquM9Gim
	 JRuLRkjaEYaZw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 22FFC3781182;
	Fri, 19 Jan 2024 09:13:32 +0000 (UTC)
Message-ID: <7e3e3c7a-26ae-48ff-8884-d4f703995546@collabora.com>
Date: Fri, 19 Jan 2024 10:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: mt6360-tcpc: Rename IRQ to PD-IRQB
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, linux@roeck-us.net, heikki.krogerus@linux.intel.com,
 cy_huang@richtek.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20240112094538.65639-1-angelogioacchino.delregno@collabora.com>
 <20240112142018.GA3127117-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240112142018.GA3127117-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_011334_531620_E4999F27 
X-CRM114-Status: GOOD (  13.39  )
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

Il 12/01/24 15:20, Rob Herring ha scritto:
> On Fri, Jan 12, 2024 at 10:45:37AM +0100, AngeloGioacchino Del Regno wrote:
>> Since there is no user yet, rename the only interrupt of this device
>> to "PD-IRQB", avoiding underscores.
> 
> It is primarily node and property names that have this recommendation,
> not so much -names values.
> 
> If there is only 1 interrupt, I'd just drop the name.
> 

Yeah, you're totally right. I'll just drop it.

Thanks!
Angelo

>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml         | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
>> index 053264e60583..0bea23ce2f09 100644
>> --- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
>> @@ -24,7 +24,7 @@ properties:
>>   
>>     interrupt-names:
>>       items:
>> -      - const: PD_IRQB
>> +      - const: PD-IRQB
>>   
>>     connector:
>>       type: object
>> @@ -58,7 +58,7 @@ examples:
>>           tcpc {
>>             compatible = "mediatek,mt6360-tcpc";
>>             interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
>> -          interrupt-names = "PD_IRQB";
>> +          interrupt-names = "PD-IRQB";
>>   
>>             connector {
>>               compatible = "usb-c-connector";
>> -- 
>> 2.43.0
>>


