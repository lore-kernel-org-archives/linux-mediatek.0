Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B6AC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BD7AV2FyorEsA4muHIINyKFsQOAP4OYBDpkmcANfhIU=; b=U5MAP5carYW71FBmdy1yThmLFf
	2s/9v77Zb9x7B4fA4NeTCTySSONJqBLR1ANbzUTzr3jQaq9A77LLqBEvHfW47rHXEZE0hi2duGtEX
	isLFTD26hvI3zaZfIVwXwGbKaT+bNYPEudZ+4hPgg8HeNV5arK/9msIWp7+fM/8g4Nsr4MBlXTzby
	XGhNhn4krlJz+D5jBDjZ02A4FxNbsfcpXZzGeiqWKAfWEwGm8aUwwDTV/qQtQnx90BTcE6i86i1SD
	8c4WTdi0A8UnYlQ5brrmT3PubBarfo/wr9xdbMG+Hnj6V9KJRm364VZkb+SXaoyRYACe6IRQWTCKd
	Vt+ArwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kAE-00000005upK-2fXN;
	Tue, 30 Apr 2024 09:52:42 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kAA-00000005uod-2Ox0;
	Tue, 30 Apr 2024 09:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714470756;
	bh=34AxLChZrxxqHn1rYrjE3n7vuuxWsZUQYT7Rf3uwoQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0vDQKLOwgXxhzFhDjTWnQU3kuptP84J3H/JMQqd4nlpdZuZ245vHqSGv8SqIzEFyD
	 pI64jSlCfB8+4477d7BHY5JMPlK4YNn8NqcKEmgKCQy/y+Ro5kJkP/MPIqA6VVqS1n
	 OQCUC36ha+e8u2EvH0s1tSiUi3Yr7AgrU+c8cA6OnzoYRMJORAsTRQ/Wbx9SDBiYPt
	 VPIDHGggwOh4xGokXkAYTj74YdHlcqgTAMAYKr3gPU93G866zVS+q1+BduFU86I2Hb
	 KLL8liPgykUc49u9k0luukl8NXbE+5QTjujclGtNi1zj8oQSIqP/j7yu5wPkhi1FB7
	 zH6leRSB1LbJQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 27EE2378143B;
	Tue, 30 Apr 2024 09:52:36 +0000 (UTC)
Message-ID: <8c4f32db-5c80-4fef-8e8d-76f74d3c6bd4@collabora.com>
Date: Tue, 30 Apr 2024 11:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Add off-on-delay-us
 for pp3300_mipibrdg
To: Pin-yen Lin <treapking@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>
References: <20240429095333.3585438-1-treapking@chromium.org>
 <b3c69a78-78c9-4a15-829b-e4b36e16566a@collabora.com>
 <CAEXTbpf2HOQj_AxHGbsgOXVF_HyKttL=z7Mi8QStcmuOS+yN7g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAEXTbpf2HOQj_AxHGbsgOXVF_HyKttL=z7Mi8QStcmuOS+yN7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_025238_818677_90C6C3CB 
X-CRM114-Status: GOOD (  24.72  )
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

Il 30/04/24 11:32, Pin-yen Lin ha scritto:
> Hi Angelo,
> 
> On Tue, Apr 30, 2024 at 4:17 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 29/04/24 11:53, Pin-yen Lin ha scritto:
>>> Set off-on-delay-us to 500000 us for pp3300_mipibrdg to make sure it
>>> complies with the panel sequence. Explicit configuration on the
>>> regulator node is required because mt8192-asurada uses the same power
>>> supply for the panel and the anx7625 DP bridge. So powering on/off the
>>> DP bridge could break the power sequence requirement for the panel.
>>>
>>> Fixes: f9f00b1f6b9b ("arm64: dts: mediatek: asurada: Add display regulators")
>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>>>
>>
>> Uhm, there might be more to it - I don't think that this should ever happen.
>>
>> The regulator is refcounted, so...
>>    * Bridge on: panel goes off, but regulator doesn't turn off (refcount=1)
>>      * Panel resume -> sequence respected (refcount=2 -> wait -> more vregs, etc)
>>    * Bridge off: panel is already off (refcount=0)
>>      * Bridge resume -> refcount=1, no panel commands yet
> 
> The off-on-delay could be violated because the bridge driver does not
> check the delay.
> 
>>      * Panel resume -> refcount=2, wait -> more vregs, etc
>>
>> Can you please describe the issue that you're getting?
> 
> The symptom we observed is that the device has a small chance to
> reboot to a black panel, and we think the panel's unprepare delay (the
> time to power down completely) might not be satisfied because the
> bridge doesn't check that when it enables the regulator. Even if the
> regulator is enabled by the panel driver, the delay can also be
> violated in the following sequence:
> 
> * t=0ms, bridge on: panel goes off, but regulator doesn't turn off
> (refcount=1). The .unprepared_time in panel_edp is updated
> * t=300ms, bridge off, regulator goes off (refcount=0)
> * t=600ms, panel on, the panel driver thinks the unprepare delay
> (500ms) is satisfied, but the regulator was disabled 300ms ago.
> 
> Did I miss anything here? Or should I add more detail to the commit message?
> 

Heh, no you didn't miss anything, this time it's just me :-)

If you can please add that description to the commit message for a v2 that'd be
appreciated on my side.

In any case

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>>
>> Cheers,
>> Angelo
>>
> Regards,
> Pin-yen
> 
>>> ---
>>>
>>>    arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>> index 7a704246678f..08d71ddf3668 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>> @@ -147,6 +147,7 @@ pp3300_mipibrdg: regulator-3v3-mipibrdg {
>>>                regulator-boot-on;
>>>                gpio = <&pio 127 GPIO_ACTIVE_HIGH>;
>>>                vin-supply = <&pp3300_g>;
>>> +             off-on-delay-us = <500000>;
>>>        };
>>>
>>>        /* separately switched 3.3V power rail */
>>


