Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33A9CF6491
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 05:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q0x9yH1Uzj10hQrb2viip48aTGZ70NFlnLir/OAPVM=; b=0ADrtdn4JiVRZl9CUJZERq6Dwv
	gHA2gJXarg94kh8repQZtf/dJpaJgBB/Qzz/gNifagLuAo8unpSUnkPRj+1MyeBR0+Z7Reuznwu2l
	GIenZefwMiP5YHz3buGr35bIBKY7sH89t/XGbBUFO3dwompFtfaqrTSjXWW57U9LeJgLBcE3Ud7kq
	4+/gOiU7gw4Kxq2SjJ4p/h0j4tY2BoVW/wTLJVt73Llhf3jSUeBTsgfAoFjgrqfOHU/eka68qIHNI
	pmW6+XpqgKs782l+oDVSn03mhJXlpjMRAr9Gf+oVieJYB2H9kV2QOLFEc+nEfvbbaAQuQcs63yrLs
	7UdC+CIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv9NL-0000000G1Gk-0t3i;
	Mon, 30 Sep 2024 05:55:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv9M8-0000000G1Ad-2hwD;
	Mon, 30 Sep 2024 05:54:01 +0000
X-UUID: 5fa746e87ef011efba0aef63c0775dbf-20240929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=7Q0x9yH1Uzj10hQrb2viip48aTGZ70NFlnLir/OAPVM=;
	b=a55CGF/Ix4VEHt9m1H3XC+uFemhBBvMPiC/4S3KyrhzrIIUa3APACGFcpowojZoD46FD43PFC2pholeKvK4esU27uWPeAZ7vxA1ynbYY5HYV6Zri6n9LPf1gZOzYZHSCLvfVnJt3th/7ae8LENxvh2oHF09xO5s9TEurA0WWbZs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a928c9b8-cfca-46dc-bdcf-ed64824447f9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:9217c59e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5fa746e87ef011efba0aef63c0775dbf-20240929
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1515954698; Sun, 29 Sep 2024 22:53:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 29 Sep 2024 22:53:50 -0700
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 30 Sep 2024 13:53:48 +0800
Message-ID: <bd6376df-baea-d29d-6b74-68d350cbf797@mediatek.com>
Date: Mon, 30 Sep 2024 13:53:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: add adc and
 regulators for mt6359
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: Pablo Sun <pablo.sun@mediatek.com>, Alexandre Mergnat
	<amergnat@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, Sen Chu
	<sen.chu@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, Chris-qj chen
	<chris-qj.chen@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-pm@vger.kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>, Bear Wang
	<bear.wang@mediatek.com>
References: <20240925171156.9115-1-macpaul.lin@mediatek.com>
 <172731883694.2430476.10157265874067724564.robh@kernel.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <172731883694.2430476.10157265874067724564.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_225400_731606_93F93C4F 
X-CRM114-Status: GOOD (  13.93  )
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



On 9/26/24 10:47, Rob Herring (Arm) wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Thu, 26 Sep 2024 01:11:55 +0800, Macpaul Lin wrote:
>> Since MT6359 PMIC has been added as one of the compatibles of
>> "mediatek,mt6397.yaml", the sub-device node of "MT6359 PMIC AUXADC" and
>> "MT6359 PMIC Regulators" should also be contained in this DT Schema as
>> well.
>> 
>> This patch includes:
>>  - add 'adc' property and $ref for 'mediatek,mt6359-auxadc'.
>>  - add 'mt6359-regulator' to the compatibles of regulators.
>> 
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 

Thanks for the review. This patch will be merged into v7 patch of
the conversion of
Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml'

Thanks!
Macpaul Lin

