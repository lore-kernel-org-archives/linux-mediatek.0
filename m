Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4F0D132C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNU2JpZX/eVQkXUoGnr/S3jjls/U0OlNS3uYWAIOpxw=; b=g54nBdW6Wq1Ae8olYWV8pDvD6W
	qGkRyl/kd+tv/vOA/BKI0y6SyIhWdTA2120W6Lvld1IfxqCt7FS4lHSFE9pz9YBvdQgC8Fw/ksknx
	TWVhuZMi6yVdDekBmFbnDr3Ims1KMeuTgVrjpD0NOY9KjynNUEywqrBYRXpZVmPgk8qB3P1sDRH97
	9iINPfhKrED9D68AgMwx4wikp/KzGVwSxXFR41h1LTxlrSidp5Fu89Frpcjn2OEoG+MZT2gI3yhCn
	WbavFdZ28XBDS5k8tidZkxJTE9dR56H2CwNC8omv/LvzJBZGPRazcFbOp495hWA0Drx2FBR6RySqY
	/kb3nyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x0u-0000000DpO0-3CG6;
	Mon, 04 Nov 2024 13:21:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wz9-0000000Dorv-2ZOe;
	Mon, 04 Nov 2024 13:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730726349;
	bh=1PkamZZykZ77sMp0GI5lTUolLioO7jIOn5iTrhpoK+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jdqx5P3z8eit/2sxGG3RKvQuELfZyqNVAmJ7fow9TZRN9AIX0RMG/E9y64pnky2kz
	 H9BPYhVUzu9yxTT9gD0Mmwi7kFvfSBVmHjFSYn/A5MaLdiwybosLQkNEPRVfiEvNSC
	 R0LJ9BmPla8JVosjXDLfoPIi+Z/sODWMcmZNYyHsb5llDoYdWITCoihpyGtafxo4yD
	 mKOA1yMsivY5G9X4wOiOcfCui9dtRPGalZn2aMYXUiuw2I+WHbyZRRmye9/QCWIS15
	 /C7ijWHXG/e6+mPTti8Zqy+EGF+pW3lzQYumh8S8GgojldzfQr1LRVEPf1RAHYPgn8
	 vhJFq/8IKXUlQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 642C217E3620;
	Mon,  4 Nov 2024 14:19:09 +0100 (CET)
Message-ID: <bbaa0c8f-9702-4252-a674-e46fb51f0a2a@collabora.com>
Date: Mon, 4 Nov 2024 14:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop
 pp3300_panel voltage settings
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241030070224.1006331-1-wenst@chromium.org>
 <20241030070224.1006331-2-wenst@chromium.org>
 <CAGXv+5HVy41qee6kwVUeLV_DfA0=wk2X77kv81rBKAZDGE6mww@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5HVy41qee6kwVUeLV_DfA0=wk2X77kv81rBKAZDGE6mww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_051911_831516_D9325035 
X-CRM114-Status: GOOD (  18.47  )
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

Il 04/11/24 14:00, Chen-Yu Tsai ha scritto:
> On Wed, Oct 30, 2024 at 3:02 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> The pp3300_panel fixed regulator is just a load switch. It does not have
>> any regulating capabilities. Thus having voltage constraints on it is
>> wrong.
>>
>> Remove the voltage constraints.
>>
>> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> I see that the other three patches were merged and included in the pull
> request, but not this one. Were there any concerns?
> 

Sorry I forgot to actually provide an explanation for that - yes, I do have some
comment about this one.

Despite this being a load switch, it's still switching power from regulator A to
target device X, so this is technically still providing 3.3V to device X.

Think about how a "regular" full-fledged regulator works: you can (sometimes) set
a voltage, and then you can ENABLE the VOUT for said regulator (/rail): this kind
of "load switch" does exactly the same as the ENABLE switch for a full-fledged
regulator.

So, this is switching on and off a power rail that is derived from a source rail,
practically creating... well, a "new" rail, with...

  VIN=somewhere-3.3v,
  VOUT=somewhere-still-3.3v

Any objections/doubts/etc? :-)

P.S.: I'm writing fast, sorry if anything appears unclear, feel free to shoot more
       questions in case :-)

Cheers,
Angelo

> 
> ChenYu
> 
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
>> index 783c333107bc..7bbafe926558 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
>> @@ -35,8 +35,6 @@ pp1800_mipibrdg: pp1800-mipibrdg {
>>          pp3300_panel: pp3300-panel {
>>                  compatible = "regulator-fixed";
>>                  regulator-name = "pp3300_panel";
>> -               regulator-min-microvolt = <3300000>;
>> -               regulator-max-microvolt = <3300000>;
>>                  pinctrl-names = "default";
>>                  pinctrl-0 = <&pp3300_panel_pins>;
>>
>> --
>> 2.47.0.163.g1226f6d8fa-goog
>>


