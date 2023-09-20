Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BCFCE79D0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4z1ebTU1XlJL0RNvsPG4JRKzQxEhUmSGzIqnEtPiLRQ=; b=ySLK4kc7GRES5AO/NrEARhlZnX
	XW6xt2SK+6cp3dIq195c+Bofc6H5ItD7huE78p11q6smnmtpZ4lwT0DLZTWJi2vIRvjSbBd3gRU4o
	iMIhrdmwpyvwxi75DNhM7ObNIPr1o2JJ0wY4SjyfNrHmc34UWBD82FI25klRyDDi4ajKtMU58IyYT
	1MrWkCw/rZKoyCIR28XUaYxTL8AsiKagSV1U/+7h0q7jWNHa7P4c8ONm9NQ3gPagEwRyr4vrbW9+4
	Ui2/e5Vj9kFeMHxJqQlkKHCX9v9NkLVJJJ1HSETylEV+eSN9WgLs+CRpMAj0iBfu1fTkyUjfiIRTE
	l1RgzaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qix5E-0039dC-1W;
	Wed, 20 Sep 2023 13:17:36 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qix5A-0039bL-2M
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Sep 2023 13:17:34 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so1979851a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Sep 2023 06:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695215849; x=1695820649; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4z1ebTU1XlJL0RNvsPG4JRKzQxEhUmSGzIqnEtPiLRQ=;
        b=ewgaUNNG+3lbtQ0qFHfhtfbxNqXhyZijq+ShagVIfjTylFaZJrKOvYNsUy+aS5RK/A
         ih3+oHBDh/O1TJ0sw8FVTzXqmxeE39eBe/nVn4DX5knNwZ8Ncmhu3w31pe+OT+Zvz07q
         m/Wx+WAVvStucrh5kaV6mA8FAIaCPNsTs/1RgpvC7C3LvGyV7mw7OCUrl0/VYihRO4MZ
         L1STVVOAtNwRR463CD0yLTmVSRs4QPhA/Wp6b1v8EvR4trVkYgFSzmtlVMCbl9xdD5KM
         xh6ralDLp/IWDq2bB26pZaYm1XKD5h5B9NFwmvo9jY//u1l4rZMq0scPJE8wf0EK8Qpf
         uNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695215849; x=1695820649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4z1ebTU1XlJL0RNvsPG4JRKzQxEhUmSGzIqnEtPiLRQ=;
        b=km1mfte3wQ/LRxiZUmxO3bIZHQoGE2C4JEtRQjxf7eN+Nvyzd3k7Q8iL/je5s2hIEM
         oJl5DvYH6nXvNImkWXQdbUOOMtFNHLS3sbR1li5AYLqEUvADxsn876v7EevM6X8XTdkP
         5KXXjH1suCWt1Fdj6vHDy/ab/fki6dqNEXERSYsJvnZBF+2diU+FRklwjqZW34ilMGJC
         jDD81g5VWLPZeoaapY5T7XHoPWm6Q87tTCTBa3ooWpHzZDWtDmXFGOucMSsOSTl6BSn/
         eXV8KYAcOcMikjQ8hBPw7MS5Pq48X5cULoBQsRZssVMW+iitHQe9I07deVJA6AFi95lC
         Grcg==
X-Gm-Message-State: AOJu0YzqTBu2++tonXnmdxHFSSdtfTD37NIyLoRcp6/lBZvVqMzifYCs
	VjqtUIbD/CtftHtGVzXqGHbT5w==
X-Google-Smtp-Source: AGHT+IEmvvIFfHDLufK6B7+1Zm9nQFebxNW9ONYqmXunc/NW7CodSVkSB9tXJZNIb7OE8MRpGCwd0w==
X-Received: by 2002:a17:907:360a:b0:98e:4f1:f987 with SMTP id bk10-20020a170907360a00b0098e04f1f987mr7939528ejc.3.1695215848815;
        Wed, 20 Sep 2023 06:17:28 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id g5-20020a170906394500b0099bc038eb2bsm9305870eje.58.2023.09.20.06.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 06:17:28 -0700 (PDT)
Message-ID: <85958d72-a06c-b709-594e-52550f591175@linaro.org>
Date: Wed, 20 Sep 2023 15:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: mediatek,net: add
 phandles for SerDes on MT7988
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <cover.1695058909.git.daniel@makrotopia.org>
 <35c12a115893d324db16ec6983afb5f1951fd4c9.1695058909.git.daniel@makrotopia.org>
 <20230919180909.GA4151534-robh@kernel.org> <ZQoJpGLhNZ0M2JhI@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZQoJpGLhNZ0M2JhI@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_061732_772912_EE37FD2C 
X-CRM114-Status: GOOD (  34.90  )
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

On 19/09/2023 22:50, Daniel Golle wrote:
> Hi Rob,
> 
> thank you for the review!
> 
> On Tue, Sep 19, 2023 at 01:09:09PM -0500, Rob Herring wrote:
>> On Mon, Sep 18, 2023 at 11:26:34PM +0100, Daniel Golle wrote:
>>> Add several phandles needed for Ethernet SerDes interfaces on the
>>> MediaTek MT7988 SoC.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>  .../devicetree/bindings/net/mediatek,net.yaml | 28 +++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
>>> index e74502a0afe86..78219158b96af 100644
>>> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
>>> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
>>> @@ -385,6 +385,34 @@ allOf:
>>>            minItems: 2
>>>            maxItems: 2
>>>  
>>> +        mediatek,toprgu:
>>> +          $ref: /schemas/types.yaml#/definitions/phandle
>>> +          description:
>>> +            Phandle to the syscon representing the reset controller.
>>
>> Use the reset binding
> 
> I got an alternative implementation ready which implements an actual
> reset controller (by extending drivers/watchdog/mtk_wdt.c to cover
> also MT7988 and its addition sw-reset-enable bits) and uses single
> phandles for each reset bit assigned to the corresponding units
> instead of listing them all for the ethernet controller (maybe that's
> one step too far though...)
> 
> However, as mentioned in the cover letter, using the Linux reset
> controller API (which having to use is a consequence of having to use
> the reset bindings) doesn't allow to simultanously deassert the
> resets of pextp, usxgmii pcs and/or sgmii pcs which is how the vendor
> implementation is doing it as all reset bits are on the same 32-bit
> register and the Ethernet driver is the only driver needing to access
> that register.

You can have reset for entire register, why not? And even if current
Linux implementation had some troubles with this, you could fix it.


> 
>>
>>> +
>>> +        mediatek,xfi-pll:
>>> +          $ref: /schemas/types.yaml#/definitions/phandle
>>> +          description:
>>> +            Phandle to the syscon node handling the 10GE SerDes clock setup.
>>
>> Use the clock binding
> 
> Does that imply that I should implement a clock driver whith only a
> single clock offering only a single operation ('enable') which would
> then do the magic register writes?

Yes

> 
> While one part is actually identifyable as taking care of enabling a
> clock, I would not know how to meaningfully abstract the other (first)
> part, see vendor driver:
> 
> /* Register to control USXGMII XFI PLL digital */
> #define XFI_PLL_DIG_GLB8        0x08
> #define RG_XFI_PLL_EN           BIT(31)
> 
> /* Register to control USXGMII XFI PLL analog */
> #define XFI_PLL_ANA_GLB8        0x108
> #define RG_XFI_PLL_ANA_SWWA     0x02283248
> 
> [...]
> 
> /* Add software workaround for USXGMII PLL TCL issue */
> regmap_write(ss->pll, XFI_PLL_ANA_GLB8, RG_XFI_PLL_ANA_SWWA);
> // How would you represent the line above using the abstractions of the
> // common clk framework?

What is above line? Please do not ask us to decode your vendor code. You
know, we also have nothing to do with it.

And anyway, why do you need to abstract it? Why not writing unconditionally?


> 
> regmap_read(ss->pll, XFI_PLL_DIG_GLB8, &val); //    that looks like it
> val |= RG_XFI_PLL_EN;                         // <- could be a abstracted
> regmap_write(ss->pll, XFI_PLL_DIG_GLB8, val); //    in a meaningful way in
>                                                     clock driver.
> 
> ... which is all we ever do on that regmap. Ever.

Not only. You will also get all Linux infrastructure associated with
this clock, so proper devlinks, sysfs/debug entries, automatic gating of
unused clocks etc.

Best regards,
Krzysztof


