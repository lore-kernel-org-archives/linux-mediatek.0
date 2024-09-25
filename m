Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53716C369A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 08:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Do3ooaQZNXtQMdr7rWT9aLKM/O1qU46ww0/Lu6tZOpU=; b=E7bTPY1IsFHUOIoiSiYe7QPHGz
	ihS5GYXR6GQtv+EuKcXX2LUo/Dr9HuDVui+1tYaXxg5v8PmT2RQ/b2fIBH6ZZykk4zX+PIQA/gCFe
	fQEmhVomJIcUhsvtwwDNtT+ObV1VjIxHo3BAxkqKpU6gE/1TbqABZtpKafjWyqeghXSG4IWR4veJR
	O3y7mIUtlq4+AZJooQI4mVqtuw0qfqgGNQ/MuJqq07GWEcgAzrVtrZ8/kZggiBkczGnxZ6WFSvsLM
	LG3Prz7GPI+TATwE9s2Xydsqz3xIJaw0tEA/fDjxEJR5ZjlrOlGJhv4dios79xI0jQyEekNjQtDI6
	SpHae0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMxf-00000004Qgs-19t2;
	Wed, 25 Sep 2024 08:01:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stMtI-00000004PlQ-1giq;
	Wed, 25 Sep 2024 07:56:53 +0000
X-UUID: b6c78fd67b1311efba0aef63c0775dbf-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=Do3ooaQZNXtQMdr7rWT9aLKM/O1qU46ww0/Lu6tZOpU=;
	b=eolPzsRX6ymMk2kChZd9SCjYjnvogbJzAwU0QHzz+CsFsgdJtdaONWq+t+wqIow6DG2kSWGV6jVdbjZt31EMtbpx3gKeVb9C7YVJXeBmW9mfmqbjmoChUIvsWoz6RjL5Af4aea+vYqlytJayKt1OeIeVKOV2hj6yUNeBI4OFnqs=;
X-CID-CACHE: Type:Local,Time:202409250022-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:32551689-05e4-4c2e-9750-5971dc7ffb57,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a02cbcd0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b6c78fd67b1311efba0aef63c0775dbf-20240925
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 796739442; Wed, 25 Sep 2024 00:56:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 15:56:44 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 25 Sep 2024 15:56:43 +0800
Message-ID: <9e51fdad-382c-5889-7986-7e0373eb0918@mediatek.com>
Date: Wed, 25 Sep 2024 15:56:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add power domain for
 dp_intf0
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Alexandre Mergnat <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, Chris-qj
 chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Tommy Chen <tommytl.chen@mediatek.com>
References: <20240925071514.17626-1-macpaul.lin@mediatek.com>
 <7e57ea01-f881-4c6a-95e7-96ab56dbc455@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <7e57ea01-f881-4c6a-95e7-96ab56dbc455@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_005652_485616_A309EFF9 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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



On 9/25/24 15:54, AngeloGioacchino Del Regno wrote:
> Il 25/09/24 09:15, Macpaul Lin ha scritto:
>> During inspecting dtbs_check errors, we found the power domain
>> setting of DPI node "dp_intf0" is missing. Add power domain setting
>> to "MT8195_POWER_DOMAIN_VDOSYS0" for "dp_intf0"
>>
>> Signed-off-by: Tommy Chen <tommytl.chen@mediatek.com>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> 
> You missed a Suggested-by tag here :-)
> 
> after which,
> 
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>
> 

Got it! I'll send v3 update later.

Thanks
Macpaul Lin

