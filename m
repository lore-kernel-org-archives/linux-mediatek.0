Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7315C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 17:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HfFEhDy7wrc1JJ4JwN66dtF2lU/7GHQL5ceh8i2rCk=; b=ui3Jqb/P7VQ05WS7hoP3vFBQdR
	uVSBy4GilQAvLtH/+y2q8TrlX4HWnl9zox+UfHO/s0u98/Oqe+UdhOnvaH751xJU0A40VBUefNDgQ
	vaSAkKQy5Jbx6js4dTSR0Y6a7/h2zD3L9OsQQn/QAyPyJ+uCgBquey05X7ELPeMxHp/63+EQ+OTEJ
	pTLJuV480htd4NfgiNrnXfk5dS13hCK3xwMdTd6AztIQd7uv7q9iyjybBJg3Wc4Ul63J/kihUUNBR
	bTm+p10+7GdTWaZiTlaQ0ImjaEN9bBBenU4EFhpM1OWxxYi8PMPdlYUgcV+nb9Sycwa2KtlTFLBB2
	Pp/Afx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJcW-00000000t7g-2WsM;
	Tue, 23 Apr 2024 17:07:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJcP-00000000t1x-2asT
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 17:07:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4187c47405aso40241005e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 10:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713892063; x=1714496863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4HfFEhDy7wrc1JJ4JwN66dtF2lU/7GHQL5ceh8i2rCk=;
        b=MkGXJXBw62VH5hjkByIGmcp5pP0RGSTDlQJ5EtySIACDtcdv1AmtnhM6S9hRZOfGOF
         A+r8OPsMTJeEiadhxJA7NKDbhxze7xgSlsk1mAqDt37Qn3CZSvqGmXH+UkMLfOPqCnHo
         nd1DtuLO6LiLQ07zmsnfUiUSmUqwNg4Z0yL/r+efXeCxBkP7p18tV+OGK0BP/jXOWd0n
         MDZFMGKmhY7ibxAkInUizlXtvOHY+OXUR1UHRa9mv4554MwBVN1dpbR7Qm7ez/QnkTvG
         5gDxWU1NDMKGYLDWf0mkcYxzDYV2RaxQ4g8pHIZzHHk5YcH8US3OnRUKXbfs1NJm48Jw
         RmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713892063; x=1714496863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HfFEhDy7wrc1JJ4JwN66dtF2lU/7GHQL5ceh8i2rCk=;
        b=foU76qAu/vHLxU6UnLDGHAPRzJkder4KhCdTP8vqjvWhuqQAnR/RgNAs24V8hRULHJ
         Z/OsDZZWtAyY/JIcr046Aq/40Eelz/J1zC3K9lpgHAzS6HsSetPih6do6DGVzCLZOd9T
         VAfUr97qMWG/pDhcc4UhEZpghCe+VIMp4s2XCkOcPlfxIeLKihkgs5ru0DyiDeTt8rCX
         WywR7pOXG2RSVByXtaUXsnFFh/HOlv1o3vOrDT6zRHIKpTHCtlxSvTFAaQLXfol8Bu7E
         +p/kzuGCiV9CEl2d96D0kP1njXns8IUpoGnm2HhNuaZ99pcKwm+6IJNzBSmu+8ihP2SU
         tfWA==
X-Forwarded-Encrypted: i=1; AJvYcCXQtoj7lo66mYrWF2LHWTG5wgTQpTT1Kyx9wok4iRS9UsZRGBOM7HqnQFbGT6SbhLVYA5LNh6aMr6Qex2k1dDgNstcqOzDh9RCgwBKCC7t76IQZ
X-Gm-Message-State: AOJu0Yxrcm8EqiL16Zxr1xYY4PyxNHOynHB8hMggyKTTerhsNQhAzXD6
	qzkyzqNE1kN38R2hOoz2nSub6eQm8Y1Y2qr+uQuHwo871T3PqXM/yHfjTP12su4=
X-Google-Smtp-Source: AGHT+IEeml7xlDPvKVEJlBPjkyqYO1K/a3UWyW6pbqsDEH7Dp3zHkT8MMXjVjKAP5avnRrImiMosWg==
X-Received: by 2002:a05:600c:a001:b0:418:a7a7:9bd7 with SMTP id jg1-20020a05600ca00100b00418a7a79bd7mr8084322wmb.24.1713892063377;
        Tue, 23 Apr 2024 10:07:43 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b00414659ba8c2sm20996935wmq.37.2024.04.23.10.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 10:07:42 -0700 (PDT)
Message-ID: <a8730bb5-4f51-4c75-b049-6f00e3de5855@baylibre.com>
Date: Tue, 23 Apr 2024 19:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/18] ASoC: dt-bindings: mt6357: Add audio codec
 document
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
 <20240226-audio-i350-v3-3-16bb2c974c55@baylibre.com>
 <481abafd-33af-44a6-8460-068b4a85d764@linaro.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <481abafd-33af-44a6-8460-068b4a85d764@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_100745_840788_91875416 
X-CRM114-Status: GOOD (  14.09  )
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



On 09/04/2024 17:55, Krzysztof Kozlowski wrote:
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    codec {
>> +        mediatek,micbias0-microvolt = <1900000>;
>> +        mediatek,micbias1-microvolt = <1700000>;
>> +        mediatek,vaud28-supply = <&mt6357_vaud28_reg>;
> Sorry, this does not work. Change voltage to 1111111 and check the results.

Actually it's worst ! I've removed the required property (vaud28-supply) but the dt check pass.
Same behavior for some other docs like mt6359.yaml

The at24.yaml doc works as expected, then I tried compare an find the issue, without success...

I've replaced "codec" by "audio-codec", according to [1].
I've tried multiple manner to implement the example code, without success. I'm wondering if what I 
try to do is the correct way or parse-able by the dt_check.

If I drop this file and implement all these new properties into the MFD PMIC documentation directly, 
I've the expected dt_check result (function to good or wrong parameters)


+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,9 +37,32 @@ properties:
    "#interrupt-cells":
      const: 2

-  codec:
+  audio-codec:
      type: object
-    $ref: /schemas/sound/mt6357.yaml
+    properties:
+      vaud28-supply:
+        description: 2.8 volt supply phandle for the audio codec
+
+      mediatek,hp-pull-down:
+        description:
+          Earphone driver positive output stage short to
+          the audio reference ground.
+        type: boolean
+
+      mediatek,micbias0-microvolt:
+        description: Selects MIC Bias 0 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+      mediatek,micbias1-microvolt:
+        description: Selects MIC Bias 1 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+    required:
+      - vaud28-supply
      unevaluatedProperties: false

    regulators:
@@ -88,6 +111,12 @@ examples:
              interrupt-controller;
              #interrupt-cells = <2>;

+            audio-codec {
+                mediatek,micbias0-microvolt = <1700000>;
+                mediatek,micbias1-microvolt = <1700000>;
+                vaud28-supply = <&mt6357_vaud28_reg>;
+            };
+
              regulators {


Is the implementation above looks good for you ?


[1] 
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

-- 
Regards,
Alexandre

