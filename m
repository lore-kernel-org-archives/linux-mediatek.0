Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACD7CEBF80
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSHvJiePihDHrvRm0P0iXE0axppBM5CqjqpGGZtkmaU=; b=tZI5Tdhz7MVlxs4Fnh986UCRXh
	IoTADLgjdO7s7p5yXG6SWDNooIARenIc1nw5ONlYACIJNSMqB/WXRcFwcavWr9AOL5Zs2QlWyqLpP
	p0CVdGD1XqcFTGfM6JjaPlZpY0rFdzhxcurh5bhJjX70nXv/UD/t7D62Q4+t6cTFG4vvIrZ4QeUAR
	zzMaqb7Dfn8l/+eVmV0DpOGsGizRgGLrV3N4V718bbJrVLCawR93Wg2D/EyR6wuwFLkzkzlowQs7r
	qI5/egXGkCvMBuwkOQhVNUjP/brOGUGIPMS8Y4Qcl03jZWEHbfDHR+jWxl2pQ3+BJdzfWN20Ls5fq
	F7fMKjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su5vC-0000000AQXM-2Twj;
	Fri, 27 Sep 2024 08:01:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su5so-0000000AQ18-05GX;
	Fri, 27 Sep 2024 07:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FSHvJiePihDHrvRm0P0iXE0axppBM5CqjqpGGZtkmaU=; b=nCFlD57U5zfnQv2exB5bhxatsx
	H8WT6zSKMWbslM8vUlPa6jLMEpP9yg+dPzjDoKV+Wfx1f9GkukV42YFuJSMAbnAIm/vGFyHQdioVN
	NjAee0+mwmXvWclqLNJ6BOQ3cSxxOONM7KlZd0iHb7MsBIhD06ZeHBkrw4z8oN3EmUtnVcujqD34g
	a1t4wdmYoXE2VSuuIGR/Iej1O+cWOaWruvLIPyXR9UIfexWiJpgHq0Gech6ueJXg2lqWeeat4c/xc
	r0ylHjpw4vUwL/RVWHJEiI69mAJdnyESZtkrmjWitM20kwuZP6RM+awqmQmrw00k1nYV/wG26QYOa
	v2ZeRYdw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su5sk-00000002Jfj-1A2B;
	Fri, 27 Sep 2024 07:59:20 +0000
X-UUID: 3993a3307ca611efb3adad29d29602c1-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=FSHvJiePihDHrvRm0P0iXE0axppBM5CqjqpGGZtkmaU=;
	b=pm+L6SuXs8JD+H7o0asCxTFJPtH4P9Y8t1ICqDkmzKrf0tYRm36pa3rqRVnFUDHbTQUgPEYXfOoNC5dvgK7UModwFGXuHhm/HqX2nQlQgCQ44FRxL/E63G+g6mT2gCrGzX4v/lrJ99sj595JhPOjWVbSGXOkaNTEOXhctImRs7s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4bf37f52-b17f-483c-a8cf-db334ff406d4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:87dcdbd0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3993a3307ca611efb3adad29d29602c1-20240927
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1271474769; Fri, 27 Sep 2024 00:58:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 15:58:00 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 27 Sep 2024 15:57:59 +0800
Message-ID: <78381b10-eae6-1414-6913-994e1ed03410@mediatek.com>
Date: Fri, 27 Sep 2024 15:57:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] dt-bindings: mfd: mediatek: mt6397: add compatible
 for mt6359-codec
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, "Lee
 Jones" <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Eason Yen
	<eason.yen@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Shane Chien
	<shane.chien@mediatek.com>, Hui Liu <hui.liu@mediatek.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-sound@vger.kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang
	<bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin
	<macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, "MediaTek
 Chromebook Upstream" <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
References: <20240926092519.6556-1-macpaul.lin@mediatek.com>
 <20240926092519.6556-2-macpaul.lin@mediatek.com>
 <20240926-smokeless-clobber-0fb8a1cdc7ab@spud>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240926-smokeless-clobber-0fb8a1cdc7ab@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.744400-8.000000
X-TMASE-MatchedRID: cgbqQT5W8hcOwH4pD14DsPHkpkyUphL9GNMTWh+TA9t+YesuCgkiXJsn
	GP/L/vukQ2hUNgLaYpUvndTJnUi/SAAt/Fsc5wFGbc297PAGtWbXof+XRfBH287EPIkVcg+OD3J
	fu36QI2GIi0Yt2qmJZR9K6LGpAwssZMLMXtQ7bzFsG7r4Qh7N3J6KYa03LCO2myiLZetSf8nJ4y
	0wP1A6AKEwgORH8p/AjaPj0W1qn0Q7AFczfjr/7HPBXw4uHT3JyO9Fb+NyVxV9IeBCvU2xpOg2z
	GJYtXDU5BRVekiXxRE=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.744400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: AFFE03E053B385FE89437B5129CE9C73A9E0002E6ECFE675424FD8767641666F2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_085918_840594_21150028 
X-CRM114-Status: GOOD (  15.57  )
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

On 9/27/24 00:04, Conor Dooley wrote:
> On Thu, Sep 26, 2024 at 05:25:18PM +0800, Macpaul Lin wrote:
>> This patch updates the audio-codec properties includes:
>>   - compatible:
>>    - Re-order the supported device items.
>>    - Add 'mt6359-codec' to compatible since MT6359 PMIC has been included
>>      in this DT Schema.
> 
>>    - Set 'additionalProperties: true' for 'mt6359-codec'.
> 
> Why?

The mt6359-codec support these 3 properties:
mediatek,mic-type0, mediatek,mic-type-1, mediatek-mic-type2.
While mt6358-sound and mt6397-codec don't (at least, I didn't find
these 3 properties in driver codes.

Set 'additionalProperties: true' is also required to fix the following
dtbs_check errors:
pmic: audio-codec: 'mediatek,mic-type-0', 'mediatek,mic-type-1',
       'mediatek,mic-type-2' do not match any of the regexes:
       'pinctrl-[0-9]+'

>>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> index 40cabaf60d0d..ffb5848a96d5 100644
>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> @@ -104,7 +104,7 @@ properties:
>>   
>>     audio-codec:
>>       type: object
>> -    additionalProperties: false
>> +    additionalProperties: true
>>       description:
>>         Audio codec support with MT6397 and MT6358.
>>   
>> @@ -112,8 +112,9 @@ properties:
>>         compatible:
>>           oneOf:
>>             - enum:
>> -              - mediatek,mt6397-codec
>>                 - mediatek,mt6358-sound
>> +              - mediatek,mt6359-codec
>> +              - mediatek,mt6397-codec
>>             - items:
>>                 - enum:
>>                     - mediatek,mt6366-sound
>> -- 
>> 2.45.2
>>

Thanks
Macpaul Lin

