Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF0CC52D73
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 07:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdjGRG2C3LvwOmsYFPcbKW0yZATvTyH5hadq862NARw=; b=ucPAUtLkx+jmqBn96M+deRTlm9
	92MnxEuUKFTNKnTL14a4BT8QOIu3FK5X0IaQMq5e4EytbeLRj8iZUF6DHkIycjYFMk4IvAAy6gKBr
	ZskxjKgRDcjtjnGofz2RtZ0X+18LJlOfWUUcRim5VJmK81pVirKpwGdVS/UcnpIyQ/nJclVv3pZbT
	cXx6AcsibXeqhWhnrsFwXcrOrNaEDeIVUSlNVgm2FzYbWaAkHcATCnxQz2HiYnYrPHFMSZCZTKSTg
	NR1m7QbrB7aOvR40z9ftL58GtcDUgLrfWypjwJfoedHQZ6tAyJyqDUEV0fGcRGpAjwlx/v7wfJyQc
	J375BTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbxN5-00000007Lb1-32WE;
	Thu, 08 Aug 2024 07:15:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbxJH-00000007K1K-373z;
	Thu, 08 Aug 2024 07:11:47 +0000
X-UUID: 7329a324555511ef955bff358274dad2-20240808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=xdjGRG2C3LvwOmsYFPcbKW0yZATvTyH5hadq862NARw=;
	b=en55UcgEYe67+HJhZGknMwJ7B/ZVdzVutesKo88wdkeFNKvLH0xyGvYAFePnW2qERoyjxd/gAlNiOCIBWMoiOXAnwhR4/ngvnSbg9i8k/cToJ641NKENgSFujrVbkcT2eARsk6tNzFr1YripyIJBzhcyg/vR8nsLawYLye9ZAHE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3417e2db-68fd-47a8-a266-fbe4b0662a2b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:94fd56c1-acff-4a0f-9582-14bcdf4ed7e0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7329a324555511ef955bff358274dad2-20240808
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 126071032; Thu, 08 Aug 2024 00:11:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 8 Aug 2024 15:11:30 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 8 Aug 2024 15:11:28 +0800
Message-ID: <38933817-11f8-adc0-eb34-56a5602e37e6@mediatek.com>
Date: Thu, 8 Aug 2024 15:11:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] dt-bindings: regulator: mediatek,mt6397-regulator:
 convert to YAML
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bear Wang
	<bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin
	<macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, Jason-ch Chen
	<Jason-ch.Chen@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>
References: <20240807091738.18387-1-macpaul.lin@mediatek.com>
 <ZrPvb_bT2ty-1V6-@finisterre.sirena.org.uk>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <ZrPvb_bT2ty-1V6-@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.500900-8.000000
X-TMASE-MatchedRID: pBwXUM+nCwsOwH4pD14DsPHkpkyUphL9IfyQNHR2naa1eX0jEQ9c6qnq
	WHYEB3G4sgbiBx9i+zIl5NT9XNABgo8sb4DSq8SmxMb7Gw3AjrorHkgIan9a0WlIYy/8U7rao8W
	MkQWv6iUD0yuKrQIMCCAtDqHg/4Qm0C1sQRfQzEHEQdG7H66TyJ8TMnmE+d0ZTZXFr1g0J/nt1y
	Rzd18hTqqUu5UWWPJiARCUAVRFOzfSVIuyXKG3Xhp+dmWg9hpR+oE+9VrjUxFu60CZVSXrDcsC6
	++T8K1Grwc1Nq3cgvQxf1lrcMPVQHZOlaHNG3zLys274HLLVzNWXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.500900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 20AB1ECA636973C2693942798CA415BEA7C19413E8836D5F4D0319E89DA80F5B2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_001143_826792_7589402E 
X-CRM114-Status: GOOD (  12.02  )
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

On 8/8/24 06:04, Mark Brown wrote:
> On Wed, Aug 07, 2024 at 05:17:38PM +0800, Macpaul Lin wrote:
>> Convert the MediaTek MT6397 regulator bindings to DT schema.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thanks for the reminding,
will keep in mind and take recent patches for reference when converting 
next dt-bindings.

Thanks
Macpaul Lin

