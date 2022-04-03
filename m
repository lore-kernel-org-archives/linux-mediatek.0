Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8984C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Apr 2022 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhWe8MueWu+HjxzDvRHyC0shxsMVEejInOWitsHGqzo=; b=HKgeA6D2JE80zs
	MAka9QiTByaMKrvNtwMfGQ42/4o79YpzoZZz4Ln40eJ93hjJjmVqCJqYbpR8BxQSEnt9BhcwuGXgp
	oP2WSu5eRYdz+pOX53OO/DBPHg8dEzsmU4nGsqXyWh0luLvXVJzIpelvBezvp4qh23njDOEgL4tIO
	VlMULEpcPgA0miyR9vge8QhcloiUzjoFcEof9M1wD6cx2xJah0J7aLREY5KJ4HAuxoljUSy7z2Wbj
	xM1Aj9UgRNW7ZAmMZXWhD32WIiwue55kPS8pZBTcJBm/4cXSnVBRe1DSMGkLDTnxYd7EJHmBpBfh5
	4C1S/bIT8Kbmz8hBq5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb2UO-00Blqw-Sl; Sun, 03 Apr 2022 15:50:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb2UB-00Blm3-VW
 for linux-mediatek@lists.infradead.org; Sun, 03 Apr 2022 15:49:53 +0000
Received: by mail-ej1-x62e.google.com with SMTP id k23so11800204ejd.3
 for <linux-mediatek@lists.infradead.org>; Sun, 03 Apr 2022 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Nl7mx8m7EnlbDwYYwvHzo6XZQrrQmR8xseakEJu/ApQ=;
 b=MAqUTVvxlESuAw6otRHcDSI7aSiMb/pzHxYyyc8ocwlSKeZ0QbusTy+3VVAT4PMjjZ
 r35T4x1/aKMCNukK3w5y4OjNLkM0JGY1j+bYY3bZiDiQBTONI3EcfWOlbKrHIEqQEpQm
 PulMplT17U+A4s8Q+qHr5FI/pw98uxA0mwdUGTLc3nomLuZLeeHl7TX+K04794pLORF+
 OHiLPHqoQ8zeryorwhj0pYSbudxizi0JyQik9ge8WsZmBPAgYW679WPOg3T1LhmTKCAq
 CiZapoJ1nG8IcKCUzTyQJocZdDtPgCWWrBCInKFEIy1voIhcjpOjGk3xCcCwsX+n1NoL
 GiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nl7mx8m7EnlbDwYYwvHzo6XZQrrQmR8xseakEJu/ApQ=;
 b=iQxlLjSzQR6L1puMVBAbOAGM5ie7iHy/Mqv2SLyjcC9ctAWiY6GWq939X5B8ZiFajb
 Z8cTuOtsZznJWukHV+diV9K3bgXwYYn//KYhifHfOO805QZ235iQFrNuuVXKvuwaC/4k
 CIj+ozl+ylpSNFoa0GVY+O9dN5UKBG9M2DVt9GPTJb9gAwNpJKRQKwrWtcw2xegkgUiX
 LM+frLpLFigcHTHwjdTGa9vmHzk2hjhmShV9R9dfV39v1H0cQVtM0VrEN/abCqbsyBRn
 TXNqzKK1m+n+RiFkKOvKyhAY0SpIHvMCW3EYfJa6m8Nhqq2DhX8C/NETQNWfF4P1TBmQ
 JA3Q==
X-Gm-Message-State: AOAM532SU6NJqMIvDyUnonZqJu/6yy9Dy6RD5m9k/CaavSLSM3MfkQRS
 AoQHsUSIEjdA+K1n5g0x2Na3jQ==
X-Google-Smtp-Source: ABdhPJx3rcnv1yKUNSctVm5332uQ8CUzIarsgEIAO55wHKNgl2rFifkjJnDT+yD+tVwKZKX0hGsBGA==
X-Received: by 2002:a17:907:6d0a:b0:6db:f0f8:6528 with SMTP id
 sa10-20020a1709076d0a00b006dbf0f86528mr7426771ejc.466.1649000989905; 
 Sun, 03 Apr 2022 08:49:49 -0700 (PDT)
Received: from [192.168.0.172] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b006daa26de2fbsm3313742ejc.153.2022.04.03.08.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:49:49 -0700 (PDT)
Message-ID: <06ef6b4b-c8e8-549b-54be-9eecf59a7757@linaro.org>
Date: Sun, 3 Apr 2022 17:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/4] dt-bindings: spi: add binding doc for spi-mtk-snfi
Content-Language: en-US
To: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-spi@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, Florian Fainelli
 <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <20220403131154.1267887-1-gch981213@gmail.com>
 <20220403131154.1267887-4-gch981213@gmail.com>
 <817dda10-39db-adfc-376d-a3d5e037937e@linaro.org>
 <CAJsYDVKYsz7c2yVe7TmPu_7kvBDXTih4+cceLsay2YJm21YntA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJsYDVKYsz7c2yVe7TmPu_7kvBDXTih4+cceLsay2YJm21YntA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_084952_068480_5F622C4D 
X-CRM114-Status: GOOD (  15.70  )
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

On 03/04/2022 17:45, Chuanhong Guo wrote:
> Hi!
> 
> On Sun, Apr 3, 2022 at 11:37 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> [...]
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt7622-snand
>>> +      - mediatek,mt7629-snand
>>
>> One blank line, please.
> 
> I'll fix this in the next version.
> 
>>
>>> +  reg:
>>> +    items:
>>> +      - description: core registers
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: NFI interrupt
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: clock used for the controller
>>> +      - description: clock used for the SPI bus
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: nfi_clk
>>> +      - const: pad_clk
>>> +
>>> +  ecc-engine:
>>
>> The nand-chip.yaml defines a nand-ecc-engine, so how about using that
>> one? I know mtk-nand.txt uses ecc-engine, but for new schema better to
>> use properties from existing YAML.
> 
> The ecc-engine code is shared between mtk_nand.c and this driver, and
> the property name is defined in the shared part. I left it as-is so that
> existing dt for mtk_nand doesn't break.

This can be easily fixed with:
	np = of_parse_phandle(of_node, "nand-ecc-engine", 0);
	if (!np) {
		/* Backwards compatible */
		np = of_parse_phandle(of_node, "ecc-engine", 0);
	}

I would like to avoid having one property in generic NAND schema and
keep adding something slightly different everywhere else.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
