Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B35FC5478C
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 12:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDRYe/KHQlnSYq9IEFbpIIgAFOjpXxlEkxELgPs5a8I=; b=mvT48YC4PUDq3Rb5v4dov52rB0
	po8Q5LNuyZ6vfBJLSJqCbW5uESmhVY/OHPrwHDrgza1ULrxxdkQ9GPiMSPf6giqdZzfR76lt+eKBm
	oXO/eyPMPAXg0d2ktNYA5L7Wi2diHcThFIqgDo3lR0JY2QK+fqh7qf6034uxRpIonzrNdetQ3elmK
	r/WwWLVIw6ZkApQOo9pVyoR1zoud3YNdltVq2BaLCGhLctheZFw+5sE8Vwa7cjeA2r19QbPUxav29
	1EdF52q7cpSzTgfrYSNm02QrspSsp+eM/JBSJnwYSfftt7eUpIgL5nYOiTqxpfKa5fmfBcHKm+p8u
	xotZdbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfIkT-00000009C0N-2R7i;
	Wed, 28 Feb 2024 12:09:21 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfIkQ-00000009ByA-2cos
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Feb 2024 12:09:20 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a3e7f7b3d95so628533366b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Feb 2024 04:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709122147; x=1709726947; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WDRYe/KHQlnSYq9IEFbpIIgAFOjpXxlEkxELgPs5a8I=;
        b=hmUnZsATUzlXghJEP26BZtEem6uI/f/ZPjlhJTAZMAr/FKRw7WAMastOkGI1A8tCNI
         IOYSO/GgYo6Pk/EqJjlaeKqvz1z0nppEPghmN+du2A9Q+esxNXEac3dfZkhILqRniooX
         mdXniIpO88FnCR45yTJbRCsjIzoAutj0jiQhIqTQ9C1vaCheuw9vfHuZPP23GZJk7JB6
         foq2DsX4WNHsT3uyI85rGNUG4l1AYjcwf4inMzf7emFzaeaSDeq8wHsfzTamqIBKygSu
         XpYPrELHIegsGFCHHbU/kMidI60Z3BQGOCcqo1DLNrF1X7TRVJKMveKzQBTJ2/tQbyx1
         R1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709122147; x=1709726947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDRYe/KHQlnSYq9IEFbpIIgAFOjpXxlEkxELgPs5a8I=;
        b=qKM+16wZdoOcRevmU+34+jNTTz4HB1WYx9prDEemDhp4ZjAaefM0ivOrwjOHPDh1nA
         BNr1dWuEgzw4cQ2xGv4Mv/cWZjEAn8a7/NMboIz7X03n7HnP0zczNJmPtbiyYcHxz19W
         wQngdmqvvNDG01I6Phg4l1A2ZY/Q8BCPoDk0qxBk6oJYLBx0oRyGry1HjCJ54f1RjiK1
         2zULgbS0Hc2ZbrsCoDmmRr99jlztqQekgvwVj6Cb48+l9Boz4ppsjk9AbfI0sw1W9BxN
         2n6sgahYLDwIRh+kT8vdLsG6pID2jHj4fBkmSlwy5ZNatAUNrXEwa4GuLBTJQW5Ndz8i
         PNOA==
X-Forwarded-Encrypted: i=1; AJvYcCUBG/WzclawgUErT7v4bM2BP9aDX9E8QL6g993sML5KRgTerayTAZFgdDKt/JioKaKvbKhnTG3f/WIjumnn94OTcU1IqmKS4LzGB68mbu4QoDrG
X-Gm-Message-State: AOJu0YxMqnYqpgVg7t+bTTmMZ3+U0kiS30MzCq9dKIM3BGSPnfaY7SDT
	y+S6do9qrNo6o1sBUrbnIjsAxxDYDLdzhr4aPn0qPeJQU5EgcDufQEfhFWTkwjc=
X-Google-Smtp-Source: AGHT+IFdLV5ldkp0x2cr3dhraZTRWmFPQrhdR1DDCvm1U1uhhE7FIv9Lhc4520o628RK8mW0PxrgKw==
X-Received: by 2002:a17:906:c196:b0:a40:a615:a9c4 with SMTP id g22-20020a170906c19600b00a40a615a9c4mr8913393ejz.65.1709122147305;
        Wed, 28 Feb 2024 04:09:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id ps3-20020a170906bf4300b00a42ed7421b8sm1790012ejb.93.2024.02.28.04.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 04:09:06 -0800 (PST)
Message-ID: <35e0d5e6-9a65-4a96-93d8-0007b4dee3d7@linaro.org>
Date: Wed, 28 Feb 2024 13:09:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
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
 <20240226-audio-i350-v1-1-4fa1cea1667f@baylibre.com>
 <ce5f71a9-1b5f-4724-89db-dae2f64e8008@linaro.org>
 <eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com>
 <bd4bf6ae-350e-4ee6-a924-7dd31b2c6034@linaro.org>
 <66e527af-0253-4565-9822-04ed84e5817c@baylibre.com>
 <bb86b986-ecd7-416a-9036-082a3cff2176@collabora.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <bb86b986-ecd7-416a-9036-082a3cff2176@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_040918_707492_C9844A3E 
X-CRM114-Status: GOOD (  13.27  )
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

On 28/02/2024 11:25, AngeloGioacchino Del Regno wrote:
> Il 28/02/24 10:57, Alexandre Mergnat ha scritto:
>> I think I got it.
>>
>> - mediatek,i2s-shared-clock: will be remove from DT
>> - mediatek,dmic-iir-on: will be remove from DT
>> - mediatek,dmic-irr-mode: will be remove from DT
>> - mediatek,dmic-two-wire-mode: rephrase description needed
>>
>> I've did abstraction (despite me) that IIR settings are runtime config because the 
>> driver implement its usage like a one-time-setup -_-'
>>
> 
> Yes but just one more thing I just noticed: `mediatek,dmic-two-wire-mode` - can we
> please rename this to `mediatek,dmic-mode` ?
> 
> That'd be for consistency check mt6359.yaml and mt6358.txt
> 
>    mediatek,dmic-mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: |
>        Indicates how many data pins are used to transmit two channels of PDM
>        signal. 0 means two wires, 1 means one wire. Default value is 0.
>      enum:
>        - 0 # one wire
>        - 1 # two wires

Thanks for checking. Now I wonder if entire binding just ignored
existing work and started doing things from scratch...

Best regards,
Krzysztof


