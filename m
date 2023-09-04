Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AE6C71153
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDcVkHt0PgOyyDOoExjE+TeYuugV9WTIUjuLd6MGDyg=; b=JlHtBnQM0fdTNReykt6rR1wiE4
	40anALuvoX1wV4IQUHq0kTt7u75pCRXiIMjW3YceJ04v6ZkPZxPyraHbJ80L1s+A3dbdl+Mkl1lN/
	ngLVyI2IkoWwI8dhcnloSwy43L54HVUt1PPOEl0Xk/rz+b3QnplInVqfAX9ZmpP9A8G1WwzQkv9sP
	niXEX5khOw+CPxED3edVndQUKXaoOu+Cd8BBRKDq8YWa3leN776/M42u9hdvzf/ecSt6QdIXX6O6X
	gkvM9LS/CnztHxGEo8ajEKT1kLDevVV8+tr/YyeprzfOq4kaszS/osAPNLj1DjctoYxFunsTpHw10
	302PvJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd6EL-003hoT-15;
	Mon, 04 Sep 2023 09:50:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd6EI-003hnt-1w;
	Mon, 04 Sep 2023 09:50:47 +0000
X-UUID: 82c6fa284b0811ee9b7791016c24628a-20230904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=pDcVkHt0PgOyyDOoExjE+TeYuugV9WTIUjuLd6MGDyg=;
	b=GxzsFXWXOCMWi9zBfbTxmpjGlIEVIEiwC1jgnV33zN5mhITHMwT+ReosEUxbq5ZLvxj9NYb2bdjabCqTEH1hjr4cGZ4n3jDbTtjrGk47GW6lVmblmtWiZtVy9+bMXwoVsZrYB+XuXnA+Wer/lYoIMX7zUBho1T2eSbO2z3tQA04=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:d0e4dca5-d898-4862-8294-ec52135daec2,IP:0,U
	RL:0,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:3
X-CID-META: VersionHash:0ad78a4,CLOUDID:f2179ec2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 82c6fa284b0811ee9b7791016c24628a-20230904
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1651232833; Mon, 04 Sep 2023 02:50:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 4 Sep 2023 17:50:05 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 4 Sep 2023 17:50:03 +0800
Message-ID: <00f0a1cf-6246-92e9-13b0-cf31bb292a94@mediatek.com>
Date: Mon, 4 Sep 2023 17:50:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8395-evk
 board
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Frank Wunderlich
	<frank-w@public-files.de>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?=
	<bero@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <e2e35d4d-7853-fccc-28c2-b8ecf309d6ec@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <e2e35d4d-7853-fccc-28c2-b8ecf309d6ec@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_025046_653242_B6127C71 
X-CRM114-Status: GOOD (  13.86  )
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



On 9/4/23 17:33, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 04/09/2023 11:20, Macpaul Lin wrote:
>> Add bindings for the MediaTek mt8395-evk board.
>> The mt8359-evk board is also named as "Genio 1200-EVK".
>> MT8195 and MT8395 are the same family series SoC could share
> 
> How can be the same and have different numbers? You sill need dedicated
> compatible.
> 

The SoCs mt8195 and mt8395 are designed for different market application 
and physical characteristics, using different efuse values for 
distinction. The booting flow and configurations are controllered by the 
boot loaders, firmware, and TF-A. Therefore, the part numbers and 
procurement channels are different. The detail information of these 
efuse values is proprietary, so I cant disclose it futher. Hence the 
most of peripheral drivers and base address are almost the same.

> 
> Best regards,
> Krzysztof
> 

Best regards,
Macpaul Lin

