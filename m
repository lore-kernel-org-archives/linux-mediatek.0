Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012DCEEB580
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 06:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xncj7W7kaMkt6p/GplUiCAS0Mxu6OVn6dZNjtwSPCPE=; b=mfGngkgJp+Ke3iC5e4BuOnxN24
	WYYNbU9aYNSalbGG7hlIrOEHxbRdV5xN0YoYt1Nuktk3eA9SNInEnGr2baOx2tlmflm0kzLMQpVO/
	FNrigtYtw0uT6dtVoLMlYLbXVOgjNrGzg88x534lHZ+nBHDop46VdFjFVAwpchFkV7lxdfuYU8Xj8
	bMZaJOAgT5SjEDnlBCHqtBMr8egumy++QwBP0d5Io3Rbbo6QPA8XBx6qD3yvhz+Cq99JeMzh4o3t8
	latHDUxeXO/Twd8nxTMgO/S9ic9Ig6OSwnP1Ijv1uoS7kLpqf+dEfDjvcgUDEec8oashKR0/85Tvs
	+0TpxFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfai7-00HLfK-12;
	Mon, 11 Sep 2023 06:47:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfai3-00HLe9-2c;
	Mon, 11 Sep 2023 06:47:49 +0000
X-UUID: 146f8182506f11ee86758d4a7c00f3a0-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=Xncj7W7kaMkt6p/GplUiCAS0Mxu6OVn6dZNjtwSPCPE=;
	b=UxBg04gGH6a6V88+VRmB+cFzYrJuebD1sQSmDMLzm/HxbWWvFvuF/uTZmy5k9UVnOTqeKByODra77w6TLumZyDDBKGzFYEHKxooGfggTmOvVIR8UK/lF5hN5V8b6ZwZGS2kfeBpWq0QRh33nWHLgSIiruv7uxzgaxuwfaGVvhqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:e4e3ab46-4a95-4288-bab3-661e228a2506,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:5f71ca13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 146f8182506f11ee86758d4a7c00f3a0-20230910
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2007954029; Sun, 10 Sep 2023 23:47:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 14:46:57 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 11 Sep 2023 14:46:56 +0800
Message-ID: <d959de4d-43e3-ec58-8873-415165ac2705@mediatek.com>
Date: Mon, 11 Sep 2023 14:46:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
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
References: <20230909132819.21626-1-macpaul.lin@mediatek.com>
 <2318be3d-5687-8b6c-3669-1d2ae1c94d2c@linaro.org>
 <946ee1c5-77af-3ce0-83ba-2966fab70a5f@mediatek.com>
 <fc4bd212-c112-0d42-e94c-c3ba569d2d32@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <fc4bd212-c112-0d42-e94c-c3ba569d2d32@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_234747_850534_18E8DEC5 
X-CRM114-Status: GOOD (  21.57  )
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

On 9/11/23 14:07, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 10/09/2023 14:23, Macpaul Lin wrote:
>> 
>> 
>> On 9/10/23 18:56, Krzysztof Kozlowski wrote:
>>> 
>>>
>>> External email : Please do nost click links or open attachments until you 
>>> have verified the sender or the content.
>>>
>>> On 09/09/2023 15:28, Macpaul Lin wrote:
>>>> 1. Add compatible for MT8395.
>>>> 2. Add bindings for the MediaTek mt8395-evk board, also known
>>>> as the "Genio 1200-EVK".
>>>>
>>>> The MT8195 and MT8395 belong to the same SoC family,
>>>> with only minor differences in their physical characteristics.
>>>> They utilize unique efuse values for differentiation.
>>>>
>>>> The booting process and configurations are managed by boot
>>>> loaders, firmware, and TF-A. Consequently, the part numbers
>>>> and procurement channels vary.
>>>>
>>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> 
>> Changes for v4:
>> Changes for v5:
>>   - No change, update Reviewed-by tag only. Thanks.
>> 
>> The explanation is here. The version v4 and v5 are the same.
>> For sending v5 is because "Patch v5 2/2" has been updated and these 2 
>> patches were in the same patch set. I think to update the whole patch 
>> set together with a single modified patch should be a usual operation.
>> Did I miss anything?
> 
> Yeah, like not top-posting.
> 
> Why do you change the same line in other patchset?

Hmm, they are different patch actually.
I've tested the patch v5 here can be applied with / without mt8365's 
description patch independently.
I'm not sure why the patch show the patch started from the same line number.
@@ -248,7 +248,8 @@ properties:
But these 2 patch sets seems won't be conflict at my local.

>> 
>>> Confusing. You just sent a patch changing the same hunk - adding
>>> description, without any explanation.
>>>
>> 
>> The marketing naming rule of MediaTek SOCs are usually confusing people. 
>> I guess the previous patch just confused you. Ha.
> 
> ?
> 
> 
> 
> Best regards,
> Krzysztof
> 
> 
Thanks
Macpaul Lin

