Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE0BC83F33
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdtLuvK5FoLWlrvycOTnaJ+HduNbx6ANjKzfliekyu4=; b=DUk1w02Gr8qO7dxbE20ZKOx7+t
	u3fOs8ikCJz0G5G1oqW4ei22bW8y+SwCdIHySkQETY0x4S/FJsuWQ0sHkWskH2MX0uUiuc82LLuhT
	9xzOVarcHNB4hfREwg7e8WP33+FIts+ft/+qCIMjIuestyKz9Uu/Ful35oOujYAhZaciFNvBk4Dil
	i0DfMrfGZyUuPqRnIz+CDmtuoo4u+nRzEVPwYd3t82JBnkFeWz0E7qUu4Mv47Oabrd8YSGVfx4hfG
	mbPytasJAxAZUl/2JgJBuiqrxcXmnd0lIoe4lfZDAklMOel0DhVlaT7n/DmwobBhVp8U5eV4JxBfe
	5oP9SpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdRE3-005VOe-0G;
	Tue, 05 Sep 2023 08:15:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdRE0-005VOB-10;
	Tue, 05 Sep 2023 08:15:53 +0000
X-UUID: 65deedaa4bc411ee86758d4a7c00f3a0-20230905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=PdtLuvK5FoLWlrvycOTnaJ+HduNbx6ANjKzfliekyu4=;
	b=svc1DzMHb8sp0cR91beGFmHizs82nCOdNG9OJtoZhNzxoYW2AEObx3ADd1vPYPnw4vqiGVCTy52EkuEFlCqBV9QfgHPAQAaYGW5F/+kzVq+dho+xUxAA5cJ6wfbt6TcN8SnrpyF/N/bF4IKahOVEcejLCM3790OKHLfr47aP5FA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:86959a9c-5f8d-4b1b-8475-98ba086737bc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:82459213-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 65deedaa4bc411ee86758d4a7c00f3a0-20230905
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1650350464; Tue, 05 Sep 2023 01:15:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Sep 2023 16:15:05 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 5 Sep 2023 16:15:03 +0800
Message-ID: <6e39b4b1-42b5-515c-aca0-08374ee7634e@mediatek.com>
Date: Tue, 5 Sep 2023 16:15:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/2] arm64: dts: mediatek: mt8195-demo: fix the memory
 size to 8GB
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Fabien
 Parent <fparent@baylibre.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, <stable@vger.kernel.org>
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
 <20230905034511.11232-1-macpaul.lin@mediatek.com>
 <4e0c1222-5211-5515-99f1-b44b25f8ecfe@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <4e0c1222-5211-5515-99f1-b44b25f8ecfe@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_011552_383208_9A9FBDB8 
X-CRM114-Status: GOOD (  19.06  )
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



On 9/5/23 16:00, AngeloGioacchino Del Regno wrote:
> Il 05/09/23 05:45, Macpaul Lin ha scritto:
>> The onboard dram of mt8195-demo board is 8GB.
>>
>> Cc: stable@vger.kernel.org      # 6.1, 6.4, 6.5
>> Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 
>> Demo board")
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Changes for v2:
>> Changes for v3:
>>   - No change.
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts 
>> b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> index b2485ddfd33b..ff363ab925e9 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> @@ -48,7 +48,7 @@
>>       memory@40000000 {
>>           device_type = "memory";
>> -        reg = <0 0x40000000 0 0x80000000>;
>> +        reg = <0 0x40000000 0x2 0x00000000>;
> 
> Shouldn't this get automatically filled in by the bootloader?
> Usually, that's the case: if it is, then the right thing to do here
> is to change this property to
> 
>          /* The bootloader will fill in the size */
>          reg = <0x0 0x40000000 0x0 0x0>;
> 
> Regards,
> Angelo
> 

Thanks for the review. However, this value seems depends on the boot 
method. Take u-boot as the example, the total memory size which Linux 
kernel get will be different via EBBR boot or fitImage boot.

It the system is booted through EBBR, the memory size should be filled 
by u-boot's UEFI variables, which is from u-boot's dts file. If the 
system is booted from fitImage, the memory size should be filled by 
kernel's dts file which is usually packed with fitImage. That's why we 
still need this fix.

>>       };
>>       reserved-memory {
> 
> 

Thanks.
Macpaul Lin

