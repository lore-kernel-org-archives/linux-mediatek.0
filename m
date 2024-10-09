Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92236CED628
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vn8tEkGuRtMHF0tlfEZ8QyLNGegxpb21cpoM4gTfZRI=; b=P9QgA3rj84RDnmlslmnjxZnewH
	lk9Wt3wlmAgf4aykDGY5mh4GFbqUNX1DP+mJMjN65k5VBrv2ATA2GPSZW9gqh1urQS/VWdSjOwkWo
	qXFm59dvSYbY24gmRb7xkhLGmwuXn3/W9tPQdR6xH/j61lVjMHbBXZxHHJ7fon20c0bvaNr8HB2fs
	6A7K/wc/Os17LuCJEQTRDcV+EIJj9HiifXO6OWXiF8R2bNIG5vAJgGrj6BXtxqAQiGxeIZaxXR+JD
	1+JyQcO7j6AeIk7pqD2gyhtKrkLtGpukBkmI2Y8UOhP/g4NXBRprmQ56qLVC1Xk3ZSlnqKaSsQwCK
	5FOfbEfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sySEO-00000008VE1-1oKh;
	Wed, 09 Oct 2024 08:39:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sySEK-00000008VCx-4AIT;
	Wed, 09 Oct 2024 08:39:38 +0000
X-UUID: 018c2606861a11efba0aef63c0775dbf-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=vn8tEkGuRtMHF0tlfEZ8QyLNGegxpb21cpoM4gTfZRI=;
	b=t5W20TBR4Bs0NOmarixuKBTt5N/bD/VpG0DQjOfOmawGgL5SSOtF7Dxv2CpLC8fuDAGc21fdbCuKBnQJ0YKIUO9AlTrtc+YpLa0TD6p+q4EuHDg8MNki9jese+uIjILEQBkEBOuhRda0fQ6uXGso6pb3RsEINW26QObtW3qkseg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:f19bd389-2761-4c4f-ba6d-679de09cd3c0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:ed688726-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 018c2606861a11efba0aef63c0775dbf-20241009
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1658356739; Wed, 09 Oct 2024 01:39:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 16:39:28 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 9 Oct 2024 16:39:28 +0800
Message-ID: <95e29964-8932-19cb-f812-db516e90b889@mediatek.com>
Date: Wed, 9 Oct 2024 16:39:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8390-genio-700-evk: add
 keys and USB HUB
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Alexandre Mergnat <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, "Chris-qj
 chen" <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
References: <20241007090244.1731-1-macpaul.lin@mediatek.com>
 <20241007090244.1731-2-macpaul.lin@mediatek.com>
 <8cdce399-1f42-4558-9cdb-c36b96205212@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <8cdce399-1f42-4558-9cdb-c36b96205212@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.507200-8.000000
X-TMASE-MatchedRID: 1GZI+iG+MtcNtKv7cnNXnSa1MaKuob8PofZV/2Xa0cLBs8kDsMW7w9j3
	ZmXrgmMgjwYPH9x94AlRJr0x5pq5roNNUcsMbelEbBu6+EIezdwXGEjE96ler99RlPzeVuQQlwW
	f7/4SyDulL6ml/horeewFAXG5XM8DyU5XnWcIgDPhuXUWQoMQt77VXHusOfivFLXUWU5hGiH8Z6
	9+gfjbulzsna8FWSVpW1nyZ73XgFcaAgQzCMe24Qs9VkfCh3uAQKuv8uQBDjohvFjBsLEZNNfpf
	O5YhTb3EGriuommA29Uz7QIBqLdbduz/TmKWd6abajVAc2DKqa4hAMe708bDhPuWwH3mlrqA5He
	1kDS+OLnzlXMYw4XMAGLeSok4rrZC24oEZ6SpSkj80Za3RRg8OTE7AvI+717DsePfxQaxS5tDwQ
	X/T3LMgsQeNnCo+C/oloOgBiKq/U=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.507200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0CEDD76DD3F0A1570982FFD2F507549A12C2E622B9C4CAD2B27D6E2F7E860BA42000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_013937_068242_78A82B69 
X-CRM114-Status: GOOD (  25.94  )
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



On 10/8/24 16:20, AngeloGioacchino Del Regno wrote:
> Il 07/10/24 11:02, Macpaul Lin ha scritto:
>> 1. Add i2c, mmc to aliases.
>> 4. Add PMIC_KEY setting.
>> 5. Add USB HUB TUSB8020 to xhci1.
>> 6. Re-order spi2 node.
> 
> Please either add the aliases in a different commit, or add that to the 
> title.
> 
> arm64: dts: mediatek: mt8390-genio-700-evk: Add aliases, keys and USB HUB
> 
> Additionally, I'd really like to see a "conversation-like" description 
> instead
> of a kind-of-checkbox list.
> 
> Something like..
> 
> "
> Add aliases for the I2C and MMC/SD controllers to keep the numbering 
> consistent and
> describe the TUSB8020 hub present on the USB XHCI1 controller instance 
> to enable
> resetting it with its specific reset GPIO.
> 
> While at it, also move the spi2 node to keep nodes alphabetically ordered.
> "

Okay, Sorry for providing incorrect order of modified and added items.
I'll update in the next patch.

>>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   .../dts/mediatek/mt8390-genio-700-evk.dts     | 57 +++++++++++++++----
>>   1 file changed, 47 insertions(+), 10 deletions(-)
>>
>> Changes for v2:
>>   - Fix order of spi2.
>>   - Update pinctrl in i2c4 and rt1715.
>>   - Drop IT5205 and RT1715 nodes since the DTS are not completed yet.
>>   - Add #address-cells and #size-cells to xhci1 for supporting USB hubs.
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts 
>> b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
>> index 96b272567cb1..3e77f59f2c74 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
>> @@ -23,6 +23,15 @@ / {
>>                "mediatek,mt8188";
>>       aliases {
>> +        i2c0 = &i2c0;
>> +        i2c1 = &i2c1;
>> +        i2c2 = &i2c2;
>> +        i2c3 = &i2c3;
>> +        i2c4 = &i2c4;
>> +        i2c5 = &i2c5;
>> +        i2c6 = &i2c6;
>> +        mmc0 = &mmc0;
>> +        mmc1 = &mmc1;
>>           serial0 = &uart0;
>>       };
>> @@ -249,7 +258,6 @@ &i2c3 {
>>   &i2c4 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&i2c4_pins>;
>> -    pinctrl-1 = <&rt1715_int_pins>;
> 
> What is this extra change?
> Please describe it in the commit description.

okay, I'll fix this.

>>       clock-frequency = <1000000>;
>>       status = "okay";
>>   };
>> @@ -867,6 +875,17 @@ pins-wifi-enable {
>>   &pmic {
>>       interrupt-parent = <&pio>;
>>       interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +    mt6359keys: keys {
> 
> Is there any reason why we can't just put this node in mt6359.dtsi?

That's a good point.
I think I can try to add this in a separate patch for mt6359.dtsi.

> Cheers,
> Angelo
> 
>> +        compatible = "mediatek,mt6359-keys";
>> +        mediatek,long-press-mode = <1>;
>> +        power-off-time-sec = <0>;
>> +
>> +        power-key {
>> +            linux,keycodes = <KEY_POWER>;
>> +            wakeup-source;
>> +        };
>> +    };
>>   };
>>   &scp {
>> @@ -874,6 +893,15 @@ &scp {
>>       status = "okay";
>>   };
>> +&spi2 {
>> +    pinctrl-0 = <&spi2_pins>;
>> +    pinctrl-names = "default";
>> +    mediatek,pad-select = <0>;
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +    status = "okay";
>> +};
>> +
>>   &uart0 {
>>       pinctrl-0 = <&uart0_pins>;
>>       pinctrl-names = "default";
>> @@ -892,15 +920,6 @@ &uart2 {
>>       status = "okay";
>>   };
>> -&spi2 {
>> -    pinctrl-0 = <&spi2_pins>;
>> -    pinctrl-names = "default";
>> -    mediatek,pad-select = <0>;
>> -    #address-cells = <1>;
>> -    #size-cells = <0>;
>> -    status = "okay";
>> -};
>> -
>>   &u3phy0 {
>>       status = "okay";
>>   };
>> @@ -921,6 +940,24 @@ &xhci0 {
>>   &xhci1 {
>>       status = "okay";
>>       vusb33-supply = <&mt6359_vusb_ldo_reg>;
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    hub_2_0: hub@1 {
>> +        compatible = "usb451,8025";
>> +        reg = <1>;
>> +        peer-hub = <&hub_3_0>;
>> +        reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
>> +        vdd-supply = <&usb_hub_fixed_3v3>;
>> +    };
>> +
>> +    hub_3_0: hub@2 {
>> +        compatible = "usb451,8027";
>> +        reg = <2>;
>> +        peer-hub = <&hub_2_0>;
>> +        reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
>> +        vdd-supply = <&usb_hub_fixed_3v3>;
>> +    };
>>   };
>>   &xhci2 {
> 

Thanks
Macpaul Lin

