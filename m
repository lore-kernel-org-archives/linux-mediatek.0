Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0B2C5478C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 15:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgeSwdzfejtZ7gerQ3YAwA0BCpS4Ld6TiTQUNC32GpI=; b=nKxa7NAsW0fnM5AMpMwgdmX/gp
	9mXLE6xicnFaFDmpT2PIpjH5Q2xpY1J7AnSaq3nWoU6kia8WPFLC6YB8jGH9BsU9rBObYOWy0NypY
	OzDxBfM9WC7vjk4nhnXrNSchuiq1RpA6ZhjG7Mhl1Op05i/73eELTI9y0ojurYVVd7vnQI23XG5R+
	mHKxoIUWwfjV5kB+DZPfwzSAB3b89d5XEg2zbLmJhKB3/oXEJt1EagjWrI+rwVr4sRZZRT0Nb/LDu
	yBeaOAMZEsPYoLttCGnM8l1NIQqQqviHcEo0bfDoU5JL8JADANA57sqhn1WNaCjRavgrRn0pnmKgl
	58IGT3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rezEB-00000005kZ2-2SR3;
	Tue, 27 Feb 2024 15:18:43 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rezE8-00000005kXg-3AFs
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Feb 2024 15:18:42 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6902947c507so2836006d6.3
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Feb 2024 07:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709047117; x=1709651917; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FgeSwdzfejtZ7gerQ3YAwA0BCpS4Ld6TiTQUNC32GpI=;
        b=zVumw8ASWhzjVqcm50e3zSwNCu8+W2zRa9eH9CTf7CgirhjjCJ+VyUPVKPUoqQbmn1
         mfl/CDPBktob1wjV20it8NAT/TSa6v41wpqADWww64nMArpw9Y4gx9Sl+107vHBlaNLt
         LJ/LyqBF+3uiRalRsQj19cacHvnEkw2pfjzKPVi9moLATPqJlEF4fC34mZnX1om96B7M
         /hHov1n+AMDr390FYfT9Hk0FZWP2lS6Ew6hH4v2ZKMZHSpWYw2zjty8zQJTUUeTSFKPg
         aVkj14WCeLxyAJT2vBQEa6PBSKAxeZwAq5JIEICJXIdGyUAixoWRHj2MGihnljcrAVoH
         7IlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709047117; x=1709651917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgeSwdzfejtZ7gerQ3YAwA0BCpS4Ld6TiTQUNC32GpI=;
        b=FWOmyMqlGfqxJkNqizV05No+kKVWT4Y0SF8WPuOuSVKkVRiEItFXJallV68w7QnMu+
         kHxqofXiNUrJ9XnjS+gkthKhDLbMwFwPrLEUQwoHdI1WgZ2ljVd/7q5KQQGBgVOaJnrz
         yDEIp5Bkj0UPoe15BpKFsniDv3jpyvlb9vrGGYtxZT7Ya04uPjGBeLMJ3n0214Fn15FS
         +NE7z2adTcQtxaLFEU+8Y1x8xmyMyWfbDBOUf9062za0PGx3BMnyWb54sbmBV/JDBwG2
         7MeSFM2wUx42X6qOgOOhxKzoKLEq+yxw6kqAJ8w9rguEDuOFUwy6cviCWSpyoqDKQrdz
         JZDg==
X-Forwarded-Encrypted: i=1; AJvYcCWxYvWc8ituir1dTIJ39UyJ01uc5vM8bpFFc80z1HCvOniKuhxJMZF9WoVmyPTY2efHL24qaZuMVYo4Jdths91GMeabq210+IMpIqr/C48YAy2m
X-Gm-Message-State: AOJu0YyQMdxi7cRd4xdAm4OwONvwkzmoVZcAOeET+ZV7KQlQPFrUKRjo
	gUirO1DEBOBFtYShIHyP5Rjq507NID14CXNhgjJP7+wtwn8KCkYgP/E+WpcGzBk=
X-Google-Smtp-Source: AGHT+IGCOPu8LzF13tl9Z5c0o4yQmsOPurtebB8rpDPdng5maYtZftIJX0pkpHN6dXZAiJKRZsdFWA==
X-Received: by 2002:a0c:971a:0:b0:68f:ef9b:44aa with SMTP id k26-20020a0c971a000000b0068fef9b44aamr2191669qvd.27.1709047117308;
        Tue, 27 Feb 2024 07:18:37 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id pf10-20020a056214498a00b0068f914ac80bsm2104905qvb.50.2024.02.27.07.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 07:18:37 -0800 (PST)
Message-ID: <eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com>
Date: Tue, 27 Feb 2024 16:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-1-4fa1cea1667f@baylibre.com>
 <ce5f71a9-1b5f-4724-89db-dae2f64e8008@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ce5f71a9-1b5f-4724-89db-dae2f64e8008@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_071840_846090_823919EF 
X-CRM114-Status: GOOD (  35.52  )
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



On 27/02/2024 10:01, Krzysztof Kozlowski wrote:
> On 26/02/2024 15:01, Alexandre Mergnat wrote:
>> Add MT8365 audio front-end bindings
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   .../bindings/sound/mediatek,mt8365-afe.yaml        | 164 +++++++++++++++++++++
>>   1 file changed, 164 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
>> new file mode 100644
>> index 000000000000..1d7eb2532ad2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
>> @@ -0,0 +1,164 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/mediatek,mt8365-afe.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek AFE PCM controller for MT8365
>> +
>> +maintainers:
>> +  - Alexandre Mergnat <amergnat@baylibre.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8365-afe-pcm
>> +
>> +  reg:
>> +    maxItems: 2
> 
> You must describe the items.

Actually, I've took downstream code that I'm not able to explain because 
the second reg isn't on my MTK documentation.
So I've remove the second reg and passed all functional tests 
successfully. Then I will remove the extra reg for v2.

> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  mediatek,topckgen:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: The phandle of the mediatek topckgen controller
> 
> What for? Don't repeat the property name. Say something useful.

got it

> 
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  clocks:
>> +    items:
>> +      - description: 26M clock
>> +      - description: mux for audio clock
>> +      - description: audio i2s0 mck
>> +      - description: audio i2s1 mck
>> +      - description: audio i2s2 mck
>> +      - description: audio i2s3 mck
>> +      - description: engen 1 clock
>> +      - description: engen 2 clock
>> +      - description: audio 1 clock
>> +      - description: audio 2 clock
>> +      - description: mux for i2s0
>> +      - description: mux for i2s1
>> +      - description: mux for i2s2
>> +      - description: mux for i2s3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: top_clk26m_clk
>> +      - const: top_audio_sel
>> +      - const: audio_i2s0_m
>> +      - const: audio_i2s1_m
>> +      - const: audio_i2s2_m
>> +      - const: audio_i2s3_m
>> +      - const: engen1
>> +      - const: engen2
>> +      - const: aud1
>> +      - const: aud2
>> +      - const: i2s0_m_sel
>> +      - const: i2s1_m_sel
>> +      - const: i2s2_m_sel
>> +      - const: i2s3_m_sel
>> +
>> +  mediatek,i2s-shared-clock:
> 
> Why do you need this property? Linux (and other systems) handle sharing
> clocks properly.

Indeed, not needed. It was used by the downstream code driver but I 
remove it for v2.

> 
>> +    description:
>> +      i2s modules can share the same external clock pin.
>> +      If this property is not present the clock mode is separrate.
> 
> Typo
> 
>> +    type: boolean
>> +
>> +  mediatek,dmic-iir-on:
>> +    description:
>> +      Boolean which specifies whether the DMIC IIR is enabled.
>> +      If this property is not present the IIR is disabled.
> 
> "is enabled" or "enable it"?
> 
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.

I will rephrase:

True to enable the Infinite Impulse Response (IIR) filter
on the digital microphone inputs.

> 
>> +    type: boolean
>> +
>> +  mediatek,dmic-irr-mode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Selects stop band of IIR DC-removal filter.
>> +      0 = Software programmable custom coeff loaded by the driver.
> 
> Bindings are for hardware, not drivers. Why is this a property of board DTS?

Actually this is a hardware feature. Mode 1 t 5 are predefined filters. 
Mode 0, the HW will read some "coef filter registers" to setup the 
custom filter. the "coef filter regs" are written by the driver. 
Currently the coef values are hardcoded in the driver.

> 
>> +      1 = 5Hz if 48KHz mode.
>> +      2 = 10Hz if 48KHz mode.
>> +      3 = 25Hz if 48KHz mode.
>> +      4 = 50Hz if 48KHz mode.
>> +      5 = 65Hz if 48KHz mode.
> 
> Use proper unit suffixes - hz.
> 
> 
>> +    enum:
>> +      - 0
>> +      - 1
>> +      - 2
>> +      - 3
>> +      - 4
>> +      - 5
>> +
>> +  mediatek,dmic-two-wire-mode:
>> +    description:
>> +      Boolean which turns on digital microphone for two wire mode.
>> +      If this property is not present the two wire mode is disabled.
> 
> This looks like hardware property, but the naming looks like SW. Again
> you instruct what driver should do. Standard disclaimer:
> 
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.

Actually this is a hardware feature. This is ALL I have to describe the 
HW behavior from the datasheet:
"
bit name: ul_dmic_two_wire_ctl
Turns on digital microphone for two wire mode.
0: Turn off
1: Turn on
"

On the board schematic, SoC and DMIC and linked by 3 pins:
- clk
- data0
- data1

IMHO, "two-wire-mode" means the HW use 2 pins for data, and the SoC must 
be aware of that by reading the register value written by the driver, 
using the value found in the DTS.

I don't get why you think it wouldn't be hardware behavior.

Rephrase description:
"True to enable the two wire mode of the digital microphone"
Is it better ?

About the property name, "mediatek,dmic-two-wire-ctl" sound better for you ?

> 
> 
>> +    type: boolean
>> +
>> +
> 
> Just one blank line.
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - power-domains
>> +  - mediatek,topckgen
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        afe@11220000 {
> 
> What is AFE?

Audio Front End, this is the same name used for other MTK SoC, to be 
consistent.

Cook a new patch serie to change "afe" by "audio-controller" for all MTK 
SoC would be great.

> 
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
>> +            compatible = "mediatek,mt8365-afe-pcm";
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Alexandre

