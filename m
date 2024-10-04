Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716E7CFA769
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg57b2C8DB3sjeiJUSQURXizNpt/OycVgwR/X0Z5Pt4=; b=FKvw1a0ElyeyPOfktsdvAupGXe
	X7+M9BCzdxtGt2bIAOEEHJa3Ona+OUrm1t+51mnDYhbdKMWQt3oTBI/3UtfiO2uPJxWo39WRvB+0F
	hMlCMn4tuIFL4T26lBmgp/UOng3AZOvl2vdP4D7OlhJCO5my0AL4vcoMPFNsyuGMQvKC28r/r0Qta
	xCQgEipKbd2bzuSI5z+LJ0FPaMod/yK7YgmmMynHU8/U5S7jOWO01CK6S0f8eRtwq20mRlgwccNSU
	m8k7FTGgsWKZKVags6LPYOncv2nzsUGfXjX82pzcIm+0HBayL4uZAXL+QohmaV3VgrN/ywjpc5Hra
	lGWG8SIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swgJZ-0000000C4Ii-1oP4;
	Fri, 04 Oct 2024 11:17:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swgB6-0000000C1Sk-0YaG;
	Fri, 04 Oct 2024 11:08:57 +0000
X-UUID: 092e213e824111efb3adad29d29602c1-20241004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=Rg57b2C8DB3sjeiJUSQURXizNpt/OycVgwR/X0Z5Pt4=;
	b=fvoXmcewBUYl/9P/erl4TFyRotvP8gssBISM6N4a8s1EcsUYF2JrIVUQKc/vzqyOUxvwEHukJZO4jszPt2UXhDKmHhZQJSH7KimWerq4ndYQTpL+Vk0ZC2oUy2YfHmm1V5aBBiJAtDNDOQTIRv+E42JqnR/Khhf5xnhm8P+AkcA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e0c07f69-3008-4a36-ba2d-25881ffa2a1b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:3615bf64-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 092e213e824111efb3adad29d29602c1-20241004
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1364482962; Fri, 04 Oct 2024 04:08:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 4 Oct 2024 19:08:48 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 4 Oct 2024 19:08:48 +0800
Message-ID: <0aa5a003-46d5-4dc7-c720-c847cae95f65@mediatek.com>
Date: Fri, 4 Oct 2024 19:08:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 3/6] dt-bindings: nvmem: mediatek: efuse: Reuse
 mt8186-efuse in mt8188
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
 <20241002022138.29241-4-pablo.sun@mediatek.com>
 <mh7upw2y2dclyosved3chw7chpqgdg4a3j5ftwftfhm6v5uqpt@cotoeuopfbqg>
 <559fc2a5-631c-440a-812f-2907f84b16b4@collabora.com>
 <20241002211130.GA1316112-robh@kernel.org>
From: Pablo Sun <pablo.sun@mediatek.com>
In-Reply-To: <20241002211130.GA1316112-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_040856_239872_C617478F 
X-CRM114-Status: GOOD (  18.61  )
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

Hi Rob, Angelo, and Krzysztof,

Thanks for the thoughtful review, I'd like to follow-up on
Rob's comment:

On 10/3/24 05:11, Rob Herring wrote:
[snip]
> > > diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > > index 32b8c1eb4e80..70815a3329bf 100644
> > > --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > > +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > > @@ -39,6 +39,10 @@ properties:
> > >                 - mediatek,mt8195-efuse
> > >                 - mediatek,mt8516-efuse
> > >             - const: mediatek,efuse
> > > +      - items:
> > > +          - enum:
> > > +              - mediatek,mt8188-efuse
> > > +          - const: mediatek,mt8186-efuse
[snip]
> 
> What about all the other efuses? The fallback needs to be a subset of
> the 1st compatible.
[snip]
> 
> No, but any fallback seems seems a bit odd here. It's one of those
> things that's going to change with every chip.

I think you all agree that the common fallback "mediatek,efuse" should
not longer be used, and such deprecation should be commented both commit
message and the YAML, same as "rockchip,rockchip-efuse" in rockchip-efuse.yaml.

But, Rob has mentioned that I should only define a fallback
if and only if mediatek,mt8186-efuse is a **subset** of mediatek,mt8188-efuse.

It is true that I can merely confirm that they share the same "GPU speed bin"
efuse bit definition and conversion routines.

At this moment I cannot confirm:

- mt8188 has every efuse cells mt8186 defined.
- Every mt8188 efuse cells values must be interpreted the same as mt8186.

So, I don't think mt8186-efuse is a subset of mt8188-efuse in this sense.

Do you think it would be better that we re-use this GPU speed bin conversion
in the eFuse driver implementation, rather than reuse it in the dt-binding?

This is also what Angelo suggested initially for v2 modification.

Many thanks,
Pablo

