Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF4AC5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 05:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSRMa3URb6no/Wd7CjkH5X93Fu9KW1GnRk2pSZR1Mr0=; b=3vHHgp8wkrgO8ERo2vC8DP13xh
	Cy+1/HtLUKvwsArjElf1455W+t7i5pNL8YSGcEd51bx2rX10I+sXVn39N/tcpMQ+Ton0Y/8idNiAs
	WJ6ZoYuZUoaVOTBbaSj1JrlD2/NY8ZFTnGCju6BgWal1kcOt8in5ZRBAPHbJyQ4/SNz1Xsy6HUbsW
	dr5teelpmcvLdDsdZgpJWXRinAsKAwNJFzzHr+4oqYXQfgEBUkpkueBbQuNB4Cp+ucD77/i2OqhkP
	BLTr00kobbKByxHosHxebmkwG3/8Rgmbk/wP7MCY1cZvHAl0Cxftt4Db+rbMnE81Rwno3NXlA10nA
	gDtLe+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFU1p-009maW-NC; Wed, 11 Jan 2023 05:52:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFU1n-009mYt-43; Wed, 11 Jan 2023 05:52:00 +0000
X-UUID: 0868a220917411edbbe3f76fe852e059-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=iSRMa3URb6no/Wd7CjkH5X93Fu9KW1GnRk2pSZR1Mr0=;
	b=ePZsRTtO7y9a1Fy2XjBM7NjRXNsaxYTY/jIl2BU7FV31xgjskLleRGdAXeT3enkISpXhZeu/U6q4K0W6kw4bEnFDk91DVu0AKRvPUJdOp6os+JurLRIvEPXL8nmUEaAmC1ZvUyG7rdknuvOcrE44C4zBPUa9s0ang59kdJunqW8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:1da8f7e7-693e-4d2a-99a1-9c3f4e0c7c15,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:70d9ea8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 0868a220917411edbbe3f76fe852e059-20230110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 660597923; Tue, 10 Jan 2023 22:51:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 11 Jan 2023 13:41:09 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 11 Jan 2023 13:41:09 +0800
Message-ID: <add7a0ed-b676-142f-dea4-3a024a85a72c@mediatek.com>
Date: Wed, 11 Jan 2023 13:41:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: enable USB device port for
 mt8195-demo board
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Miles Chen <miles.chen@mediatek.com>,
	<linux-usb@vger.kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	<yow-shin.liou@mediatek.com>, <ben.lok@mediatek.com>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
 <20230105092809.14214-3-macpaul.lin@mediatek.com>
 <fb2a4f7d-f35a-2c48-ad31-3138a4fae247@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <fb2a4f7d-f35a-2c48-ad31-3138a4fae247@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_215159_196888_4AB48C91 
X-CRM114-Status: GOOD (  15.80  )
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



On 1/6/23 20:56, Krzysztof Kozlowski wrote:
> On 05/01/2023 10:28, Macpaul Lin wrote:
>> 1. Enable USB device port (USB port0).
>> 2. Enable u2 speed for other USB HOST (USB port1/2/3).
>> 3. Configure mt6360 (TYPEC) related pinctrls.
>>
>> Note: Full dual-role switch capability requires TYPEC MUX driver and dts
>> update will be send in separate patches.
>>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 51 ++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> index 07a864cb8b54..207bb5f4c58f 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> @@ -12,6 +12,7 @@
>>   #include <dt-bindings/input/input.h>
>>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>>   #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
>> +#include <dt-bindings/usb/pd.h>
>>   
>>   / {
>>   	model = "MediaTek MT8195 demo board";
>> @@ -380,6 +381,22 @@
>>   		};
>>   	};
>>   
>> +	mt6360_pins: mt6360-pins {
>> +		pins {
>> +			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>,
>> +				 <PINMUX_GPIO101__FUNC_GPIO101>;
>> +			input-enable;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	u3_p0_vbus: u3_p0vbusdefault {
> 
> No underscores in node names. Also does not look correct naming. Please
> run `make dtbs_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

Thanks for the suggest.
I'm trying to request IT to setup for the environment for supporting 
"make dtbs_check". This should be fix in next patch.

>> +		pins_cmd_dat {
> 
> Same problem.
> 

Got it.

> 
> Best regards,
> Krzysztof
> 

Thanks!
Macpaul Lin

