Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D675CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbUKc5+M4A13tRhLrQDCXFDg4LvyvHUNk+/1687J63Y=; b=wIRPAhwzLCchjbinNzqoM91YzD
	QPWudc/wxK26tbe52xuitCBdOtCutRGKn6Mb7cFFlhw/YTXdmvS4lfvkexmtPuN/DI7lutkAEddAw
	9Tak3JE3gsPL5t5iX4lCeyreU3RLTjS/A6UL5fr5alYK5Xw582NQJ4LXoIRi9TRZi+XUHF/Wjz0A5
	clR3qchZByJ176iGxh8Bnk0AMq58OCmPlrlgf6y2rUYlXK4/ps05/VC3KnpNUT70ZCSTGicd2TlnZ
	n3qtqw8rn6032XmPNmFFe6Hjc7EiPRfydouTHNdgEzPSQr0on3SEhaJSLYNsgCKMWzi0MuHemAxaZ
	6rjWCCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssg8J-0000000GxFv-25vE;
	Mon, 23 Sep 2024 10:17:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssg5h-0000000Gwcx-24xb;
	Mon, 23 Sep 2024 10:14:51 +0000
X-UUID: a711ac0a799411efba0aef63c0775dbf-20240923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=gbUKc5+M4A13tRhLrQDCXFDg4LvyvHUNk+/1687J63Y=;
	b=BLye5v/Tw+C33mJcqD2PHgoj51pf5r3SInQlFIx4NwyOTNED3kD95PR+glE15XnKxEn7OyW/R08j985zrQEICjtptJHR67GFVIQ7nUcgqELQYAfKbMft4sXogTz0H37yffoMExJGqem4EBuFnoQ8zbbX4c2KVPI3AqJoWzUQT1I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3ffabbd9-dd48-49c8-b15e-8a300cdf5d9e,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:fd779fd0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a711ac0a799411efba0aef63c0775dbf-20240923
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 393763748; Mon, 23 Sep 2024 03:14:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Sep 2024 18:14:41 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 23 Sep 2024 18:14:38 +0800
Message-ID: <bf45531a-eacf-22a9-65f1-f6474a2ca843@mediatek.com>
Date: Mon, 23 Sep 2024 18:14:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8390-genio-700-evk: Enable
 Mali GPU
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
 <20240920134111.19744-6-pablo.sun@mediatek.com>
 <eb17085d-78ff-4833-a4de-17b9327d776c@collabora.com>
From: Pablo Sun <pablo.sun@mediatek.com>
In-Reply-To: <eb17085d-78ff-4833-a4de-17b9327d776c@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_031449_582578_F1E7A1CF 
X-CRM114-Status: GOOD (  17.53  )
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

Hi Angelo,

On 9/23/24 16:45, AngeloGioacchino Del Regno wrote:
[snipped]
> 
> Is there any real difference between MT8390 and MT8188 in terms of the 
> GPU OPPs?
> 
> I see that on MT8188, frequencies up to 880MHz want a DVDD_SRAM_GPU of 
> 0.750V,
> then 0.775/0.762/0.750 (bin1-4/5/6) on 915MHz, and 0.800/0.775/0.750 
> (bin1-4/5/6)
> on 950MHz.
> 
> Those never call for 0.850V...! So is MT8188 (Chromebooks) wrong, or is 
> MT8390
> different in that?

To the best of my knowledge, MT8390 and MT8188 has identical GPU
subsystem. Thus, the OPP table should have no difference.

To be specific, I list the link to the OPP table of Genio 700 EVK
(MT8390) in reference in [1]. It should match the setting in Chromebook
kernel branches.

The "typical" voltage in the datasheet is the voltage that would work
for all frequency settings. As long as it is smaller than the maximum
operating voltage, setting voltages higher than the ones specified in
the OPP table does not damage the hardware.

But this 0.85V setting is indeed not optimal. We should follow the
voltages described in the OPP table, if we want power savings.

I also considered model the regulator setting with 
'regulator-coupled-with' and 'regulator-coupled-max-spread', but I am 
not entirely sure how to describe the relation that "DVDD_GPU_SRAM 
should follow DVDD_GPU
if and only if DVDD_GPU is higher than 0.75V" - should I simply
set min-voltage to 0.75V and set 'regulator-coupled-with' ?

[1]: 
https://gitlab.com/mediatek/aiot/rity/meta-mediatek-bsp/-/blob/kirkstone/recipes-kernel/dtbo/mt8390/gpu-mali.dts

Many thanks,
Pablo


