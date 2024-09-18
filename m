Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7A7CCD1B3
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 14:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjEmjEbDr/iItb5rfSlsNht1UeFeXXltkTGmpbSrD10=; b=4PEm3h932f3OoFRP4CTJFROQNo
	AWdBaGatSixqTO4Wz/9EN8sXg1IqmFksmD/7EXke7t5CmPiKSubRDpoojHTBuHgov7jG1hFrQwYFf
	Q6ooBQLM5VbUk88j70mAM9IqoVkjs4YYa2QYOJ4mn8fmFjSRkIbnNI4LX2Cm+o1eeYPCrYLwQsEPR
	Tg3z2SSBM/dRK4vqIUDJ+2492+Z0N/9dR9/kBuBCzSAzSiaZRdMU7G/o2eKraRZAaGqORiLSmVjKj
	HSFNm6fdGmhkqz/aK0YclUdzN6MeAiIrCAasVbFUi4RH/SGqxtQMSxMp1Pf97dP2JipGyCytkx/Uy
	/9iqugCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqvXP-00000008RJU-2cXL;
	Wed, 18 Sep 2024 14:20:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqvWG-00000008R5G-1tm6;
	Wed, 18 Sep 2024 14:19:02 +0000
X-UUID: f0c00f2475c811efba0aef63c0775dbf-20240918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=XjEmjEbDr/iItb5rfSlsNht1UeFeXXltkTGmpbSrD10=;
	b=PWN3ix7ONh+a4y/lAHDm8uxzSpLOvc219I9YQm1apLkUem5WUHwLxBhqYpE0FoJ/4dCroS3KfyvqxLhR8uNYorbOLG/88bs7sgHFsEBrTuv97D/bXHa40aTLPfHvdZQCEr5uBtd+iEPQ3aZ8agtidVv0uvlxXbCA53GbvdyV0Z4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:15b2a5f0-2cb7-472e-ae9b-3941d2988c56,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:cd1832b7-8c4d-4743-b649-83c6f3b849d4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f0c00f2475c811efba0aef63c0775dbf-20240918
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 178831410; Wed, 18 Sep 2024 07:18:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Sep 2024 22:18:51 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 18 Sep 2024 22:18:51 +0800
Message-ID: <2af0621d-14ac-b7f3-b28d-2df698931121@mediatek.com>
Date: Wed, 18 Sep 2024 22:18:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 2/2] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sean Wang
	<sean.wang@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones
	<lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Chen Zhong
	<chen.zhong@mediatek.com>, <linux-input@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>, Alexandre Mergnat
	<amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Chris-qj chen
	<chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
References: <20240918064955.6518-1-macpaul.lin@mediatek.com>
 <20240918064955.6518-2-macpaul.lin@mediatek.com>
 <20240918115151c896f33f@mail.local> <20240918115651c1475d36@mail.local>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240918115651c1475d36@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.691800-8.000000
X-TMASE-MatchedRID: oTBA/+sdKaYOwH4pD14DsPHkpkyUphL9MVx/3ZYby79qv/+QKNcPLjC0
	pJIQUiJOGseg1yShYPHih/b1HlnM9Q5G/b6aSGR8XP5rFAucBUG4vBuE2X0HlWCD5SM8YvVFrEc
	1eeVEldxaYyc8H6RJsjyKeJLvd5yKS33cD/vC1hvMZk86HxFjjpxfK35V7okVhfNq6/87jDJYjc
	VS5TZhCWHcSGagcNcdZy7lMbj3gjVQswgj0HOv3OYAh37ZsBDCfS0Ip2eEHny+qryzYw2E8Jkw8
	KdMzN86KrauXd3MZDWUeK0fD/v8dvjqHGyLezS3oy0lljZZZ2v5QaKF1q8tByZGO6z8Y6YfwL6S
	xPpr1/I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.691800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 50E6DB0D564377DBBA495A7680F8C29ABE43384A3C6FFA277C2A8BBD86BA24502000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_071900_531543_C906BE84 
X-CRM114-Status: GOOD (  18.32  )
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


On 9/18/24 19:56, Alexandre Belloni wrote:
> 
> On 18/09/2024 13:51:51+0200, Alexandre Belloni wrote:
>> > Changes for v4:
>> >  - Remove "mediatek,mt6357" from PMIC's compatible string since there is a
>> >    seperated DT schema for PMIC mt6357.
>> > 
>> > Changes for v5:
>> >  - Rebase to next-20240913 (linux-next/master).
>> >  - Fix the "title" (device type) of mfd/mediatek,mt6397.yaml to "PMIC".
>> >  - RTC:
>> >   - Drop "start-year"
>> 
>> Maybe, instead of dropping the property, you should add support in the
>> driver by setting range_min and range_max.
> 
> Looking at this even more, the driver can probably be simplified by
> setting start_year in probe and dropping RTC_MIN_YEAR_OFFSET.

Thank you for pointing out where and how the driver should be changed.
However, I'm wondering if this should be a fix with a separated
patchset (bindings and the driver)? The board or SoC's device trees
should be reviewed as well. I'll need to get someone's help (permission) 
inside MediaTek to check those dts and construct the patch for RTC driver.
That will take sometime.

[snip]

Thanks.
Best Regards,
Macpaul Lin

