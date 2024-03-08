Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22467C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FlB5QxrZT0tgb/NJGsWK0Sgi/wHKHPjajrlFW92gcw=; b=g28/KnON5q3PlsR090zfuE6j0b
	B677V9ckkm6tJBvWtMYMZb7fwk94lToiY+6+Ce3GBkWJ3yfF2z8SM1csLLOkon3p7cIpYUf2DjcWv
	nvfoMnr+yJJecTiNWsm/+yF+oLczW2IeR7VHBcMOqektSYM0XcE1vc9mTlJbpT9ngAEALNZr9grZ+
	uUctV6eezTzpVqbMYR4lN59T8DlC7W/hETayqEJzwfvsenO33gVcww8QjUbF+fZgxJhBjjj8NP7zI
	JeS2rNmI32RG+44FMl8WuMpFm5dd+0fF3aFIrvfGIsFNwbeYGrXYSgq6F1aeYf2h691jLCYGb98Ea
	kKfvmwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVhC-00000008LPF-0XIB;
	Fri, 08 Mar 2024 08:35:14 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVh7-00000008LLj-3UIV;
	Fri, 08 Mar 2024 08:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709886907;
	bh=Pzu0gaWkTDesifP6Q2YOgfjmau3I8TTI4fcSFW4LqO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rvngq1IGeh+RcP8rkLUgR3vxThFsprDzFgDjGcGG+mms1y5TwzyBtcrHJT4hIJN21
	 fTDOqY8Dlovk1QHdUIBtd/Lw4XKmIIXPSOF0GTBMOlMoRJLKlNCOcsaK2+H3xCPLlW
	 V+lrASTtZ0n3k9r8Ts5VUFjAXbb2LH83Q+jFapF2QW9Yr9LP3d0FUeTPRn1cNjPEJi
	 g/5PElyi1RT47FWOMr8baVeb6i2xiuPdYby/IQ6ov7DH5FL+ExA48uMk+nou7wwoH+
	 BzCIUPnzk9fc6GtHSudp5mnaPUK49lmkEQlS/VD6m5XcGPsjfcRy1X9srcrb5eUMUc
	 VTSIBPn03Xh/A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9DFD737813CA;
	Fri,  8 Mar 2024 08:35:05 +0000 (UTC)
Message-ID: <25a93c67-35d8-4ce6-86f0-780559d58e96@collabora.com>
Date: Fri, 8 Mar 2024 09:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/22] ASoC: dt-bindings: mt8192: Document
 audio-routing and dai-link subnode
To: Rob Herring <robh@kernel.org>
Cc: broonie@kernel.org, wenst@chromium.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
 <20240307114445.196981-20-angelogioacchino.delregno@collabora.com>
 <20240307141228.GA2491015-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240307141228.GA2491015-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_003510_108665_1619A2F8 
X-CRM114-Status: GOOD (  19.66  )
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

Il 07/03/24 15:12, Rob Herring ha scritto:
> On Thu, Mar 07, 2024 at 12:44:42PM +0100, AngeloGioacchino Del Regno wrote:
>> Document the dai-link subnodes and the audio-routing property, allowing
>> to describe machine specific audio hardware and links in device tree.
>>
>> While at it, also deprecate the old properties which were previously
>> used with the driver's partially hardcoded configuration.
>>
> 
> I replied on v1, but one more thing here.
> 
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 124 ++++++++++++++++--
>>   1 file changed, 115 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
>> index 7e50f5d65c8f..449454c50dcc 100644
>> --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
>> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
>> @@ -13,6 +13,9 @@ maintainers:
>>   description:
>>     This binding describes the MT8192 sound card.
>>   
>> +allOf:
>> +  - $ref: sound-card-common.yaml#
>> +
>>   properties:
>>     compatible:
>>       enum:
>> @@ -20,6 +23,14 @@ properties:
>>         - mediatek,mt8192_mt6359_rt1015p_rt5682
>>         - mediatek,mt8192_mt6359_rt1015p_rt5682s
>>   
>> +  audio-routing:
>> +    description:
>> +      A list of the connections between audio components. Each entry is a
>> +      pair of strings, the first being the connection's sink, the second
>> +      being the connection's source.
>> +      Valid names could be the input or output widgets of audio components,
>> +      power supplies, MicBias of codec and the software switch.
>> +
>>     mediatek,platform:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>>       description: The phandle of MT8192 ASoC platform.
>> @@ -27,10 +38,12 @@ properties:
>>     mediatek,hdmi-codec:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>>       description: The phandle of HDMI codec.
>> +    deprecated: true
> 
> The deprecated keyword doesn't do anything at the moment, but my plan
> there is to add a mode to the tools which disables all deprecated
> properties. That will give you want you want in terms of disallowing
> these properties.

That would definitely be awesome - looking forward to it!

> 
> That would require dropping them from "required" which I'm fine with you
> doing. (Though technically that's still an ABI change)
> 

Then instead of waiting for you to add that mode and then remove stuff later,
I'll just omit the `else: required:` block on v3, so that we avoid commit
noise and all the warnings when the deprecated check gets released.

I guess that's fine, right?

Cheers,
Angelo

