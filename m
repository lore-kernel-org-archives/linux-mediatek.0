Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DD3EE57CD
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Sep 2023 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oh56dyKv5P1xDKcNG6dbZIisA+qo2c3kNUaZRn1mo3U=; b=qZNDV2mmWzYJ61ysrwm/QpLN3e
	qIQ9JDLfiQ8Ymvel/coK6FV7vFxCCfzl/7pg0zA9A7uctW3F3nHjKQi847NA22NudJvvIxHYIT3aE
	RchpJS7vcSlNtAwEhfsQj1SV2LOuzXiPSw5QE0aKW1DEEGaJ2bIgDi5Kx9jGokUiRzHbskjJjrNTu
	TBSaBaol0PlIErcAwuwvs+Jk0s9L8Llm5KvIgGQJOfACuFXfFw2whOUT5k7RGQFzLDoj2r7oGR0lh
	g8nHuozAIA5bVAzg3zDxwwG35ZLsDUg4Ik0oMzXlEYxlfn4wEkyLTV/3wo31reWWl6NEa6ICf1WuY
	XjsvP++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJY2-00Gaf2-0E;
	Sun, 10 Sep 2023 12:28:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJXy-00Gaeb-2r;
	Sun, 10 Sep 2023 12:28:16 +0000
X-UUID: 7fa86b984fd511ee9b7791016c24628a-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=oh56dyKv5P1xDKcNG6dbZIisA+qo2c3kNUaZRn1mo3U=;
	b=SLDEkVUTxpjxMJcZB21TXGodsTKSE5rkVJlCgVr4S+glm1uLBzDoEzCZYegQjh5lOfcLnw/vE/rGfpXjs3UXujp9rkyfHe858QY1gxXX3WbMdmpBnExpTScl1M1ROZ0Vtin8DvOrOknPh9jI8cjPP1DTDWDZ6zFHEaQGVHq6960=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a3439bdb-0039-4feb-ac63-8807bd888239,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:394a85ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7fa86b984fd511ee9b7791016c24628a-20230910
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 369600672; Sun, 10 Sep 2023 05:28:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 10 Sep 2023 20:07:29 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Sun, 10 Sep 2023 20:07:28 +0800
Message-ID: <12bdd17a-98f4-5551-4253-229dc36f0c77@mediatek.com>
Date: Sun, 10 Sep 2023 20:07:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: arm64: dts: mediatek: add description for
 mt8365-evk board
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>
References: <20230910062852.15415-1-macpaul.lin@mediatek.com>
 <f8864242-daa1-e72f-4759-aac3fa1bbcf2@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <f8864242-daa1-e72f-4759-aac3fa1bbcf2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_052815_260070_218B155A 
X-CRM114-Status: GOOD (  12.10  )
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



On 9/10/23 17:09, Krzysztof Kozlowski wrote:
>> +      - description: MediaTek Genio 350 Boards (Genio 350 EVK)
> 
> That's a bit confusing. So all of the boards here will be Genio 350 EVK?
> I don't get what is the point of this description.
> 
> 
>> +        items:
>>            - enum:
>>                - mediatek,mt8365-evk
>>            - const: mediatek,mt8365

Thes boards with compatible 'mediatek,mt8365-evk' is indeed used by
Genio 350-EVK, which Baylibre helped to do upstream tasks. The only 
production version of hardware will be available on the market. The 
derived version of customer's hardware is not available yet.

The separate patch for renaming mt8365-evk.dts file should be send next 
week for aligning the naming rules.

Thanks
Macpaul Lin

