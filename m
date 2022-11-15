Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02945C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTgU5DL2lbsr4QxYmfdT/EhGBpsOpcmLN7gpqg+pc8k=; b=t6vreeAdDu8nVO68zpvoaNif+o
	MRccSDwwo7um/ENN3SIlgLO95ZmX8JauUVBOApcocBzfORfzjzm6V5Xku9wlIeS8GwMyEdBxUKeA3
	QNlHG1GT6ENoM46ztZ3w/s9xcF5HuuqvwK7Df3MnURpmUmODjZ8Ot7WrKWJkXYDAPajIyvQbLeAG5
	apMnHqcRU1aleboMxk9zNSdU2IukIaPqj7u+0QNZs/VMibOljmfHolo82tSY9PxF7d7udJacdxI0p
	48ehTpKAKy+NLqq+pJdvjj/viQc/54H01f+4lt4XSo/CTzxxU7lIS3cwcrBNu51x1xwCbAKSnjQN4
	+fJX52zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ourgL-0093nK-TG; Tue, 15 Nov 2022 08:52:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ourg7-0093jc-N7; Tue, 15 Nov 2022 08:52:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE50566029B1;
	Tue, 15 Nov 2022 08:52:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668502342;
	bh=/HIRPmCrAbi1g9Wxs/I+JuWDXoQgjWz8G2CL3MrPoHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZsE348TFM/TKIjHKMzkZkSuv+ntrtq8yL8nArP0zQSIbD3GEFtmgY8ZK/wWr7GSDF
	 YvWIIjA5Aw2Fx0lYcVsMf7cFK5Z53kK5a5QdC3GNafwKXmImMBdflMHAinXS5cLtCJ
	 QJSUf9SmM8PZijlNpiZleCe8DDTnkameOJNs1wdh0QIHotWS0JrbIs98vnZpl4GjHj
	 F0vn3tq5w4g5/kZbsgwQzsFlQ1EYz4QeVDdLWPUwhvq6adUadDJSaOEh0lET/Y5bVc
	 LFMT8euW5koibUeKX97oNvx3mOZhBwPHXudCY5TA/RoSG9YFr5XS0GOH5UF7UmndNM
	 KPmIe7wDs78Yw==
Message-ID: <8732f418-a8eb-3cb4-962f-2353fe8d0154@collabora.com>
Date: Tue, 15 Nov 2022 09:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 2/4] arm64: dts: mt8195: Add edptx and dptx nodes
Content-Language: en-US
To: =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
 <20221110063716.25677-3-rex-bc.chen@mediatek.com>
 <73e5491a-9720-ea52-48ff-cc506c6dc582@gmail.com>
 <bb53d1d7e3cfa75af578412d56d2c6e8fc0d1be7.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <bb53d1d7e3cfa75af578412d56d2c6e8fc0d1be7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_005224_041393_51A2ECB1 
X-CRM114-Status: GOOD (  21.81  )
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

Il 15/11/22 08:58, Rex-BC Chen (陳柏辰) ha scritto:
> On Fri, 2022-11-11 at 13:22 +0100, Matthias Brugger wrote:
>>
>> On 10/11/2022 07:37, Bo-Chen Chen wrote:
>>> In MT8195, we use edptx as the internal display interface and use
>>> dptx as the external display interface. Therefore, we need to add
>>> these nodes to support the internal display and the external
>>> display.
>>>
>>> - Add dp calibration data in the efuse node.
>>> - Add edptx and dptx nodes for MT8195.
>>>
>>> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8195.dtsi | 25
>>> ++++++++++++++++++++++++
>>>    1 file changed, 25 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> index c380738d10cb..7acbef5a4517 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> @@ -1244,6 +1244,9 @@
>>>    				reg = <0x189 0x2>;
>>>    				bits = <7 5>;
>>>    			};
>>> +			dp_calibration: dp-data@1ac {
>>> +				reg = <0x1ac 0x10>;
>>> +			};
>>>    		};
>>>    
>>>    		u3phy2: t-phy@11c40000 {
>>> @@ -2205,5 +2208,27 @@
>>>    			clock-names = "engine", "pixel", "pll";
>>>    			status = "disabled";
>>>    		};
>>> +
>>> +		edp_tx: edp-tx@1c500000 {
>>> +			compatible = "mediatek,mt8195-edp-tx";
>>> +			reg = <0 0x1c500000 0 0x8000>;
>>> +			nvmem-cells = <&dp_calibration>;
>>> +			nvmem-cell-names = "dp_calibration_data";
>>> +			power-domains = <&spm
>>> MT8195_POWER_DOMAIN_EPD_TX>;
>>> +			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			max-linkrate-mhz = <8100>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		dp_tx: dp-tx@1c600000 {
>>> +			compatible = "mediatek,mt8195-dp-tx";
>>> +			reg = <0 0x1c600000 0 0x8000>;
>>> +			nvmem-cells = <&dp_calibration>;
>>> +			nvmem-cell-names = "dp_calibration_data";
>>> +			power-domains = <&spm
>>> MT8195_POWER_DOMAIN_DP_TX>;
>>> +			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			max-linkrate-mhz = <8100>;
>>> +			status = "disabled";
>>> +		};
>>
>> For some not really obvious reasons we get the following errors with
>> make CHECK_DTBS=1 mediatek/mt8195-cherry-tomato-r2.dtb
>>
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb:0:0:
>> /soc/edp-tx@1c500000: failed to match any schema with compatible:
>> ['mediatek,mt8195-edp-tx']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb:0:0:
>> /soc/dp-tx@1c600000: failed to match any schema with compatible:
>> ['mediatek,mt8195-dp-tx']
>>
>> Can you please see how to fix this. Tested with next-20221111.
>>
>> Regards,
>> Matthias
>>
> 
> Hello Matthias,
> 
> I can not reproduce this issue in my local environment, but I am sure
> the binding is in kernel master branch (v6.1-rc5):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml?h=v6.1-rc5
> 
> It's strange that the message you provided said it can not find any
> schema with ['mediatek,mt8195-edp-tx'] and ['mediatek,mt8195-dp-tx'].
> 

Matthias, I can't reproduce that either... perhaps there's something odd that's
going on with your environment?

Cheers

