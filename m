Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD44CED628
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LfpGNkuO2alufeBmISrE7AJMEJiCLM0oNn5nvXUP1U=; b=aZc5kf+7ICXtGgGsfBwPrp9128
	6Y3H93jEBpupu5BEnVSa7JkGYu54YYgcw0mmtOtkmfELOiv+TGrXjm1YJfjJNpKebuce6uVBOAsO6
	bHQpj9gCTHE4JzXNHfPwk5qTgE/yB3STZCFmQDGq+NGLCy/9RqhqmkRy4GdQZpgngZtnbV9TSlMEj
	7BCNkyfYUK4WPtvezQG2NEusQoQCy2UYGV8SFO/n4GTNG0Idz6HJda9Y/mKC+iD0j6b20wrzsAbcX
	bQ3/rfDknwd7nv/gbA0qxsDI5WNrZimM5mppico4erJ0rY4JkxnRicmofk1bY+BaJmFNMufEBWduB
	h6fXDm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sySOZ-00000008Y11-30zY;
	Wed, 09 Oct 2024 08:50:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sySOX-00000008Xzj-0Reb;
	Wed, 09 Oct 2024 08:50:10 +0000
X-UUID: 7af20802861b11efb3adad29d29602c1-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=/LfpGNkuO2alufeBmISrE7AJMEJiCLM0oNn5nvXUP1U=;
	b=nHEJYzG3p1perhQucYhdmsSwfqU58HBvMKFJDvKC6XsW62S2fvSSOkeGUMcjIgWbFvq58DqI1sQbjnoeukarXM8kSvmPHWWIU3cY3NOmD6n0ppHONoPd1CsoLW52Bew7X0uvwW53Dl/Dw8OQbtNRXCIGntHev11vSkVlhXOCypg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a636c3a4-1754-411e-8234-91938f444a1e,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:8e9a8726-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7af20802861b11efb3adad29d29602c1-20241009
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 214667915; Wed, 09 Oct 2024 01:50:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 16:50:02 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 9 Oct 2024 16:49:59 +0800
Message-ID: <f1bb941b-cb6d-32c4-2cf9-268fc3f43bf9@mediatek.com>
Date: Wed, 9 Oct 2024 16:49:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix dtbs_check error for
 tphy
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Jieyy Yang <jieyy.yang@mediatek.com>, Jian Yang <jian.yang@mediatek.com>,
	Jianguo Zhang <jianguo.zhang@mediatek.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Seiya Wang <seiya.wang@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, "Bear
 Wang" <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, "Macpaul
 Lin" <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, Chris-qj chen
	<chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
References: <20241008053514.6800-1-macpaul.lin@mediatek.com>
 <CAC=S1ngrsDxQ1Fe9xB_EevGbGB5nDoCB_n2oGb2VTLiv1vSsGA@mail.gmail.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <CAC=S1ngrsDxQ1Fe9xB_EevGbGB5nDoCB_n2oGb2VTLiv1vSsGA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.653400-8.000000
X-TMASE-MatchedRID: zGP2F0O7j/sOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0rfEt9Ay9zO7pE4FU2ZdQO4T7jCYv2QJPH7At+An9uo8zRCaZSKE/Os9BQ
	FWu9qPYbJcca6gmWU8Q8A0V8fZwPWVCAsGbzzwDfAJnGRMfFxyfioIsi7Sa0gs1qWTOOMIESRnE
	JOP6CIAvHyC+k6/enwJpJr7UBzLQgYB2fOueQzj4MbH85DUZXyseWplitmp0j6C0ePs7A07Xi4X
	EoPXecxAS0b2iWUgNy5tnIQjFqyCaZjfvjrnrJ4+Y9PUywXU4g=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.653400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9BD4915CE2DEFF6750EBB7161EA9A6CC18A176270AFFF248F20032925B0E03892000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_015009_173623_E82F2F45 
X-CRM114-Status: GOOD (  13.14  )
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



On 10/8/24 15:10, Fei Shao wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Tue, Oct 8, 2024 at 1:36 PM Macpaul Lin <macpaul.lin@mediatek.com> wrote:
>>
>> The u3phy1 node in mt8195.dtsi was triggering a dtbs_check error.
>> The error message was:
>>   t-phy@11e30000: 'power-domains' does not match any of the regexes:
>>     '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
>> Fix this issue by dropping 'power-domains' of u3phy1 node.
>>
>> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
> 
> Apart from this, can you or Chunfeng confirm if we should make a
> similar change for MT8188[1]?
> 
> [1]: https://lore.kernel.org/all/20241004081218.55962-3-fshao@chromium.org/
> 
> Regards,
> Fei
> 

According to the suggestion and discussion in

[1]: 
https://lore.kernel.org/lkml/20241008-disorder-slacking-d8196ceb68f7@spud/T/#mccf978d76f52cc26970f3f3be6120055e4698fe6

I think adding 'power-domains' to PCIE node of MT8188 is okay.

Thanks
Macpaul Lin

