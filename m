Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DFDEE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 08:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLtsrzjxUtfjRXBTdg7ryD78RZbIUqX7HT6UlqEs7uw=; b=AE0iU7PA2W+jxle1ZXAH7CMGuj
	wAc2l1+BkIxK8E/WimONj0WLJ3nzzVQgxU2oIK3/RxhwfM2IR8W9kTKDj5ZGRj5ClaXg1OmDJN/WS
	XkOSGEejhzrjBGoppeJDjRyDU7UV2UrMGuJ9n9Nq/30MHDvXSTN5URcJTf4+obsk8g16SfCD2/TNB
	bYgPIZXR0ZP0huZDv+A3gRllUYRZq85MXuhZYH6QF2GKIeXCuUdDQUkMyxABA0COGjq+HM3OQZ5gK
	vcZSxNan9VB5+NLG1fGTucrCOo35F1pm027vzgflGEK76Ltm67qG/IEHtEfQzoYtZIX1j4Y3jZd9y
	1NFnQPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfc6o-00HWdY-2f;
	Mon, 11 Sep 2023 08:17:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfc6m-00HWcW-1n;
	Mon, 11 Sep 2023 08:17:25 +0000
X-UUID: a17fc288507b11ee86758d4a7c00f3a0-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=bLtsrzjxUtfjRXBTdg7ryD78RZbIUqX7HT6UlqEs7uw=;
	b=UebW4fkJT4sinEnIj28vlOHdnCLNyrqN35wRKpPbWXzbYjEk4X/G0Ig3TIfNRKKKW0AZ0SKzcd78MAGk483f1viXvf3r18sF9tu9Tpzd+J8UYuZ+q7xkijAZbmQPixncfzCEJ9CxIqOJNWrnIKrJmur3C0OF1ODuCZmqGT+gY10=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:42791457-1969-4a78-b1e0-b03ea0a35697,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:f493cb13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a17fc288507b11ee86758d4a7c00f3a0-20230911
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 94974329; Mon, 11 Sep 2023 01:17:21 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 16:16:47 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 11 Sep 2023 16:16:45 +0800
Message-ID: <e697a23e-e677-c97b-269a-a7a11d338d95@mediatek.com>
Date: Mon, 11 Sep 2023 16:16:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: arm64: dts: mediatek: add description for
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
References: <20230910062852.15415-1-macpaul.lin@mediatek.com>
 <f8864242-daa1-e72f-4759-aac3fa1bbcf2@linaro.org>
 <12bdd17a-98f4-5551-4253-229dc36f0c77@mediatek.com>
 <ef81697f-473e-898e-ec13-4dd255e2e3d7@linaro.org>
 <82a0ab25-a3cc-3e87-e379-9b15b3fbbf76@mediatek.com>
 <649e89c3-343a-c00c-ae89-329833b38981@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <649e89c3-343a-c00c-ae89-329833b38981@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--17.294500-8.000000
X-TMASE-MatchedRID: +f/wAVSGjujsYbGmK/WYxia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yChLn4nGgmm6XPJAf1AuYU6BbVWMeHOeZaFc/CedjlcvkASS
	25Kb4JAK/PxUCMpGeRFQXB1s+iArFOkjQDRo1OZRor4yxPAz7WQ2AVSpm3nkDATjAbArJUsiqHZ
	Z4aC7fIyJtQogTap1vmw8gErCz5evsPLr8JwjnkLGj3LN0+Ey97yrmaqIg0yAwEhHW5KVAz2J+P
	WmHAknxnlSM1mB4TLLOHyiFumtKQSnixsypv8PSFPowz8xfffSeimGtNywjtpsoi2XrUn/JyeMt
	MD9QOgChMIDkR/KfwI2j49Ftap9EOwBXM346/+zxKm+NrlRaJHxJwMK8LeRQaDATuz7r6ZYNxer
	6R4Ih84VxIm5v/HGf
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.294500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6EEA80FCF1E52590F8061DE403ECC5A07550DF81B15E6C606221868D3A8DE3472000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_011724_598505_9458805F 
X-CRM114-Status: GOOD (  24.94  )
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



On 9/11/23 15:06, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 11/09/2023 08:34, Macpaul Lin wrote:
>> On 9/11/23 14:09, Krzysztof Kozlowski wrote:
>>> 
>>>
>>> External email : Please do not click links or open attachments until you 
>>> have verified the sender or the content.
>>>
>>> On 10/09/2023 14:07, Macpaul Lin wrote:
>>>>
>>>>
>>>> On 9/10/23 17:09, Krzysztof Kozlowski wrote:
>>>>>> +      - description: MediaTek Genio 350 Boards (Genio 350 EVK)
>>>>>
>>>>> That's a bit confusing. So all of the boards here will be Genio 350 EVK?
>>>>> I don't get what is the point of this description.
>>>>>
>>>>>
>>>>>> +        items:
>>>>>>            - enum:
>>>>>>                - mediatek,mt8365-evk
>>>>>>            - const: mediatek,mt8365
>>>>
>>>> Thes boards with compatible 'mediatek,mt8365-evk' is indeed used by
>>>
>>> Boards?
>> 
>> I'm not sure if there will be more hardware version released to market.
>> Current the p1v3 is the final version of mt8365-evk.
> 
> Then your code (enum) does not match description. The code is saying:
> this is for multiple boards based on mt8365.
> 
> Your description is saying: this is only for 350 boards.
> 
> Now your email is saying: there is only one 350 board.
> 
> Three different versions. Sorry, I am confused.
> 

Okay, this description has been modified to support single board.
Since there is only one type of the hardware is available on the market.

>> 
>>>> Genio 350-EVK, which Baylibre helped to do upstream tasks. The only 
>>>> production version of hardware will be available on the market. The 
>>>> derived version of customer's hardware is not available yet.
>>>>
>>>> The separate patch for renaming mt8365-evk.dts file should be send next 
>>>> week for aligning the naming rules.
>>>
>>> So the description is not correct.
>>>
>>> Anyway, this patch does not make much sense to me considering nothing
>>> like this was merged. You just sent v5 doing the same!
>> 
>> 
>> Sorry I'm confused now.
>> These are independent patches.
>> This patch is for SOC mt83'6'5 and board mt8365-evk, which is not relate 
>> SOC mt83'9'5 and board mt8395-evk.
> 
> OK, I see my confusion. mt8365 and mt8395.
> 
> Still the description is not matching the code, at least to my limited
> understanding of the description.
> 

patch v2 of this change has been send and rebase with that v5 change.
This will generate a different base line for the v2 patch for avoiding 
confusion. :)


> Best regards,
> Krzysztof
> 

Thanks
Macpaul Lin

