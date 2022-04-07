Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA469C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8pEVddY3UaeXS/rRHgVIlidQSFFlz2EXMf0WU/QszQ=; b=zYc1EX1GbvkFuA
	WAVvgOO/6J1KrMFbPKmWVDMNRvPTjfOV/Ht5/KcLmpEpsN5xWRNQf6Xyp3xmNjCQavC/11wfVAe+T
	czhfhqFf3XAcpEENn9WylzFm5L6icmXfVMDhR/K9otnVWcRLQ4lER6r3NQBF9HKiES1Zmj2iFFup2
	V2X0FkEeNjoXUPM2+Vyg1S6lQgztECjXtQi1FbvN4+nLry7YW2AvqekX0g3PBUD5LtzwlOcYYsW17
	Ew1/bME7YUr0OeQfRgHpx/oYPmGZ/LYRM/UJQ4jI5TFsBN+rBRx52yK0DaO6rDRXwfgtcNYwK7Gs7
	lONiX5noNBL0HNihi8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncOsU-00B3Pz-Q0; Thu, 07 Apr 2022 09:56:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncOhr-00Aytl-MC; Thu, 07 Apr 2022 09:45:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 49CAA1F45DD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649324734;
 bh=L0r7ZwmFnBVo/NbGBVz0kgb+5537luDptsTBBJWqS5o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TkckvxikMUzBrJbYhEwScFTQbnCWKfHPBZk81WwX4QWn/kyI5huVQL8m+lrh/TY27
 t8+AVCoYvzQA8k7HgKlgk6iXiGmDAI2IjteA2HIsO5aUjIwRdkLr0akOWZZjD9uQdC
 pUu2GyUcCTdVpb2+NlG9uYKqGt2sGsGEKv17CvCBp5xikUohiEWoVIUJoufs4WwNRs
 TjXUfwVlqR09bu7yIlOk2soTGrkWHg20lbx8RBtQFX+JFbwIT3BnWYzvN1AuNeQxU8
 0U1OzbmwxiCfQLtt/T5b71e43t6Wimm61QP3cGThbGFZA7Xp8srjNOf2Cii0Uub237
 dpCQ5n8UffTBQ==
Message-ID: <507fd6e4-a425-dbbe-f76f-da90870ff29e@collabora.com>
Date: Thu, 7 Apr 2022 11:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: i2c: convert i2c-mt65xx to json-schema
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>
Cc: devicetree@vger.kernel.org, hsinyi@chromium.org, kewei.xu@mediatek.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 qii.wang@mediatek.com, robh+dt@kernel.org, wsa@kernel.org
References: <20220406152940.140224-1-angelogioacchino.delregno@collabora.com>
 <20220406232400.2788-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220406232400.2788-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_024536_016982_635B96A9 
X-CRM114-Status: GOOD (  13.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/04/22 01:24, Miles Chen ha scritto:
> Hi AngeloGioacchino,
> 
>> Convert I2C binding for MediaTek SoCs to Devicetree schema.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  53 --------
>>   .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 118 ++++++++++++++++++
>>   MAINTAINERS                                   |   2 +-
>>   3 files changed, 119 insertions(+), 54 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>>   create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>> deleted file mode 100644
>> index 026985b8f61a..000000000000
>> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>> +++ /dev/null

..snip..

>> -  - clocks: clock name from clock manager
>> -  - clock-names: Must include "main" and "dma", "arb" is for multi-master that
>> -    one bus has more than two i2c controllers, if enable have-pmic need include
>> -    "pmic" extra.
> 
>> +
>> +  clocks:
>> +    minItems: 1
>> +    items:
>> +      - description: Main clock for I2C bus
>> +      - description: Clock for I2C via DMA
>> +      - description: Bus arbitrator clock
>> +      - description: Clock for I2C from PMIC
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: main
>> +      - const: dma
>> +      - const: arb
>> +      - const: pmic
> 
> I read "clock-names: Must include "main" and "dma"" from i2c-mt65xx.txt.
> Does it means that we should have at least 2 clock-names (minItems: 2)?
> 
> Thanks,
> Miles
> 

Hello Miles,
yes, you're right, I just rechecked the code and this is indeed the case.

Thanks for catching that, will send a v2 shortly.

Regards,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
