Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6F0EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Unhb0nlK5Mot54hOxYBqdWjaYrSaOaet6VqslMUP6i4=; b=ypAjZdDWt8mgJ6Chv2uUJJ1Ydm
	WdYT0a4Hw6wXqVcZBIfkg8fwG09WjwUbj0uxZ4EaYTRfkSJWMg+gSgCFNLFGgKLm8C+YHRgsFWQMt
	gIncE7ptfOlC7F1oHA6iJ+xJgDhYYt6i2cssqdASoe3+U7lDZQWUBM4vTKVO+j0N/0GSj+QDS+W/v
	x65zX7032yT4tbRwNGY1nVm+zjijkj5U+IFpd/W4Br1qYq4aE1bpD7Ueo3nb/qZwDxuOfPB5YJbwC
	9mLySTu5oj2YE6BaVrdHR4KMJjkIq47iKukq0J2ge8uuYMV59pzzzeyOjZY5ZSQx8Wcv9LxuVox/7
	sWVJUtcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfaVU-00HKYk-37;
	Mon, 11 Sep 2023 06:34:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfaVR-00HKY4-1C;
	Mon, 11 Sep 2023 06:34:48 +0000
X-UUID: 4789901e506d11ee86758d4a7c00f3a0-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=Unhb0nlK5Mot54hOxYBqdWjaYrSaOaet6VqslMUP6i4=;
	b=iEuCl7LUn1tXVFzW7khoeivtt3myqKRbFSHKje0cP5uLQjv8Ba1F+TIa320lgtoaTqj3tgToc5DGH2XrWV6sHVKP6c0WtiDFKopmKhDmQfXJEGyy29F48FjZ32/y1XeV7vxExW55SOqN0TQk4U9rXr3Ml74gf4cbtcxVGpr4m38=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:0aeee906-0c9e-4f08-982e-ff1d0cd4d5ce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:bd768cef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4789901e506d11ee86758d4a7c00f3a0-20230910
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 865533912; Sun, 10 Sep 2023 23:34:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 14:34:03 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 11 Sep 2023 14:34:03 +0800
Message-ID: <82a0ab25-a3cc-3e87-e379-9b15b3fbbf76@mediatek.com>
Date: Mon, 11 Sep 2023 14:34:02 +0800
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
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <ef81697f-473e-898e-ec13-4dd255e2e3d7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_233445_412731_80500494 
X-CRM114-Status: GOOD (  19.42  )
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

On 9/11/23 14:09, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 10/09/2023 14:07, Macpaul Lin wrote:
>> 
>> 
>> On 9/10/23 17:09, Krzysztof Kozlowski wrote:
>>>> +      - description: MediaTek Genio 350 Boards (Genio 350 EVK)
>>>
>>> That's a bit confusing. So all of the boards here will be Genio 350 EVK?
>>> I don't get what is the point of this description.
>>>
>>>
>>>> +        items:
>>>>            - enum:
>>>>                - mediatek,mt8365-evk
>>>>            - const: mediatek,mt8365
>> 
>> Thes boards with compatible 'mediatek,mt8365-evk' is indeed used by
> 
> Boards?

I'm not sure if there will be more hardware version released to market.
Current the p1v3 is the final version of mt8365-evk.

>> Genio 350-EVK, which Baylibre helped to do upstream tasks. The only 
>> production version of hardware will be available on the market. The 
>> derived version of customer's hardware is not available yet.
>> 
>> The separate patch for renaming mt8365-evk.dts file should be send next 
>> week for aligning the naming rules.
> 
> So the description is not correct.
> 
> Anyway, this patch does not make much sense to me considering nothing
> like this was merged. You just sent v5 doing the same!


Sorry I'm confused now.
These are independent patches.
This patch is for SOC mt83'6'5 and board mt8365-evk, which is not relate 
SOC mt83'9'5 and board mt8395-evk.
Although they are all belongs to Genio EVK's product line.
This patch is not related to that v5 change for mt8395.

This is an independent patch for adding more detail description for 
mt83'6'5 and mt83'6'5-evk.

> Best regards,
> Krzysztof
> 

Thanks
Macpaul Lin

