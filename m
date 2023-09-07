Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B129AEE14D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 04:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/+fmgeuErAUmUURu6+eSlmaEzlVyX07VG9PJZuuB9c=; b=UbUUBci/Vzo1UJzuzbEQIndsbX
	G/t3+ly/VgQ7obO45R6kUkGwUTaF2VbHw2Nc2cGLPcppEr6ONpFYk49xCWhLq2yXx/e5+PegVlXln
	Jwm5jlCxam+4V4NxKS4csyOV5H02BwPI5tXdMiXlq8sasV1bu0Bv5YjTb/vg2ZqAHT5YfIjTY66lE
	m/J+1OnJExkmpVQxk4GSB/b9Z1AcoJ7LHM4RLm8IUqnZvkh1t4YkzD17wxTVVTDd4H/x1iLZXpHhD
	9/60pwr7hz/ouNVXWPqCRsl5SoVcD0hUkti4ivSDHbyu7ZgeiEp+/GOou5GqdyIIN5htjJ3H4bqxb
	1ZGwZBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe6JS-00BHj2-1i;
	Thu, 07 Sep 2023 04:08:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe6JP-00BHiN-2s;
	Thu, 07 Sep 2023 04:08:13 +0000
X-UUID: 23e436dc4d3411ee9b7791016c24628a-20230906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=C/+fmgeuErAUmUURu6+eSlmaEzlVyX07VG9PJZuuB9c=;
	b=CpwojtPiB3tOws/E2ouIFZZ+cakca/p/N3urbGAxdTPyH+EA+7zyr6oz2jv0lN9CMTJLQBUdybvM4tkN6QsT3qOHo1Zej/x3uOJtdi+aV3DrkKW9iXq9oMX2PMtjE4BqB99muPBxNrHRShc7he+G4hmc/vlqnHovoW81SsLGdPs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:3aaf24a2-cc41-45bd-9341-726148a25184,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:2fe43620-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 23e436dc4d3411ee9b7791016c24628a-20230906
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 709633573; Wed, 06 Sep 2023 21:08:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Sep 2023 12:07:33 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 7 Sep 2023 12:07:32 +0800
Message-ID: <8db8823d-8313-5515-78ca-effc8d6bc47f@mediatek.com>
Date: Thu, 7 Sep 2023 12:07:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: <frank-w@public-files.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sean Wang
	<sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-1-macpaul.lin@mediatek.com>
 <fbad941f-232b-9f56-5de3-98a16a8c4d89@linaro.org>
 <c3ddf00c-235a-2d23-db60-c998a67a3fcd@mediatek.com>
 <f343b6e2-6106-47eb-71cb-f391aff6cb7f@collabora.com>
 <50f7fbdd-8592-7a47-b2d8-a1af8ed93b92@linaro.org>
 <c951f693-b219-4745-be20-a8e1fee0099d@mediatek.com>
 <E3DEDA34-C203-4560-B07D-8BCB44204FF3@public-files.de>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <E3DEDA34-C203-4560-B07D-8BCB44204FF3@public-files.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_210811_936324_CC9BF8F7 
X-CRM114-Status: GOOD (  13.05  )
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



On 9/6/23 20:19, Frank Wunderlich wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> Can you please only target Reviewers/Maintainers and mailinglists reported by get_maintainers script?
> 
> I have only sent patches for mediatek and did some tests. So i'm not interested in patches for hardware i do not have here :). I guess i'm not alone...
> regards Frank

I'm sorry for bothering you and other contributors.
I've indeed run get_maintainers.sh script for these 2 patches.
Here's the result.

Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED 
DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN 
FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:3/4=75%)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND 
FLATTENED DEVICE TREE BINDINGS)
Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC 
support,commit_signer:3/4=75%,in file)
...
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 
(reviewer:ARM/Mediatek SoC 
support,commit_signer:2/4=50%,authored:1/4=25%,added_lines:1/12=8%)
Frank Wunderlich <frank-w@public-files.de> 
(commit_signer:1/4=25%,authored:1/4=25%,added_lines:1/12=8%)
...
[striped...]

You've contributed the similar percentage as Angelo for these files.
So I think both of you could be important reviewers.
I'll try to skip contributors who add lines less then 10% next time and see
if this will help.

Thanks!
Macpaul Lin

