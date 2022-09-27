Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3161BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 04:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ahXguKncQoP96BTrWTBp8+5vM5nwnwdJveXeSEIm9c=; b=zNN/hV16EVp13nKqAJKHfJ8F2s
	/gnEjEDuwqPWJXy3mxH+wizBGwdEiNGiv7CH2fE0rsFDiVkjPFlzvX4xort5V8c7WRuWufNcOp+VE
	DqHb8yssmrZ34f0M4Vw7zH0hi36SdgpnbWXXeK7S51DarrvCX4DRHSKp/gSkX1J7dF218VRmmlz5c
	7nuBHSnByU2WlLQqdMk6DYGjJTKjqYtw9KSdGfZsUE33DApwM0LebOepSJcw7ZpOI0fctTgc+Qbsa
	Pur8sERE7Y2SH71PWtJ7/yDwah2FnPhkUc8Wpnu/rxy3nWvnH6yDHNznpKolshC9kQIgS2fmbEd83
	BLIxb7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od1mA-008DKo-5A; Tue, 27 Sep 2022 04:00:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od1m6-008DJC-Q6; Tue, 27 Sep 2022 04:00:52 +0000
X-UUID: 816c930ea3da49758d5199da9692464e-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=3ahXguKncQoP96BTrWTBp8+5vM5nwnwdJveXeSEIm9c=;
	b=VPNODF5t4Ad3dBeM+YXSyMLxzcetbcDKcVFmO0VOS12C3TYRZkv2E3pLPWAmzA9szzy4D34N+ui5XM76adrYztg0qYPswsOjXd8rUYAx7ADFZa5OpZdCsVwqhLdwt37XH0jTmgz7UVqHRgulw4ezYb0yoLedmQ40O/szqTuk43w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:7947ee60-7700-4dac-9f5c-0ffd6edd5d49,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.11,REQID:7947ee60-7700-4dac-9f5c-0ffd6edd5d49,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:39a5ff1,CLOUDID:486a2da3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:220926150559TV5JQC0T,BulkQuantity:70,Recheck:0,SF:28|17|19|48,TC:nil
	,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 816c930ea3da49758d5199da9692464e-20220926
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 494091464; Mon, 26 Sep 2022 21:00:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 27 Sep 2022 12:00:29 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Sep 2022 12:00:29 +0800
Message-ID: <664f3b7d-d629-5af1-cae4-cb5b638a5da1@mediatek.com>
Date: Tue, 27 Sep 2022 12:00:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195-demo: fix the memory size of
 node secmon
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>
CC: <bear.wang@mediatek.com>, <devicetree@vger.kernel.org>,
	<fparent@baylibre.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<macpaul@gmail.com>, <matthias.bgg@gmail.com>, <pablo.sun@mediatek.com>,
	<robh+dt@kernel.org>, <stable@vger.kernel.org>
References: <20220922091648.2821-1-macpaul.lin@mediatek.com>
 <20220926070544.13257-1-miles.chen@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20220926070544.13257-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_210050_903866_6A69114E 
X-CRM114-Status: GOOD (  14.97  )
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



On 9/26/22 15:05, Miles Chen wrote:
> Hi Macpaul,
> 
>> The size of device tree node secmon (bl31_secmon_reserved) was
>> incorrect. It should be increased to 2MiB (0x200000).
> 
> 192K should work when the patch(6147314aeedc) was accepted.
> Does the trusted-firmware-a get larger now, so we need to
> increase the size to 2MiB?
> 
> thanks,
> Miles

When mt8195-demo.dts sent to the upstream, at that time the size of
BL31 was small. Because supported functions and modules in BL31 are 
basic sets when the board was under early development stage.

Now BL31 includes more firmwares of coprocessors and maturer functions
so the size has grown bigger in real applications. According to the 
value reported by customers, we think reserved 2MiB for BL31 might be 
enough for maybe the following 2 or 3 years.

>>
>> The origin setting will cause some abnormal behavior due to
>> trusted-firmware-a and related firmware didn't load correctly.
>> The incorrect behavior may vary because of different software stacks.
>> For example, it will cause build error in some Yocto project because
>> it will check if there was enough memory to load trusted-firmware-a
>> to the reserved memory.
>>
>> Cc: stable@vger.kernel.org      # v5.19
>> Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 Demo board")
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Thanks
Macpaul Lin

