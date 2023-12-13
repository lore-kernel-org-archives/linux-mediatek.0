Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37185C4167D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 11:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=654crAGroaULG8bETVk5/mzkOdoW/xebgl2nAdPfSxM=; b=fsn9qL/vqqcJNe6kzdwjox4/66
	XGbd4tqhPeTOQPWi4X0mh8fij+tK4e6KbJDPMWyw9Tugk+3lCLbtmIybq+wbS0K9D62wd9xSvv4WJ
	J1KCF4ejunGUOL7PvXisid4923gRpjyh0I9+DWkSLdpHulEWEZRf5Si7aKakN9SEL7ApNowRrmkRW
	r3oVYGthARq3r/mYfUY+TlE+7vJ4PX03X/HPFD5teEv58HMItoUCopCyj7nx+8DifGDLKxwAUHPiV
	KDhQ+t5tcZag0/56pXWM27ROnubTW8MPvMNSwXhmUiq0nHAKSenjqjnwEkRK+6z6HgSoqAGebCs3L
	KDFKQj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNEy-00EQin-2H;
	Wed, 13 Dec 2023 11:17:24 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNEv-00EQfI-0N;
	Wed, 13 Dec 2023 11:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702466238;
	bh=96//esADRJOplqr88mspWyhOTMtK0mDFOs2Lc3N4+AY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vNl9EfAH7fdF7bv33WObj93Bnua/VyYYCEXrpSDln3sYpvj4A54iZAsB8mykb1KeN
	 qsuGpBxCteADgWJAfmzH6KiB9BpqLJ/7QGSmQpYoEm32bN4mpOMgCr2QlqGI0K5DF1
	 O49m5L82yWVhwcgFcQ4GelNCJ1k/Ud94FWbSUaC+1kKSo7RBDm5RuDE1kyh2Ny/uPV
	 iqpbG1cBDmS5vXiC161CfBFtYywhR9jz0zdw/BL2vwmPxEKRPxkL4bqHlrXhjvFA8T
	 dQemoSTN3Yh5GBWTTDRCqFYsDWsPok3cjCijVV2Dc3SDyJez5ohr0n0zd99qGg+pU8
	 F7oRQ68kF62ig==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C2B8637813F2;
	Wed, 13 Dec 2023 11:17:17 +0000 (UTC)
Message-ID: <5327b2fd-94c6-46fe-b987-52cfff042033@collabora.com>
Date: Wed, 13 Dec 2023 12:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtk-xhci: add a property for Gen1
 isoc-in transfer issue
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Macpaul Lin <macpaul.lin@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
 <c1bc144d-07d6-422c-8294-42be47f83e59@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c1bc144d-07d6-422c-8294-42be47f83e59@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_031721_317839_84959811 
X-CRM114-Status: GOOD (  13.73  )
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

Il 13/12/23 09:05, Krzysztof Kozlowski ha scritto:
> On 13/12/2023 07:35, Chunfeng Yun wrote:
>> For Gen1 isoc-in endpoint on controller before about SSUSB IPM v1.6.0, it
>> still send out unexpected ACK after receiving a short packet in burst
>> transfer, this will cause an exception on connected device, specially for
>> a 4k camera.
>> Add a quirk property "mediatek,rxfifo-depth" to work around this hardware
>> issue;
>> The side-effect is that may cause performance drop about 10%, including
>> bulk transfer.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
>>   .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml     | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>> index e9644e333d78..b8ed68574ba4 100644
>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>> @@ -124,6 +124,16 @@ properties:
>>         defined in the xHCI spec on MTK's controller.
>>       default: 5000
>>   
>> +  mediatek,rxfifo-depth:
>> +    description:
> 
> The property description and driver patch suggest you configure the
> depth of FIFO, so this should be not bool, but some uint32. And then,
> use generic "fifo-depth" property to set desired depth.

Did you mean "rx-fifo-depth" instead, as used in net?
This FIFO depth parameter is for RX only.

Cheers,
Angelo



