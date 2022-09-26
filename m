Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AD6C6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 06:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3hxzdrBIum1j0xz9YZTHAUg/0XjqqL/D7mMmLIxdR4=; b=FFPFLnxTRXYRp5rVcb472UwLHb
	T9yHrp+3TMAYGkF3bhfURJcmGeOvHPecdM1i+dVRnZJ5fqd9UcH+xEUFlPA84zZGp5hMijAMH2wtL
	Ilp91Kjl8tHbqyf3EWP9XMaQKW90PEmuQvgve32Z/VEiUcj6YLmxS4zzKNqPuUosrrWsjQEK/mfyT
	R+4Pq30QS5Ze4+vVi1F/a2/KmqXtES1TUH8TSnTiZGqzdjnTtV4/2/BYbPmc92tFpHxIddF85EyrE
	Z/sE2YEGVx4y6MAaSj/Fm2AcTUbMeOMlRvPbik2lBeI19RuP9jtXZ7SRESlgWsh6Akg4j4UKbDm7Y
	tf78D2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ochmg-002PMM-WB; Mon, 26 Sep 2022 06:40:07 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ochl6-002OFj-BU
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 06:38:31 +0000
Received: by mail-lj1-x230.google.com with SMTP id b6so6259513ljr.10
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 23:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=W3hxzdrBIum1j0xz9YZTHAUg/0XjqqL/D7mMmLIxdR4=;
        b=ePexRndPURvdCW/6uFFqR/iEiqGsxFN63U0+E7Mw/SDz4ZwwNEHsmVHumFqZeMYCUP
         w8s7D75BCLIzBKqYzi2ogsSYLQfENPA4YBlkAy7xmGIaZVpzOBLJOJBVmSgV8B9AxENp
         4k9tn5vOQllbiqS/XTVubaMGN3+gj9u09UhLCVk0TYFk8T5lw7S/gkcV2EfEw/3L/JMQ
         D1Pt/0hEH58mgxQwVwA1fUt8341UKEQFrik2uQZ70jnH8wajATyMJdZbd8uzdTiFw7/8
         s4sXMk+6hYNL9CHWmFGnedd4ZzjP6bKJB+in83kJvdPYJbbwwdg5MwyBBVmi4j+WhIEb
         IqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=W3hxzdrBIum1j0xz9YZTHAUg/0XjqqL/D7mMmLIxdR4=;
        b=KJK/nqlwFzH7EXbL2CZXPU59x+P8KzDeelH04p5TpatVmsuStAMhdt9cS4Im6ZG1yE
         ddYaBpxTwIA9Ich5aHDvAj2Oq1TpNvWDN97ZiR0nZtJzNjnlYd4pEhcmTj6jp7rAfrb1
         PCZbcE7V7LsrVApgxy+k95kyC6UobPZs9lsMlDvas9R89nJl6c2PwPQgptCteg4d57xy
         3EinnQfUECDIHTUSaiyEEl4okM0XAdIlIwDGW87RfZOzouTNib+fvn9qiaRHAhUdQxy+
         s5Z57dVr+T4YRjOlEvSbbWcrBUzgdVejO4yVNn6Ch+tLLtTDAzKU5A03hPyV6vNpXHLG
         RdvQ==
X-Gm-Message-State: ACrzQf0X5OCWzUR2Qkk0n5pVp3HZ/HuU6F/GBF8cARqZL5/6bjZpicuH
	Vp/zzv3CqlwYzPMP4uEggFithQ==
X-Google-Smtp-Source: AMsMyM7zYhJnhCTUeUDjnpPqlK+tH954E2LgxBK1i8gOU2GZVXuiyg0sE4TRiLJTrdd7ByA6IdiJnQ==
X-Received: by 2002:a05:651c:a04:b0:26c:50df:75ad with SMTP id k4-20020a05651c0a0400b0026c50df75admr6942132ljq.416.1664174303703;
        Sun, 25 Sep 2022 23:38:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020ac25625000000b004a050ddc4ecsm1321680lff.125.2022.09.25.23.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 23:38:23 -0700 (PDT)
Message-ID: <bd99a454-8cee-edb9-bc34-ce0be280bd90@linaro.org>
Date: Mon, 26 Sep 2022 08:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 15/17] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8195
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-15-4844816c9808@baylibre.com>
 <e993c25e-f334-e1ca-73f8-58cf141c521e@linaro.org>
 <CAGXv+5FYjj6=WHWBvNRDmpw2Ux8RJ4a2fT1gXk3+eXSqt9poeQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGXv+5FYjj6=WHWBvNRDmpw2Ux8RJ4a2fT1gXk3+eXSqt9poeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_233828_523830_ECC3C473 
X-CRM114-Status: GOOD (  13.71  )
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

On 26/09/2022 07:24, Chen-Yu Tsai wrote:
> On Thu, Sep 22, 2022 at 3:20 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 19/09/2022 18:56, Guillaume Ranquet wrote:
>>> Add dt-binding documentation of dpi for MediaTek MT8195 SoC.
>>>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>> index 5bb23e97cf33..2c7ecef54986 100644
>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>> @@ -24,6 +24,7 @@ properties:
>>>        - mediatek,mt8183-dpi
>>>        - mediatek,mt8186-dpi
>>>        - mediatek,mt8192-dpi
>>> +      - mediatek,mt8195-dpi
>>>        - mediatek,mt8195-dp-intf
>>
>> Aren't these the same?
> 
> *-dpi are MIPI DPI (as in parallel data with DDR modes) encoders.
> *-dp-intf are Display Port encoder.
> 
> Totally distinguishable. :)
> 
> The hardware blocks seem similar upon cursory comparison of the register
> tables, with the base layout being the same, and sharing registers for
> basic settings such as the display timings.
> 
> The DPI ones have some extra registers, presumably to control the signals
> or output width. The DP one has some registers of its own that only make
> sense for Display Port.

OK.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


