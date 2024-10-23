Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B05ED2E01B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 06:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LlyPax/7pZTsDzzT62rFA+njlFCuzS51AjASbHBcXQ=; b=1JEdWuX7McKGfefiFaHw1o8mTm
	g8OGWkoZWlRHFKMQmAPvLjTtmrSUeNKFgpN4UWjNM+TNxiJ3y6NrFbsf/xrp9f0luJkMo/fsln8LX
	OmegS1u6Pv8lv4T+RJgMTHzViCCjIVKFVypDxYB7mjZBxsMz4NWFnWpo+xEtnaKK9g3uQb14aCUr+
	1V2VmmMQYTAiMtG+APJROU9/yGMPpQOxWLH24zAV/rlPiHDBQ5q0huE4xiwMEpu6zKUY1RGSPfZ0f
	5kWQpSTVonkus5NTDqmSpgQkkDg3uLmS6Ba7bp81zKo9Szwwam7rHV7GAcRFuL03/QbVwstY3QQzs
	5ZIote7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3V6w-0000000DF5c-0cHI;
	Wed, 23 Oct 2024 06:44:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3V6s-0000000DF3b-41YJ;
	Wed, 23 Oct 2024 06:44:48 +0000
X-UUID: 475d6b68910a11ef82ff63e91e7eb18c-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:Message-ID; bh=/LlyPax/7pZTsDzzT62rFA+njlFCuzS51AjASbHBcXQ=;
	b=FuDrhIy5dSp5HmVbFRIwY5+QEpy5W3536QpetOkAK3rgvIjkoOe4DfbjDgithFBXruB4lONL3CVz5UNxVEEObHBBH0tBhmPPp+O0dc+xMyezc3LqeJaeC4PBJAJFSXiOXQ3jQ7nCMQTLZbXKsJIhyzza170b1nLmkSJeI5wodvc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:f3677a0d-8e49-4b36-9ee8-daa5376d3879,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:b0fcdc3,CLOUDID:c72dbacc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 475d6b68910a11ef82ff63e91e7eb18c-20241022
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 484224543; Tue, 22 Oct 2024 23:44:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 14:44:33 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 23 Oct 2024 14:44:32 +0800
Message-ID: <7db67825-cd14-8085-081d-90f090804724@mediatek.com>
Date: Wed, 23 Oct 2024 14:44:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8195: Fix dtbs_check error for
 tphy
Content-Language: en-US
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Seiya Wang <seiya.wang@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>, Jian Yang
	<jian.yang@mediatek.com>, Jianguo Zhang <jianguo.zhang@mediatek.com>, "Jieyy
 Yang" <jieyy.yang@mediatek.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, "Chris-qj
 chen" <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
References: <20241008071540.32607-1-macpaul.lin@mediatek.com>
 <e9277edf-d372-4a8e-881c-49a907f0a883@collabora.com>
 <314aafed-5903-2478-971f-59870b8ac5fa@mediatek.com>
In-Reply-To: <314aafed-5903-2478-971f-59870b8ac5fa@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.693900-8.000000
X-TMASE-MatchedRID: 6otD/cJAac0OwH4pD14DsPHkpkyUphL9Wot5Z16+u76+UkTh6A/Dwdno
	quRwHY3BkAluVYknZHpbzVVgo9RtXiA1dgOjatGGXP5rFAucBUHnpmIrKZRxTs/PM4nfEDArIyZ
	NTlgT7qnRLHyi43Gvn5VYfV6rzvhfRyV3gdKbiKMpa6LJktEjgPioIsi7Sa0gUUVrdcYJZJ0sgd
	kHScxUMZKrGRECKhSOExCEFq1jOnsTY/HRCFabdLU+IyHhkXf1f2g6KJZtxl2YBF1C0J2QPuuYG
	VimV8axiI8t/Y95trJ7nZmSglxg9i1Wsi+5O6JcJQI+kfsRJdqeimGtNywjtpsoi2XrUn/Jsuf7
	RWbvUtyrusVRy4an8SAHAopEd76vRgZ0es9KU/RKAyF67tDyvJxdMmyRqn9gNXm9bRYGgkKW0XD
	zeoW8Rw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.693900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C810F8B9D87195458A9F7EFB21E49AFFF30BA1B0E50E32FA1B6818C4E7A366842000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_234447_044780_78F59B9F 
X-CRM114-Status: GOOD (  16.54  )
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



On 10/9/24 17:21, Macpaul Lin wrote:
> 
> 
> On 10/8/24 17:09, AngeloGioacchino Del Regno wrote:
>> Il 08/10/24 09:15, Macpaul Lin ha scritto:
>>> The u3phy1 node in mt8195.dtsi was triggering a dtbs_check error.
>>> The error message was:
>>>    t-phy@11e30000: 'power-domains' does not match any of the regexes:
>>>      '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
>>> Fix this issue by dropping 'power-domains' of u3phy1 node.
>>>
>>> This is because MediaTek tphy dose not need to add mtcmos.  It is not
>>> necessary to add 'power-domains'. If the power of the tphy is turned 
>>> off,
>>> it will affect other functions. From the current USB hardware design
>>> perspective, even if mtcmos is added to the phy, it is always on.
>>>
>>> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and 
>>> evaluation board")
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
> 
> Sorry for bothering, it seems MediaTek internal still have some
> discussion about according to Conor's suggestion:
> 
> [1] 
> https://lore.kernel.org/lkml/20241008-disorder-slacking-d8196ceb68f7@spud/T/#mccf978d76f52cc26970f3f3be6120055e4698fe6 
> 
> 
> Please don't to pick this patch until if MediaTek could have some
> conclusions.

Update: This patch could be dropped since the correct fix in
TPHY's DT Schema has been accepted.

[2] 
https://lore.kernel.org/all/172917936283.288841.9548294790735623997.b4-ty@kernel.org/

>>> ---
>>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> Changes for v2:
>>>   - Add detail description of the tphy design for explaining the reason
>>>     of this change.
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi 
>>> b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> index ade685ed2190..1c6f08dde31c 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> @@ -1920,7 +1920,6 @@ u3phy1: t-phy@11e30000 {
>>>               #address-cells = <1>;
>>>               #size-cells = <1>;
>>>               ranges = <0 0 0x11e30000 0xe00>;
>>> -            power-domains = <&spm MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
>>>               status = "disabled";
>>>               u2port1: usb-phy@0 {
>>
>>
> 
> Thanks!
> Macpaul Lin

Thanks!
Macpaul Lin

