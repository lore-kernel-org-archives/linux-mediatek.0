Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBDEEB8FAD
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDK+6RfIR9DfKyFeGVgBFLvvd4UMW0Rk4nzSlScLa/Q=; b=kbEnABqlkp+DoFfKxo+22nk5cC
	uRdbUM5a5F+l0jzRza9465pCS5WMYohPEmisxNsZVpP87CQMIK8IO3w5QX3SQougznxBFyACMxrkI
	x7pMY0qbTIft3gvD8DF6SDm2vknmLWk1HF3/UPM2ZALWVXGhg28tPYVpWmcCQ6hcOs8ApndrCX7gE
	8NZJnp55n04sHwvnX0unVnAGnU1WYT4kR7Keb7clFIIbOmB9mMwavvOSeL5wB3aTJ7VvUZXTcl0Yu
	rVnVWsOmjoWQcJvqNHPR0Y4NEn888+jDre5vYllvsHa8nou1IrcqzeIDfUFWi3Nb0pfkYHCrRK/+b
	lt15nbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpEW-0081Tg-0Z;
	Wed, 06 Sep 2023 09:54:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpET-0081S3-1j;
	Wed, 06 Sep 2023 09:53:59 +0000
X-UUID: 489f1a944c9b11ee86758d4a7c00f3a0-20230906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=jDK+6RfIR9DfKyFeGVgBFLvvd4UMW0Rk4nzSlScLa/Q=;
	b=AlA9tzZf+wLhSsaBVczpRXyNnYnQYda1AfEO3Nqe0Wy4RS44RgjDt1R1CZDys5x8Dix2hqD/sVG6eMqnaCjulyuzmBcpFSwKHubBjoI/iY0Jb2lPNtfb3Ln5DmHdRLAfMLcEQK3fwbtFRKZ5nOVb7w+NqeT1UfhxUuncy2YPN74=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:83882438-6f3f-4999-b89f-081e088d7e01,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:45739f13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 489f1a944c9b11ee86758d4a7c00f3a0-20230906
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 315452471; Wed, 06 Sep 2023 02:53:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Sep 2023 17:53:48 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 6 Sep 2023 17:53:46 +0800
Message-ID: <c3ddf00c-235a-2d23-db60-c998a67a3fcd@mediatek.com>
Date: Wed, 6 Sep 2023 17:53:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Frank Wunderlich
	<frank-w@public-files.de>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?=
	<bero@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-1-macpaul.lin@mediatek.com>
 <fbad941f-232b-9f56-5de3-98a16a8c4d89@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <fbad941f-232b-9f56-5de3-98a16a8c4d89@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_025357_604605_93810BEE 
X-CRM114-Status: GOOD (  21.08  )
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



On 9/6/23 17:32, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 06/09/2023 11:25, Macpaul Lin wrote:
>> 1. Add compatible for MT8395.
>> 2. Add bindings for the MediaTek mt8395-evk board, also known
>> as the "Genio 1200-EVK".
>> 
>> The MT8195 and MT8395 belong to the same SoC family,
>> with only minor differences in their physical characteristics.
>> They utilize unique efuse values for differentiation.
>> 
>> The booting process and configurations are managed by boot
>> loaders, firmware, and TF-A. Consequently, the part numbers
>> and procurement channels vary.
>> 
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>  Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.
> 
>> 
>> Changes for v2:
>>  - add more detail description for mt8395.
>>  - add bindings for mt8395, and mt8395-evk.
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> index ae12b1cab9fb..d7a20df640d7 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> @@ -248,6 +248,11 @@ properties:
>>            - enum:
>>                - mediatek,mt8365-evk
>>            - const: mediatek,mt8365
>> +      - description: MediaTek Genio 1200 Boards (Genio 1200 EVK)
>> +        items:
>> +          - enum:
>> +              - mediatek,mt8395-evk
>> +          - const: mediatek,mt8395
> 
> 
> I don't understand. You said last time this is fully compatible with
> mt8195, so why it's not here?
> 

Yes, mt8395 is fully compatible with mt8195.

But after reading Angelo's comment, we thought it is necessary to create 
a new compatible to avoid confusion for users.
https://lore.kernel.org/lkml/bf8394c6-5460-8696-f46b-0c39927aaf84@collabora.com/

Although they are fully compatible, developers cannot arbitrarily 
replace the chip on the board with another one. So separated bindings 
might be better.

> Best regards,
> Krzysztof

Thanks
Macpaul Lin

