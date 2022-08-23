Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18084C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RN/LOwAs0mnCfns8ZqSzFQO5l9T587JWTtmjgOoDJU0=; b=c5lzgIqA0ZIjAS6GNoOsbLlY21
	e+NXpwdKyQObBRcAbgs9304b1JTLizijxaiuob2iSL+qTuuLOWaPISIUdeXX7iJt1qHRdC7O+snIW
	GSZuOEctMZDZKQ/f1Z+/rhRE5PQY9/2UHHIxhB8xeXA2dUUG/iwFAvwx7Y+ZEHZHIbK18mj83GDii
	oiZvV9inuV9THGMiCrqxK+y7FXgS6qktDLsMJP0hmlc0YXoDWPkFZnnbm/CF2KQUl2paeCrHQVf//
	PNqGPyh7AIJiAqGTMxVJHe+NQm6pKCqFwOW1KAeKarztPjATarm1RzftkoPGsC4XfIrgF3BCP2ZEx
	MzeetWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRQJ-0054Uv-P0; Tue, 23 Aug 2022 10:46:19 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRQ7-0054PO-Ly
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 10:46:08 +0000
Received: by mail-lf1-x131.google.com with SMTP id d8so6726034lfq.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=RN/LOwAs0mnCfns8ZqSzFQO5l9T587JWTtmjgOoDJU0=;
        b=Py0wMtQJoUAEqHG39bdO2l0BFyd5gIb/rukM60FnZ1hchbdZcz/+uZHBv+PwZYsYHD
         KPwGaoEP4kJMY7TN5kh0S2PbU/GtEAZFI6/GWecCyniqreT6ulMrcaAexk8rNouQW+pC
         r2mpDu584TwrHqn6lCYfsCPZwrvgPTkIImrUO6nDjdM3TUwkrCUnEZ4JeI+Y7RDYZR4L
         9/nnSDO1kK59WzFrgxbHwSPItaD3vOteBcPpxjbHQlyhLUNEWJGEX904OANzDvl/GJx3
         XZgFnoOeWES7ce7ypMcQRWjqXoYyvB83wxa1ANQHzbjoC8isWgnJ+MVhgQkN8od+6iNh
         LUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=RN/LOwAs0mnCfns8ZqSzFQO5l9T587JWTtmjgOoDJU0=;
        b=VrNMT3tsmRsuaFJluhdmAA/rCUCCzeltCr2Pt4eR5BVNuzFB//DGirmZxf/0K5LlN3
         lT/n+kEZ6NiEu1z05KB6CJufs32a8K+XMKE3iUfpR8+JMNiYMMtt4vkAGfpijDb6zguV
         9Tngl7LKx7HU1VEGFc0h3irqwkzI6zbeC/MLnaCSG8Vk4Mk5fhl4toYhEjb6PUv3YyiE
         Uf0k+FWlGxNxpvkOQ10MjLjWK7vtzH7bF9cID/AUMEireXjJfJDCXRU752fGPRVMmveC
         62ywrtgOq0aRUczAkIsSUFW4Ak6ZO1FN3k52W66jJgMiKK0xvvI29Yj70tfTJQChdoXk
         +t7Q==
X-Gm-Message-State: ACgBeo0QesntFSyUYzQsiyy9WNrqsF/rX8F4EJW8vrfN0OZDu2r8AHzh
	MDf9l4yNzh2N4ilZBZW4rR+jpA==
X-Google-Smtp-Source: AA6agR7X5sSiNq/i+Hdcr45vvYQkfwChkiEwFRHa/+jS1NGRNkHqhXgoDdJQhIB3VWwSaYKrwvZ2Ew==
X-Received: by 2002:a05:6512:22d5:b0:492:cf78:59b7 with SMTP id g21-20020a05651222d500b00492cf7859b7mr5862437lfu.504.1661251564314;
        Tue, 23 Aug 2022 03:46:04 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id t14-20020a2e8e6e000000b00261af4754bbsm2299173ljk.41.2022.08.23.03.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:46:03 -0700 (PDT)
Message-ID: <019d8f8a-cff1-4539-dc9f-8a0073b6ab32@linaro.org>
Date: Tue, 23 Aug 2022 13:46:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/6] dt-bindings: net: dsa: mediatek,mt7530: update
 examples
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
 <20220820080758.9829-4-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220820080758.9829-4-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_034607_728970_972D9496 
X-CRM114-Status: GOOD (  12.63  )
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

On 20/08/2022 11:07, Arınç ÜNAL wrote:
> Update the examples on the binding.
> 
> - Add examples which include a wide variation of configurations.
> - Make example comments YAML comment instead of DT binding comment.
> - Add interrupt controller to the examples. Include header file for
> interrupt.
> - Change reset line for MT7621 examples.
> - Pretty formatting for the examples.
> - Change switch reg to 0.
> - Change port labels to fit the example, change port 4 label to wan.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 402 +++++++++++++++---
>  1 file changed, 347 insertions(+), 55 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

