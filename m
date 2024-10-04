Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8F2CF856A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 03:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCUbhenGMf5+wIxJ4JWL1bgoO1/T6c4+0JMhIL3Tzh0=; b=f5FTZUP3MxmOC8Q6wBk0Fd4/dV
	dCf3KASuK3bZz/gAnH0dsa6bcJaxpi60SSjC5Dbll38stQEVaauyrhjDLm9mXvnr+T5/wTyqIIP8Z
	loAW2vOQsMv0dUoTbMlqRk+YnHZfbvMeMbSYZYwofRmfVW0zYNS4AgyVjSjPisiSldGN1+cMUA6Jw
	1e3bu9zcSAI1DyDDJSQ/7Kv8vLc0RBJtY+MJ12gbq7RjbGb8UnQY/X67S3LpboxYcXB4Svs6mhZj/
	GygmCSNJa76nihSZqrDMP3BguikTe8b1CHuLAM8tzncrnFSy/WOJjKqRkQxrlHtqZf6j1EpGfZIbr
	af3wfwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swYhd-0000000AvGo-0Irz;
	Fri, 04 Oct 2024 03:10:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swYha-0000000AvGI-4Bo1;
	Fri, 04 Oct 2024 03:10:00 +0000
X-UUID: 1fb3921a81fe11efba0aef63c0775dbf-20241003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:Message-ID; bh=FCUbhenGMf5+wIxJ4JWL1bgoO1/T6c4+0JMhIL3Tzh0=;
	b=ulEN/OuimOcgB0b9XoKJLbkQyPoPM8fTE3lDVpnUMKVjr+dhtyra98dUNgbzdX55cq141b6cKj/MAJlT75yi2znK3E2jjV1LSeE2kFDAQngit8LIG5uYBXtZrWCRE1cVxtSN8i/MWpRoTcfmti+7XvvFlrZyfTqS6m3+C0MZmK8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7cbb8faa-55a4-4d84-9a0d-98eae9dd1ef4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:551cb864-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1fb3921a81fe11efba0aef63c0775dbf-20241003
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1110233560; Thu, 03 Oct 2024 20:09:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 4 Oct 2024 11:09:48 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 4 Oct 2024 11:09:47 +0800
Message-ID: <ced5e434-c2f8-9900-5a00-1808540ab2d7@mediatek.com>
Date: Fri, 4 Oct 2024 11:09:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: add adc and
 regulators for mt6359
Content-Language: en-US
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: Pablo Sun <pablo.sun@mediatek.com>, Alexandre Mergnat
	<amergnat@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, Sen Chu
	<sen.chu@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, Chris-qj chen
	<chris-qj.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, "MediaTek
 Chromebook Upstream" <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-pm@vger.kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>, Bear Wang
	<bear.wang@mediatek.com>
References: <20240925171156.9115-1-macpaul.lin@mediatek.com>
 <172731883694.2430476.10157265874067724564.robh@kernel.org>
 <bd6376df-baea-d29d-6b74-68d350cbf797@mediatek.com>
In-Reply-To: <bd6376df-baea-d29d-6b74-68d350cbf797@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.508200-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfgOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0qOGmN9nEzx3i2W7Y+Npd9RqWsZCJMnBwQmlwEyKUIIaFwpnAAvAwaz8Sd
	VWKPY/enHIiXypGH+EHXdOQc5s1eB9ZRkVakSSW2eAiCmPx4NwFkMvWAuahr8+gD2vYtOFhgqtq
	5d3cxkNeZmFbgdmZJSvU+7a+iFp4LJ+ob9w+Cdu3jDsGn4QLiDwUyMN90/km4=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.508200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BA7F69DBC496223544DAB2C3B492BC27F1AD1D744F94D11AD6B13F73221C96B02000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_200959_074155_EE7CEA99 
X-CRM114-Status: GOOD (  13.21  )
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



On 9/30/24 13:53, Macpaul Lin wrote:
> 
> 
> On 9/26/24 10:47, Rob Herring (Arm) wrote:
>>
>>
>> External email : Please do not click links or open attachments until 
>> you have verified the sender or the content.
>>
>> On Thu, 26 Sep 2024 01:11:55 +0800, Macpaul Lin wrote:
>>> Since MT6359 PMIC has been added as one of the compatibles of
>>> "mediatek,mt6397.yaml", the sub-device node of "MT6359 PMIC AUXADC" and
>>> "MT6359 PMIC Regulators" should also be contained in this DT Schema as
>>> well.
>>>
>>> This patch includes:
>>>  - add 'adc' property and $ref for 'mediatek,mt6359-auxadc'.
>>>  - add 'mt6359-regulator' to the compatibles of regulators.
>>>
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>
> 
> Thanks for the review. This patch will be merged into v7 patch of
> the conversion of
> Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml'
> 
> Thanks!
> Macpaul Lin
> 

Updated:
Since the nearly the final version patch of v8 of 
'mfd/mediatek,mt6397.yaml' is without adc, audio-codec, and regulator
of mt6359
([1] 
https://lore.kernel.org/all/20241001104145.24054-3-macpaul.lin@mediatek.com/),
a patchset v2 has been send.
[2] 
https://lore.kernel.org/all/20241004030148.13366-1-macpaul.lin@mediatek.com/

Thanks
Macpaul Lin

