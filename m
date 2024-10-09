Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC751CED254
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/5+Sddg3H+O4oysQuhNA4Lmgxc5WiB96rQ7dFLcGlc=; b=LVuPyrSXDsFet/SXEmFUnQ+X/+
	/7TBLPWm4OOxZQ+b4zinHmL/M4YUse6rrw1Nv9GVn4WP1gWcIQPF283gL8k9wxYTu4TY+A4qdHpan
	H8+g6vRvMZ85PsrTizsng/s558IKMsUA2uMrT/2cckAJjHrrxd7oZPjw8jaKUJsMfI3w8giaSvPvm
	09kTJ9+xIH0Mi4Qi5tsqVFJjYFhvAeClEH3AVgVwKCF51rxA82igEmC1vK7R5Q0eF6kIxdGxh5Hf1
	Rquqr8SKjBLWf0YmSowT9PHmjgJgONJH6JyuL18G0/I0pTrytQ6NsaGuOyccvFBoneEVt9PcCDJnd
	L+oNO7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syStV-00000008egX-2jgI;
	Wed, 09 Oct 2024 09:22:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sySsj-00000008eRz-2GWS;
	Wed, 09 Oct 2024 09:21:23 +0000
X-UUID: d7c10e94861f11efba0aef63c0775dbf-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=x/5+Sddg3H+O4oysQuhNA4Lmgxc5WiB96rQ7dFLcGlc=;
	b=F8WlZO7vFeQpo70sDfkUfQYtNG+x4NobK5oN1NWw0Cr3XJuWaIw3ldBESMCXVPwHdUjQIG3Dcz9Tm9gJcOtAzN5FlXNxyJUpOPz/ThtfpCF4If9zMjYcZ/w5UYuPNSj5OwTqIp04JUoXHFmy2Yjf5zTyUochgRpEyYQMk+1AOxQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3aa252b6-09a1-406a-9a18-9ebb5cb1d735,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:2418ff40-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: d7c10e94861f11efba0aef63c0775dbf-20241009
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1105368350; Wed, 09 Oct 2024 02:21:19 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 17:21:15 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 9 Oct 2024 17:21:14 +0800
Message-ID: <314aafed-5903-2478-971f-59870b8ac5fa@mediatek.com>
Date: Wed, 9 Oct 2024 17:21:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8195: Fix dtbs_check error for
 tphy
Content-Language: en-US
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
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <e9277edf-d372-4a8e-881c-49a907f0a883@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.120500-8.000000
X-TMASE-MatchedRID: VfovoVrt/oYNtKv7cnNXnSa1MaKuob8PofZV/2Xa0cK+UkTh6A/Dwdno
	quRwHY3BkAluVYknZHpbzVVgo9RtXiA1dgOjatGGXP5rFAucBUHnpmIrKZRxTs/PM4nfEDArIyZ
	NTlgT7qnRLHyi43Gvn5VYfV6rzvhfRyV3gdKbiKMpa6LJktEjgPaS52LUPfcSUUVrdcYJZJ0sgd
	kHScxUMWUQAwDxYVxG1S+wyEMlXe8HTXUunEyzWGwbuvhCHs3cfLPKYyLDlAffUZT83lbkEBHxr
	RblSw8bLPQ+pa7MIVkfZdczzDm/ur9ZdlL8eonaVnRXm1iHN1bEQdG7H66TyH4gKq42LRYkUK59
	MjR9wrsi5A4ICRHaqPCJJCAkXsc/RHeQpqAFdaB+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.120500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 62E55BFEEA33CD37E8BF54AEA8EB2CAABBF29006B944BE04D6245EF911B536242000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_022121_641973_02523DEC 
X-CRM114-Status: GOOD (  16.87  )
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



On 10/8/24 17:09, AngeloGioacchino Del Regno wrote:
> Il 08/10/24 09:15, Macpaul Lin ha scritto:
>> The u3phy1 node in mt8195.dtsi was triggering a dtbs_check error.
>> The error message was:
>>    t-phy@11e30000: 'power-domains' does not match any of the regexes:
>>      '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
>> Fix this issue by dropping 'power-domains' of u3phy1 node.
>>
>> This is because MediaTek tphy dose not need to add mtcmos.  It is not
>> necessary to add 'power-domains'. If the power of the tphy is turned off,
>> it will affect other functions. From the current USB hardware design
>> perspective, even if mtcmos is added to the phy, it is always on.
>>
>> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and 
>> evaluation board")
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>

Sorry for bothering, it seems MediaTek internal still have some
discussion about according to Conor's suggestion:

[1] 
https://lore.kernel.org/lkml/20241008-disorder-slacking-d8196ceb68f7@spud/T/#mccf978d76f52cc26970f3f3be6120055e4698fe6

Please don't to pick this patch until if MediaTek could have some
conclusions.

>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> Changes for v2:
>>   - Add detail description of the tphy design for explaining the reason
>>     of this change.
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> index ade685ed2190..1c6f08dde31c 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> @@ -1920,7 +1920,6 @@ u3phy1: t-phy@11e30000 {
>>               #address-cells = <1>;
>>               #size-cells = <1>;
>>               ranges = <0 0 0x11e30000 0xe00>;
>> -            power-domains = <&spm MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
>>               status = "disabled";
>>               u2port1: usb-phy@0 {
> 
> 

Thanks!
Macpaul Lin

