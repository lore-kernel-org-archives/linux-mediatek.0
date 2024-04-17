Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF69C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 08:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrmESxH3RnhxlI3N1GmDb33VMABbntjU3MAxxrH6D+Y=; b=iZlC3YDb99U4a534UJW+i8X5gO
	ScJLa7Mv68bwGqIb8qMzIycTGCR/YeKrTsJ60NzhVxpaSVzMTnWAMJhyg8aJwJGc2x3OPa+IpcoVg
	cAbZ1G4FrpBOrxqb0XTe/X9rPwk9QFpyeevXPw6IDQxlP9R9xCWdOvXbnA4UQ2L+A5FrgluE+Ai/T
	v2LJAw1UF2HTw0+bPhhU/01NI3mofX6WsyiJgnof4kgvIGfQjas74d2zTneohUIUHg3W/+2lb8H3M
	6gj+Qy6BES6cYSSUy+aR8pzHqHo4levxtJhuImZ5tFqFKEzX70eM2qKT1PinLaqFUjCdPPWQ/IXeP
	SLWAG2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0RD-0000000FAPd-2KEc;
	Wed, 17 Apr 2024 08:14:39 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0R9-0000000FANJ-0l84;
	Wed, 17 Apr 2024 08:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713341669;
	bh=nxKyq4H0ET8o57EUkk9BeFnAgDxkoDenfHs8BMo7Gwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RkLV/o1PU9ese6veoTStGg4K/NZagOdBE6LolLHaXNkrnLu/YEag41lL2b3bdSr37
	 Wh86fihPy7t3RocZmjM4JxFj080dJXzwuKOKMQohdyQAhfxnNx7wDlHFOT90mlCgqW
	 /hXnYC462KYH89DE2Tx+Oavowvd7RNcp0LXlcYJ9UyAQeL56BZK4WLW/JI2dkCrdJg
	 pciBYIEo/3AHBXF17BXKSmnhzALaMatAJ7lNRuXY8NdpevP1Z5dbWGCec4JlO73+L8
	 sZ1JCNimKuKWPqqGI4H+5aggw8DGG7JRzbtCSuFbTgbiVDeIKbr/vKs3ikzyEXFdf+
	 3Y0aQxTbbaA8Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B6E033780629;
	Wed, 17 Apr 2024 08:14:28 +0000 (UTC)
Message-ID: <ecd7c691-db47-42aa-ab19-f554c20774af@collabora.com>
Date: Wed, 17 Apr 2024 10:14:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] scsi: ufs: ufs-mediatek: Remove useless
 mediatek,ufs-boost-crypt property
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Alexandre Mergnat <amergnat@baylibre.com>
References: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
 <20240415110012.148871-4-angelogioacchino.delregno@collabora.com>
 <c9634a286fbdb4c98a7fe6703a4eb10d66dfcb9e.camel@mediatek.com>
 <4d60e9e4-9eae-4b0a-abb2-b1ad3d278fc9@collabora.com>
 <93db93aa7eb24a255f97a1a1e8e8d936dc908258.camel@mediatek.com>
 <f3920433-b0fa-4a64-9653-e385bf1eb5c7@collabora.com>
 <d11e174d85c7f5a9b4ffe5fb2bb15dfd5823f83e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <d11e174d85c7f5a9b4ffe5fb2bb15dfd5823f83e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_011435_393725_C6E27924 
X-CRM114-Status: GOOD (  22.07  )
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

Il 16/04/24 15:05, Peter Wang (王信友) ha scritto:
> On Tue, 2024-04-16 at 12:38 +0200, AngeloGioacchino Del Regno wrote:
>> Il 16/04/24 12:31, Peter Wang (王信友) ha scritto:
>>>
>>>> Yes this causes -> less than half of a millisecond <- of
>>>> additional
>>>> boot time
>>>> if the dvfsrc-supply is present but boost-microvolt is not.
>>>>
>>>> I really don't see the problem with that :-)
>>>>
>>>
>>> Adding a little bit of boot time to one smartphone might not be a
>>> problem, but when you consider a billion smartphones each adding a
>>> little bit, the cumulative effect becomes significant. The power
>>> consumption of these accumulated times will continue to increase,
>>> contributing to the Earth's carbon emissions. Moreover, removing
>>> the
>>> master switch for this feature doesn't seem to have any benefits
>>> other
>>> than not having to set it in the DTS. Similarly, the master switch
>>> for
>>> VA09 seems to have more disadvantage.
>>>
>>
>> Sorry, but I still don't see how a few *microseconds* more of boot
>> time can
>> be significant, even related to power consumption during boot.
>>
>> If that was a few milliseconds, then I'd agree with you, but that's
>> not the case.
>>
>> Removing the master switch has a benefit: you *lose* a few
>> microseconds of boot
>> time (so, boots in *few microseconds LESS*) on platforms that would
>> have this set
>> in devicetree, as this property is redundant with the other
>> activation checks
>> for those features.
>>
>> So, there you go: if the majority of MediaTek platforms are already
>> using this
>> crypt boost feature, then this commit reduces carbon emissions, as
>> those would
>> boot in a few less microseconds.
>>
> 
> But the majority platfomrs dosen't need this feature.
> This feature is only for legacy chip which at least 4 years ago.
> 

Upstream supports platforms that do and don't need this feature, and having
redundant device tree properties performing the same checks is not just
suboptimal but plain wrong.

Adding to this, devicetree describes the hardware - and there is no physical
hardware switch that needs this redundant property, this means that the
property that is getting removed in this commit (and the va09 one in another
commit of this series) is a *software switch*, not HW.

Keep in mind, also, that this feature (and again, the va09 one as well) has
a specific requirement to be supported - and this is what the code does even
without the software switch to add it.

In case there's any need to disallow such feature from a specific SoC, the DT
bindings can be modified such that a specific compatible string would disallow
adding the required regulator and/or boost-microvolt properties.

Besides, I want to remind you that there is no reason to drop support, or have
them unreliably working, or use hacks, for SoCs that are "old" - especially
when this is a driver that works on both old and new ones.

Regards,
Angelo

