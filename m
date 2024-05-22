Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9933C25B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 May 2024 21:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iT1AOadXKdkeYb8c0TgcpuQB1WGmLOhZwg6j5OThiw8=; b=JSiD5Y95MOH345YrEjNHYQIWvD
	Uxii5bwi+HdRRP3TdAGcHMs3jd/0k1Ezlksu9yTKXayFebJmQgQGJuoWw1FRE7XCugo9Bw8+Dz9T/
	6ZC/bz5F8yLkJBN1DHvBP07YvEyKCdc8EudFMu9+2EAn6Yu1Ng0RJmHOjmRpSl7l2EbApJPFm/mOk
	U0bL/Xi5q4WkLXridQn1QXelF60g6RNu2nFDSd03dUsCnK59DQyxImsmHqkXrw6RHhk8iz2/XvpFz
	IQ7wZCQWNKaKFOdvHJzCAEYmVU9oNUfYz+zgUL5tPp3kqkQsP30aIPdIJnO7l5rraF9hHa7QtHAoc
	1Sf0MOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9t8T-000000046oV-2bg5;
	Wed, 22 May 2024 21:04:33 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9t8Q-000000046mM-2xC2
	for linux-mediatek@lists.infradead.org;
	Wed, 22 May 2024 21:04:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6f44390e328so2795015b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 22 May 2024 14:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716411868; x=1717016668; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iT1AOadXKdkeYb8c0TgcpuQB1WGmLOhZwg6j5OThiw8=;
        b=KUZXNP/zuHkw5NrDPWciAAbigFxYgZLt/WNzoo/+RljhY8rzYVZpxOGGyU3yVKtzz2
         jPwalsiCjqK0nD1hbyohknqGqkaQhNsNi69bPFEvqGxyWapbH5UaJBLyYElgb9Dp9Ui4
         FY2wi2wzj88+vkjyyp1NG6zTwPETM0ihzmMBtEZmFTc+/JT24DlPDMC2bVAj8scTwSBE
         y7DJBVIG/4fePTKvF2zKvkvIyf/pzIPUBZTFFoAZZ49hz0/T0GKDOV3m4GzJle8mpTeT
         bTrdUlBHi3K97OhFw0gF8eAU/p5fFUr6FzmZ6xHGsBdm/XGfJQzWZXH5em8zu4O9Dicb
         Isow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716411868; x=1717016668;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iT1AOadXKdkeYb8c0TgcpuQB1WGmLOhZwg6j5OThiw8=;
        b=lk4MzqEJ4fgAE3eKLF8BRbIoQ5IV+F7I8CHxFzqNPyyxhlEbZ0ioPfSiXIYJfu+VwE
         d1pRohbooRzw7d1+x0sFGgqPc9GT9sBg+1GBTXZFg1vGjk0HhIXeAtkEYz6KCuxzNerS
         r9yur+oRNtf/BiBYHjRLjIw15wZJpxjByTnpGXb9O7JUGNWKlprGMcEROLceo/j++cD1
         /gMOx5egPYRH+JTAV3SVxfX/ZbBhNa/QwKiFqlX84oBZAI/SFr8YJpyiaDd3KWg9+C5p
         PmhWY0l8Yccp5KcSGzpaVAvuYmKGUK5jV4IWgQ+2sLBnb/L3GAxTG0bQs8sbRXIzidl8
         dJWA==
X-Forwarded-Encrypted: i=1; AJvYcCULuWAJoYsQJH/jmE6skvSfEuBzVHZnI+8/SZYi+gsj0RZyfrgMRBSB3xRIj8L4ePmtbwBswCVvq6mVH5MrthFX5L8fW9ZOne0tSVUnsUNai5Pj
X-Gm-Message-State: AOJu0YzmNbhlkjkSdlA0mcyIioFVzWxzV5C4cOHlgDIncVLc3l1iiTxr
	1Qwxb379oG1pMLHQlUR5Ixm/JR6SWr4Nx+efU5VOUkw06jJvjNrK
X-Google-Smtp-Source: AGHT+IHyvIyJqabzGn2pk+6jufjKdtxxS7JXm8ZDJHA57VzobiooDn0JOUAk0HMf2Nxvd5Pxfsf4dg==
X-Received: by 2002:a05:6a21:3483:b0:1af:cfca:e515 with SMTP id adf61e73a8af0-1b1f87386a9mr4758616637.12.1716411868131;
        Wed, 22 May 2024 14:04:28 -0700 (PDT)
Received: from [10.5.5.43] ([103.139.191.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a663bbsm23606465b3a.17.2024.05.22.14.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 14:04:27 -0700 (PDT)
Message-ID: <dc8a05ee-ed84-4517-baad-a220d8702f07@gmail.com>
Date: Thu, 23 May 2024 02:34:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kartik Agarwala <agarwala.kartik@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mt6358: Convert to dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240518081621.63386-1-agarwala.kartik@gmail.com>
 <c05f91f5-a878-4f36-b325-0ac8e038a7e5@linaro.org>
Content-Language: en-US, ar-LB
In-Reply-To: <c05f91f5-a878-4f36-b325-0ac8e038a7e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_140430_812281_A8F2BA04 
X-CRM114-Status: GOOD (  22.45  )
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

On 5/20/24 12:39 PM, Krzysztof Kozlowski wrote:
> On 18/05/2024 10:16, Kartik Agarwala wrote:
>> Convert Mediatek MT6358 Audio Codec bindings from text to dtschema.
>>
>> Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>
>> ---
>>  .../bindings/sound/mediatek,mt6358.yaml       | 47 +++++++++++++++++++
>>  .../devicetree/bindings/sound/mt6358.txt      | 26 ----------
>>  2 files changed, 47 insertions(+), 26 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/sound/mt6358.txt
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
>> new file mode 100644
>> index 000000000..f57ef2aa5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/mediatek,mt6358.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek MT6358 Audio Codec
>> +
>> +maintainers:
>> +  - Kartik Agarwala <agarwala.kartik@gmail.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.

Noted

> 
>> +  The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
>> +  For more detail, please visit Mediatek PMIC wrapper documentation.
>> +  Must be a child node of PMIC wrapper.
> 
> Did you update the PMIC wrapper binding with ref to this?

I am sorry but if I understand this comment, you are asking me to update this
file [1], correct?

1. https://www.kernel.org/doc/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt

> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt6358-sound
>> +      - mediatek,mt6366-sound
> 
> You did not test the DTS.
> 
> I think I raised the issue already: please make necessary fixes to the
> binding (with explanation) or to the DTS, when converting the binding.
>

Apologies again. Just to be sure, am I correct to assume that you want 
me to fix the dts file [1] as it has both these compatibles 
mentioned instead of only one and I should fix that by dropping one of 
the two compatibles?

[1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi#L1246

>> +
>> +  Avdd-supply:
>> +    description: power source of AVDD
>> +
>> +  mediatek,dmic-mode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +      Indicates how many data pins are used to transmit two channels of PDM
>> +      signal. 0 means two wires, 1 means one wire. Default value is 0.
>> +    enum:
>> +      - 0 # one wire
>> +      - 1 # two wires
>> +
>> +required:
>> +  - compatible
>> +  - Avdd-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    mt6358_snd {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> Definitely no underscores. Probably this is "codec" or "audio-codec".

Noted

> 
> Best regards,
> Krzysztof
> 

Thanks for the review!

Regards,
Kartik Agarwala

