Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C295C54766
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrRtn58nRdzgiHjxO5LEX/AMpFVMDY48qkJZG+hrISI=; b=vgkqhkhgfuHaf6tRxisDR/+QYp
	lYEEtlUSXEThQUvFfS6ATNs8R3DY7vdKTGbSgXLGWFsD+jEHgi+AHUo0fM2kAeP32U5HR19McsZiI
	GUYHhSkPQZfOvxeRQ9DbtJhbVMr3A08IuHk8NsFeeyKHiJSUHzR6qM+Zjve8m/WHPyexP8nPZNyCE
	aGfIGiEvxWGIKP5Nqm6l4Rm6KYxccSzHjQDBPAQWutbSCNn4Fx2XBBXb+buUNM4OahKF4F+IZ1sv1
	moFMEsSmdkcf4OIfI6wWn5QnrZ9NcLwKqQ4nYTK/Z2WBsXArdd7kU28Yd04uDmf0csK5k1n4euHht
	bLUWnMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0cm-00000009ywb-2QFs;
	Mon, 19 Feb 2024 10:11:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0cj-00000009ytS-25qr;
	Mon, 19 Feb 2024 10:11:46 +0000
X-UUID: 4642abb6cf0f11ee9a263b4415211400-20240219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=FrRtn58nRdzgiHjxO5LEX/AMpFVMDY48qkJZG+hrISI=;
	b=b5IP8oB0Z4PMPQbZStwzEWt/qKj8D2T6SxgxjuASMPY4nSOqRE5FqCyp4Biip4wM6Q5KI7hjwNiuSnhNn1LIHgSf976iWemmwoAZjUJzBvkonR4MiQIGC6gHNyJxGf2/aUcsmyQaEJu9at+E4YKhY8uIb/OOSaHCX1KciVVBOPM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:1b645167-2d84-4fc1-9602-fb49ce1e0968,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:e39af3fe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4642abb6cf0f11ee9a263b4415211400-20240219
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 99063939; Mon, 19 Feb 2024 03:11:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 19 Feb 2024 18:11:10 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 19 Feb 2024 18:11:04 +0800
Message-ID: <91b2109d-1bf7-1fa7-ac16-ec1d9aba2f5b@mediatek.com>
Date: Mon, 19 Feb 2024 18:11:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek: tphy: add a property
 for force-mode switch
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Chunfeng
 Yun <chunfeng.yun@mediatek.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
References: <20231211025624.28991-1-chunfeng.yun@mediatek.com>
 <170317895962.712473.102387666807925662.b4-ty@kernel.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <170317895962.712473.102387666807925662.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_021145_569187_2AA3B1BE 
X-CRM114-Status: GOOD (  13.85  )
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

On 12/22/23 01:15, Vinod Koul wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Mon, 11 Dec 2023 10:56:23 +0800, Chunfeng Yun wrote:
>> Due to some old SoCs with shared t-phy between usb3 and pcie only support
>> force-mode switch, and shared and non-shared t-phy may exist at the same
>> time on a SoC, can't use compatible to distinguish between shared and
>> non-shared t-phy, add a property to supported it.
>> Currently, only support switch from default pcie mode to usb3 mode.
>> But now prefer to use "mediatek,syscon-type" on new SoC as far as possible.
>> 
>> [...]
> 
> Applied, thanks!
> 
> [1/2] dt-bindings: phy: mediatek: tphy: add a property for force-mode switch
>        commit: cc230a4cd8e91f64c90b5494dfd76848197418ed
> [2/2] phy: mediatek: tphy: add support force phy mode switch
>        commit: 9b27303003f5af0d378f29ccccea57c7d65cc642
> 
> Best regards,
> -- 
> ~Vinod
> 
> 

Is it possible to cherry-pick these 2 patches to stable branches?
These 2 patches help fix USB port 1 (xhci1) for board mt8395-genio-1200-evb.
The following branch has been tested.
  - linux-6.7.y (6.7.5): apply test, build pass, function tested OK 
(with corresponded dtb change).
  - linux-6.6.y (6.6.17): apply test, build pass.
  - linux-6.1.y (6.1.78): apply test, build pass.

Thanks.
Macpaul Lin

