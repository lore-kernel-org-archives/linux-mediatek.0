Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC98C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYaoT64rLSiAkBu6ZnEVRKnzaukCu6pGqQ25YPlgRlQ=; b=MbmNhfEIXFnmpgNXfKqufApKel
	HoMzZK4nRaA2+A+OHKXkL9/1u9JIq3HGQnwKbqyrUCmwOboRFaKlrr4vF3ADcKzZg4GO3ApkR8Q1z
	DxCtT0ka7kx+6roV5vzQliHzymJ9yr5JBDZsog662sxCWFTmbPKZCB+0vAwF1kW8vboC59UcY/xKu
	eQk37GibOXNVOLOmqdLn3nIsZrYAdQ6/l9WxjI4yhsJfiZABJlTBSzEDehPx3WvV5JISpAZH5AJcm
	Qmyvupue32ugIazH+Z6U0fYiu4wDFQlWPJEPNJwiGg6R96++nVAmHVWQ+ewhA0tyRDeKhx6Dw6obt
	HCDSHWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTwZ-006JRI-T9; Tue, 23 Aug 2022 13:27:47 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTwM-006JNq-7a
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 13:27:39 +0000
Received: by mail-lf1-x131.google.com with SMTP id z25so19692847lfr.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=RYaoT64rLSiAkBu6ZnEVRKnzaukCu6pGqQ25YPlgRlQ=;
        b=B4xc8gVe0InX3hW6P2VMd5XAFlRh66yotF7S/ardado2iYgZjMEMVv/wy06PQiQzah
         iazrBekEqxteSA9KQm8t30AOVGmmi2nqx+2DGZ7Rq28j7lCsHF5PEdVGKgG6RIQmO0Fd
         TrUySKUx3jVYjXeBUawdAJqP6R3BQQxAxPTfHbzUIMMVAxhGc6IUzHJW8HDB12SbIiKY
         YAHWEi1w26iX4K5bZPKPW7Wq/uEH5qV9Z9fb5lYcGrpfKgmY8uFQ//8YoXjzDA9JYV4P
         xoObMYAS/nuo9PtQT9msLlV1ST+v6Cp2WrTbz0h1PZIgDndRXBVkSPar3tku5vdUhLZ5
         iJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=RYaoT64rLSiAkBu6ZnEVRKnzaukCu6pGqQ25YPlgRlQ=;
        b=tFHPcJD7WoqejvZ291Rw2BCCN5cMBjXhSlkVNHi+PqDbSBUnajacIMUD7kEZyKOciH
         +Om8hBd+c6hjbBH/o/5w8oVO3I/9DA+VJrs5rclr4mvuooY8Nvkzut2e2pZtTOwOBnoU
         4/xm233NBvzdbGNhD0PBldXqtuEEU/1WH3kBGycsTULaQPNxtYidHfyovfOFRy72cqGX
         R/I8fbyud02iJSMihL+FNBDsestRO6z5BM5JSUR2aHndZvrTTwCHhAFst5UZCHXQpRnW
         e/MUWQ9P/7nD4nJ6Sfj/WQjMqD7uHx6Sc8XSHea3UjFHeH6+g0SNasb4f/KwYPCAxGrF
         FJlw==
X-Gm-Message-State: ACgBeo2nnWg5ch2QKZCxF7AV1lO7/Ck0f70efuqbT2oBKvU/4IXXsLEJ
	G/X9TxkR+/2Eg63EKV0dKTXtHg==
X-Google-Smtp-Source: AA6agR7yDkNWoU8CznVAgBBUwBldaGBGAZ63skSgJLnHIYu5wpua5KrElt1bP4h+zbTgu4ZNMHb0Ew==
X-Received: by 2002:a05:6512:4009:b0:492:f0f7:d83c with SMTP id br9-20020a056512400900b00492f0f7d83cmr1587481lfb.449.1661261251555;
        Tue, 23 Aug 2022 06:27:31 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id p8-20020ac24ec8000000b0048b12ff12e8sm2417459lfr.99.2022.08.23.06.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 06:27:28 -0700 (PDT)
Message-ID: <f5dd04b8-2560-2987-328b-3697aaf1dd74@linaro.org>
Date: Tue, 23 Aug 2022 16:27:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8188 and MT8195
Content-Language: en-US
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryder Lee <ryder.lee@mediatek.com>, Rex-BC.Chen@mediatek.com,
 TingHan.Shen@mediatek.com, Liju-clr.Chen@mediatek.com, Jian.Yang@mediatek.com
References: <20220802120624.19258-1-jianjun.wang@mediatek.com>
 <5c14e959-10cc-5520-e88f-b47a195b99e9@linaro.org>
 <YwTNXaaotJW/vUT9@lpieralisi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YwTNXaaotJW/vUT9@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_062737_922335_4428083F 
X-CRM114-Status: GOOD (  10.45  )
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

On 23/08/2022 15:51, Lorenzo Pieralisi wrote:
> On Wed, Aug 03, 2022 at 08:44:11AM +0200, Krzysztof Kozlowski wrote:
>> On 02/08/2022 14:06, Jianjun Wang wrote:
>>> MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as MT8192.
>>>
>>> Also add new clock name "peri_mem" since the MT8188 and MT8195 use clock
>>> "peri_mem" instead of "top_133m".
>>>
>>> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
>>> ---
>>> Changes in v4:
>>> Remove "items" for "mediatek,mt8192-pcie" since it only have one item.
>>
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Should I pick this up ?

Yes, go ahead. Thanks!

Best regards,
Krzysztof

