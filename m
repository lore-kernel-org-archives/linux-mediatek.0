Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C043C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmMlITZ8N6Xyv2X6pot+wicKEUKBuaYj834Ym899zUU=; b=QrPBUSufZTd448f0zWJM/CGBdF
	3uMKV+b+46wTeXpnqdR+YsdyZU8baDcsFQsyXWPpCUEH/xfjfi4N927ieAOu5ZaDimjlWsc4306EB
	dSLfiClkspl/DpwOSIMOKZil750mA3xUfTxXQF5yo7E/r/5xdYdVCJwQSM1iyGsPCZbQ8l6Fgkojn
	n5SZb+oHMVKApUAHA3w61tTm7SRdCBSMu/3lTsPqs6bN+G3Pk1E2jXEoVT+fXm+lNjSlh/2Dk1aXz
	kv8nBoFmTmdLJadsRGS6knEyyyYWXCy6TgCHf98S7X0kmNEcekXgn7+77r2+NjM0Ii4ENmjPknbOR
	RYchjFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw8P-0000000Cgc2-2Ddo;
	Thu, 11 Apr 2024 15:14:41 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw8M-0000000CgaQ-0Pzt;
	Thu, 11 Apr 2024 15:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712848476;
	bh=uOpSXnhxv2OHawhHyAEzb/JljiqQBa6kpiy/MPdPczU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZkXHfrn8RIBm5pjCFyk7iuukhhhPGZ1yL/8DNBa5B9pIf0xN3Aqc4LVy9lgy6tlmI
	 y3dSZvS/gjlrVmmTDtJhX/kHFD2PNHTgWpHW60pxjG3V36NXiOT3Cy5epyHpPS8iLZ
	 cwj0ya/578AqYLQRsOyWCH9GlIp8SqBILrzkw7SrECMAB5+WUAJvmAaO+DQdQG5gUp
	 ania2AcQ7rCppjv7a4rpv2l2O3KnIegc9lMrFALU0wBjDDGMG36P6nTaMFyGpZ0Y8l
	 0302z/HUP1ClfH/2at5P3TqZelQ5Xd5t89yxsm0qQ/z5lA/SMqqMBEFxuIR8gcEltO
	 oP1bTGDYJ0hIg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 198D137813C0;
	Thu, 11 Apr 2024 15:14:35 +0000 (UTC)
Message-ID: <f7fcbae7-fd54-4ad5-8dc6-4deb80088b79@collabora.com>
Date: Thu, 11 Apr 2024 17:14:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] dt-bindings: ufs: mediatek,ufs: Document
 additional clocks
To: Conor Dooley <conor@kernel.org>
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
 bvanassche@acm.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, peter.wang@mediatek.com, chu.stanley@gmail.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, lgirdwood@gmail.com,
 broonie@kernel.org, matthias.bgg@gmail.com, stanley.chu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
 <20240411114300.169055-8-angelogioacchino.delregno@collabora.com>
 <20240411-filth-trekker-8a8c185d589b@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240411-filth-trekker-8a8c185d589b@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_081438_318107_C1CB00B6 
X-CRM114-Status: GOOD (  15.59  )
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

Il 11/04/24 17:10, Conor Dooley ha scritto:
> On Thu, Apr 11, 2024 at 01:42:59PM +0200, AngeloGioacchino Del Regno wrote:
>> Add additional clocks, used on all MediaTek SoCs' UFSHCI controllers:
> 
> I appreciate being told they're on all, rather than it being unsaid and
> having to ask.
> 

You're welcome :-)

>> some of these clocks are optional and used only for scaling purposes
>> to save power, or to improve performance in the case of the crypt
>> clocks.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>> index e2c276da3f2c..21b038db100c 100644
>> --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>> @@ -26,11 +26,23 @@ properties:
>>             - const: mediatek,mt8183-ufshci
>>   
>>     clocks:
>> -    maxItems: 1
>> +    minItems: 1
> 
> Could you add an itemised list to the clocks property please?
> 

Not really... Honestly, I'm not confident that the description will be 100%
correct for all of them... can we do that at a later time, when I will be
really that much confident in writing down a proper description for each
of them?

The only thing that I'm really sure of is exactly what I wrote in this commit,
nothing less, nothing more... for now :')

Cheers,
Angelo

>>   
>>     clock-names:
>> +    minItems: 1
>>       items:
>>         - const: ufs
>> +      - const: ufs-aes
> 
> 
>> +      - const: ufs-tick
>> +      - const: unipro-sys
>> +      - const: unipro-tick
>> +      - const: ufs-sap
>> +      - const: ufs-tx-symbol
>> +      - const: ufs-rx-symbol
>> +      - const: ufs-mem
>> +      - const: crypt-mux
>> +      - const: crypt-lp
>> +      - const: crypt-perf
>>   
>>     phys:
>>       maxItems: 1
>> -- 
>> 2.44.0
>>


