Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DFCC54798
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 10:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRDnUl47SBcmf8gVz+t2ubWEYD6TUCpoZIdH8z+nNoU=; b=vTadU30PwLEm4cZQWw7O7doAPa
	pef2UHpOLOsPdiqCPF4HKDsfC7rnuyfi8b18onDbd7mqdhClXHqkr9GzgIfpuyKK7ISjMdCOeSJgW
	qyZZYtS76a5iRe/oOz1gOtHmLsoSJKnU7DWFyGE+4khl3SvJamKggH8BO+xe31Q5gJTafWMqck23q
	2NstivsS3I+B+dqWt9MCFVY+tEKCYRqndPUtnXMkUms7zZFZCFPZSWJqxc0WGl8QbUPzjdi9tc8xa
	j8DlmnuEa7ss2idN7Oibj3rx2z1N71CfXVGQcl2x/L+mz8uNgwoiDvjP2kziJQzKEaQGLugtMK3Kj
	vrYdCkDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reucg-00000004iqm-29pu;
	Tue, 27 Feb 2024 10:23:42 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reucc-00000004io8-37E8
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Feb 2024 10:23:41 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-365afa34572so412375ab.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Feb 2024 02:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709029414; x=1709634214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRDnUl47SBcmf8gVz+t2ubWEYD6TUCpoZIdH8z+nNoU=;
        b=FLCfgIUXJc1gL/Daf2kYnz41g1G8JZ+IGroRNeMkI/mlPbaDtT1gMEKBCk5JFcmtnJ
         BpWVZ6ijUC8LbwyrswbKvlKxFjuk0UUauNIAdfc0bBHRSAECHyFwUaqw4yd0dfPtSx7T
         7N8sWyR2oim7t7Cc8qmG/DMI37AhcB3UYHs2UzVRpVlv40rwCQfm+VFlCKrALPKsRZbm
         NU8+wNveeYtcMtpvIJ2q/xzb8ZsNd5rF4AdukznTnObMqcgHbIq/3JE0vL2kHDSh6oPF
         aQm0KnE3GqC2aEaJxWtWWFVG/hseYO9FvC/7jvd1tuc8brwj2Zf/JkhMyslK66Lj3Gyz
         iIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709029414; x=1709634214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRDnUl47SBcmf8gVz+t2ubWEYD6TUCpoZIdH8z+nNoU=;
        b=cvG35mvqHPcWbSRHODE3BEXq3NDdEZx0oZ5UAbQYkPdSAo0K8B4iDWwyjMfgw3vS+E
         +9pBm6jHJwHVimB/GPCGI8j4Usp9ycy4+2nhVdr89BuscI9+M8PY8KquVCKtmxka+xsn
         j8W4vPFKKu0JfpIX/DHQPI46Qh5gqT8tCe0fplHPJMdc13KJtgWPzZiJ8Uo6PRNeE1SJ
         WiYCSytXiiBE0WhEqbdltJLdl2AJFzGe0npZ0EMrCqDhB9MXnDR0GTEUAZpP2V1ocXzu
         +Nd27U9h51WP2SHksGX19DZD0AlSyY2nnsMagSQY+qSSqNPyl+ls0R88qT9UwMCC+Eph
         FiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyWzQAQXcAjj/esYyBqqZAwGdtbkYAUpBTtT7tSiPb27aFlgr7NN/vAK6xRRDdwuse0bwNq0c2hN7hZYn4JmFukbIUCWmyaTEiW0QqWrlUbSdu
X-Gm-Message-State: AOJu0YxtoFZSso4BEt1Az95w0YpUZ/8C0tjyha6NikYRN/sF9bJgA+Od
	62X0AV9TjHzAMJHA+Wky62MHDzPsbgQgkSZBy/cxIzWDAv7e7KuYrJ9P20rn+Kk=
X-Google-Smtp-Source: AGHT+IFlwjkngqWStTBwNfi9zv2j3kwATePJOcv87F/BtVt3qeg8VtNnjQ+1xDPzFY8KBNxxoIwTKw==
X-Received: by 2002:a05:6e02:e10:b0:365:1b7c:670 with SMTP id a16-20020a056e020e1000b003651b7c0670mr7885060ilk.8.1709029414201;
        Tue, 27 Feb 2024 02:23:34 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p6-20020a92c606000000b003642dacafa5sm2063105ilm.29.2024.02.27.02.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 02:23:33 -0800 (PST)
Message-ID: <92b9e9ac-6265-4611-888d-ba74bb871be5@baylibre.com>
Date: Tue, 27 Feb 2024 11:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-2-4fa1cea1667f@baylibre.com>
 <e15fdb18-d4de-495f-b90b-ba0e787cbef4@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <e15fdb18-d4de-495f-b90b-ba0e787cbef4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_022339_038644_5414E5C8 
X-CRM114-Status: GOOD (  20.15  )
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



On 26/02/2024 16:30, AngeloGioacchino Del Regno wrote:
> Il 26/02/24 15:01, Alexandre Mergnat ha scritto:
>> Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 127 
>> +++++++++++++++++++++
>>   1 file changed, 127 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml 
>> b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
>> new file mode 100644
>> index 000000000000..f469611ec6b6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
>> @@ -0,0 +1,127 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek MT8365 sound card with MT6357 sound codec.
>> +
>> +maintainers:
>> +  - Alexandre Mergnat <amergnat@baylibre.com>
>> +
>> +description:
>> +  This binding describes the MT8365 sound card.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8365-mt6357
>> +
>> +  mediatek,hp-pull-down:
>> +    description:
>> +      Earphone driver positive output stage short to the
>> +      audio reference ground.
>> +      Default value is false.
>> +    type: boolean
>> +
>> +  mediatek,micbias0-microvolt:
>> +    description: |
> 
> description: Selects MIC Bias 0 output voltage
> 
>> +      Selects MIC Bias 0 output voltage.
>> +      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
>> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> 
> No, you don't say 0 1 2 3 4 to a property that says "microvolt", that's 
> simply
> wrong.
> 
> mediatek,micbias0-microvolt = <2100000>;
> 
> ...so you want a binding that says
> enum: [ 1700000, 1800000, this, that, 2700000]
> 

Is it correct if I put "description: Selects MIC Bias 0 output voltage 
index" ?

>> +
>> +  mediatek,micbias1-microvolt:
>> +    description: |
>> +      Selects MIC Bias 1 output voltage.
>> +      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
>> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> 
> same here.
> 
>> +
>> +  mediatek,platform:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: The phandle of MT8365 ASoC platform.
>> +
>> +  pinctrl-names:
>> +    minItems: 1
>> +    items:
>> +      - const: aud_default
>> +      - const: aud_dmic
>> +      - const: aud_miso_off
>> +      - const: aud_miso_on
>> +      - const: aud_mosi_off
>> +      - const: aud_mosi_on
>> +
>> +  vaud28-supply:
>> +    description:
>> +      2.8 volt supply for the audio codec
>> +
>> +patternProperties:
>> +  "^dai-link-[0-9]+$":
>> +    type: object
>> +    description:
>> +      Container for dai-link level properties and CODEC sub-nodes.
>> +
>> +    properties:
>> +      codec:
>> +        type: object
>> +        description: Holds subnode which indicates codec dai.
>> +
>> +        properties:
>> +          sound-dai:
>> +            maxItems: 1
>> +            description: phandle of the codec DAI
>> +
>> +        additionalProperties: false
>> +
>> +      link-name:
>> +        description:
>> +          This property corresponds to the name of the BE dai-link to 
>> which
>> +          we are going to update parameters in this node.
>> +        items:
>> +          const: 2ND I2S BE
>> +
>> +      sound-dai:
>> +        maxItems: 1
>> +        description: phandle of the CPU DAI
>> +
>> +    additionalProperties: false
>> +
>> +    required:
>> +      - link-name
>> +      - sound-dai
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - mediatek,platform
>> +  - pinctrl-names
>> +  - vaud28-supply
>> +
>> +examples:
>> +  - |
>> +    sound {
>> +        compatible = "mediatek,mt8365-mt6357";
>> +        mediatek,platform = <&afe>;
> 
> Please:
> 
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Is it about the wrong pinctrl-names tab alignment ?
Also, 2ND I2S BE => 2ND_I2S_BE ?
Otherwise, I don't get it sorry.

> 
> Regards,
> Angelo
> 
>> +        pinctrl-names = "aud_default",
>> +            "aud_dmic",
>> +            "aud_miso_off",
>> +            "aud_miso_on",
>> +            "aud_mosi_off",
>> +            "aud_mosi_on";
>> +        pinctrl-0 = <&aud_default_pins>;
>> +        pinctrl-1 = <&aud_dmic_pins>;
>> +        pinctrl-2 = <&aud_miso_off_pins>;
>> +        pinctrl-3 = <&aud_miso_on_pins>;
>> +        pinctrl-4 = <&aud_mosi_off_pins>;
>> +        pinctrl-5 = <&aud_mosi_on_pins>;
>> +        vaud28-supply = <&mt6357_vaud28_reg>;
>> +
>> +        /* hdmi interface */
>> +        dai-link-0 {
>> +            sound-dai = <&afe>;
>> +            link-name = "2ND I2S BE";
>> +
>> +            codec {
>> +                sound-dai = <&it66121hdmitx>;
>> +            };
>> +        };
>> +    };
>>
> 

-- 
Regards,
Alexandre

