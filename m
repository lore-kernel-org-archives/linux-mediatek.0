Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4785DC5ACB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqorQbljtFpA0x+MxGfUnzvUIXIXOJHNHwKUm5kHLXI=; b=eoaodLFfnJVe79HDHZi16/RqGi
	BUsgUTXqlm5uuye9QIbfVdE5sYtkLMt3FCvqAzQ152IQHOBZgg7YU2DxKbr9zS+jG3kIuLA9SuXMA
	TjFCgJmQYEKe4DYggyakX8aKKz29nDoccL7327caMqo/cuvtx5MvFsIv/Tn0kRTzlJdIZDTAjl/Dt
	qbcJXQ8jjHq3s8/xnaTlkO5ni2IU3n7AVDLZXx6KNZgBR0BxQdkxQtn3iull1VI+REF4oY2bS6vnV
	apJOCb+iZBo2cVEBEZFJCuu6vVZG1dEA+t0JEd/C7S+Z16vMkf8MKwLOSsRNITZICn2lz8dYtWjim
	JnvTxddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LTk-00Fvvw-0N;
	Tue, 21 Nov 2023 07:47:28 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LTg-00FvuT-1K
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 07:47:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991c786369cso717240466b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Nov 2023 23:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700552842; x=1701157642; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqorQbljtFpA0x+MxGfUnzvUIXIXOJHNHwKUm5kHLXI=;
        b=GSGiWzkf/Y9N2qfaD7WLL1dmv4b2MlDcXHjC/VKUURQGK5a4NyNPGV1T+eXOf60MQY
         Bn6SW3qkNIwG4zkPwZg4FvjD/R8gdVRZQl7jLF5r3WWcsEHyK489qsq7iPhI+Qs06dAm
         ABaa6y7CkhZj6eH98HrRyT4v8P04ZLxJl7p0vKnHGKHEE/WmNV6SoCA9EBUXZZKFAggU
         p4xCTe+lfWHc40mLHzOm8XVGblNg8+YNPNeUHVfPtV4UlErFH9OySE9NgeaOf0JLe3fe
         Ud8NJvnlaW/CC+iXYGAQDZkFjH/aEHdnCmHJ6DbkmR/m0XgwUrvm2gxjCQbt9Z7KQPZk
         qQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700552842; x=1701157642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqorQbljtFpA0x+MxGfUnzvUIXIXOJHNHwKUm5kHLXI=;
        b=dgeolHYuXLNv0KGCrGfAO1f7duSCyc2hsn1ns2FLlDfacvIwFx0vIjmRJIzgH2i7I7
         v0iRktki3TPcKvy3OQTAz6mri3R6M1bmRfxgIfxjPy00sCScgVVENVzluKJqoRESz1LH
         wLZZ5brNheCtQUAnDVWETu4+RmMNItioJRf1kPqVifoGEdUAeNgJFE3yroP94GioM5bg
         WtRqCC67aZiKxt4sW3yHuYNCmswIM2414pm208sdKciriDEqP2AqqvltMAVXKAhuYpt1
         B1Zv111pgKASA7n2XTB1ay2QNqKPJdkJi+d/NHjAHpiPYqLVL8c1eBExe0zu1b9iKue/
         Le7A==
X-Gm-Message-State: AOJu0YwfqrQ0MatqjJ/uIvGieyAS8r2RS1/BaTyiI733CjaD5lWIYNRD
	87a9XnBwq6ACG9c3he4NZEC8Pw==
X-Google-Smtp-Source: AGHT+IHueEI/LYzq8OnogdMBjjkgXmWFk8XwmxU9cgWy13QqTgMpQ8th6trg2y3LXbmauXNw3li19Q==
X-Received: by 2002:a17:906:bc53:b0:9fe:6349:d8ba with SMTP id s19-20020a170906bc5300b009fe6349d8bamr3789712ejv.27.1700552842316;
        Mon, 20 Nov 2023 23:47:22 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id n21-20020a1709062bd500b00a015eac52dcsm752988ejg.108.2023.11.20.23.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 23:47:21 -0800 (PST)
Message-ID: <b48293f3-16e3-4980-b900-add0cb7d69f6@linaro.org>
Date: Tue, 21 Nov 2023 08:47:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Michal Simek <michal.simek@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com>
 <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <CAMuHMdW4WPJT0Km7w8RWrGJaztk6QDGoFAn0bdGbrEsw81R1FA@mail.gmail.com>
 <acfdce81-f117-4a1a-a9fe-e2b4b8922adb@linaro.org>
 <bd49f17c-7ebf-4e19-b77b-b5ec95375f7d@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <bd49f17c-7ebf-4e19-b77b-b5ec95375f7d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_234724_475859_14A0C296 
X-CRM114-Status: GOOD (  16.56  )
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

On 21/11/2023 08:33, Michal Simek wrote:
> 
> 
> On 11/20/23 20:31, Krzysztof Kozlowski wrote:
>> On 20/11/2023 20:18, Geert Uytterhoeven wrote:
>>> Hi Krzysztof,
>>>
>>> On Mon, Nov 20, 2023 at 3:53 PM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>> On 20/11/2023 15:01, Michal Simek wrote:> >
>>>>> On 11/20/23 09:40, Krzysztof Kozlowski wrote:
>>>>>> Document preferred coding style for Devicetree sources (DTS and DTSI),
>>>>>> to bring consistency among all (sub)architectures and ease in reviews.
>>>
>>>>>> +Organizing DTSI and DTS
>>>>>> +-----------------------
>>>>>> +
>>>>>> +The DTSI and DTS files should be organized in a way representing the common
>>>>>> +(and re-usable) parts of the hardware.  Typically this means organizing DTSI
>>>>>> +and DTS files into several files:
>>>>>> +
>>>>>> +1. DTSI with contents of the entire SoC (without nodes for hardware not present
>>>>>> +   on the SoC).
>>>>>> +2. If applicable: DTSI with common or re-usable parts of the hardware (e.g.
>>>>>> +   entire System-on-Module).
>>>>>
>>>>> DTS/DTSI - SOMs can actually run as they are that's why it is fair to say that
>>>>> there doesn't need to be DTS representing the board.
>>>>
>>>> I have never seen a SoM which can run without elaborate hardware-hacking
>>>> (e.g. connecting multiple wires to the SoM pins). The definition of the
>>>> SoM is that it is a module. Module can be re-used, just like SoC.
>>>
>>> /me looks at his board farm...
>>>
>>> The Renesas White-Hawk CPU board can be used standalone, and has a
>>> separate power input connector for this operation mode.  As it has RAM,
>>> Ethernet, serial console, eMMC, and even mini-DP, it can serve useful
>>> purposes on its own.
>>> I agree it's not a super-good example, as the board is not really a
>>> "SoM", and we currently don't have r8a779g0-white-hawk-cpu.dts, only
>>> r8a779g0-white-hawk-cpu.dtsi.
>>>
>>> The RZ/A2M CPU Board is a real SoM, which can be powered over USB.
>>> It has less standard connectors (microSD, USB, MIPI CSI-2), but still
>>> sufficient features to be usable on its own.
>>> Again, we're doing a bad job, as we only have a DTS for the full eval
>>> board (r7s9210-rza2mevb.dts).
>>>
>>> I guess there are (many) other examples...
>>
>> OK, I never had such in my hands. Anyway, the SoM which can run
>> standalone  has a meaning of a board, so how exactly you want to
>> rephrase the paragraph?
> 
> What about?
> 
> 2. If applicable: DTSI with common or re-usable parts of the hardware (e.g.
> entire System-on-Module). DTS if runs standalone.

OK, but then it's duplicating the option 3. It also suggests that SoM
should be a DTS, which is not what we want for such case. Such SoMs must
have DTSI+DTS.

Best regards,
Krzysztof


