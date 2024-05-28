Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B225C25B7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMcndx1MyOn/tzGp7W1bciJqyD0f9IArD3yPKz887Vo=; b=39PyfTuBms9bM+XKsuUnjgH6Ym
	BwpQSV/KocTTxkT+DV+OC0fGyWeTB87PsTamLZX2Q0MPcb3/f7rgMwlqYTaQrMDilhGWTXcE7FBH3
	+DJR178XBdmQ+LEs32j0oDP93V4QBPdJLtzJr9+5HkrHn8b2GiHVCfNStDpqG7EerFsOWj2wV7AHb
	j31sVBW7ipru8+SchIfXmaDj2nOgJaxizdkPgntiEsEwUEBE/tpVt6w+TcPwFjJw7mFvhYRTMXAYY
	MvM4JsOghC8ssjNWVmN3dQ14KUALLDux47eYs+X0PbQMW8WZ/4+Ps5ceYpciZhkqBaNrnL2y9UT6I
	Iwfj3mBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBweJ-00000000jKj-3dhC;
	Tue, 28 May 2024 13:13:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBweG-00000000jJC-2Srn
	for linux-mediatek@lists.infradead.org;
	Tue, 28 May 2024 13:13:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-35508106cc2so730159f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 06:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716902026; x=1717506826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMcndx1MyOn/tzGp7W1bciJqyD0f9IArD3yPKz887Vo=;
        b=woZOZDqe9AWDN2rEQSFi4R04L5wInT43k8sCpvMR7mNPWlwvkjPPc9EOqL9sE0YK4c
         6AP/LSs8fTKd1RfqlWKNX1BbDPlu9hLPCVBouMobZNczoKgs0LGHzW3dpQ76KOAGN8gc
         NZbgudWDsIpshMHiLuAvAUMyjl3rTqflrXl23O4hWTk1FNJ/DfSRTpEWHwKZAg5fBU3c
         Lm4hnkHRbL7JL8/R8qdxnwYkGSc1f8wgk5xvusFBonqIX4Jcfl9O7H/zFYXoH16JJYx8
         DVJ04c5SbjMGOZFc4lswLvV5AC90GWn5wI1dnJvrPTThNmKipWhdg3L2dzFN0uNTbAbv
         8NFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716902026; x=1717506826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMcndx1MyOn/tzGp7W1bciJqyD0f9IArD3yPKz887Vo=;
        b=Jsy3QcrZTBQBG0VXexbVtM//IJHLIi8k4N6avWC9DloyTh9GcTJqsW0/3D8AVENDnd
         VrJ0j9GBQz6mICsXMe5td7UuHAI3KpK88+X0h4iUGgIoG0UxE+aHY2XN9DOiYhwhfvK/
         rPDveppIS84MVBYTPomOAoirfaqE9Ofuh53isJI3VBciDxnITLb9DhRGkpH/JHvlQ1AZ
         CMAZfhkcgwKCddJzalBcCaLUv+ifYjyYjAxIF5O+SWiRjyWBOGoLi6hHG0Ax3zb1IT60
         ADZN9DxAyo3go4z38/7u1CRXDAyb8ECzHhFAoD1p4oJF7YtZCohf4J1ojq4LoCKxXG4G
         /xCg==
X-Forwarded-Encrypted: i=1; AJvYcCUseBioUdvNFMY/+AYsOO76cpMOHIi4sb2PDp5ECUBZt8bsBQ5EoGzXEPUjG7ic5CTndg4s5YrvHqYWidIv3Dl6pldQyhHB2l0U3y2Mz+tN5vhz
X-Gm-Message-State: AOJu0YxnfJaX+TpGo1lFwRtax4jEc70MoWV+TtioLETbV/I8TrOccfS2
	r7NVbW2qOJf3gUlVR2et8LGQwd7XJu9I3sF+3NNG6Omz818HF/zpoclimW7PkRg=
X-Google-Smtp-Source: AGHT+IFcjZPdSjwdhRZc+nZsDK1tBXTV9ToeKuYOV9I7MWvMKdFyTLe3sxT6lJtaaMcKP9OprZr8vQ==
X-Received: by 2002:adf:e648:0:b0:357:40e8:e574 with SMTP id ffacd0b85a97d-35740e8e60amr5679648f8f.37.1716902025896;
        Tue, 28 May 2024 06:13:45 -0700 (PDT)
Received: from [10.3.5.161] (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a090805sm11546560f8f.48.2024.05.28.06.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 06:13:45 -0700 (PDT)
Message-ID: <2e872daa-a9d8-430f-9a6c-90001dd3391e@baylibre.com>
Date: Tue, 28 May 2024 15:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8188: Add support for Mali
 GPU on Panfrost
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, mandyjh.liu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
 <20240527093908.97574-6-angelogioacchino.delregno@collabora.com>
 <f553b3f2-d895-446a-a741-7a151ebeb3ed@baylibre.com>
 <4715d477-5f66-47db-973f-af64a3009113@collabora.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <4715d477-5f66-47db-973f-af64a3009113@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_061352_687342_2728CCD6 
X-CRM114-Status: GOOD (  15.94  )
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

On 5/28/24 12:36, AngeloGioacchino Del Regno wrote:
> Il 27/05/24 16:53, Julien Panis ha scritto:
>> On 5/27/24 11:39, AngeloGioacchino Del Regno wrote:
>>> Add the necessary OPP table for the GPU and also add a GPU node
>>> to enable support for the Valhall-JM G57 MC3 found on this SoC,
>>> using the Panfrost driver.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>
>> [...]
>>
>>> +        gpu: gpu@13000000 {
>>> +            compatible = "mediatek,mt8188-mali", "arm,mali-valhall-jm";
>>> +            reg = <0 0x13000000 0 0x4000>;
>>> +
>>> +            clocks = <&mfgcfg CLK_MFGCFG_BG3D>;
>>> +            interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
>>> +                     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
>>> +                     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +            interrupt-names = "job", "mmu", "gpu";
>>> +            operating-points-v2 = <&gpu_opp_table>;
>>> +            power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
>>> +                    <&spm MT8188_POWER_DOMAIN_MFG3>,
>>> +                    <&spm MT8188_POWER_DOMAIN_MFG4>;
>>> +            power-domain-names = "core0", "core1", "core2";
>>
>> Hi Angelo,
>>
>> I think you should add something like that here:
>> #cooling-cells = <2>;
>> (the warning is raised when I run 'make dtbs_check')
>>
>> Julien
>>
>
> I can either add it to a v2 of this series, or you can add it in your patch where
> you're actually adding the thermal support.
>
> I have no preferences about who adds it, and I agree that cooling-cells should
> eventually get there, so I'll leave the choice to you :-)
>
> Cheers,
> Angelo

I will add it to my patch.
Julien

