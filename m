Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46E0EB8FAF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 11:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52E412ODifuzDOHdYgLGCZhv8rQa4JIlCqlA9ZnKBJs=; b=2+zO25yF5isCD2uh/7OEMaacoi
	knIZvbvdOfGwZnjimRBu/oqkb0VBAhrFYjaQfeYoPMnLlapOYGgUHWsOiD34pXmNd2SyEoTeKUlv6
	9RvVsTWFsekDpRURWKXz8+FlexL2sTed2szAfb+M2UXHtgQwdy+mzS3FMVj9N3S/nAG0yayF4Vooh
	MRQyBREjDxZNNiC/P4U1wcqLde3H1b8PHMcw9UnCDYVnrVnFcbuqyYX4Qg6xuMkW9LsOtC5/5zPOZ
	jBJdROFQgyJFrX/E1ePsTgA7oz18gDx/G+IQqkgW4VyQkin+rbBLrT5469V5SnGMjDzq/Tgwpbwwt
	dd9QrqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdr2C-008zRK-1B;
	Wed, 06 Sep 2023 11:49:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdr29-008zOu-0U;
	Wed, 06 Sep 2023 11:49:22 +0000
X-UUID: 696baa3e4cab11ee86758d4a7c00f3a0-20230906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=52E412ODifuzDOHdYgLGCZhv8rQa4JIlCqlA9ZnKBJs=;
	b=IZYVBI9Shkjttp75FFilqlGWq9G/NCDCH23vuNjYxKGZ2xFyYzDeQxH/b2fJnlom+eFA1ilCEAqrhbIYQx7chUrPqXWUcr/hMnWXA+bSqIEzMwFwakzyXWXokaHUrqnQZmX38TcaTkGX2aJZSgYt4JMTLX0ol2psBn+JdXTzAU8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:f2163bc6-8aa4-4e9a-9ea4-85921d54dbed,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:2f5c3020-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 696baa3e4cab11ee86758d4a7c00f3a0-20230906
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 382159673; Wed, 06 Sep 2023 04:49:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Sep 2023 19:49:15 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 6 Sep 2023 19:49:14 +0800
Message-ID: <10cbb316-b08b-a8c1-87dd-00e6ad2aeb7a@mediatek.com>
Date: Wed, 6 Sep 2023 19:49:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add device-tree for Genio
 1200 EVK board
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
	Macpaul Lin <macpaul@gmail.com>, Ben Lok <ben.lok@mediatek.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-2-macpaul.lin@mediatek.com>
 <2cb8069a-976b-0af4-a427-1e63ba4e7870@linaro.org>
 <951e34bc-dda3-f9d4-b251-7f0fd02052ee@mediatek.com>
 <145f9a3e-af61-c62f-1752-2abb7663d7a3@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <145f9a3e-af61-c62f-1752-2abb7663d7a3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_044921_219378_A1F017EA 
X-CRM114-Status: GOOD (  17.55  )
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



On 9/6/23 18:20, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 06/09/2023 12:15, Macpaul Lin wrote:
>>>> +
>>>> +wifi_3v3: wifi-3v3-regulator {
>>>
>>> This is a friendly reminder during the review process.
>>>
>>> It seems my previous comments were not fully addressed. Maybe my
>>> feedback got lost between the quotes, maybe you just forgot to apply it.
>>> Please go back to the previous discussion and either implement all
>>> requested changes or keep discussing them.
>> 
>> 
>> This keeps a format with -regulator is because I've found some other use 
>> cases. It seems "-regulator" or "regulator-" could be arbitrary. I'm not 
>> sure if it is a new guideline for regulator's node. If there is in the 
>> devicetree document, maybe I just missed it?
> 
> What is the point to name in the same DTS some of the regulators
> "regulator-foo" and some "foo-regulator"?
> 
> Best regards,
> Krzysztof
> 

It looks like I've miss the point of previous review comment.
Updated new patch in v3 series.

Thanks
Macpaul Lin

