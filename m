Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD6ECEDDB7
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 07:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8I6A2olOCtmG5k5rmKmYtyOQFqvwL84wIi1DSFnmSP4=; b=XqLQyJyZkoef7jJX+11uucImbI
	tiQ0HKm9AAJA3JhWzQlQwwWRyZH8dIuinMuHDghqNg4MEWOhbTV5I6m0zwuNgPxmvNKWXaKQ7Ionc
	MmMm3FLQfs3498Wj7O81ool9bragundw8TWikob0vVjIMhBWYM6KojUis/Ee1n7qO1Iw+jCXMkxDQ
	nu0mw48EgTIGLr13FTvvoSx5ShShzdaPlhEj6W29HcRuJVfTi7XsZ4I/a001aZ5Rok8i5J0sSRPXW
	0gnWSI5PU3Ux00gnSp1/lCZ4RhryRavUM3ceaPgf9Q1TrSvJ4gSqMe71FPkpATTEcsPUiPJB5aW87
	wZmwUZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz9ir-0000000FUQE-3tLV;
	Fri, 11 Oct 2024 07:06:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz9ZZ-0000000FStL-0ELt;
	Fri, 11 Oct 2024 06:56:26 +0000
X-UUID: ec048956879d11efb3adad29d29602c1-20241010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=8I6A2olOCtmG5k5rmKmYtyOQFqvwL84wIi1DSFnmSP4=;
	b=DhDTtYN7VILXZEY+98qOUyp4UqI61eyLpzzTIeiunRvIDx6XTFEh0X75rthRuaoQUrCI+mq1eyTgpIDhXUM8gXK5lOcUa5R0SYS3bztCesFmUgRiyia4wyyCxUr/yv3EjAT6mu9/nan51goeW47r2+Iojdoaozc1X2blvNx3jm4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:be2aaae4-c5d7-4c8e-951a-ba4a8083d733,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:97101565-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ec048956879d11efb3adad29d29602c1-20241010
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2078057091; Thu, 10 Oct 2024 23:56:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 14:56:18 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 11 Oct 2024 14:56:16 +0800
Message-ID: <30955c9f-2133-46fe-aaa8-6709d6e301c5@mediatek.com>
Date: Fri, 11 Oct 2024 14:56:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: phy: mediatek: tphy: add a property for
 power-domains
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Jason-ch Chen <Jason-ch.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Alexandre
 Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, Pablo
 Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen Chu
	<sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek
 Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
References: <20240926101804.22471-1-macpaul.lin@mediatek.com>
 <20240926-treadmill-purr-b2e3279a14a4@spud>
 <3a970560-2458-f5f3-87c5-925079fa12a4@mediatek.com>
 <20241008-disorder-slacking-d8196ceb68f7@spud>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241008-disorder-slacking-d8196ceb68f7@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_235625_136761_93E3054A 
X-CRM114-Status: GOOD (  21.03  )
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



On 10/9/24 00:31, Conor Dooley wrote:
> On Tue, Oct 08, 2024 at 12:03:37PM +0800, Macpaul Lin wrote:
>>
>>
>> On 9/27/24 00:25, Conor Dooley wrote:
>>> On Thu, Sep 26, 2024 at 06:18:04PM +0800, Macpaul Lin wrote:
>>>> Some platforms requires a dependency for power-domains.
>>>
>>> Some, so not all? Why isn't this restricted on a per compatible basis?
>>
>> After discussion with Chunfeng and double check tphy design in detail.
>> Chunfeng commented that tphy dose not need to add mtcmos.
>> It is not necessary to add it, if the power of the phy is turned off,
>> it will affect other functions.
>>
>>  From the current USB hardware design perspective, even if mtcmos
>> is added to the phy, it is always on.
> 
> Firstly, I have no idea what "mtcmos" means, sorry. I am a dt-bindings
> guy, not someone familiar with mediatek hardware.
> Secondly, it sounds like this /does/ have a power domain, so it should
> be in the binding. That it is turned on by something else and must
> remain on doesn't mean it shouldn't be documented here. What if those
> things try to turn it off while the tphy is using it?

After discussion in MediaTek internal. Chunfeng agreed to
add 'power-domains' property to DT schema. The v2 patch will
also adding the reminder in the description for developers.

>>
>>>> So we add property 'power-domains' and set 'maxItems: 1' in the
>>>> DT Schema.
>>>>
>>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>> index 423b7c4e62f2..c77fe43c224a 100644
>>>> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>> @@ -125,6 +125,9 @@ properties:
>>>>        $ref: /schemas/types.yaml#/definitions/uint32
>>>>        default: 28
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>>    # Required child node:
>>>>    patternProperties:
>>>>      "^(usb|pcie|sata)-phy@[0-9a-f]+$":
>>>> -- 
>>>> 2.45.2
>>>>
>>

[snip]

V2 of this patch has been send.

Thanks
Macpaul Lin.

