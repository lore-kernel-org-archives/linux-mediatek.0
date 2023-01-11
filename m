Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2324BC46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 05:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmUDVA531EfhlhgEaWFvf3IPw/DwzgIiiNRd/7sJBRk=; b=O106vr+ZxO6HUOsmVYkI3xGOM9
	9wcW3lEQxn1ny3P03lf7T3xeAi8titKKGzKE9mbVPzWW7S21G6uilkI/GcDx3jV77QxMHIqUpBWgJ
	pZ3MTSBGR4LlOkZU5S6VLwg+5MDKm0tMCOWQoLc1kBgzgixb79pfQZfp1mVu87V4D/jYaJiMfR9j8
	p4BuAyIIAjV2gU3kMGwTnSrHH7fm9D1F3fxdH07w0xDOwXmy+8PONmOTOk/sRdKpJSfuTV+6UsUZQ
	a74J2Y8by5mTM7yOcUk/oXen6Bajgp4pmy17vDBmPf9YpfURYaoxVhKb8K5q6vUsegQOPZlYppAP1
	WWVoVMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTpb-009jQG-GV; Wed, 11 Jan 2023 05:39:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTpF-009jAk-P0; Wed, 11 Jan 2023 05:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jmUDVA531EfhlhgEaWFvf3IPw/DwzgIiiNRd/7sJBRk=; b=E/uOfAw7pg/OYRrsKGzC0k1AZ5
	qIbK3pshuNc0/j/lSZmzEd2dmp7+JGKqqaNQc09oKLhcN7m4VXyWhyluqptRplLo8+XILGtgEXQiu
	KjU7xfWoY44wg7Sya3n5vG0joyXDK41ja8ZdrN6XB9tCKojTibyrJ42VFpg92lYp1pATwn5SSIO2g
	PPvvAQCvfFKvEpM2iRy44CuB8KOCKbgfhNL9MuFreq0ta3YuLPlQNqt0r1RDNRKIelUGzRkF/ZZKj
	E3ijgMfflinvHZ/myQaXB60kAk76XFIYPR9jR9MHXQ3Nh2bR7d6W2Wouabv8rejRbXJfUf92luYE8
	sghJ2rzQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFTp3-003Xu4-0Y;
	Wed, 11 Jan 2023 05:38:52 +0000
X-UUID: 2730b53c917211eda08d4d6090ec5a5c-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=jmUDVA531EfhlhgEaWFvf3IPw/DwzgIiiNRd/7sJBRk=;
	b=kUOY0+oY2EKxgnlf2CuaqwDI8FyverLbbE4nSEeI4asnv0m0rCDK8ZbX5sqBoHvbc+Ve1sWYkbSwPXea+/WVNSCl2+HvjSsWUghfggynSlgd1hI+mOnPuEszqGZMqkBMQqlQdYem9JSSqpWAGS+UqvKpAbmYxPd2VyMDqocgD+U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:87d1157e-e69f-43d8-85dd-fc2920012cf9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.17,REQID:87d1157e-e69f-43d8-85dd-fc2920012cf9,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:543e81c,CLOUDID:c38b4f54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230111101907THW46AZC,BulkQuantity:14,Recheck:0,SF:38|28|17|19|48|102
	,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0
X-UUID: 2730b53c917211eda08d4d6090ec5a5c-20230110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 728847779; Tue, 10 Jan 2023 22:38:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 13:37:42 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 11 Jan 2023 13:37:42 +0800
Message-ID: <7851a7a2-a2bc-c460-a53a-52a8f94e3969@mediatek.com>
Date: Wed, 11 Jan 2023 13:37:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and
 IOT's USB configurations
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Miles Chen <miles.chen@mediatek.com>,
	<linux-usb@vger.kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	<yow-shin.liou@mediatek.com>, <ben.lok@mediatek.com>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
 <0ae6a31c-9a7b-ff05-08e1-eed96e672bd9@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <0ae6a31c-9a7b-ff05-08e1-eed96e672bd9@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_053849_996301_952C7742 
X-CRM114-Status: GOOD (  30.78  )
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



On 1/9/23 23:13, AngeloGioacchino Del Regno wrote:
> Il 05/01/23 10:28, Macpaul Lin ha scritto:
>> Introduce the split MT8195 laptop and iot USB configurations.
>> The hardware specifications for LAPTOP devices is different from IOT
>> devices. The major differences include some hardware constrains for
>> dual-role switch for USB controllers in different configurations,
>> especially for power management and other control flows as well.
>>
>> Here are some hardware specifiction differences listed:
>>    1. LAPTOP (Cherry Tomato boards) don't support USB gadget (device 
>> mode).
>>    2. IOT devices must support multiple gadget devices and host mode.
>>    3. Dual-role switch is not fully supported. Only USB PORT0 support
>>       dual-role switch.
>>    4. Power management is designed in primary and secondary dominator.
>>       For a dual-role port, the device controller is the primary 
>> controller
>>       for power management; while the host controller is the secondary.
>>       LAPTOP devices should remove device nodes for avoiding abnormal
>>       behavior.
>>
>> This modifcation is to add USB configurations "mt8195-laptop-usb.dtsi"
>> for LAPTOP devices, and add "mt8195-iot-usb.dtsi" for IOT devices.
>>
>> To remove common USB configurations for mt8195.dtsi and switch includes
>> dtsi these new files for the boards will come in next patch.
>>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> 
> I'm mostly sure that there's no reason to split the two configurations.
>
> I agree in that Tomato doesn't support gadget mode on the Type-A port and I
> honestly don't currently know (and I'll test that later!) if it would be 
> possible
> to act as gadget on any of the two Type-C ports.
> Of course I agree on the fact that a laptop acting as a gadget may not 
> be useful,
> but that's not something that I want to judge, as someone may find a 
> usecase.
> 
> In any case, even if Tomato does *not* support gadget mode on *any* port 
> at all,
> I wonder why we wouldn't be able to probe MTU3 (and correctly describe 
> the SoC)
> on Chromebooks but only on MT8195-based IoT boards...
> ...and in case there's any real issue, we can always force host mode 
> (with a
> generic  devicetree property!) on the MTU3 on Tomato.

We are sorry it cannot be achieved by even setting "force host mode" to 
usb device node. At least, it cannot be done on MT8195.

The basic reason is the power requirements for USB host on a LAPTOP are 
different from those on an IoT device.

The main cause is low power management. The hardware of each device port 
is different on MT8195. Even the bit fields definition in registers were 
different.

Some details such as sequence need to be coordinated with the SPM 
firmware. When a device hardware is involved in runtime PM, function 
like remote wakeup and other suspend/resume behavior will be abnormal 
for a LAPTOP device. If we split the dtsi for different devices, people 
can choose different configuration in SPM firmware in coreboot or in 
TF-A to meet the requirement. Hence we'd better not to get more messy 
code in Linux driver.

> Finally, if we're able to add MTU3 to Tomato boards, this means that we 
> won't be
> seeing these two DTSI files and that USB nodes are still going to all 
> lie in the
> main `mt8195.dtsi` file, without all this duplication that I'm seeing here.
> 
> What do you think?
> 
> Regards,
> Angelo
> 

Thanks for the suggestion, we hope the next platform in the future could 
avoid this issue and reduce some duplicate dts.

Macpaul Lin

