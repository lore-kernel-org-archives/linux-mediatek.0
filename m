Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54803C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0pTuYXqLEm2PicZjnMT9sKqIErzcGgeE6r7PEPFD34=; b=o4lfF07t3g7qY5l4HgOetiXm70
	XbuxwkP2mcnc9sy9/DmW01n4/z4nTIdlHWeeN5H3f/QdJIx56m42RJ2YkpOc7YrH0yzGJ2p5EhQ20
	3RV9u/Nf5lNGJR7u6ZJ9TYu3zgzVOJQgOfL0zwIJ7pIllQtq5OrlZ9Eoi0aLrcu7srTTroawJPZdI
	0nAOsSiHCSdBWTmQbrpPQjzlQL1uuPIw//dr4z1imtQJ7iFTg95plLO5n/qVer0WNCs5W/pDId3w3
	WJCfezLK3+LTMT3EqSw9JyZLsQNuFPt032eWnsPZ1sHgXrBlF4eWlzCOiQDAJ7dnZqD4/CJZ1Pq9Q
	GkE1YaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1l6o-001Qob-2O; Thu, 16 Jun 2022 08:44:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1l6b-001QhG-Rs; Thu, 16 Jun 2022 08:43:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A1F876601742;
	Thu, 16 Jun 2022 09:43:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655369034;
	bh=4jGClLDY5f6BG1FfD7RfaglDLpDrYdvh0EE5esCI3bo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SIjmBTDdK92BGB0lCzVdaetlRk6h4lsUfEldDJ4R3usWCUsEPDfHMC2RL1RdIj5RE
	 aKyw8+jRXdTpADJ9rMJsqz+kH3+P/sw+IT9vyrDlV5LDSL0qghyUq17Xvm4cSeGttM
	 R4vvDzvukC+AWxf8Lb0bhE1sVFvtx7StmobyFtAJGe6H7q3m8jJtK9zEaxo/mVq38C
	 bdEBRUYRh8lMDPMJqN2C7hl1616zAi9l3J7gnio2FKC2Q+okZMcmO4Db3DVqyUu2OF
	 YwzbfhBxYSWtIMLINL1LBbymVf7V/0oU7/3QsBhf9JQ81oE5NRlaI+g7WvWk21b7Ay
	 Mq1MhIwx9ar0Q==
Message-ID: <c46dc265-115b-d27a-9e74-a7c48497cdfc@collabora.com>
Date: Thu, 16 Jun 2022 10:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] mfd: mt6397: Add basic support for MT6331+MT6332 PMIC
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, johnson.wang@mediatek.com,
 hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
 <20220520124617.228808-3-angelogioacchino.delregno@collabora.com>
 <YqpUmE5+Kmq9rxwB@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YqpUmE5+Kmq9rxwB@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_014358_080649_ACBE699D 
X-CRM114-Status: GOOD (  21.39  )
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

Il 15/06/22 23:52, Lee Jones ha scritto:
> On Fri, 20 May 2022, AngeloGioacchino Del Regno wrote:
> 
>> Add support for the MT6331 PMIC with MT6332 Companion PMIC, found
>> in MT6795 Helio X10 smartphone platforms.
>>
>> This combo has support for multiple devices but, for a start,
>> only the following have been implemented:
>> - Regulators (two instances, one in MT6331, one in MT6332)
>> - RTC (MT6331)
>> - Keys (MT6331)
>> - Interrupts (MT6331 also dispatches MT6332's interrupts)
>>
>> There's more to be implemented, especially for MT6332, which
>> will come at a later stage.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/mfd/mt6397-core.c            |  47 ++
>>   drivers/mfd/mt6397-irq.c             |   9 +-
>>   include/linux/mfd/mt6331/core.h      |  53 +++
>>   include/linux/mfd/mt6331/registers.h | 584 ++++++++++++++++++++++++
>>   include/linux/mfd/mt6332/core.h      |  53 +++
>>   include/linux/mfd/mt6332/registers.h | 642 +++++++++++++++++++++++++++
>>   include/linux/mfd/mt6397/core.h      |   2 +
>>   7 files changed, 1389 insertions(+), 1 deletion(-)
>>   create mode 100644 include/linux/mfd/mt6331/core.h
>>   create mode 100644 include/linux/mfd/mt6331/registers.h
>>   create mode 100644 include/linux/mfd/mt6332/core.h
>>   create mode 100644 include/linux/mfd/mt6332/registers.h
> 
> [...]
> 
>> +#endif /* __MFD_MT6332_REGISTERS_H__ */
>> diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
>> index 1cf78726503b..4d2b80319db3 100644
>> --- a/include/linux/mfd/mt6397/core.h
>> +++ b/include/linux/mfd/mt6397/core.h
>> @@ -12,6 +12,8 @@
>>   
>>   enum chip_id {
>>   	MT6323_CHIP_ID = 0x23,
> 
>> +	MT6331_CHIP_ID = 0x20,
>> +	MT6332_CHIP_ID = 0x20,
> 
> Are these meant to be the same?
> 

Yes, because this list is referring to the first 8 bits of the CID register,
which is the same for both 6331 and 6332, this is because these two chips are
meant to be used together (at least from my understanding), one as main PMIC
and one as a companion PMIC.

The difference belongs in the higher 8 bits, but there's no support for this
check in the mt6397 driver (yet), and I chose not to implement that to not
complicate this work *at least for now*, as I have no idea about what the
already implemented PMICs read in the high 8 bits (I can check only two of
them, but not the others as I don't have the hardware).

Besides, checking the lower 8 bits is important only because we get knowledge
of the chip *revision* and not the actual model (for which, we use devicetree
anyway).

Regards,
Angelo



