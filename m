Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77792C48297
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYkJ5O5jRh27BYCAq26mhDQIPUAqJkb+sTuRSDzVCHY=; b=RjIy9nu8XUvWTFTF6vkZbhFm8e
	XYSePEXi2uaGwIuLbefC+aNw87f2dA+UneBCVSRWi9ESIG7bSIZFNR/qEN9XN9BcLYMdUUZVyh2vu
	wA4Vn/Z2CUieGzL2S0DizhqGIGvXVVDLuCaQVYtK8V1/l8rMI+20X8UyQD5cpT7YVtb1fVyjzei3j
	fqLDJ1zy3cm12K9lDiemVRk+oVBCGQDvD576DD8i8kF4RkPnC4QW70TJm5xE7/TKnUSc/ks0a+Iqd
	iLs70Y7bDBSzRk/CoG71ylPiv8pEMiZDs+Xsxz/XOIHrh9Ay1V6HEH4WwXZXA/F7dhXq8OawmCFz+
	ynamP8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYN4y-0000000GZSO-41vl;
	Fri, 09 Feb 2024 09:21:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYN4u-0000000GZRg-3Oh7;
	Fri, 09 Feb 2024 09:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707470507;
	bh=JbZ74A9tk2UWT+VrLIApBOpqqPN0+cze41j1I55Ge6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tFvDqK+klPRWkB14WAgjKKUsbzaEZMT8Qt6Dtt0PHCBG3BTF+I7tmwXivMImqGlqk
	 DagdXAySSBDsAELUumgQ90DPTHZUHhKgAvW4sQhwhND6TX35JgguzCaOvyTb/SfDAP
	 hzgf5v2gDCsFqLXznwjS9ZW+lqpCuF+wCsEzju29gDkwSlXO7xW/yMiMK682HUEM3j
	 51/YLR51n2eL9Bqk8fWDMzddA4jsT1lCPwZqfwbvnn1HJVl1mK4isy5twQjsD3kdNn
	 sWDtug2YaCF+E/e73GFO1BorESezwL7SbmGBcRem4+8YETBlEXTsXTgA5rB2tc2P2T
	 VffYn3elHpc6A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 74EE837811F4;
	Fri,  9 Feb 2024 09:21:46 +0000 (UTC)
Message-ID: <185865bb-983e-467f-be2d-4978c8f4d6dc@collabora.com>
Date: Fri, 9 Feb 2024 10:21:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] dt-bindings: arm: mediatek: convert hifsys to the
 json-schema clock
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240208215926.10085-1-zajec5@gmail.com>
 <20240208215926.10085-2-zajec5@gmail.com>
 <d4a4a468-4a81-413e-9de6-060c2ba9e0b6@collabora.com>
 <502836d9-5a57-4614-b908-2adc0f01df33@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <502836d9-5a57-4614-b908-2adc0f01df33@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_012149_014253_B7D688F8 
X-CRM114-Status: GOOD (  11.64  )
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

Il 09/02/24 10:17, Krzysztof Kozlowski ha scritto:
> On 09/02/2024 09:53, AngeloGioacchino Del Regno wrote:
>> Il 08/02/24 22:59, Rafał Miłecki ha scritto:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> This helps validating DTS files. Introduced changes:
>>> 1. Documented "reg" property
>>> 2. Documented "#reset-cells" property
>>> 3. Dropped "syscon" as it was incorrectly used
>>> 4. Adjusted "compatible" and "reg" in example
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>    .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ----------
>>>    .../clock/mediatek,mt2701-hifsys.yaml         | 51 +++++++++++++++++++
>>>    2 files changed, 51 insertions(+), 26 deletions(-)
>>>    delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
>>>    create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
>>> deleted file mode 100644
>>> index 323905af82c3..000000000000
>>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
>>> +++ /dev/null
>>> @@ -1,26 +0,0 @@
>>> -Mediatek hifsys controller
>>> -============================
>>> -
>>> -The Mediatek hifsys controller provides various clocks and reset
>>> -outputs to the system.
>>> -
>>> -Required Properties:
>>> -
>>> -- compatible: Should be:
>>> -	- "mediatek,mt2701-hifsys", "syscon"
>>> -	- "mediatek,mt7622-hifsys", "syscon"
>>> -	- "mediatek,mt7623-hifsys", "mediatek,mt2701-hifsys", "syscon"
>>> -- #clock-cells: Must be 1
>>> -
>>> -The hifsys controller uses the common clk binding from
>>> -Documentation/devicetree/bindings/clock/clock-bindings.txt
>>> -The available clocks are defined in dt-bindings/clock/mt*-clk.h.
>>> -
>>> -Example:
>>> -
>>> -hifsys: clock-controller@1a000000 {
>>> -	compatible = "mediatek,mt2701-hifsys", "syscon";
>>> -	reg = <0 0x1a000000 0 0x1000>;
>>> -	#clock-cells = <1>;
>>> -	#reset-cells = <1>;
>>> -};
>>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
>>> new file mode 100644
>>> index 000000000000..eb429337cdf4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
>>> @@ -0,0 +1,51 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/mediatek,mt2701-hifsys.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Mediatek hifsys controller
>>
>> Please, "MediaTek HIFSYS controller"
> 
> Them maybe "clock controller" or "clock and reset controller"?

Yeah, that's right, let's prefer "clock and reset controller", as this binding does
describe exactly only those two functionalities of the whole HIFSYS block.

Cheers,
Angelo

> 
> 
> Best regards,
> Krzysztof
> 




