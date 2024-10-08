Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B378CED266
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 04:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwTHTTsRLjvACOCxRw8N0aIBKWsdNo6TgCo9mXIoopg=; b=iyRuzKwkl9zXyY6gTCSKoGO9HN
	xtVJGvHL/OnsIvxNC+jKDHtW7wr/LzJmLArmMtyDmwSugOaD/sFMazZaBSRPjdGttqlGQyrCkqFc9
	yy/UJUmcAwGCzWbtKlce2bA7LlHV4AwdkxBvu+7GRhuuB0Hmfjyh5dYcURUc+1jXZmlAB1tFR5wKj
	RiQ0bAfDHbw47gXH+g47FrViFAQwwsdNDrvzIp2TKcO79Eh7q58UboAMFIyxwqwozj4qEZ9h5CgqP
	R4bz5rGVNV2d20+pJJm+SyN6oIUv7tV59mxeIMAWOc2ArfZ//A8jnpB8i8BaUiEXe30lsK9ciHPmK
	NLKQLFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy1TB-00000004Ry2-0UZt;
	Tue, 08 Oct 2024 04:05:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy1Rr-00000004RoW-1hE4;
	Tue, 08 Oct 2024 04:03:48 +0000
X-UUID: 4f440dfa852a11efb3adad29d29602c1-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=mwTHTTsRLjvACOCxRw8N0aIBKWsdNo6TgCo9mXIoopg=;
	b=iaHsXtf6Rw0jYxC0w/UHeGf/u82Oiul5qQOcx4Fymap1mSSh7OcuhZvigAfrEidjnhT+3feWte8eJssZq398qQX1uJJqaErGMf1Kmjs/BezRPWB+nESMlMbT08c0i7/il8ngl98T6NAwBJFhhCKdkqAjE96CsoqTwm1xds7HBPY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:34e6372e-1849-4b8f-90fd-8d84a1644b69,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:7a94e764-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4f440dfa852a11efb3adad29d29602c1-20241007
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 610000708; Mon, 07 Oct 2024 21:03:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Oct 2024 12:03:39 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 8 Oct 2024 12:03:38 +0800
Message-ID: <3a970560-2458-f5f3-87c5-925079fa12a4@mediatek.com>
Date: Tue, 8 Oct 2024 12:03:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: phy: mediatek: tphy: add a property for
 power-domains
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Jason-ch Chen
	<Jason-ch.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, "Chris-qj
 chen" <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
References: <20240926101804.22471-1-macpaul.lin@mediatek.com>
 <20240926-treadmill-purr-b2e3279a14a4@spud>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240926-treadmill-purr-b2e3279a14a4@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.403700-8.000000
X-TMASE-MatchedRID: csPTYAMX1+EOwH4pD14DsPHkpkyUphL9mX+W7bzPOQEsElh8RiHU9TRO
	5DLJAPjbbIezkMyOt2/FtYuDam42iwdNdS6cTLNYoaP4nSNLOYuwR/wKmchi2fJ/jS86DpPDFVk
	w4X07kmgXw0prgDEKYG2UIwvQdMxgucM7lDuTbby8coKUcaOOvaOI1u80g4PZZ5yuplze9puVQ2
	bE9K2FgiEn+59qml4SkZOl7WKIImrvXOvQVlExsFZ0V5tYhzdWxEHRux+uk8h+ICquNi0WJOQuX
	NATtBTvuMcQkP5KqdH9y2dEXTBNtCv1l1GAoBYzftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.403700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C4C001A2C3E0140BF9ED2D1FF23C06F2DC8DAACE6EC962175BCD71A962969DD42000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_210347_488098_D45E728A 
X-CRM114-Status: GOOD (  14.91  )
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



On 9/27/24 00:25, Conor Dooley wrote:
> On Thu, Sep 26, 2024 at 06:18:04PM +0800, Macpaul Lin wrote:
>> Some platforms requires a dependency for power-domains.
> 
> Some, so not all? Why isn't this restricted on a per compatible basis?

After discussion with Chunfeng and double check tphy design in detail.
Chunfeng commented that tphy dose not need to add mtcmos.
It is not necessary to add it, if the power of the phy is turned off,
it will affect other functions.

 From the current USB hardware design perspective, even if mtcmos
is added to the phy, it is always on.

>> So we add property 'power-domains' and set 'maxItems: 1' in the
>> DT Schema.
>>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>> index 423b7c4e62f2..c77fe43c224a 100644
>> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>> @@ -125,6 +125,9 @@ properties:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       default: 28
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>   # Required child node:
>>   patternProperties:
>>     "^(usb|pcie|sata)-phy@[0-9a-f]+$":
>> -- 
>> 2.45.2
>>

Please drop this patch and I'll send a new fix to mt8195.dtsi.

Thanks
Macpaul Lin

