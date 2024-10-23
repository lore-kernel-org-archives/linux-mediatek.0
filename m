Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60F5D2E01B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 07:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLT2EELlLA5EsEZukw2FmKQ26xxJRaMm4DbGbcReVJY=; b=b3IlsHOFQE8lbxYEep4WGaI8tF
	3eW2STPHDyH2rn/IrxO+4ictH/iln2jJzC/8E7E7LvFnblmh7RalHnq4pHt4MhaySNwcUSjyk7OHw
	YCNuxBlr+aPvDk72cQ0tlwTxr8LLwVEBcbDzvmaRe05jEDgmBjS3iap1xMeXA0QZ9Tru3VhPr3GXf
	XCUsOHyR190LI+JirvfMhYzse/vi/ktSL/PmYnVJSKwWSomUqQQ1q4ub+AcnEahiGpHwyKf+uavKb
	wYDpdNaQrMd+x2sudHksQuNHRVOCzOGFrllxphiCef0mswRmyDP2oPh6cZZDjiA12Anp8HpHr2OIL
	ARGNh0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Vtn-0000000DPNy-23Kt;
	Wed, 23 Oct 2024 07:35:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Vbq-0000000DLjG-1pJK;
	Wed, 23 Oct 2024 07:16:47 +0000
X-UUID: b9a26706910e11ef82ff63e91e7eb18c-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=NLT2EELlLA5EsEZukw2FmKQ26xxJRaMm4DbGbcReVJY=;
	b=B2C0OyiYJjImkCwepFfqDZd/vs5dh12JW14Uj6cJcckbxZAZhsyczdQmuMCCHobmUrl0uhcgJd1sY3dp+aXx9hcWaTYL4rAV8fNYNOt5QSc+uBhVF/+eye3BQCCptgRw47XpGEd58Q3d+D3DedfoyWykqoJd9GBtGpHZ+dRa/+E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:fe0b1fb0-1313-489e-a036-9a38ef2ac2ab,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:95b4bacc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b9a26706910e11ef82ff63e91e7eb18c-20241023
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 360796525; Wed, 23 Oct 2024 00:16:30 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 15:16:27 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 23 Oct 2024 15:16:26 +0800
Message-ID: <0d0b1ebc-6fdd-cf65-510e-51c273856cb9@mediatek.com>
Date: Wed, 23 Oct 2024 15:16:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: usb: mediatek,mt6360-tcpc: add ports
 properties
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
References: <20241015103337.20479-1-macpaul.lin@mediatek.com>
 <20241015205405.GA1934266-robh@kernel.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241015205405.GA1934266-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_001646_521777_BB1F11A3 
X-CRM114-Status: GOOD (  20.58  )
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



On 10/16/24 04:54, Rob Herring wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Tue, Oct 15, 2024 at 06:33:36PM +0800, Macpaul Lin wrote:
>> Add 'ports' and sub node 'port' properties to specify connectors on the
>> High-Speed/Super-Speed data bus, or Sideband Use (SBU) AUX lines
>> endpoints of the USB controller.
>> 
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>  .../bindings/usb/mediatek,mt6360-tcpc.yaml    | 21 +++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
>> index 053264e60583..5b6ea0d734ea 100644
>> --- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
>> @@ -32,6 +32,27 @@ properties:
>>      description:
>>        Properties for usb c connector.
>>  
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description:
>> +      Any connector to the data bus of this controller should be specified.
>> +    properties:
> 
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 0
> 
> No need for these, already defined in the $ref'ed schema.
> 
>> +
>> +    patternProperties:
>> +      "port@[0-2]$":
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          It could be one of the following interface types. High-Speed
>> +          (HS) data bus endpoint to the Type-C connector, SuperSpeed (SS)
>> +          data bus endpoint to the Type-C connector, or Sideband Use (SBU)
>> +          AUX lines endpoint to the Type-C connector for the purpose of
>> +          handling altmode muxing and orientation switching.
> 
> You have to define what each port number is.
> 
> However, I'm completely confused as to why you need any of this. The
> description sounds like the usb-c-connector which is already defined as
> a child node.
> 
> Rob
> 

After checking the internal reference DTS, I've found the
intent was wrong for these ports. I'll send [2/2] of v2 for the
DTS update. Hence this change to DT Schema is no longer required.
Please drop this patch.

Thanks!
Macpaul Lin

