Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA05EEB58C
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 03:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWIKK1/ZS53ok7+bu/0uJ8Kzv+di/hf128cxVMXk9So=; b=0MngKlu9EveN25ELGhG6kwXMdK
	in4ASetjWNDZWwXRaybZYizT9DhHN+ot1/VLfb0RlrtAtxi2Hozpk8Yy/JYSyrnpzgwNQQvh1u76L
	Rwdku9ZYLvJw1miH6dsrJZ4ROXZub8IS/BeuyxaXoIWJaysX0giP9V7T4JGQWCFyr0PrCVnzYoMMh
	vPVV+M4QKD6YwGhIq1XrTm2w6rGxmwWw0Sn7o3/IfMyOLG5sWT04+fBr0GasE6GjZlhK92RmwcGxY
	Kx3rWclCDbaiTmEMvXakhNGe/HOmukkyPJOkep9P5cSFGANCDIG+I1TUjOgbT/Kj2ukKN0ICQ6S9X
	Pv4QDJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgGeg-004V78-0T;
	Wed, 13 Sep 2023 03:35:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgGed-004V6m-1v;
	Wed, 13 Sep 2023 03:35:05 +0000
X-UUID: 834ace2c51e611ee86758d4a7c00f3a0-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=FWIKK1/ZS53ok7+bu/0uJ8Kzv+di/hf128cxVMXk9So=;
	b=oW/UVMMRJnZgPu6qnu/R3vqyBljsFX/Mi5quvRSO6pS2VclkGR8vWxKdw/HimWtgy2jJ5/gqgN/RwTDq6NpCMRyjA57J79pQ1W8xnhFW84yXwLvyp4Q+lsWGFY2vdDGgCSQ3uECWNStaeVJ+iNtsBfZaJj933AzlKj4oydprZds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:dd4a2c1b-a885-4a1f-874a-ca8712ca567f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:97dfdf13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 834ace2c51e611ee86758d4a7c00f3a0-20230912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2100629941; Tue, 12 Sep 2023 20:34:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Sep 2023 11:24:20 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 13 Sep 2023 11:24:20 +0800
Message-ID: <6821fede-5f08-52a5-5d3b-14fc0a5af4b2@mediatek.com>
Date: Wed, 13 Sep 2023 11:24:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: add mt8390-evk
 board
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
References: <20230912140613.6528-1-macpaul.lin@mediatek.com>
 <d147a163-3696-8fdf-4c76-ec8375243d2c@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <d147a163-3696-8fdf-4c76-ec8375243d2c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_203503_643639_480F38A3 
X-CRM114-Status: GOOD (  16.93  )
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

On 9/12/23 22:31, Krzysztof Kozlowski wrote:
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 12/09/2023 16:06, Macpaul Lin wrote:
>> 1. Add compatible for MT8390.
>> 2. Add bindings for the MediaTek mt8390-evk board, also known
>> as the "Genio 700-EVK".
>> 
>> The MT8390 and MT8188 belong to the same SoC family,
>> with only minor differences in their physical characteristics.
>> They utilize unique efuse values for differentiation.
>> 
>> The booting process and configurations are managed by boot
>> loaders, firmware, and TF-A. Consequently, the part numbers
>> and procurement channels vary.
>> 
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>  Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> dependencies for v1:
>>  - This patch should be applied after the following patch set
>>   - mt8365's bindings
>>    - https://lore.kernel.org/linux-arm-kernel/20230912092444.31635-1-macpaul.lin@mediatek.com/T/
>>   - mt8395's bindings
>>    - https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@mediatek.com/T/
>>   - mt8188's bindings
>>    - https://lore.kernel.org/lkml/a4e1a80ebd19896410f50b0297e05dce06fb47cc.camel@mediatek.com/T/
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> index d8e449c6a7d7..047204a4aff5 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> @@ -251,6 +251,12 @@ properties:
>>        - items:
>>            - const: mediatek,mt8365-evk
>>            - const: mediatek,mt8365
>> +      - description: MediaTek Genio 700 Boards (Genio 700 EVK)
> 
> We had a long discussion, so again: drop description.
> 

Okay, will drop description and send v2 series.

> Best regards,
> Krzysztof

Thanks
Macpaul Lin

