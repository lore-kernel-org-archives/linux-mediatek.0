Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6720CCF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ok8whtVL1JKLzB6MQm1dHeefzpHZjETbFHw7INT55fs=; b=bQ8OLUUUlusW+rR0kENRLPHBu+
	SAuvpu1OX7XkqjHycItDqs9uSnQU8RORvFL1PnpJVo/zwnmOviPzH+CLuMmBxCnfmGJ1E2B7ePVnP
	5HDzi1FMW53MBJ67GByM94JVqRQqDptU/ggHP6E15ZosRz1iN24Xw7W7F8/z9d7rjacq1ikYc3OqE
	Bignm32r0Vj1TSWy+OlHnzGAhGFAlIkV4RBgs8TKqSLDDKlA9SG40vOA8LpnysYW3ybxwlEfJkMNb
	FyS1oW9M8Ma/YBSeouO6Oqj+USzf5SsRdvQ9BPYXqg4TyjbKia6PFldHfK/g3uCsjEpodMnl7gvu7
	lKfclA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvkP-00000005Ltf-1fQ5;
	Wed, 02 Oct 2024 09:34:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvj8-00000005LTw-1Qtp
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 09:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861576;
	bh=Jd3Oj9mtQ/mi5K+VxCFLk3mKstNWEsxSwYmRpLtFFRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qkp3bkdaIqoMdynbqckRLJtYKLJ7SmDh//gWge52G+Z0HttpT+y33UKHF5/53rrxg
	 GVv+BN2FsoZzOOcJ9yifTV1G1yla/hLi5gfbnw4xE404djzegUSw3IBYYVsDtcB7dc
	 Es3efUWRgSUMEf9s8aHl7aPld5AoXQgi38VRiQ0fivxvANIq+DmuTnmCa1OKk59RE1
	 DCGTHRi1pViWbuVLVPevfMQQ4zQiF4gr8GQEuU6gi5PHV5uBhzGxvg5fVbDNWeDJX7
	 x4Nn+51tbFOMkV20xU8xvSVZZFELut/v4e7tdLHSN05n7k11UGaYo5iT1PlW0M+lj+
	 ivUjKX0bYtK7w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C98617E1147;
	Wed,  2 Oct 2024 11:32:56 +0200 (CEST)
Message-ID: <8d36c55e-1dee-4bda-a1f5-d2033e116a56@collabora.com>
Date: Wed, 2 Oct 2024 11:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 hsinyi@google.com, dri-devel@lists.freedesktop.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, knoxchiou@google.com, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, "Rob Herring (Arm)" <robh@kernel.org>
References: <20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com>
 <172650686036.806282.435049873625711480.robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <172650686036.806282.435049873625711480.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023258_603227_A29C8EEE 
X-CRM114-Status: GOOD (  17.32  )
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

Il 16/09/24 19:19, Rob Herring (Arm) ha scritto:
> 
> On Sat, 14 Sep 2024 14:31:20 +0800, Jianeng Ceng wrote:
>> This is v8 of the MT8186 Chromebook device tree series.
>> ---
>> Changes in v8:
>> - PATCH 1/2: Remove custom label.
>> - PATCH 2/2: Change the commit about ponyta.
>> - Link to v7:https://lore.kernel.org/all/20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com/
>>
>> Changes in v7:
>> - PATCH 2/2: Remove prototype sku.
>> - PATCH 2/2: Disable the other trackpad to enable one of them.
>> - Link to v5:https://lore.kernel.org/all/20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com/
>>
>> Changes in v6:
>> - No change.
>>
>> Changes in v5:
>> - PATCH 1/2: Remove sku2147483647.
>> - PATCH 2/2: Remove sku2147483647.
>> - Link to v4:https://lore.kernel.org/all/20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com/
>>
>> Changes in v4:
>> - PATCH 1/2: Add more info for Ponyta custom label in commit.
>> - Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/
>>
>> Changes in v3:
>> - PATCH 0/2: Add the modify records.
>> - PATCH 1/2: Modify lable to label.
>> - Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/
>>
>> Changes in v2:
>> - PATCH 2/2: Modify the dtb name without rev2.
>> - Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/
>>
>> Jianeng Ceng (2):
>>    dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
>>    arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
>>
>>   .../devicetree/bindings/arm/mediatek.yaml     | 10 +++++
>>   arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>>   .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 ++++++++
>>   .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 ++++++++++
>>   .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
>>   5 files changed, 96 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
>>
>> --
>> 2.34.1
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y mediatek/mt8186-corsola-ponyta-sku0.dtb mediatek/mt8186-corsola-ponyta-sku1.dtb' for 20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com:
> 
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']

Hello Jianeng,
I can't apply this series unless you fix the following warnings from the DTB check:

> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: dp-bridge@5c: 'extcon' is a required property
> 	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: dp-bridge@5c: 'extcon' is a required property
> 	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: sound: 'model' is a required property
> 	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: sound: 'model' is a required property
> 	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
> 

Regards,
Angelo


