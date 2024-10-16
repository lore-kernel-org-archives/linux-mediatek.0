Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98893D2069A
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 04:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DCabenPzzIyCe0g7pTxKCjOOLbiMHBzb+xs4rZe8uQ=; b=kxIO40Ls3Swap3IZ3zDHj9PzrP
	DB80/vz6n0GMn+g7DbsJW4kdhafMnLJlHnU2HGOd/Jh66qQ9mMN66tsePAgbSBxJon+EvgwmYT4LK
	scQbhea/+pabRGmXXJAUAAL4TbcC4v38aWYjEklU34874ePrKv/gSb4Z3I04rLwY/4p9UrN7wtniV
	XF/oEjxqqGaRTqwuB68JzLZ3d5nT6QGN4SHXyAVnNjbt/i4RG4kimUVr4U+rUJhTH64BzZj9m0DXj
	N7CF7FAcxCHXKtHVZ6YKfjYp+MYCTx0ZuWq+6Uw0R76f4a0mpkvxxf5SkhoORAPLznyoCg2J+dLBZ
	Ky3OwKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0vV6-0000000ASTY-2aZH;
	Wed, 16 Oct 2024 04:19:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0vTf-0000000ASHZ-2Fn7;
	Wed, 16 Oct 2024 04:17:40 +0000
X-UUID: 91dc34668b7511efba0aef63c0775dbf-20241015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=1DCabenPzzIyCe0g7pTxKCjOOLbiMHBzb+xs4rZe8uQ=;
	b=diRL//LscT81YGMHp1OQMg8w8XvR0XuqNXXdjO9X3Dq6nRvYqMtXs9fkPCWcGh+XZ/jgPesKbUlcrLwxqYhglGbd9fGEjyH4rDYgb7WCGkC0W3lTnag0GuN6AiljslJFA1k2xfLwEOWPHOtD+qhWHXlTe8FwPULwyq6MsgutYLY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:d0c38e9f-ce41-4220-98e1-7f9006e58d82,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:36ca5341-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 91dc34668b7511efba0aef63c0775dbf-20241015
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 107444539; Tue, 15 Oct 2024 21:17:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 12:17:31 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 16 Oct 2024 12:17:31 +0800
Message-ID: <f624ea86-1754-c365-ab22-a2890960b94c@mediatek.com>
Date: Wed, 16 Oct 2024 12:17:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: usb: mtu3: add mediatek,usb3-drd property
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, ChiYuan
 Huang <cy_huang@richtek.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Bear Wang
	<bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin
	<macpaul@gmail.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>
References: <20241015172100.15150-1-macpaul.lin@mediatek.com>
 <20241015222046.GA2164669-robh@kernel.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241015222046.GA2164669-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_211739_735748_5D54F04A 
X-CRM114-Status: GOOD (  15.67  )
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



On 10/16/24 06:20, Rob Herring wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Wed, Oct 16, 2024 at 01:21:00AM +0800, Macpaul Lin wrote:
>> Add optional 'mediatek,usb3-drd' property to MediaTek MTU3 DT Schema.
>> This flag specify whether it is a USB3 Dual-role device hardware.
>> 
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>> index d4e187c78a0b..1e70af0dac82 100644
>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>> @@ -155,6 +155,12 @@ properties:
>>        property is used. See graph.txt
>>      $ref: /schemas/graph.yaml#/properties/port
>>  
>> +  mediatek,usb3-drd:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description:
>> +      Specify whether it is a USB3 Dual-role device hardware.
>> +    type: boolean
>> +
> 
> Don't the standard properties such as usb-role-switch or dr_mode work
> for you?

I've found there are some hardware capability registers could be read
when probing the device. I'll try if the platform I'm using could access
these capability registers.
This patch can be discard. If the hardware really need specify the 
capability in dts and there is no capability registers, I'll resend
this patch that time.

>>    enable-manual-drd:
>>      $ref: /schemas/types.yaml#/definitions/flag
>>      description:
>> -- 
>> 2.45.2
>> 
> 

Thanks!
Macpaul Lin

