Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40750C52D71
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 06:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DK3RG1xlccT5+i/2W06EzPdel3h2UwVh8rKWTqzIxxE=; b=HC68dbOI8VHw9pApUR70UYttZb
	qS+IilHWPZk3TvgInfom4zignie11mwjOnuw7qbHtKNfeowqXuIwxWzpr34dooK+HFUN0e9N+IMtL
	QrfytxCrK7bBUdqz7FG7bTsFejHT8zlEh71/MwPuTwZWqC+eE75U3OLfTVD412hk2rD+UwZaKxti4
	gkT5llwYOK8NDBHjpCA/CdMqEN6ztKP8CAAY/jnJqz9SaW8s1HZ/q+w32FOxqPgfWaoKUcmCJKLcy
	iwrDN3gntP5AWDUUnKfpRZv2KtFnVvHgtlVtGyzhDvuXbRIOnMHmBTYqhfiT98vaTaRzxt6YI/9H/
	oUiH4VQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scIg8-0000000AMVV-095o;
	Fri, 09 Aug 2024 06:00:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scIfW-0000000AMSq-2v4U;
	Fri, 09 Aug 2024 06:00:08 +0000
X-UUID: 9de4f266561411efa6c87f6b4542ff6b-20240808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=DK3RG1xlccT5+i/2W06EzPdel3h2UwVh8rKWTqzIxxE=;
	b=WEZmWbwvL5cpoQm9hgKjpo8kmieO1AfeZtKCcH3i+wg0OK8EXXajZCcJrahR7G4ppiqbPko1sbKXqLGMqb/84iA1Baj7tfjPbLfuZscZijIM+OqFWUjeiha8Rhe8BmBHaCAJNA4qIhHzawtjAlrvpELe9a1aXRj9zKqfe1VYn5w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:659695dd-e0e1-442f-b515-cc559fa219b6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:b172f43d-6aa5-4057-84d5-0e7d47251781,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9de4f266561411efa6c87f6b4542ff6b-20240808
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1744079674; Thu, 08 Aug 2024 23:00:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 8 Aug 2024 22:59:26 -0700
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 9 Aug 2024 13:59:25 +0800
Message-ID: <340d52e0-43b8-73db-7308-3ffbe4217419@mediatek.com>
Date: Fri, 9 Aug 2024 13:59:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: regulator: mediatek,mt6397-regulator:
 convert to YAML
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
	=?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>, Macpaul
 Lin <macpaul@gmail.com>, =?UTF-8?B?U2VuIENodSAo5YKo5qOuKQ==?=
	<Sen.Chu@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	=?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>,
	=?UTF-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?=
	<Chris-qj.Chen@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
References: <20240806122507.2766-1-macpaul.lin@mediatek.com>
 <dcc40975-93f6-440e-8887-7a40a0cb3898@linaro.org>
 <31f7251a-7759-1260-7cb7-e239c9baa0a7@mediatek.com>
 <ce5757c6-0bd9-47b9-b5f5-dd5a33953fdd@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <ce5757c6-0bd9-47b9-b5f5-dd5a33953fdd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_230006_761803_114CD389 
X-CRM114-Status: GOOD (  15.61  )
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



On 8/8/24 20:05, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 07/08/2024 12:32, Macpaul Lin wrote:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +
>>>> +    pwrap {
>>>> +       pmic {
>>>> +            compatible = "mediatek,mt6397";
>>>
>>> Messed indentation.
>>>
>>> Use 4 spaces for example indentation.
>>>
>>> Anyway, drop top node or better move the example to the parent device
>>> schema making it complete.
> 
> Look at this comment. I asked you to move to the parent device schema...
> 
> Best regards,
> Krzysztof
> 

I would like to ensure that the progress can be made step by step.

Since I am not specifically responsible for this driver, I cannot 
determine when I will be able to modify the next file after completing 
one today.
Will it be tomorrow? Perhaps in a few months?
There is also the possibility that I might have to pause midway due to 
other job assignments.

Additionally, I need to obtain approval from other internal colleagues.
I am pleased to have received permission to modify 
mfd/mediatek,mt6397.yaml the day after I submitted this conversion of 
mt6397-regulator.

I was intend to split the example parts of the patches into 3 parts 
seprately, mt6397-regulator.yaml, mfd/mediatek,mt6397.yaml,i
then moving the examples from mt6397-regulator.yaml to 
mfd/mediatek,mt6397.yaml, move the content to parent device step by step.

I will include the example part in next version patch in 
mfd/mediatek,mt6397.yaml.

Thanks for the reminder.
Macpaul Lin

