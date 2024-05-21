Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ACAC25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTdkV/Nb+lhqigMM3Hf6hdTSrxsoAm88nN+jAsX27lc=; b=Hm2a/ixT3F5CInqIj86ZwEuzlU
	miC+km8HCWMZwEEE+PChF0W9EWwFiEjS12LyXKAjORNByQ+FzaBbJZ2bXDPGSGsK4fQO/hpUwf6sE
	QCY8Jr56+rgLZNXxiLOLfU5KAcz7SWEruKV7VwkpuYNzuIxvHKG4R7Q9H42gEZWitealz0OCA3aHn
	x1+xRdt+IWReJhLt3+RdSMRXGjYqcMqsPUorSQABuBLbG9e5W8ZI3qf+SWwVZVOPhm1oYCNBdmFL+
	4izJhgJP77H3xVAMjEzAeEnMvDp+sSJ2Y2zf67nVR/VzvlGpmntRvw/vaJ2j79yDd7hFBY0YcLy5Z
	9aSwMvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9THp-00000000cwX-2bHf;
	Tue, 21 May 2024 17:28:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9THl-00000000cvY-3nzq
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 17:28:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4202ca70270so46531735e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716312501; x=1716917301; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fTdkV/Nb+lhqigMM3Hf6hdTSrxsoAm88nN+jAsX27lc=;
        b=OLDV9unLWg+s2BylVwVP/BbrgY7NZ1vQXBZSURf6JkbhxnTndApDRwgMsh8slhnBIH
         a1KCqOjto/oMEqX8TSd2ePf3y88ymWfO4umk9LYvj15Jhq50hOBUFCM0UVxK03LXqg3S
         1WioGTBPsx+jQx7dRHO9bs0xdEC0KhOWChNojksuLBnjlyzZOj6Kz/L3r9VnirTAjCcY
         Pu/PT+Xhld8+upecMYRz6HehGLJe68UftJ/wO5u8jPHta+5MO0/Of4g2WakJGRpx72H/
         0JH4NDqczenBLt70sbG8wofPUSAmN5OuRTol4NsTjyZqBH6LP0osNA8grbCIkDFVrA0U
         MdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716312501; x=1716917301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fTdkV/Nb+lhqigMM3Hf6hdTSrxsoAm88nN+jAsX27lc=;
        b=lMRtPC6IInhvv3V7id1LZtE+22Me3EKhFGrDzgQZIFnNpgA3QR0JrHP/wA11ha/ho0
         cD4fmTTnuskwP20vY/RL30du16BwXBoIQbtwtdvKCOn0lCg1k3GVTNDRKL6xmP+ZqyjL
         IX6vGKFmjE7FSGPvIMCelh4I2ece1XbxQbhlVRgAc0hgcGROkBPN5949xerWqCGej0Rs
         JMJiiOSxvhQP+u7DjVgVi0b9jN1J9boUnrhEXUi4Ym17O/w3VmSN09VwcQws5dQF2MoG
         T4rBGmX7RIwpldkfZRCsNRXZiSrdjNcvcmSG7AsF5M0SkcomZE4nsG8oSUtOT88P25Aq
         LdXA==
X-Forwarded-Encrypted: i=1; AJvYcCXNW7hvT+zOotLNF/lNh2wuXOIEdi0MhvEtYnLxv2TljrbzfQqnYFPSu9Zjwr7zOhMYZtbL023HcnoePTArS1VqkBC/JbGIWB6LE2eaE9DK5euj
X-Gm-Message-State: AOJu0Yy5K2A3gzrCp/ZJXKrEut4uFbVcaLzF/MByVjraE9kdlxjQz4ox
	Uyd7M5GPoqj6P/nLDtk39fIuf8z81cePTBsD4AGsJ8SzyduYWLWPKR/llHD0ieU=
X-Google-Smtp-Source: AGHT+IHa7aTOJ9Va0C6tSG204l9GGSDSFJtv1uIZZDq4KISzOIFIvNkmp3rnYOhlulggFsF4yMFpEA==
X-Received: by 2002:a05:600c:4f93:b0:41e:a90d:1216 with SMTP id 5b1f17b1804b1-41fea9324e4mr286919575e9.3.1716312501561;
        Tue, 21 May 2024 10:28:21 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fe36f373fsm449115495e9.20.2024.05.21.10.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 10:28:21 -0700 (PDT)
Message-ID: <5b77621c-7a82-4b9f-add7-70bb9bf9de44@baylibre.com>
Date: Tue, 21 May 2024 19:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt8365: use a specific SCPSYS
 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
 <20240518211159.142920-2-krzysztof.kozlowski@linaro.org>
 <f42ef151-6eee-418f-91e1-5ac08d161119@collabora.com>
 <2cc638ca-0add-4c8c-b844-606e22dbd253@linaro.org>
 <cf8c87fe-7a4f-423f-9c97-3759eeee4894@collabora.com>
 <51a47736-ffe8-49e2-b798-d409ca587501@baylibre.com>
 <75b78eaf-9b13-477c-bf02-4e9837a25dd4@linaro.org>
 <edc43094-19a7-4e62-8fba-ac2b22f66239@baylibre.com>
 <83bd6797-2214-4962-84a0-fadcfd130717@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <83bd6797-2214-4962-84a0-fadcfd130717@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_102826_066679_C6BBC602 
X-CRM114-Status: GOOD (  23.56  )
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



On 21/05/2024 16:13, AngeloGioacchino Del Regno wrote:
> Il 21/05/24 15:26, Alexandre Mergnat ha scritto:
>>
>>
>> On 21/05/2024 10:22, Krzysztof Kozlowski wrote:
>>> On 20/05/2024 17:23, Alexandre Mergnat wrote:
>>>> Hello Krzysztof,
>>>>
>>>> On 20/05/2024 12:12, AngeloGioacchino Del Regno wrote:
>>>>> Il 20/05/24 12:03, Krzysztof Kozlowski ha scritto:
>>>>>> On 20/05/2024 11:55, AngeloGioacchino Del Regno wrote:
>>>>>>> Il 18/05/24 23:11, Krzysztof Kozlowski ha scritto:
>>>>>>>> SoCs should use dedicated compatibles for each of their syscon nodes to
>>>>>>>> precisely describe the block.  Using an incorrect compatible does not
>>>>>>>> allow to properly match/validate children of the syscon device.  Replace
>>>>>>>> SYSCFG compatible, which does not have children, with a new dedicated
>>>>>>>> one for SCPSYS block.
>>>>>>>>
>>>>>>>> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>
>>>>>>> Technically, that's not a SCPSYS block, but called SYSCFG in MT8365, but the
>>>>>>> meaning and the functioning is the same, so it's fine for me.
>>>>>> So there are two syscfg blocks? With exactly the same set of registers
>>>>>> or different?
>>>>>>
>>>>> I'm not sure about that, I don't have the MT8365 datasheet...
>>>>>
>>>>> Adding Alexandre to the loop - I think he can clarify as he should have the
>>>>> required documentation.
>>>> Unfortunately, The SCPSYS (@10006000) isn't documented, but according to the functionnal
>>>> specification, it seems to have only one block.
>>>>
>>>> I don't have the history why SYSCFG instead of SCPSYS.
>>>>
>>>> I've tested your serie and have a regression at the kernel boot time:
>>>> [    7.738117] mtk-power-controller 10006000.syscon:power-controller: Failed to create device link
>>>> (0x180) with 14000000.syscon
>>>>
>>>> It's related to your patch 3/4.
>>> I don't see how this could be related. The error is mentioning entirely
>>> different node - mmsys. No driver binds to 10006000.syscon, except the
>>> MFD syscon of course, so my change should have zero effect on drivers.
>>>
>>> The mtk-pm-domains (so child of patch affected in 3/4) only takes regmap
>>> from the parent, so the cells again are not related.
>>>
>>> Just to be sure: you are testing mainline or next, without any other
>>> patches on top except mine?
>>
>> I've tested on next
>>
>> * a018995ac19c (HEAD -> temp, me/temp) arm64: dts: mediatek: mt8173-elm: correct PMIC's syscon reg 
>> entry
>> * 0f118436c61c arm64: dts: mediatek: mt8365: drop incorrect power-domain-cells
>> * d40e424fe6dc arm64: dts: mediatek: mt8365: use a specific SCPSYS compatible
>> * d7caa08a4a9b dt-bindings: mfd: mediatek,mt8195-scpsys: add mediatek,mt8365-scpsys
>> * 82d92a9a1b9e (tag: next-20240515, linux-next/master) Add linux-next specific files for 20240515
>> *   77ba09d6e7cb Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git
>> |\
>> | * dedcf3a8e704 tools/power turbostat: version 2024.05.10
>> | * baac2f4c7f3b tools/power turbostat: Ignore pkg_cstate_limit when it is not available
>> | * a0525800e2dc tools/power turbostat: Fix order of strings in pkg_cstate_limit_strings
>> | * ffc2e3d90e6f tools/power turbostat: Read Package-cstates via perf
>>
>>
>> I did the test with and without "0f118436c61c arm64: dts: mediatek: mt8365: drop incorrect 
>> power-domain-cells"
>>
>> Without this specific patch, no regression.
>>
>>
> 
> Honestly, that makes very little sense to me - that property is useless and it's
> like it's never been there... at least, no MTK driver is parsing that and there's
> definitely no power domain in the top node (a child does, but not the parent).
> 
> Is this a flaky result? Did you actually try to reboot multiple times to check if
> the platform is *really broken* after that commit?
> 
> Sorry, it's not mistrust or anything, but I've been in this situation multiple
> times in the past, usually always on linux-next (because it's constantly broken :P)

MMMmm you're right, I can't reproduce this time...
Sorry for the noise.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

