Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55170C77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/o9witGFEqB6mrKPmPyN7LxJga6zPVGzIsG+4CQnq8=; b=rgRQeoE7i3IP0qF3YRUkOArFiH
	r/O9VRhCmFOp2GmguCOuFlEa+ogBYLjyeDI09oaantXgI+KixBZ19Ew49TpOn5VFvKuWRszeOoJys
	1LOko557I8WTy+QIG+upbzeTcBLJTL6pjAvz7mRVc0dvOT/wO43gXKDnyl33xEl4ywC+FGKdqj1wV
	BAPCDFjYuNx9VqqR+Yu57niQjfbNRcFh+h2JeglMgqxHBO6/vqu/Yu/zn48hNF7is2Yx04X2zTk5m
	z3B0VTzva5THFfEJaWTjtvHZkCeDNU0lxSVX0SscjgEkGPz6kdm3wQNl5OecLopjSgJe8SoAEiGSk
	x/5H2lNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzYPO-00CFgN-25;
	Thu, 18 May 2023 07:50:46 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzYPL-00CFff-2f
	for linux-mediatek@lists.infradead.org;
	Thu, 18 May 2023 07:50:45 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-510d6e1f1abso2692510a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 May 2023 00:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684396242; x=1686988242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/o9witGFEqB6mrKPmPyN7LxJga6zPVGzIsG+4CQnq8=;
        b=w5bSqx5GpMEQCyeYAmlsIf6bauofXILA/X4zxIt4kAilYLBY+WaEsA0hieu2z8dfVj
         rWzeJUfyeQzpa0roxxRvoAaqJyMw5DaKWMHEUwtmzfYLZhy7BxP+xWEHb/F1Cd+RSPZi
         aQ6hIoOTdp+ZGUnMLfcrVLGlLpT6NC4k/UnD6j8I+G7jliWJRDRRdRQ/LI3BDLNV95NJ
         qNh2ZBg/Vxrw+DxDzBXJUr1Julg7NWZsN+m7YRp26fvNLF2mHdTTn6KAZcCdvB1uPviG
         ydUPWi0e/7n2419sZMRgWZ0Czr453YUGlSzJhcy9wpf7KWw/8mlzYBx+hMs6dRxwWrTx
         M89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684396242; x=1686988242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/o9witGFEqB6mrKPmPyN7LxJga6zPVGzIsG+4CQnq8=;
        b=kAhfK+/iyj6YMWJHUNDVCw0RhCAHgci/9UGt4796KjdX331/o9oicBIqjWgo0ktw1W
         KDRa93o7G9VrgFrdIGbUM/Or/PyLjxUo0fswnvnld18uV0gcymqzjgC8YGx5y6xELdGg
         zJh0Rw6pL7xWVABt/D0fzVO+IikTQajva0zlGbuUNR52nNNLXwsnTKRTXGDda0xrDAo4
         Y8byag/8PEvWDAL6wyAoMFKoPejIgRMLOtFvRTbjweWPgXKOx/Y1NGa2AvlZkPD3HFlY
         FLjM42NSVv3x2Zu+bH6vt+Sw7d7B5swdrzMVT/RRFCz2pGWAxtU+Y9w+nW5ZwQxTI5Wf
         1Zfg==
X-Gm-Message-State: AC+VfDxm2FC8figUb6Oe2HmJKOBqiiWQ2SPmzlFBKIaPmeLVV8itY4PJ
	z39BJAmBCykZafX9lflM/6kXBw==
X-Google-Smtp-Source: ACHHUZ70S2nHNNnVtr6DSBNU6UZgaGprBFguEp6nw+dtOz9VHeWMa2SFrshKGj2gvhyoMBReXjNAgw==
X-Received: by 2002:a05:6402:544:b0:510:e790:48fe with SMTP id i4-20020a056402054400b00510e79048femr865646edx.6.1684396241721;
        Thu, 18 May 2023 00:50:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a2b:c408:5834:f48e? ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id t20-20020aa7d4d4000000b00510d7152dc7sm262996edr.30.2023.05.18.00.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 00:50:41 -0700 (PDT)
Message-ID: <2048ed2a-ae6f-b425-38e4-4ba973e04398@linaro.org>
Date: Thu, 18 May 2023 09:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: arm: mediatek: add
 mediatek,boottrap binding
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Simon Horman <simon.horman@corigine.com>
References: <cover.1683813687.git.daniel@makrotopia.org>
 <f2d447d8b836cf9584762465a784185e8fcf651f.1683813687.git.daniel@makrotopia.org>
 <55f8ac31-d81d-43de-8877-6a7fac2d37b4@lunn.ch>
 <7e8d0945-dfa9-7f61-b075-679e8a89ded9@linaro.org>
 <ZGWRHeE3CXeAnQ-5@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZGWRHeE3CXeAnQ-5@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_005043_868250_4863BEDB 
X-CRM114-Status: GOOD (  25.05  )
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

On 18/05/2023 04:44, Daniel Golle wrote:
> On Fri, May 12, 2023 at 08:54:36AM +0200, Krzysztof Kozlowski wrote:
>> On 11/05/2023 17:53, Andrew Lunn wrote:
>>> On Thu, May 11, 2023 at 04:10:20PM +0200, Daniel Golle wrote:
>>>> The boottrap is used to read implementation details from the SoC, such
>>>> as the polarity of LED pins. Add bindings for it as we are going to use
>>>> it for the LEDs connected to MediaTek built-in 1GE PHYs.
>>>
>>> What exactly is it? Fuses? Is it memory mapped, or does it need a
>>> driver to access it? How is it shared between its different users?
>>
>> Yes, looks like some efuse/OTP/nvmem, so it should probably use nvmem
>> bindings and do not look different than other in such class.
> 
> I've asked MediaTek and they have replied with an elaborate definition.
> Summary:
> The boottrap is a single 32-bit wide register at 0x1001f6f0 which can
> be used to read back the bias of bootstrap pins from the SoC as follows:

Is it within some other address space? Register address suggests that.

In such case you should not create a device in the middle of other
device's address space. You punched a hole in uniform address space
which prevents creating that other device for entire space.

> 
> * bit[8]: Reference CLK source && gphy port0's LED
> If bit[8] == 0:
> - Reference clock source is XTRL && gphy port0's LED is pulled low on board side
> If bit[8] == 1:
> - Reference clock source is Oscillator && gphy port0's LED is pulled high on board side
> 
> * bit[9]: DDR type && gphy port1's LED
> If bit[9] == 0:
> - DDR type is DDRx16b x2 && gphy port1's LED is pulled low on board side
> If bit[9] == 1:
> - DDR type is DDRx16b x1 && gphy port1's LED is pulled high on board side
> 
> * bit[10]: gphy port2's LED
> If bit[10] == 0:
> - phy port2's LED is pulled low on board side
> If bit[10] == 1:
> - gphy port2's LED is pulled high on board side
> 
> * bit[11]: gphy port3's LED
> If bit[11] == 0:
> - phy port3's LED is pulled low on board side
> If bit[11] == 1:
> - gphy port3's LED is pulled high on board side
> 
> If bit[10] == 0 && bit[11] == 0:
> - BROM will boot from SPIM-NOR
> If bit[10] == 1 && bit[11] == 0:
> - BROM will boot from SPIM-NAND
> If bit[10] == 0 && bit[11] == 1:
> - BROM will boot from eMMC
> If bit[10] == 1 && bit[11] == 1:
> - BROM will boot from SNFI-NAND
> 
> The boottrap is present in many MediaTek SoCs, however, support for
> reading it is only really needed on MT7988 due to the dual-use of some
> bootstrap pins as PHY LEDs.
> 
> We could say this is some kind of read-only 'syscon' node (and hence
> use regmap driver to access it), that would make it easy but it's not
> very accurate. Also efuse/OTP/nvmem doesn't seem accurate, though in
> terms of software it could work just as well.
> 
> I will update DT bindings to contain the gained insights.

If this is separate address space with one register, then boottrap
sounds ok. If you have multiple read only registers with fused values,
then this is efuse region, so something like nvidia,tegra20-efuse.


Best regards,
Krzysztof


