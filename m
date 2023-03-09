Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FEDC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDMXuwTqQWAH56WisEztsErbpyePGnPu92kzgFHXUrY=; b=vVzElfINT8IRCp
	gj1Vwex8Cf72h+8I1gqdATSa6cx5X6CwS5v+8ghSjSYPb/k3IbAtcdlo/2Wm2OBn6ucWQizXBumZs
	RBkEnZZt3/+C4tFBGiUOknpB3Nu+wh+HhiojXaFMtOdkXR1CWiMupdVnPqqNos+k/XuirUl161v7C
	C/VubAGlna/Blay5Bpb4qFpgoT8z4DSKlMxxkDSZbLhdtQj2xr8VuW/eiZd0m6XwNKl7PoSAEan7d
	bfDVFPIK1M/eMCJu4+5mu0KYC3FJU8iBjGQUitL39t103fylUBxsGDci6NdCJif+6lufUlbdYsLyw
	o6i6WpcOK4bM1DzWq/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCxE-008w66-9b; Thu, 09 Mar 2023 09:52:56 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCxA-008w2k-HJ
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 09:52:54 +0000
Received: by mail-ed1-x536.google.com with SMTP id ec29so4619385edb.6
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 01:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678355571;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TDMXuwTqQWAH56WisEztsErbpyePGnPu92kzgFHXUrY=;
        b=Mnb7BMDBDKqxQrT7/VuMapAEP1v+HiUWThI/6W7FfXaOrNfmpYVILIW+ozz8KLgwYt
         YuwFSoNsD3Sn14NCrWqyPXyoZswZzv0vHjzCf43DXQ4K/uuPXFhWOnEs3cOUjiPDZ05w
         VowVxlyxdJr6XXD9mcNo0kstHhyhyzsz6pVgxP1m26TDJCmv2L+85yRwGJXH7Lx5g33D
         1W5EynDi64QmTB8eUjkBXrepFRqEWBhZeSNSlGppa/sGGOk9fYRM8yHMmiZOMyKz8xVT
         JV78KoJ/scIFwaKKDsUCwbrukufg0Wry4IiKUiVcCNpqL84XKZfBB/v/QJJX3uJBZmxz
         IxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678355571;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDMXuwTqQWAH56WisEztsErbpyePGnPu92kzgFHXUrY=;
        b=4CbftgWFXo6pNBVftMNpaY5X/XljC7GB9ogHx6NicFeMfTowttqyTWu9lp/wrfr5Vc
         ZrdFWHFu7akDJbW2h18iB/9l8M/IkN03k6YBjHQd+blnZpuBU/PD0q/CBC0EQP2vNRld
         qWNX4sdaO9rtzJXKYOm1iPHXOZDbas+X5fccwiVMYdO5PZ0xP7KBCWPZ3Kho0XdtVRQV
         cIgJeeB7Eu9sAjmxbDd2/GA5iiVEosNFz7ObjV73w4zWloff4bLdfBiPQH41jf/QUAYJ
         shwgo+mo7SBIdX2iRPpTZf7XfLaD8LcnTJ5M3eA2IjxN0rorSKIXi5lB7ARdkDk2tQAu
         YD4Q==
X-Gm-Message-State: AO0yUKXzC9z4YswCa6y+coIM4fBCXUdnyFsM/3EzPrtdltekS7ku6lmp
	stZ3/Ye7SZ1ZYmLbVlXcWKXTGA==
X-Google-Smtp-Source: AK7set9vfCOR4FrjRouAXd3nSUrf0/p8aPsE2Cbus07HJyu3nVojeYsL3SmEyCGtwCIxRgmnImbclg==
X-Received: by 2002:a17:906:8156:b0:886:221b:44e5 with SMTP id z22-20020a170906815600b00886221b44e5mr21189729ejw.62.1678355570948;
        Thu, 09 Mar 2023 01:52:50 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id t19-20020a170906065300b008be996c1630sm8638313ejb.39.2023.03.09.01.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:52:50 -0800 (PST)
Message-ID: <9663817e-7f6f-c3b1-8bf9-321f9b067e96@linaro.org>
Date: Thu, 9 Mar 2023 10:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/20] dt-bindings: pinctrl: ralink: {mt7620,mt7621}:
 rename to mediatek
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-10-arinc.unal@arinc9.com>
 <20230308210514.GA3767521-robh@kernel.org>
 <12be053e-b70a-faca-71c8-d8eef69a3b73@arinc9.com>
 <ccdfd262-eaf3-dbbe-7a3c-a911a5ec0fc4@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ccdfd262-eaf3-dbbe-7a3c-a911a5ec0fc4@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_015252_597204_6C00E486 
X-CRM114-Status: GOOD (  17.58  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09/03/2023 08:53, Arınç ÜNAL wrote:
> On 9.03.2023 00:19, Arınç ÜNAL wrote:
>> On 9.03.2023 00:05, Rob Herring wrote:
>>> On Fri, Mar 03, 2023 at 03:28:38AM +0300, arinc9.unal@gmail.com wrote:
>>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>
>>>> This platform from Ralink was acquired by MediaTek in 2011. Then, 
>>>> MediaTek
>>>> introduced these SoCs which utilise this platform. Rename the schemas to
>>>> mediatek to address the incorrect naming.
>>>
>>> I said we don't do renames due to acquistions, you said that wasn't the
>>> reason, but then that's your reasoning here.
>>
>> It's not a marketing/acquistion rename as the name of these SoCs were 
>> wrong from the get go. The information on the first sentence is to give 
>> the idea of why these SoCs were wrongfully named as the base platform 
>> that these new MediaTek SoCs share code with was called Ralink.
>>
>>>
>>> To give you another example, *new* i.MX things are still called
>>> 'fsl,imx...' and it has been how many years since merging with NXP?
>>
>> Ok this is a point I see now. Though, I fail to see how this is called 
>> renaming when there's only new SoCs (from NXP in this case) to be added.
> 
> If I understand correctly, i.MX is a family from Freescale so the name 

It's the same "family" as your platform, because as you said:
"introduced these SoCs which utilise this platform"

> was kept the same on new SoC releases from NXP. I believe it's different 
> in this case here. There's no family name. The closest thing on the name 
> of the SoC model is, it's RT for Ralink, MT for MediaTek.

It's not about the name. NXP took Freescale platform and since many
years makes entirely new products, currently far, far away from original
platform.

That's the same case you have here - Mediatek took existing platform and
started making new products with it.

> 
> On top of that, mediatek strings already exist for MT SoCs already, at 
> least for MT7621.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/Documentation/devicetree/bindings/mips/ralink.yaml?id=dd3cb467ebb5659d6552999d6f16a616653f9933#n83

NXP also has compatibles with nxp, thus still not that good reason.

Best regards,
Krzysztof


