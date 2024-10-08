Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA33BCEF148
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JY9aWAZvbarxNlKLPIB855RNEJhXuvOqLu871pF4VZI=; b=1fkXnIwMmapxX42MSfRgs0OmNq
	VuzZS4Z8XaBwRvXQo1MrBpPaXEmDAylqQnSf46A9q7IEljiPBTSnNe7NiQL2onmmNcYck3y4JTGXE
	pnAcRhQ8MURjD7CrGq/nIYQjzyrP8zbPtomoGSKXv7SAoLTp1blNYbVUcmZEpoesB7Dwy710ELyPu
	k8cX9Zr+uCwSjE2+C9vSLzx+2IndrDj52/IYJlW57Ke1ioUpemeBNe+vCJlM9pG6qNgF/+jhGEMVT
	MBfQG+sr26h2hBjUOo2hrGUssY5TzTTZz35xRp9ltDM6rRb3+wem0ysaa+YZERHbYwHJ/+2HtrG1/
	wUTXBhlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy7Ro-00000005SOh-3JiD;
	Tue, 08 Oct 2024 10:28:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy7QU-00000005SAe-3MF9;
	Tue, 08 Oct 2024 10:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728383204;
	bh=e5I3Kqug+3tmd5xjuXN2W835x7u9rvw42f65vGULb4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROf3bMgxZGjBvRU8HoNDrWwT5IpHBF1/Su7mYNjdxyyT9QTFLPdG2Boz0f/OrH7av
	 k5jI3s0U8SgDVIujSNnnxM2H4HpKQ2HwgjwrSA/8SL7aeY8aKVUwMscJcPTORR7xa9
	 ktdJlE0Qi2K+wZZx5zr8WMvZ4xrJLHqjM5RYX7KiP5aHkZ136xrjELtpUd/YVNORAl
	 LQDW8nuXhmyDsXdjxP3A+yNK370h3bX62gfq+kdspXRMlO9IiohK/Wkhkx+gUR2QTK
	 ffszIgk9OTGgFMYNFuRqPYb59iHTdGYzwDrA6Ou40FozODUJ2Ny6bt5n4wrYtntzPl
	 6IZJcKZDsmzJA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F16EA17E1131;
	Tue,  8 Oct 2024 12:26:43 +0200 (CEST)
Message-ID: <75fb08e1-2d47-4376-9ac0-c812c956bdab@collabora.com>
Date: Tue, 8 Oct 2024 12:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola-voltorb: Merge
 speaker codec nodes
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241008082200.4002798-1-wenst@chromium.org>
 <7caa85fa-7186-4f8f-8195-19325ebf06bd@collabora.com>
 <CAGXv+5FgPOh4kNdrG1uN-NOWEpC5rXvsr0egTsgOw+v_E3vdRg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5FgPOh4kNdrG1uN-NOWEpC5rXvsr0egTsgOw+v_E3vdRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_032647_021553_EC4AC614 
X-CRM114-Status: GOOD (  20.80  )
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

Il 08/10/24 12:14, Chen-Yu Tsai ha scritto:
> On Tue, Oct 8, 2024 at 4:51 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 08/10/24 10:21, Chen-Yu Tsai ha scritto:
>>> The Voltorb device uses a speaker codec different from the original
>>> Corsola device. When the Voltorb device tree was first added, the new
>>> codec was added as a separate node when it should have just replaced the
>>> existing one.
>>>
>>> Merge the two nodes. The only differences are the compatible string and
>>> the GPIO line property name. This keeps the device node path for the
>>> speaker codec the same across the MT8186 Chromebook line.
>>
>> Ok, I agree...
>>
>> But, at this point, can we rename `rt1019p` to `speaker_codec` instead?
>>
>> Imo, that makes a bit more sense as a phandle, as it reads generic and it's not
>> screaming "I'm RT1019P" on dts(i) files where it's actually not.
> 
> Works for me.
> 
>>>
>>> Fixes: 321ad586e607 ("arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks")
>>   > Cc: <stable@vger.kernel.org>
>>
>> Well, that's not a fix - it's an improvement, so we can avoid this Fixes tag :-)
> 
> I'd like to see it backported though, so we minimize the different DTS files.
> Guess I'll add Cc stable instead? Not sure if that works without a Fixes tag.
> 

Well, try to send it to the stable mailing list as well...
I fully understand your concern but backporting is for fixes and *not* for
improvements, so I doubt that you'll get that backported.

It's Sasha's call then, anyway.

> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> ---
>>>    .../dts/mediatek/mt8186-corsola-voltorb.dtsi  | 19 ++++---------------
>>>    1 file changed, 4 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
>>> index 52ec58128d56..fbcd97069df9 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
>>> @@ -10,12 +10,6 @@
>>>
>>>    / {
>>>        chassis-type = "laptop";
>>> -
>>> -     max98360a: max98360a {
>>> -             compatible = "maxim,max98360a";
>>> -             sdmode-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
>>> -             #sound-dai-cells = <0>;
>>> -     };
>>>    };
>>>
>>>    &cpu6 {
>>> @@ -59,19 +53,14 @@ &cluster1_opp_15 {
>>>        opp-hz = /bits/ 64 <2200000000>;
>>>    };
>>>
>>> -&rt1019p{
>>> -     status = "disabled";
>>> +&rt1019p {
>>> +     compatible = "maxim,max98360a";
>>> +     sdmode-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
>>> +     /delete-property/ sdb-gpios;
>>>    };
>>>
>>>    &sound {
>>>        compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound";
>>> -     status = "okay";
>>> -
>>> -     spk-hdmi-playback-dai-link {
>>> -             codec {
>>> -                     sound-dai = <&it6505dptx>, <&max98360a>;
>>> -             };
>>> -     };
>>>    };
>>>
>>>    &spmi {
>>


