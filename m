Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A718BCA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 06:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ps11xcFJ0x4uz6iyg7AMvaIUrjPAirlB6aY9czV4xDE=; b=MHRqnGYQBfe4jxV8is2oL5ArSs
	BOANlWKnG0AwjZYkW/417J8MaYSq5iEa740NEwanabCOPYJ0b5iAfHeIEuTRkqix8J15z2qXWCQiW
	gGhKNz8ycYzH1up5AWcTvMX76DVOz0+a1dHPnYV+d4NcIHAXtExDoVy1ZFIXDahW0zP2dRtRwM4Hp
	ODiZPfyax0GyHizv5ziIurqgOZ9SaETvTUXPWm/8T1gxf5HQ4mK/vtUtCTXCeT+JOo55vtAx5+iPk
	O3wJDbSN6HvHQSl2rsUGjBYZZBFaho1csCgTzB0atCcXC/OLtQKpjrDhzpoxu+FAK8+ocPY8bmR8Q
	OMY4zBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxDw-002K8N-0K;
	Tue, 12 Sep 2023 06:50:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxDs-002K6a-35;
	Tue, 12 Sep 2023 06:50:10 +0000
X-UUID: 95d40ff8513811ee86758d4a7c00f3a0-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=Ps11xcFJ0x4uz6iyg7AMvaIUrjPAirlB6aY9czV4xDE=;
	b=vCkFOL1vcaSohcJahl1Chi2ISjiaykoWU5d84NbbOnqzB9hG7rrF+73ra5roR4RSE5d/y1J2lptWWa/RoFqv0TxagT0/cNrUBhh0IwAQkslnvmjwA4wQsueoG+5hvYh2olWuIqDXmoD/BamXsAMPa/vDR28dASL9YTP9paI+59U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:c670f5d3-f957-49b0-a2ea-9364f5458833,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:851fbcbe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 95d40ff8513811ee86758d4a7c00f3a0-20230911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 795554651; Mon, 11 Sep 2023 23:49:56 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 14:29:53 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 12 Sep 2023 14:29:52 +0800
Message-ID: <4010955c-9df7-da30-aef9-477ae8483e89@mediatek.com>
Date: Tue, 12 Sep 2023 14:29:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] dt-bindings: arm64: dts: mediatek: add description for
 mt8365-evk board
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>
References: <20230911081126.18463-1-macpaul.lin@mediatek.com>
 <53cd72f7-5a8d-ee9e-4d8a-f5159cafb3e7@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <53cd72f7-5a8d-ee9e-4d8a-f5159cafb3e7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_235009_024733_0ED36702 
X-CRM114-Status: GOOD (  23.43  )
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

On 9/11/23 17:49, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 11/09/2023 10:11, Macpaul Lin wrote:
>> Fix the missing description for MediaTek mt8365-evk board.
>> 
>> Fixes: 4f5fc078ac6f ("dt-bindings: arm64: dts: mediatek: Add mt8365-evk board")
> 
> This is a friendly reminder during the review process.
> 
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
> 
> Thank you.

In the previous modifications, I overlooked this suggestion. It will be 
corrected in the next version.

>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>  Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> change for v2:
>>  - rebase this patch to follow the v5 patch set of mt8395.
>>   - depends on https://lore.kernel.org/lkml/20230909132819.21626-2-macpaul.lin@mediatek.com/T/
>>  - Fix description as a single board.
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> index 2e8ad49c3479..b163995e32d5 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> @@ -244,7 +244,8 @@ properties:
>>            - enum:
>>                - mediatek,mt8183-pumpkin
>>            - const: mediatek,mt8183
>> -      - items:
>> +      - description: MediaTek Genio 350 Board (Genio 350 EVK)
> 
> Drop, no need, redundant (copies the compatible) and your other entries
> do not have it.

The primary objective of this patch is to incorporate a description that 
will prevent users from confusing this platform with others. 
Additionally, it aids in identifying this as a "Genio EVK" for marketing 
purposes.

> 
>> +        items:
>>            - enum:
> 
> This is still confusing. Why do you have enum here with such description.
> 

In order to accommodate the current market situation for a single 
reference board, will replace this with a 'const'.

> Best regards,
> Krzysztof
> 

Thanks
Macpaul Lin

