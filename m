Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E02C48BC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbWMDXJd3ZYUcTgGErq0K4CkNjjPTv9DAFRCkT5TpOI=; b=AfKOYedfRTR+IHP6LZBl7rgWJV
	l2yErZwzYMEuMF87Fs5Y/xCMaPIVz4osFFwlvgIfY70A+d5NFUGsTitTRrgAnOIilJeHwBrgcZVoO
	kwesbMtFdN8dITetq8mvs8zY8u5wAzo13n4nJKXmRY6pcg5bE4m+FOyj4HlYwceBIKRNYeig7rmSO
	m5aDKdbos8BWE4RXB5i9Iy0DavbdZn5zF1CuAMxdai6wAp8z+cjgRlLTvZtcNjD33LvKokkkJ8EQZ
	OBMuHeSkDEwtg7fDDT9EklhF9QJUXNTY85BGMb46myucZZOMqTXpnEmRrYFVcB8vTje77bOOVdj9w
	dAjB3Fpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLtH-0000000DoyA-0Ezx;
	Tue, 20 Feb 2024 08:54:15 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLtD-0000000DowV-2cug;
	Tue, 20 Feb 2024 08:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708419249;
	bh=M8/PhF0aAqABF/pRPoLSGcD9DP7US6tDXUQJIwRD354=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DR+iocJ0Rz307omPoFvSmgFRhhtAABmY+XrQiLAQTlRAUrlFw0GZNJHxjMmhx0/Bt
	 t5k9wtlV0/qqG4tbCx4SsErlOTi62v7aAYS+RtHrrdZ0jEIhRS/GtenkuekSVt9Kxr
	 CoktsWi4i1CuJOQP8KRT7wmCsu4YKDQlTGOnGeBo/CwD2kA83Al4KOzpFyMWL/WheZ
	 XuQ3HJEKCfQUD8iRPn62+QpsOgdO1Ic5ZHti6deOh38+fO8tOzBdL6SKSsr9dnXYEl
	 KSGJ91O8qNhbfMIurf044wjDJA7C2ERHwCRHWNfXtcUGoP1LngdopvU5C0derCZWRP
	 bKQtUiDOAwfqA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E581E37820C1;
	Tue, 20 Feb 2024 08:54:08 +0000 (UTC)
Message-ID: <e0c44c03-8c66-4a44-9c6d-6b8c83e9d16f@collabora.com>
Date: Tue, 20 Feb 2024 09:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200
To: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240219084456.1075445-1-mwalle@kernel.org>
 <20240219084456.1075445-2-mwalle@kernel.org>
 <2ad6bda8-a457-421b-b35d-dc005fb00ae9@collabora.com>
 <CZ92W3VSYV1A.1693O76GY1XDP@kernel.org>
 <b50d49fd-2976-46fc-9f35-354fb39720ad@collabora.com>
 <CZ93XYV3MB10.YRCFWLLHIICY@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CZ93XYV3MB10.YRCFWLLHIICY@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_005412_009531_5357669F 
X-CRM114-Status: GOOD (  26.46  )
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

Il 19/02/24 14:59, Michael Walle ha scritto:
> On Mon Feb 19, 2024 at 2:35 PM CET, AngeloGioacchino Del Regno wrote:
>>>> vbus is always supplied by something, as otherwise USB won't work - whether this
>>>> is an always-on regulator or a passthrough from external supply this doesn't really
>>>> matter - you should model a regulator-fixed that provides the 5V VBUS line.
>>>
>>> I don't think this is correct, though. Think of an on-board USB
>>> hub. There only D+/D- are connected (and maybe the USB3.2 SerDes
>>> lanes). Or have a look at the M.2 pinout. There is no Vbus.
>>>
>>
>> Yes but the MediaTek MTU3 and/or controllers do have it ;-)
> 
> .. and ..
> 
>>>> For example:
>>>> 	vbus_fixed: regulator-vbus {
>>>> 		compatible = "regulator-fixed";
>>>> 		regulator-name = "usb-vbus";
>>>> 		regulator-always-on;
>>>> 		regulator-boot-on;
>>>> 		regulator-min-microvolt = <5000000>;
>>>> 		regulator-max-microvolt = <5000000>;
>>>> 	};
>>>
>>> As mentioned above, I don't think this will make sense in my case.
>>>   >> P.S.: If the rail has a different name, please use that different name. Obviously
>>>> that requires you to have schematics at hand, and I don't know if you do: if you
>>>> don't, then that regulator-vbus name is just fine.
>>>
>>> I do have the schematics.
>>
>> In that case, you should model the power tree with the fixed power lines,
>> check mt8195-cherry (and/or cherry-tomato) and radxa-nio-12l; even though
>> those are technically "doing nothing", this is device tree, so it should
>> provide a description of the hardware ... and the board does have fixed
>> power lines.
>> It has at least one: DC-IN (typec, barrel jack or whatever, the board needs
>> power, doesn't it?!).
> 
> Mh, maybe I don't get it. But within the hardware there is simply no
> Vbus. Thus I'd argue it doesn't make sense to have a vbus-supply
> property. Besides, the mediatek,mtu3.yaml binding lists it as
> deprecated anyway and it should rather be on the connector. There,
> it makes perfectly sense (at least if it's a USB connector).
> 
> Thus in my case, the xhci for the front port has a vbus-supply
> property (but it should rather have a connector node, as I've just
> learned). But the internal port which connects to the USB hub
> shouldn't have one.
> 
> 
>    +-----+           +-----+                  +------+
>    |     |<--Dp/Dn-->|     |<------Dp/Dn----->| USB  |
>    | SoC |           |     |                  | Conn |
>    |     |           |     |   +-----+        |      |
>    +-----+           | USB |   | PWR |--Vbus->|      |
>                      | Hub |   | SW  |        +------+
>                      |     |   +-----+
>                      |     |     ^
>                      |     |     | PRTPWR
>                      |     |-----'
>                      +-----+
> 
> "PWR SW" is a power switch, the input (+5V) isn't shown here. The
> power will be enabled by the USB Hub.
> 

Ok then, put the vbus on the connector, where applicable.

If PWR_SW is a physical switch (not detectable), then you can still model it as an
always-on regulator-fixed, as there's no other clean way of doing that.

As for modeling the power tree with the fixed power lines, I mean that you should
add the power rails as described in your schematics.
You will surely have one DC-IN supply, and others. That should be modeled as a
fixed regulator, which outputs to (probably) the PMIC, using it as an input for
its buck regulators.

Again, your PMIC must be getting a voltage from somewhere in order to regulate
that to a different voltage for a different power rail, right? :-)

Regards,
Angelo

