Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B589C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJYsphAyvhq04rzHjhnPIvebFoKGun7AahMRnUnlmDA=; b=d74JlafoFXOuoeKDIdhLByz9bu
	iR3o09xYXF3d6xE7fQRm5O/n6ZCqCCtArf7SaCdEwpIsBzLaLeVlzEpbqeQ3CnSchsxiXYyM3INEZ
	2erAYmJUGSERqcdEsbIDqBXUx/4/G9jDZIDVsgJXErGhIcMx+FqLqvqb7jWWp0OH5HCxWvv3tjK6E
	KedxnN5Qxhos0ihp2ZN40lUTLB6G2c4L+iL4U2PrYf3PNJzscVcKONcY9ciYrdvs8ieEwcSMEHnOC
	/2FcR9yb0m4r5Eg/6rV9rmOxCsZAoy9Rlr+94BG+J+CP4l020exTt0pZt4adQ5ymrVxPrZraSeAaY
	GslPo83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsiv-0032xu-67; Fri, 04 Nov 2022 09:10:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsit-0032xL-3k
	for linux-mediatek@lists.infradead.org; Fri, 04 Nov 2022 09:10:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5994A6602970;
	Fri,  4 Nov 2022 09:10:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667553045;
	bh=7nYsgFqVbRr74Sh3zzYl4F3NSBnfkBjbsZpFJLALM/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=biGQZk7O0HWhR9Yh7AmIgSdgMyfRZ+cU/UuwxbttqnbVh8s8TCGQrAEX4mtk6gkwK
	 ARRfwLfoj2XJlpWfIahnQGnXl/yg6cX11R4MrtrBlzyxd0XZktLqJGV5ULLWdGtE7N
	 W9qB75y8QD41sqjo+S8KQhv0jMqpqEpO7+Ijdo9tlI/K5bahvD7gJT+7otrlrhnJOy
	 GWRYf5cWY0SdhJj2MmRKCo3NYYkTf4jFrSq0bV+RKuG4m0v01uIcVxJ2ihTsrnmmnM
	 pEIhaYXCblZBSCo4BskrkjE5DRWuYqqccQ3bngH1eerEJPLrh8oNO+n9tLJ2fKkmN7
	 fUN1rnIppGUoA==
Message-ID: <0ef8200d-5e41-4724-cdf3-48b1e9fd4feb@collabora.com>
Date: Fri, 4 Nov 2022 10:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 net-next 1/8] arm64: dts: mediatek: mt7986: add support
 for RX Wireless Ethernet Dispatch
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
 ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, daniel@makrotopia.org,
 krzysztof.kozlowski+dt@linaro.org, Sam.Shih@mediatek.com
References: <cover.1667466887.git.lorenzo@kernel.org>
 <4bd5f6626174ac042c0e9b9f2ffff40c3c72b88a.1667466887.git.lorenzo@kernel.org>
 <3046551a-62d7-2990-afb6-75fe2e20d8cb@collabora.com>
 <Y2TV34YFl/uySbiP@lore-desk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y2TV34YFl/uySbiP@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_021047_326432_80AF3C6E 
X-CRM114-Status: GOOD (  22.90  )
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

Il 04/11/22 10:05, Lorenzo Bianconi ha scritto:
>> Il 03/11/22 10:28, Lorenzo Bianconi ha scritto:
>>> Similar to TX Wireless Ethernet Dispatch, introduce RX Wireless Ethernet
>>> Dispatch to offload traffic received by the wlan interface to lan/wan
>>> one.
>>>
>>> Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
>>> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>
>> Hello Lorenzo,
> 
> Hi Angelo,
> 
>> thanks for the patch! However, there's something to improve...
>>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 75 +++++++++++++++++++++++
>>>    1 file changed, 75 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>>> index 72e0d9722e07..b0a593c6020e 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>>
>> ..snip..
>>
>>> @@ -226,6 +252,12 @@ ethsys: syscon@15000000 {
>>>    			 reg = <0 0x15000000 0 0x1000>;
>>>    			 #clock-cells = <1>;
>>>    			 #reset-cells = <1>;
>>> +
>>> +			ethsysrst: reset-controller {
>>
>> That's not right. It works, yes, but your ethsys rightfully declares #reset-cells,
>> because it is supposed to also be a reset controller (even though I don't see any
>> reset controller registering action in clk-mt7986-eth.c).
>>
>> Please document the ethernet reset in the appropriate dt-bindings header and
>> register the reset controller in clk-mt7986-eth.c.
>>
>> Finally, you won't need any "ti,syscon-reset" node, and resets will look like
>>
>> 	resets = <&ethsys MT7986_ETHSYS_SOMETHING_SWRST>;
>>
>> If you need any hint about how to do that, please check clk-mt8195-infra_ao.c.
> 
> reviewing the code I think we do not have any mt7986-eth reset line consumer at the
> moment, since:
> - mtk_eth_soc driver rely on syscon for resetting the chip writing directly in the register
>    in ethsys_reset()

Ouch :-)

> - we do not rely on reset api in wed wo code.
> 
> I think we can just drop reset support in ethsys/wo-dlm nodes at the moment (since it
> is not used in this series) and convert the driver to reset api as soon as
> we have proper support in clk-mt7986-eth.c (AFAIU sam will work on it).
> 

If you don't need to add resets to devicetree... then I guess dropping it is ok,
let's go with that.

Regards,
Angelo


