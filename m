Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3EAEB8FA5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWU2+sQSWFn6D31EW6X/Ih88Ohc9NNvNu0TwesMvU7g=; b=SqlYLD/OF57+kFrNTH+ks5p4Iq
	DWJNH4XYv6+qIBglxWXmYTQYW+QbCxHODzqCtVyXCkksnfPyJPNTwNE/QMSUoPqBbm2oKbw0SZVQu
	ns2wfsbr5N+ldshSfdFhBLTNn5R2r77RuEACfo6qJ1iZWm05mA7nxXy9wIvMRAhRTewzWtL++N2/0
	z3BYx0ldlsDRAEgkUOSh4Ki8jrm9xfDiQKwq4LIyirp5Zijnrm3ifGr6DtLx31tVrhAYrvq5joI+R
	r4p3HX/+gA3zcXOASbldotGKdmvdFHJ16EtSFEZo9PEYC5n37zsHpLtTFJQtk3ttlw62hhUAErU5V
	FdqwNEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdr07-008xzW-0g;
	Wed, 06 Sep 2023 11:47:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdr04-008xxC-0h;
	Wed, 06 Sep 2023 11:47:13 +0000
X-UUID: 1cbfeeac4cab11ee86758d4a7c00f3a0-20230906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=hWU2+sQSWFn6D31EW6X/Ih88Ohc9NNvNu0TwesMvU7g=;
	b=iGpn4J0NnK7Q3iL7EuB1dRywtO/NHh1cWVgvqED42pWvfUSwkgZXGXn7ZugU0CngS+rHzHsuqDL9FRaU3Kg5owf7LOGWdHfIOhRlktWcHAXJTsA91Psn4HaDrVD2a1BLSkHmi5jMUEQJrZn6SOQFyVPVNXjd7bT2iRY8yxS8e1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a6379803-80be-4a45-9f41-f2a06d14135c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:4a93a013-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 1cbfeeac4cab11ee86758d4a7c00f3a0-20230906
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1232266337; Wed, 06 Sep 2023 04:47:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Sep 2023 19:47:07 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 6 Sep 2023 19:47:04 +0800
Message-ID: <c951f693-b219-4745-be20-a8e1fee0099d@mediatek.com>
Date: Wed, 6 Sep 2023 19:47:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich
	<frank-w@public-files.de>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?=
	<bero@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-1-macpaul.lin@mediatek.com>
 <fbad941f-232b-9f56-5de3-98a16a8c4d89@linaro.org>
 <c3ddf00c-235a-2d23-db60-c998a67a3fcd@mediatek.com>
 <f343b6e2-6106-47eb-71cb-f391aff6cb7f@collabora.com>
 <50f7fbdd-8592-7a47-b2d8-a1af8ed93b92@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <50f7fbdd-8592-7a47-b2d8-a1af8ed93b92@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_044712_260803_A0E2985D 
X-CRM114-Status: GOOD (  13.02  )
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



On 9/6/23 19:24, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 06/09/2023 12:48, AngeloGioacchino Del Regno wrote:
>>> Yes, mt8395 is fully compatible with mt8195.
>>>
>>> But after reading Angelo's comment, we thought it is necessary to create a new 
>>> compatible to avoid confusion for users.
>>> https://lore.kernel.org/lkml/bf8394c6-5460-8696-f46b-0c39927aaf84@collabora.com/
>>>
>>> Although they are fully compatible, developers cannot arbitrarily replace the chip 
>>> on the board with another one. So separated bindings might be better.
>> 
>> Sorry you've misunderstood; I was trying to explain to Krzysztof that the two
>> SoCs are fully compatible... my suggestion was in like with what you're trying to
>> do as in I am agreeing with your first version, Macpaul, to inherit MT8195.
>> 
>> So,
>> 
>> - enum
>>      - mediatek,mt8395-evk
>> - const: mediatek,mt8195
>> - const: mediatek,mt8395
> 
> The other way - mt8395 followed by mt8195 :)

Roger that. :)

> Best regards,
> Krzysztof
> 

Thanks
Macpaul Lin

