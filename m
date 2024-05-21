Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEB0C25B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrL09oMV4rZV1d29tFPXs1+jTnHwORy7lGYYvN9rls4=; b=HgT4SY3PjBIJqHAubcNcI5rlym
	y0SNiqUCprtcT+6FBxVMAUNdWzcGbPThdmsfgRR0fgBISAixR4xrLOwWtNfQccMRmcna1KhWk1Kck
	SSqiyJV2fSHGClmxwgQF4JEAZENQk/x3yclWOi2iq/HBYGBWgorkOSlEzPUhyAztJ5FL3xZtn8fU2
	vZQVXmZwfsvYvZkgp8soAfQLBzY69I88RoOHcbW3gtbNmpBzSt3T92X01bv1faXJ81hol5kMN7cSD
	1TVnXthr73ve5HfW+3Cc2/+MiusjFOEm9A0D9DNnep/MTFghD2x3QhLBdrv7qEC+bqKUAkpcPQzZ6
	jnUg2F6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QWF-00000000BrE-32Gi;
	Tue, 21 May 2024 14:31:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PVp-0000000Hb6O-3Sdp
	for linux-mediatek@bombadil.infradead.org;
	Tue, 21 May 2024 13:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=CrL09oMV4rZV1d29tFPXs1+jTnHwORy7lGYYvN9rls4=; b=SRvj/PkJMoV4D03V1h7h51Qwt+
	pG2eNJGJplVPGkJAcfZCl2kGzrgfmJ9IYfDTJxJcS5yJSf7jM22FAA9a9+4QJv9f70DisIZ7aFguH
	gQdzXKLel/PnocLMmDnSQfZv0uPFyXxhpKL8dzFaa8YKuuM9igcN3kHrg4U4rcocwMVvgahGHnaDE
	hZOKkredva8aGgwIxXQpRVe1j2wHu/Pe4Sk84E47JrQ6oayhaqg+YByo/yWBW9ayB7NgYXwAWuxuZ
	gMKrIczmoommghX+lLoeiHcW9doB8CmDGv297qzCq/jHIGZHJlzhTJYJiXoYOmRLSfQabo0c+/bwV
	cxxlDYhQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PVl-00000006ieq-0DUJ
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 13:26:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-420180b5838so22987455e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716297995; x=1716902795; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CrL09oMV4rZV1d29tFPXs1+jTnHwORy7lGYYvN9rls4=;
        b=AO98bOp4cEeP7Z2Cqt9/aeUqNcyP6Sgi4+HLH9S142htzo/H/edAj2RW8e6SJ1apF3
         2CTlmuiFcglCG7LtKa/dQP12TCkGa7a/vUb0iYq23WUmNIqQYIoIdGkLH49m9+AP7cPo
         KxUYiLlZ53BLD1ct17qC9jOflWBu0YLg9GIxP89nKC/SLUBM0pqK0+fdCsqqG10egWBS
         MguS2eh1wSfPJg9nBrpuYjZMticXswv1mAzSpgSl7pUiexdIqoQ8gFquymroU7BVsm4I
         5EIkjqT+yLN8m1L5ys0m/Vu60rcoxOnv7m3cAbKb6oK1kNhOkDWcFNiRvAdOeUqSM3UB
         zWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716297995; x=1716902795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CrL09oMV4rZV1d29tFPXs1+jTnHwORy7lGYYvN9rls4=;
        b=peUXfKkZiDtqXC+Kyn5fRseeR1olx6STuReyHUNwzB/lCV2xc1dIbivNAG0UoP3gJ+
         /mktdNPY90hI5Bdj8XEh5mn7/6Vps2OaVViFNcw0+pdPYi4Ztaxqp8hjnHxHIXcD/Wp2
         fudbejGemRUTfXwVlwxDn1s2dorTeCiXHt5g1n0M+R/f/maA+nvWNhOhdvXhspcB9WL4
         lLiIKSYlY9rGqsf2YnyZMCM09kVA5onNzISVBpd+KhXSZxqC9Bl0DvcCvyN8Z6Fozwxn
         SG80HRnvchsoUbuIn7OQkJATLSmIscQ4rBo4aOJ+wf1zy/oCP7JjNfpyx8MF9OlKR8Dy
         EYLA==
X-Forwarded-Encrypted: i=1; AJvYcCXxKODALuNDtPQi3vFnFm91dv7iphKPSRzyQRO6WvyvFgsmY3aP2Y9Ko8QBj0BDF0dPXoEq88R1qa8xg3knld3Zap9Jkxqc2C7XLqZyUK2Fevsr
X-Gm-Message-State: AOJu0Yzr5ZzIzJlAzCl80jCb1mM+mOZXh/nPNJzQh77vzol1/T3hY0UZ
	ZzreGdkCxrbjPqDAgewF3B65myqM7ZtDbEXxPiTcVhyZrxFiHX3xGyqtBF5jg7U=
X-Google-Smtp-Source: AGHT+IHajWBe4PJHeY8YA0P+l+lgbTtcda22gyAdxfcJX54x099wwj6g4B4hBH/MjPhF/cyGyoO7hA==
X-Received: by 2002:a05:600c:3512:b0:41b:f979:e19b with SMTP id 5b1f17b1804b1-41fead6441amr318373205e9.39.1716297994532;
        Tue, 21 May 2024 06:26:34 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-351d2df8449sm15526565f8f.12.2024.05.21.06.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 06:26:34 -0700 (PDT)
Message-ID: <edc43094-19a7-4e62-8fba-ac2b22f66239@baylibre.com>
Date: Tue, 21 May 2024 15:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt8365: use a specific SCPSYS
 compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <75b78eaf-9b13-477c-bf02-4e9837a25dd4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_142637_366316_F3C7E4E8 
X-CRM114-Status: GOOD (  20.75  )
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



On 21/05/2024 10:22, Krzysztof Kozlowski wrote:
> On 20/05/2024 17:23, Alexandre Mergnat wrote:
>> Hello Krzysztof,
>>
>> On 20/05/2024 12:12, AngeloGioacchino Del Regno wrote:
>>> Il 20/05/24 12:03, Krzysztof Kozlowski ha scritto:
>>>> On 20/05/2024 11:55, AngeloGioacchino Del Regno wrote:
>>>>> Il 18/05/24 23:11, Krzysztof Kozlowski ha scritto:
>>>>>> SoCs should use dedicated compatibles for each of their syscon nodes to
>>>>>> precisely describe the block.  Using an incorrect compatible does not
>>>>>> allow to properly match/validate children of the syscon device.  Replace
>>>>>> SYSCFG compatible, which does not have children, with a new dedicated
>>>>>> one for SCPSYS block.
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>
>>>>> Technically, that's not a SCPSYS block, but called SYSCFG in MT8365, but the
>>>>> meaning and the functioning is the same, so it's fine for me.
>>>> So there are two syscfg blocks? With exactly the same set of registers
>>>> or different?
>>>>
>>> I'm not sure about that, I don't have the MT8365 datasheet...
>>>
>>> Adding Alexandre to the loop - I think he can clarify as he should have the
>>> required documentation.
>> Unfortunately, The SCPSYS (@10006000) isn't documented, but according to the functionnal
>> specification, it seems to have only one block.
>>
>> I don't have the history why SYSCFG instead of SCPSYS.
>>
>> I've tested your serie and have a regression at the kernel boot time:
>> [    7.738117] mtk-power-controller 10006000.syscon:power-controller: Failed to create device link
>> (0x180) with 14000000.syscon
>>
>> It's related to your patch 3/4.
> I don't see how this could be related. The error is mentioning entirely
> different node - mmsys. No driver binds to 10006000.syscon, except the
> MFD syscon of course, so my change should have zero effect on drivers.
> 
> The mtk-pm-domains (so child of patch affected in 3/4) only takes regmap
> from the parent, so the cells again are not related.
> 
> Just to be sure: you are testing mainline or next, without any other
> patches on top except mine?

I've tested on next

* a018995ac19c (HEAD -> temp, me/temp) arm64: dts: mediatek: mt8173-elm: correct PMIC's syscon reg entry
* 0f118436c61c arm64: dts: mediatek: mt8365: drop incorrect power-domain-cells
* d40e424fe6dc arm64: dts: mediatek: mt8365: use a specific SCPSYS compatible
* d7caa08a4a9b dt-bindings: mfd: mediatek,mt8195-scpsys: add mediatek,mt8365-scpsys
* 82d92a9a1b9e (tag: next-20240515, linux-next/master) Add linux-next specific files for 20240515
*   77ba09d6e7cb Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git
|\
| * dedcf3a8e704 tools/power turbostat: version 2024.05.10
| * baac2f4c7f3b tools/power turbostat: Ignore pkg_cstate_limit when it is not available
| * a0525800e2dc tools/power turbostat: Fix order of strings in pkg_cstate_limit_strings
| * ffc2e3d90e6f tools/power turbostat: Read Package-cstates via perf


I did the test with and without "0f118436c61c arm64: dts: mediatek: mt8365: drop incorrect 
power-domain-cells"

Without this specific patch, no regression.


-- 
Regards,
Alexandre

