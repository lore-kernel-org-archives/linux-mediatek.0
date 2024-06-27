Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8C6C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQc5reA6FUuJdvqXUDZyB3DAHmoPQ/5z2zaxHoIZM5g=; b=ssXeW7lrA/o7/KllA4dYpUgkeW
	0mqM2B5rPopvk7VST6wmZMB9iLnB8jHilc4R3zy96LwdXn+KYwUo5BiWrxNSW78NORmbbgVay+Ziy
	taraNy4wIxIJ2rKRQgnZUTjAl2fkOZ0u2YwjFq1wtS2beU5M6T+ERLy6IWbXjtyq5flJtUzRvMJSw
	WWKHK3pJPWLgJyYZZS9KQIIXd96buIq0mUXWSo/iFJbwIpiVLYaSSiVvmZtul02BaEY6hCgvE1ttC
	Re0JmDrgC9Gul1Z2EwRVgxVMUT7WZ9oLw/D/I4libGH+enRXiz4e6aRa5LknNZPJAuy3Gkv9b3QYx
	fjISh/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMm5F-00000009tAF-3WqS;
	Thu, 27 Jun 2024 10:10:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMm56-00000009t6t-2xri;
	Thu, 27 Jun 2024 10:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719483018;
	bh=YKvSjQO0kBriuXHtpM5S2HDjrcI9aj+U9VFh4zoTZMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CScKeZZ9hJayTeQlGW/3Ok8Jm4GshJujZzcM6rXvkfujk1wULJ31eu/DM6dXCEV+c
	 9Y8tFxvckIKBqnI3OBLFAsYpkUvnDXVZNYInGxb6E0MLL23CfrHvUzjiygG5HsOr7N
	 Oj6cKI5BerncV4nnf38QoDXaU663019BIcIrXrOQbiUIEHLhnGrd3x8kX6Iegb0Zpm
	 HDE/Ndh/ZzCPTogp+Gss7PAJxvmIKHinrwj6Y/iSZ1Dhs6wkXhwCjwJrKVb26IFZFo
	 ytE9nyNJ2Uo7bLy77wrQD/AF1yjKiWsmfJuSwepAqnqcGml/wQMhh75SUmQayfts5L
	 GcXTqREx2+Yww==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 123B537810CD;
	Thu, 27 Jun 2024 10:10:18 +0000 (UTC)
Message-ID: <726f2ed3-675f-45e8-94f0-d392181e7f92@collabora.com>
Date: Thu, 27 Jun 2024 12:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: [PATCH v3 1/2] arm64: dts: mt7986: add dtbs with applied
 overlays for bpi-r3
To: Frank Wunderlich <frank-w@public-files.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>
References: <20240608080530.9436-1-linux@fw-web.de>
 <20240608080530.9436-2-linux@fw-web.de>
 <trinity-82c94d49-2a78-4470-83cd-3c6747e01849-1719434738199@3c-app-gmx-bs52>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <trinity-82c94d49-2a78-4470-83cd-3c6747e01849-1719434738199@3c-app-gmx-bs52>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_031020_915403_B2471015 
X-CRM114-Status: GOOD (  15.17  )
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

Il 26/06/24 22:45, Frank Wunderlich ha scritto:
> any suggestions? hoping it does no laying around so long as v2
> 

So you're trying to just test that the overlay is valid and can actually be
overlaid to the base dts?

I'm not sure that this is the right/best way... and I honestly have no time
to check that *exactly right now*, even though that should be.

I have to be convinced of what I'm doing before applying patches, and I know
that this was sent a bit of time ago, but I really didn't have any time to
dig into that... let's see if for some miracle I can do that for this cycle
otherwise it's going to be the next one.

I mean no disrespect to Rob who suggested this change, but I still want to
check that on my own before picking it.

Sorry about the delays

Cheers,
Angelo


> regards Frank
> 
> 
>> Gesendet: Samstag, 08. Juni 2024 um 10:05 Uhr
>> Von: "Frank Wunderlich" <linux@fw-web.de>
>> An: "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
>> Cc: "Frank Wunderlich" <frank-w@public-files.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, "Daniel Golle" <daniel@makrotopia.org>, "Rob Herring" <robh+dt@kernel.org>
>> Betreff: [PATCH v3 1/2] arm64: dts: mt7986: add dtbs with applied overlays for bpi-r3
>>
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> Build devicetree binaries for testing overlays and providing users
>> full dtb without using overlays.
>>
>> Suggested-by: Rob Herring <robh+dt@kernel.org>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> ---
>> https://lore.kernel.org/all/CAL_JsqK_3xxD0DFwipXO85P=q=EYjUdjE1_8g1MKtvw3vVzx5A@mail.gmail.com/
>> https://lore.kernel.org/all/CAL_JsqJSi=kJSix=f3787ULZnaCy_Y26Phdhy5y9fat_vkDuUw@mail.gmail.com/
>>
>> v2:
>> make full dtbs multiline for better readability
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>> index 37b4ca3a87c9..0ec5b904d35d 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -15,6 +15,27 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
>> +mt7986a-bananapi-bpi-r3-emmc-nand-dtbs := \
>> +	mt7986a-bananapi-bpi-r3.dtb \
>> +	mt7986a-bananapi-bpi-r3-emmc.dtbo \
>> +	mt7986a-bananapi-bpi-r3-nand.dtbo
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc-nand.dtb
>> +mt7986a-bananapi-bpi-r3-emmc-nor-dtbs := \
>> +	mt7986a-bananapi-bpi-r3.dtb \
>> +	mt7986a-bananapi-bpi-r3-emmc.dtbo \
>> +	mt7986a-bananapi-bpi-r3-nor.dtbo
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc-nor.dtb
>> +mt7986a-bananapi-bpi-r3-sd-nand-dtbs := \
>> +	mt7986a-bananapi-bpi-r3.dtb \
>> +	mt7986a-bananapi-bpi-r3-sd.dtbo \
>> +	mt7986a-bananapi-bpi-r3-nand.dtbo
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nand.dtb
>> +mt7986a-bananapi-bpi-r3-sd-nor-dtbs := \
>> +	mt7986a-bananapi-bpi-r3.dtb \
>> +	mt7986a-bananapi-bpi-r3-sd.dtbo \
>> +	mt7986a-bananapi-bpi-r3-nor.dtbo
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nor.dtb
>> +
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
>> --
>> 2.34.1
>>
>>


