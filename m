Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2451FC38A2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWrna60VL4tJ30WRRAI8l0tpYXa3b3yao+wHMOibp5M=; b=OPlKWpi/zLqKajrTHYxXcoOz5B
	pj2spSZ1qDp2nnrPELFqKLmNeL08kV8Rkf4mkiGhlNB98LiEx1v/peGI6b7L4tCsMZBqiFsQSxDSS
	vXvOdyPiVNMIja9nEMAWlZxawX7qL1hlmAVZyIW+OnDHlRd84SQG67VkyKzqqatFKAUTYJR9k1oG0
	C4qrZObcp5HOcNYSlBvE/0ADIxmQiyhWicPcH8zf91Y28tK8Oglpga76kMBGA+9Ed86fOx/8n1BK/
	779iufQZq+0dBsW3SnsrBhGVb+e2g4CkytbxY1AV7/pyGp8Wscejbw2eDsOoCc31yzuZFHtQb2qX1
	17U1q/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzC2-00Cayt-Lb; Thu, 27 Oct 2022 09:28:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzBr-00Cavw-Da; Thu, 27 Oct 2022 09:28:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1DEDF66028C6;
	Thu, 27 Oct 2022 10:28:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666862918;
	bh=nkLiBVCq8vH0MrkVPppLESgMJQN4ENcJIlUdfoTlX3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JsMoHSUWjscrjyRcFEI09Vb+4I/iVUwYCNIqSiZu+oYKGyjoBrY7wvwzODTgQvqZS
	 BlkdJnP40hCu6Tt/QcsgC3cMajtRroAE92NvvfSyOQKCCTktYbir0tpMvb4enWVfRb
	 mK1/rhmf6Y34WoMMwqO0JZylDWfZmjec7cO8hgEmc/WEWjL3eodJ59VV7itMzn6CXV
	 XNEsXqiTQGsbzlA175jU0rxY7ImPIEP2BmyzuqEpwkr5xRQ341ftPUKbp3gCdCJLsI
	 1lAsHrnRiJyFajpjqFSQRwFgu0KT9fpQBrT1CVjUgm8aweV39YBZUUeeogZR5Azr1s
	 9h+2YP9BaiCZQ==
Message-ID: <17139e24-d33c-8240-cd4a-d87fb3b29276@collabora.com>
Date: Thu, 27 Oct 2022 11:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 7/7] arm64: dts: mediatek: Add support for MT6795 Sony
 Xperia M5 smartphone
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@somainline.org>, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
 chaotian.jing@mediatek.com, ulf.hansson@linaro.org, matthias.bgg@gmail.com,
 hsinyi@chromium.org, nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
 fparent@baylibre.com, sam.shih@mediatek.com, sean.wang@mediatek.com,
 long.cheng@mediatek.com, wenbin.mei@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
 <20220729104441.39177-8-angelogioacchino.delregno@collabora.com>
 <a8fa9e22-8c3f-60b2-a0db-01cfd5c37765@somainline.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a8fa9e22-8c3f-60b2-a0db-01cfd5c37765@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_022843_750922_D60E409F 
X-CRM114-Status: GOOD (  23.92  )
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

Il 29/07/22 14:00, Konrad Dybcio ha scritto:
> 
> 
> On 29.07.2022 12:44, AngeloGioacchino Del Regno wrote:
>> Add a basic support for the Sony Xperia M5 (codename "Holly")
>> smartphone, powered by a MediaTek Helio X10 SoC.
>>
>> This achieves a console boot.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hello Konrad,
First of all, I'm sorry for the very late reply.

>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>>   .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 90 +++++++++++++++++++
>>   2 files changed, 91 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>> index af362a085a02..72fd683c9264 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
> -holly.dtb?
> 

I prefer using the commercial name to identify the device.
"Holly" is the smartphone project codename and that is mentioned almost nowhere:
the aim here is to enhance readability as to make it immediately understandable
that this devicetree is for the Xperia M5 device.

>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> new file mode 100644
>> index 000000000000..94d011c4126c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> @@ -0,0 +1,90 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022, Collabora Ltd
>> + * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include "mt6795.dtsi"
>> +
>> +#include <dt-bindings/gpio/gpio.h>
> Looks unused.
> 

Right, I'll remove that in v2.

>> +
>> +/ {
>> +	model = "Sony Xperia M5";
>> +	compatible = "sony,xperia-m5", "mediatek,mt6795";
> sony,holly?
> 

I'm sorry, but I can't understand the sense of adding that compatible string to
the mix. To the kernel, it doesn't mean anything - and we already have another
string advertising the specific machine, which is "sony,xperia-m5".

Of course, there is no Xperia M5 with a different SoC and, even if there was a
xperia-m5 with a different SoC, we anyway have both a machine compatible and a
SoC compatible in here, so that would still not pose any issue.

>> +	chassis-type = "handset";
>> +
>> +	aliases {
>> +		mmc0 = &mmc0;
>> +		mmc1 = &mmc1;
>> +		serial0 = &uart0;
>> +		serial1 = &uart1;
>> +	};
>> +
>> +	memory@40000000 {
>> +		device_type = "memory";
>> +		reg = <0 0x40000000 0 0x1E800000>;
> Lowercase hex in size. Also, doesn't the bootloader fill it in?
> 

Updating the device to the latest software version will give you a bootloader
that fills that in, but the first-ever software release contains one that will
not do that in particular conditions (fastboot boot).

>> +	};
>> +
>> +	reserved_memory: reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		/* 128 KiB reserved for ARM Trusted Firmware (BL31) */
> Is that true for all devices with this SoC, or..? If so, it may be worth
> moving this into mt6795.dtsi.
> 
>> +		bl31_secmon_reserved: secmon@43000000 {
> memory@, everywhere. Use labels to name the nodes.
> 

I'm afraid that's not possible, as the bootloader is reading the devicetree
and requires these nodes to follow this naming.

>> +			no-map;
> reg goes first.

Will fix in v2.

Best regards,
Angelo



