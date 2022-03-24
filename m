Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D94C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbAXOiMphUi+6/fHOR4o0akG300WnXyOTKUc1yrqEGo=; b=DPHVPLMgYt8g8p
	RiTunpPdRQ6SCHSOIhI3BpkuLFQbDWvair7h+0/53DDhxpgh+6kEvBasuyS8SDHPY10jU1afLmj8f
	ZBNKJ52AGbXisWdS1AnjepkZtfn/+ko4RaPVuHqAb9heVITHJKGX5OgbRxLCAKgAphEMaGdjiYIIF
	5v7gmmxO6+80RQvu/ZX5MJdviAUUwjOjBgzy78/KvVNUVU+ALeRMEQrgCFPJSZK+hD9+YOVq3zK7P
	T9PjeJ/SuB9spu2UnGB6WsUe/PncvgWyqAUBzSILKkBR3B6R/tlGKqu+1bF8JJcwiTSMEqQSUhoC+
	s3MoSWpOIV2lUJC9IrTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXMqu-00GcbQ-LY; Thu, 24 Mar 2022 12:46:08 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXMps-00Gc8g-4Z; Thu, 24 Mar 2022 12:45:05 +0000
Received: by mail-wm1-f53.google.com with SMTP id r7so2652959wmq.2;
 Thu, 24 Mar 2022 05:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fDYFkQgPHYFRTF7D6EGG7XBxL3cF1rGYKIS0RxgnfuU=;
 b=AEXi4VNTrulsh74fajgHAvf055XyW5VGBSWKJ8KYdYXtCVhAuU7zUE1cpufIfTQuSr
 Mr0T2R0UqiwHJ3e8rnNipYPBl9xj3lOitgrcTAw3a4U0X4HOi3SM35HP+X98ZYt4kj++
 1POEoDDQX6hFlDzplVwoL+V3kxq4Si2VItpFisoMEcANHvEsLiavgD8vklyFSzKwwh7I
 yoSD91fCRmDMXULtSncTpi061sqwviQM208ou29SLojkD6XbZYoW74QB7mgncebPaYgN
 K9DyrZnAuVsCji+3tNysn69pXr3PHuyuQAVwQ6uAGcixfODA37sYYigWuAvUJ/CmXQZv
 WEpQ==
X-Gm-Message-State: AOAM5313yo7DsVp2saDQTMJRx2dswmcJUUUkj7fvEhvuUIBa2Oyi5beb
 xxf7w2Q/mVZm8SJUC7Hx2DM=
X-Google-Smtp-Source: ABdhPJwqlx64y5kOnDtI8q4vunMtQ05mIslAOi/mEHPMerHoP4tV7CnkelIT6sXi3pGwkYVHQP8MmA==
X-Received: by 2002:a1c:4b16:0:b0:38c:86c4:f205 with SMTP id
 y22-20020a1c4b16000000b0038c86c4f205mr14264220wma.131.1648125901903; 
 Thu, 24 Mar 2022 05:45:01 -0700 (PDT)
Received: from [192.168.0.156] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 l11-20020a5d674b000000b0020402c09067sm2497205wrw.50.2022.03.24.05.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 05:45:01 -0700 (PDT)
Message-ID: <aa34eccf-ef08-4a8f-7a6c-7fbd05bd54b6@kernel.org>
Date: Thu, 24 Mar 2022 13:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: devfreq: mediatek: add mtk cci devfreq
 dt-bindings
Content-Language: en-US
To: Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com, louis.yu@mediatek.com,
 roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
 <20220307122513.11822-2-jia-wei.chang@mediatek.com>
 <bf418e08-2e32-5e61-abd8-abb0d8f5c080@canonical.com>
 <13482b1b4244df5c0c0a4d6a60cdb2a7ba88500a.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <13482b1b4244df5c0c0a4d6a60cdb2a7ba88500a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_054504_230547_F6F23A99 
X-CRM114-Status: GOOD (  26.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24/03/2022 13:11, Jia-Wei Chang wrote:
>>
>> Remove "driver Device Tree Bindings". "Devfreq" is Linuxism, so this
>> maybe "bus frequency scaling"? Although later you call the device
>> node
>> as cci.
> 
> Should I use "Binding for MediaTek's Cache Coherent Interconnect (CCI)
> frequency and voltage scaling" as new title?

I just suggested to remove word "bindings" so do not add it again. This
should be a title for hardware.

Now what exactly is it - you should know better than me. :)
"MediaTek's Cache Coherent Interconnect (CCI) frequency and voltage
scaling" sounds good to me, assuming that this is the hardware we talk
here about. :)

> 
>>
>>> +
>>> +maintainers:
>>> +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
>>> +
>>> +description: |
>>> +  This module is used to create CCI DEVFREQ.
>>> +  The performance will depend on both CCI frequency and CPU
>>> frequency.
>>> +  For MT8186, CCI co-buck with Little core.
>>> +  Contain CCI opp table for voltage and frequency scaling.
>>
>> Half of this description (first and last sentence) does not describe
>> the
>> actual hardware. Please describe hardware, not driver.
> 
> Sure, I will fix it in the next version.
> 
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: "mediatek,mt8186-cci"
>>
>> No need for quotes.
> 
> Sure, I will fix it in the next version.
> 
>>
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description:
>>> +          The first one is the multiplexer for clock input of CPU
>>> cluster.
>>> +      - description:
>>> +          The other is used as an intermediate clock source when
>>> the original
>>> +          CPU is under transition and not stable yet.
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: "cci"
>>> +      - const: "intermediate"
>>
>> No need for quotes.
> 
> Sure, I will fix it in the next version.
> 
>>
>>> +
>>> +  operating-points-v2:
>>> +    description:
>>> +      For details, please refer to
>>> +      Documentation/devicetree/bindings/opp/opp-v2.yaml
>>> +
>>> +  opp-table: true
>>
>> Same comments as your CPU freq bindings apply.
> 
> mtk-cci-devfreq is a new driver and its arch is same as mediatek-
> cpufreq so that the properties of mtk-cci are refer to mediatek-cpufreq 
> bindings.
> operating-point-v2 is used to determine the voltage and frequency of
> dvfs which is further utilized by mtk-cci-devfreq.

"operating-point-v2" is understood, but the same as in cpufreq bindings,
I am questioning why do you have "opp-table: true". It's a bit
confusing, so maybe I miss something?

> 
>>
>>> +
>>> +  proc-supply:
>>> +    description:
>>> +      Phandle of the regulator for CCI that provides the supply
>>> voltage.
>>> +
>>> +  sram-supply:
>>> +    description:
>>> +      Phandle of the regulator for sram of CCI that provides the
>>> supply
>>> +      voltage. When present, the cci devfreq driver needs to do
>>> +      "voltage tracking" to step by step scale up/down Vproc and
>>> Vsram to fit
>>> +      SoC specific needs. When absent, the voltage scaling flow is
>>> handled by
>>> +      hardware, hence no software "voltage tracking" is needed.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - clocks
>>> +  - clock-names
>>> +  - operating-points-v2
>>> +  - proc-supply
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/mt8186-clk.h>
>>> +    cci: cci {
>>
>> Node names should be generic and describe type of device. Are you
>> sure
>> this is a CCI? Maybe "interconnect" suits it better?
> 
> Yes, this is a CCI and it is generic type of device like CPU in my
> opinion.
> If my understanding is correct, CCI is more suitable.

OK.

> 
>>
>>> +      compatible = "mediatek,mt8186-cci";
>>> +      clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>, <&apmixedsys
>>> CLK_APMIXED_MAINPLL>;
>>> +      clock-names = "cci", "intermediate";
>>> +      operating-points-v2 = <&cci_opp>;
>>> +      proc-supply = <&mt6358_vproc12_reg>;
>>> +      sram-supply = <&mt6358_vsram_proc12_reg>;
>>> +    };
>>
>>
>> Best regards,
>> Krzysztof
> 


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
