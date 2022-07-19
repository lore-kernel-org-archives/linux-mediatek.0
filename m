Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBC7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pxJNE6gYc8cb6d4rkA2eV3Aswi0lfTlAlrCacdvP2w=; b=xZsOUBJajiIsn9NkR8+SB+v0R0
	m1jZaWJpCSpN6hEz1DEtLPTkbfBhVscyOBf80IAa0LBPx0JXPKkG2PadxSytpBx1dAow+XQL9RtVk
	73ERYQWOstrFomkTPN5Pt1tduYJRKT4rLqhkqlhgA7qEeefePSI2wxSOht8IQuXuUhr8P50PAmDGT
	daawzlq7dOTFQ5RDY4rXmr2aBy+AJIttxtDxgSK6Qzsfy2M+IUUcTZLoQzGaOtF0PW4vjYo3uFjyq
	2NpIekdZt0RtCdNkbcqfQwDrL/MbHuVMiKuimk7x2eStKhYC7pM4L2ECKfdRW5x9AeXU78JSMtXqQ
	9rZYoASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDiwG-006d0s-8F; Tue, 19 Jul 2022 08:50:44 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDiw5-006cnx-Jy
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 08:50:36 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bp17so23620960lfb.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 01:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3pxJNE6gYc8cb6d4rkA2eV3Aswi0lfTlAlrCacdvP2w=;
        b=ijFr0es238AtzUmBFcdhNq9P7S2bQTfENXLr/NSqt5rREGLk235GS2OEVXk806dVZu
         LZhIf326MJ344Gx/3K/y1+Q6E/BWtau/4SA8q6hRckQA2KZEcTBciFBoUT+zTJN3gZaw
         bFBVZKNsc1osyAVPJRoYq8QtRgh72fYlykSBxstzpzgPawA/NqvgBZs+xrpGXLRWJhjT
         9SD45XZSuqB7Vs8eD2J9dcHuuZZpQhFfY+3HxlEDezCy6d74cAfqv7KzmJjpiPVDUPtG
         V1426Zg579DI0aFdtzg9S6F1fJK5ZFHyrAIZvjtii2W5Ch4dtUqAJY9efj+r6HtPk7BL
         k65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3pxJNE6gYc8cb6d4rkA2eV3Aswi0lfTlAlrCacdvP2w=;
        b=LRPft53IzW4Fpc661O4JycFH7/oBxC+6Zh1jzj3PQ+v71/smudIdp3xspW1KV+/RtL
         OOFkvH1gcgQH6V8PinAL6p0DDWWRQ68oW8jl9SeewkZmOF88VD9OzACuN47ud5ASI9KG
         q9u0/rfooOWFquhZ7QiyEnKEFJKuFtQ17suk2TheDlXc2pm5UPZhuQBOirKBlkLgauTy
         NSUXHmiT1l6H6rfQaeJy0MfLXa87j6SNmDdBpi47kkL1fUNpb/mqV1bXrI5MC3KlaJRQ
         aGedR+6YQCRCxP8fuePsxRRX+6eCCeYBvEHYrW8wTR5n5BTqK34mhd4EJMvHG+4tOl6H
         IWZA==
X-Gm-Message-State: AJIora8xSn1aLkec5fxBTO3kjWg8U8f+P0UcJPUNdLZP+pJPwSL9mX9J
	oOR9f/f+y30s7RulAxlebEuzcA==
X-Google-Smtp-Source: AGRyM1us868YPpB392tMn7H3KK4A7rfaBwjaayrkHiss5VCTlo/g5OiMzIp0NjvcgAuBi9wC02cPVg==
X-Received: by 2002:a05:6512:1595:b0:489:da32:ec68 with SMTP id bp21-20020a056512159500b00489da32ec68mr16232700lfb.573.1658220631316;
        Tue, 19 Jul 2022 01:50:31 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id e22-20020a195016000000b00489de206812sm3061580lfb.151.2022.07.19.01.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 01:50:30 -0700 (PDT)
Message-ID: <2a7280cb-2bcc-4297-8beb-a9249c5bf899@linaro.org>
Date: Tue, 19 Jul 2022 10:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/19] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
 <20220714122837.20094-4-tinghan.shen@mediatek.com>
 <46df4ad5-5102-b5fe-95b7-5b157fb28f01@linaro.org>
 <c4480c9ea0822ae693ff6a501c073c365e983b83.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c4480c9ea0822ae693ff6a501c073c365e983b83.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_015033_699788_B4A55DEF 
X-CRM114-Status: GOOD (  18.82  )
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

On 19/07/2022 10:17, Tinghan Shen wrote:
>>> +    syscon@10006000 {
>>> +        compatible = "mediatek,scpsys", "syscon", "simple-mfd";
>>
>> This should be a SoC-specific compatible (and filename).
> 
> Ok. I think that you mean "mediatek,mt8195-scpsys".
> I'll update it in next version.

Yes.

> 
>>
>>> +        reg = <0x10006000 0x100>;
>>> +
>>> +        spm: power-controller {
>>
>> I think you created before less-portable, quite constrained bindings for
>> power controller. You now require that mt8195-power-controller is always
>> a child of some parent device which will share its regmap/MMIO with it.
>>
>> And what if in your next block there is no scpsys block and power
>> controller is the scpsys alone? It's not possible with your bindings.
> 
> Do you mean a power controller node that looks like this?
> 
> scpsys: power-controller@10006000 {
> 	compatible = "mediatek,mt6797-scpsys";
> 	#power-domain-cells = <1>;
> 
> 	// ...
> };

Yes, I mean, with an unit address.

> 
>>
>> Wouldn't it be better to assign some address space to the
>> power-controller (now as an offset from scpsys)?
> 
> Is this mean adding an offset after the node name?
> 
> spm: power-controller@0 {

This or above. I think it does not matter for the bindings - it's an
implementation detail, whether you give to the child absolute SoC
address or you give an bus-specific (scpsys) sub-address/offset.

The point is that you have an unit address, thus in the future this
could be a device node separate from scpsys.

Best regards,
Krzysztof

