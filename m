Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7385EE498D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3tHF/N//EGXGgamdyyH/gK3cs5Dqc/2JBLeUZVd4RM=; b=rN4BSOGVTAzMMu/7MhkwJ12eOr
	vA0xx65Doq3NiX7LHnJMGQ9olYwUPATrnZEC6nXQ4bmniyvQ7vpaDWFrAvehcMdx7va/9hR3awum2
	sPM5Mb3aLXDhO7WK5jTNmK/A4BZEtVQ+ngOHDnxmdHYJWW8b6tk71DDWoXapY52fcQdtPzOIHDVyL
	iuo1nEDY+nX80JcEXyfbo5qVFoO5NGJvlVDPYusvlJEZ03qPcTGYBEd2CovBssnqcJqvGZRRKbFly
	uwqxvGS4uG5cVCMwTvvEPYW8x3m3Mp3z+2MJj/IzCqhb3V8w1HNxHTMkZ/kqOAEOVGccT7w7kA/mw
	d1h7pEOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKhj-000000096pv-3onn;
	Wed, 11 Sep 2024 10:36:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKhd-000000096oz-3WcO;
	Wed, 11 Sep 2024 10:36:06 +0000
X-UUID: 9f7a5d30702911efb3adad29d29602c1-20240911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=i3tHF/N//EGXGgamdyyH/gK3cs5Dqc/2JBLeUZVd4RM=;
	b=Mh77mlR6TAlSV+4bbsyowC5OLbsmjdXzGXXBQV5fBI6RkmBCt8lRt5Hpm0EYzt9UmDOJ8NnNb51U2mc7TyXU6YDuXyrAOcUe6zFe+iBgRyHSAG0HU4CSrG5rdxLofK+zu9mNz54/L4QCW9OgiYTHS48OjJdzuLVA/+U3vleYEVE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b3fc8625-6b97-4345-b1dd-84363153c504,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:75bc0ad0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9f7a5d30702911efb3adad29d29602c1-20240911
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1646439091; Wed, 11 Sep 2024 03:35:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Sep 2024 18:35:51 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 11 Sep 2024 18:35:50 +0800
Message-ID: <2fd45240-a341-806b-f336-78d0595a8031@mediatek.com>
Date: Wed, 11 Sep 2024 18:35:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable GPU
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20240910143245.5282-1-pablo.sun@mediatek.com>
 <01020191e04d4237-204596e1-6cc1-491c-a60f-de3917af7d42-000000@eu-west-1.amazonses.com>
From: Pablo Sun <pablo.sun@mediatek.com>
In-Reply-To: <01020191e04d4237-204596e1-6cc1-491c-a60f-de3917af7d42-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_033601_913357_6D8DE98D 
X-CRM114-Status: GOOD (  16.71  )
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

Hi Angelo,

Thanks for the review,

On 9/11/24 16:57, AngeloGioacchino Del Regno wrote:

[snip]

>> +/* for GPU SRAM */
>> +&mt6359_vsram_others_ldo_reg {
>> +    regulator-always-on;
> 
> No, that's not good. Like that, the GPU VSRAM will be subject to current 
> leakage.
> 
> Remove the regulator-always-on property.
> The right way of doing that is to add the vgpu to the mfg0's domain 
> supply and
> vsram to mfg1; that way all of the GPU regulators will be off at PM 
> suspend time.

Thanks for pointing this out, I'll send v2 to fix this.

>>   &mt6359codec {
>>       mediatek,mic-type-0 = <1>; /* ACC */
>>       mediatek,mic-type-1 = <3>; /* DCC */
>> @@ -839,8 +851,8 @@ regulators {
>>               mt6315_7_vbuck1: vbuck1 {
>>                   regulator-compatible = "vbuck1";
>>                   regulator-name = "Vgpu";
>> -                regulator-min-microvolt = <300000>;
>> -                regulator-max-microvolt = <1193750>;
>> +                regulator-min-microvolt = <546000>;
> 
> I'm okay with this constraint but are you sure that MTK-SVS won't go any 
> lower than 0.546V?

I'll see if I could confirm the maximum voltage drop that may be lowered 
by mtk-svs for MT8395. There are 3 constraints that I am aware of:

- capability of Vgpu buck: 0.3V-1.193V
- sign-off voltage of the EVK board: 0.6V to 1.2V
- recommended operating voltage of MT8395 DVDD_GPU: 0.546V to 0.787V

For the device tree of the board, would you recommend set the regulator 
voltage constraints in narrower range (because it's safer to keep in 
recommended operating conditions), or in a wider range (leaving the 
check to driver software for potential power saving?)

Thanks



