Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF61C48BC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W967IrH/oeYU9bwp+yEleRGDwbwO2tqkVHWJC6bpAo=; b=FoIZYvG6QQZwZaF1errittTXQx
	QqoNie40avURZHLZ515KsPuNkFUFUhvoe72oYewj9iAqcKMkcG9rjbKaG0dgCjNf5+B1dxpcb23df
	rTLf8FK/YDaV/OzZDNVG1acbSSdGGxu8IklFkxQM24FiBT8IMFzaUchR7/PqdzLFaqjMA6FxC3jfV
	CulRc1y+KhdSEEAZJj1hUutv4IWi7+LcOuNKcRlevrckH1JH9BjCV0yPvy2WmkkxE3snq3sU861vq
	XAJflkYuinLsirZJ0gpZUtP66kot7eo4xywa+ZQlMLikGol5F+YaDNddC4KZpWhKiWf3En+VXpZg5
	TJSO+G/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBeV-0000000CJvr-457Z;
	Wed, 14 Feb 2024 09:34:03 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBeS-0000000CJtF-26l9;
	Wed, 14 Feb 2024 09:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707903238;
	bh=U4bNMH+xtiCB6Y3mK6uVJUXqmlGYS1dPqnhcpgvAQPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rDMgrC6rjZB/wQwJNDPBTssIhx6YtdbvO59smkyyIL2/OBTXaqrPZL+cF4R45oZs1
	 /HdY2mIKiqSR1mfojtQ2NUox3hQnvpMy1WZlMVPDuhBFwPE0wYXiNMUhOPhT+PdcGA
	 Si20XPPYL7ZSjL93bDlF68G8vD+9Kv9ESDhHcDkDUi7ThJm66cwp5XpxaDWLux9hqs
	 rdQHyJDWST73v+C4egSDmNxCdIN4ulD9+YSybmD8yPt+FhXxZUzcyF38b3VVrkbaZq
	 h02UjL0Y32yX4y7TSEeotI54jaHGLGrbNhe6rFBiKBZqO3lBEDUQ6FP7JWv/xrcyR1
	 WMp9oKkBefdCw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0AEF23782076;
	Wed, 14 Feb 2024 09:33:57 +0000 (UTC)
Message-ID: <b5dce02f-414a-42df-8210-3e80a769e324@collabora.com>
Date: Wed, 14 Feb 2024 10:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7988: add PWM controller
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240213164633.25447-1-zajec5@gmail.com>
 <20240213164633.25447-2-zajec5@gmail.com>
 <36baacb4-4aa9-421f-bde0-c4be7d7f4aa1@collabora.com>
 <bbacfaad-a182-4df5-8317-640e32a1954a@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <bbacfaad-a182-4df5-8317-640e32a1954a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_013400_712159_81F96C56 
X-CRM114-Status: GOOD (  15.00  )
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

Il 14/02/24 10:24, Rafał Miłecki ha scritto:
> On 14.02.2024 10:09, AngeloGioacchino Del Regno wrote:
>> Il 13/02/24 17:46, Rafał Miłecki ha scritto:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> Add binding for on-SoC controller that can control up to 8 PWMs.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 21 ++++++++++++++++++++-
>>>   1 file changed, 20 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi 
>>> b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>>> index bba97de4fb44..67007626b5cd 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>>> @@ -1,5 +1,6 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only OR MIT
>>> +#include <dt-bindings/clock/mediatek,mt7988-clk.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>   / {
>>> @@ -78,7 +79,7 @@ gic: interrupt-controller@c000000 {
>>>               #interrupt-cells = <3>;
>>>           };
>>> -        clock-controller@10001000 {
>>> +        infracfg: clock-controller@10001000 {
>>>               compatible = "mediatek,mt7988-infracfg", "syscon";
>>>               reg = <0 0x10001000 0 0x1000>;
>>>               #clock-cells = <1>;
>>> @@ -103,6 +104,24 @@ clock-controller@1001e000 {
>>>               #clock-cells = <1>;
>>>           };
>>> +        pwm@10048000 {
>>> +            compatible = "mediatek,mt7988-pwm";
>>
>> I can't take this unless there's a driver that supports your device.
> 
> I'd argue you should rather look for a documented binding rather than a
> (Linux?) driver. Otherwise you would refuse changes that are not
> strictly Linux related. DTS files are meant to describe hardware in a
> generic way and not be driven by Linux drivers / design.
> 

Of course, devicetree describes hardware - that is pretty much globally known.

As I wrote in the bindings patch, I still anyway want to see the driver part
for this block before deciding if your description of this hardware is correct.

Regards,
Angelo


