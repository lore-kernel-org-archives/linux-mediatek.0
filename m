Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38C6CF6491
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 05:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zasI9d4EFSlQDUt9pveMHKbUWNguU0pHqIbERcEhkJU=; b=ESh4CL/gXpIZsGdvJmFd8pkRIR
	1QY0vpbXj0GELl2M34tP5VGM0yk+TEdGxkOdoojAdf+qHvr259dAFauQpHAKwNxBhGevdwzOySAOj
	2xOmiwVi46v1qxfxTvPGI680sXzO1VkR/svPqaETqSigBF2uCFetvWFm3lvMzAz/NZM25IFIhm8T4
	WHPkBv0py4zwAOuBWeTB4qABHA4NnQMYLKMzjSkSyV2As3DKjH+pm0fF4e5YFdBW0NELNV3lbB2/1
	2CKDXpekn3+3ArYRbwq7HMXKSpr0UKMp/AfG+Utv7at2v7OxBIKHzAW9zBwQ5WxerX6PBqXAlyHbn
	rFL8qcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv9Ci-0000000G0Wf-2r5g;
	Mon, 30 Sep 2024 05:44:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv9B3-0000000G00Q-2BYK;
	Mon, 30 Sep 2024 05:42:35 +0000
X-UUID: c58b9de47eee11efba0aef63c0775dbf-20240929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=zasI9d4EFSlQDUt9pveMHKbUWNguU0pHqIbERcEhkJU=;
	b=R3mDzn0OYfxLm0AkkHg1z4tDuUqHPLUTLU8pfof9/DgJ/CNlLgec43/P8q6N4k1JfUhnkhNkX3GixRnAqxpXGvG3Z6ieMrCImr/Eh6qWYf6aZALIGV7Ikrx2B+NIEAaCYzAFqxou4AyrbHlnCM1YmmZpYegPAzjG9c5Ta/rHQJg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:fd5ee8bb-12e7-4de0-b3cf-2e11e34300ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:69daf8d0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c58b9de47eee11efba0aef63c0775dbf-20240929
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1695470508; Sun, 29 Sep 2024 22:42:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Sep 2024 13:42:22 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 30 Sep 2024 13:42:21 +0800
Message-ID: <edeb6345-fc70-a3e8-0702-b9b146295aa2@mediatek.com>
Date: Mon, 30 Sep 2024 13:42:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] dt-bindings: mfd: mediatek: mt6397: add compatible
 for mt6359-codec
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Sen Chu <sen.chu@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Eason Yen
	<eason.yen@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Shane Chien
	<shane.chien@mediatek.com>, Hui Liu <hui.liu@mediatek.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-sound@vger.kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang
	<bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin
	<macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek
 Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
References: <20240926092519.6556-1-macpaul.lin@mediatek.com>
 <20240926092519.6556-2-macpaul.lin@mediatek.com>
 <20240926-smokeless-clobber-0fb8a1cdc7ab@spud>
 <78381b10-eae6-1414-6913-994e1ed03410@mediatek.com>
 <z5zehicgqqsbgsjz5nrjlqrkpqll57gb26jdc3ctpeajtlfusm@b2s5vrbuv3es>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <z5zehicgqqsbgsjz5nrjlqrkpqll57gb26jdc3ctpeajtlfusm@b2s5vrbuv3es>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_224233_611315_EFE6DF05 
X-CRM114-Status: GOOD (  22.37  )
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



On 9/27/24 17:42, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Fri, Sep 27, 2024 at 03:57:58PM +0800, Macpaul Lin wrote:
>> On 9/27/24 00:04, Conor Dooley wrote:
>> > On Thu, Sep 26, 2024 at 05:25:18PM +0800, Macpaul Lin wrote:
>> > > This patch updates the audio-codec properties includes:
>> > >   - compatible:
>> > >    - Re-order the supported device items.
>> > >    - Add 'mt6359-codec' to compatible since MT6359 PMIC has been included
>> > >      in this DT Schema.
>> > 
>> > >    - Set 'additionalProperties: true' for 'mt6359-codec'.
>> > 
>> > Why?
>> 
>> The mt6359-codec support these 3 properties:
>> mediatek,mic-type0, mediatek,mic-type-1, mediatek-mic-type2.
>> While mt6358-sound and mt6397-codec don't (at least, I didn't find
>> these 3 properties in driver codes.
>> 
>> Set 'additionalProperties: true' is also required to fix the following
>> dtbs_check errors:
>> pmic: audio-codec: 'mediatek,mic-type-0', 'mediatek,mic-type-1',
>>       'mediatek,mic-type-2' do not match any of the regexes:
>>       'pinctrl-[0-9]+'
> 
> Why is this a correct fix? Aren't you allowing "pink-pony" property as
> well?
> 
>> 
>> > > 
>> > > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> > > ---
>> > >   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 5 +++--
> 
> There is no such file.
> 
> Best regards,
> Krzysztof
> 

This patch is no longer necessary. I'm working on a new fix (v7)
for 'Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml' and try 
to rid of these mess in audio-codec node.

Thanks
Macpaul Lin

