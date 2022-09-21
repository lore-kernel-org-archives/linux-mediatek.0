Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CECC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE/lUB9GeFJ3cgcWCczdBLBsp8zcC8CA4nMsFXJExts=; b=f+8ygviWar54D1Eg8A/uAy/q8Y
	xn3rksvrt8Mn9gO6VncdNvKErM/8aSZMywntwfl8pYxR47jJ+YT0YDYBYEiLW+c8Pd9Bph+VWkjrs
	uGjPifl2JXZJV+/AHjJrkOEw1zti0Fl3YdN4WlTjZlqW7ez3rpKXFlnFZvOFalBizN/YJshhMWqSV
	E04DyExvetRfFk/WtSe1PRqLyZi1QsfqJUm/+/3h9hPczfxw2sJfOTq2XXi5cr0CdCqh3tYeMZmaX
	Np/546bnllWT7GXHy59HAHR1Eu4U1PyOop6x8Q/6T3L5acvL/6dK1/4vtQEbjlUgm1Q4GMo6OQR32
	iPqavTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaw58-00AQeW-Mj; Wed, 21 Sep 2022 09:31:50 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavz9-00ANgu-2f; Wed, 21 Sep 2022 09:25:43 +0000
Received: by mail-ej1-x62d.google.com with SMTP id y17so12216157ejo.6;
        Wed, 21 Sep 2022 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date;
        bh=IE/lUB9GeFJ3cgcWCczdBLBsp8zcC8CA4nMsFXJExts=;
        b=o1HmafZL8GjyvYOix7SJfx4WJKUR1Bc7OAqttjJ9T0N/Yj/KoCu+7CIoTFiNKbmSRl
         GO0O9hT6LMnktP8nnM6SrQl4A4F5EzaFjoovPZeVJiVfKsmcFeu4oLmMC0ZR01q5wQqX
         9lVBRxxeTKxqXZUHu9XOp+D4p+wdTaqhH2F4wU3KbjMjMlqIEAfpaH+iynNW9GCZ7xDX
         jE31ceI38vQe8l90z6zWIFTXMkTCGGzfSfcprfmByYV+SOclJHxiRa88je+R/VF2OE/r
         jm5a75DhyMjEevwPb8xnQSSOogPe+GjqvLNVzzr1+NYuWUoBpTOE8cuesEXbByZ1ddT1
         9cZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=IE/lUB9GeFJ3cgcWCczdBLBsp8zcC8CA4nMsFXJExts=;
        b=52ucS/Yk/M/NownqgJ5N1+jgfiCknRpnTC7CMjWfoF17ZDXUZ78cL8eyWxT6LC5Ov7
         U0G2Wvpqf2SIbQF+Qn9dthW4V5M9qPiPQ95vVoz+MRnq3PJY8Dz/ynr/KgSXPOFdxGeT
         h87ETiBcSRVVS9uFCCu9DkRdU/hlhlYb5pOSTLMcfJy/LfoNOuCYpOGo+dj/BvkS/IS3
         MCPvOXJh3cICz191KiVq0fmx0c4Ucq7T59hVbGqATo3l0Px6A1AZCMkhFuyOMcF8XVf1
         tJFR9/pZ4YfjUsWTKSFjkBwcDy2g9JImBiDOMZk0oKlB6oVavdQjH5PtXRkZaGps47lJ
         Vypg==
X-Gm-Message-State: ACrzQf0CyS/lyjLQdVH2/P9jZbWC6vobiBLs9kmu/1ucaTwmwRIzds39
	Pkwfzw9S41FlCzGv/s15R+k=
X-Google-Smtp-Source: AMsMyM5aVGhWkOnNJmsBsfyVgjUfb2jYAdOqzt7epbBXN3MqtxhZqf/7Xfo/k1tguHf3FwqbXbSahQ==
X-Received: by 2002:a17:907:a044:b0:770:da0d:171d with SMTP id gz4-20020a170907a04400b00770da0d171dmr19485416ejc.742.1663752335121;
        Wed, 21 Sep 2022 02:25:35 -0700 (PDT)
Received: from [10.31.3.208] ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072b3406e9c2sm1053996eja.95.2022.09.21.02.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 02:25:34 -0700 (PDT)
Date: Wed, 21 Sep 2022 12:25:20 +0300
From: yassine.oudjana@gmail.com
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Combine MediaTek MT67xx pinctrl
 binding docs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng
	<andy.teng@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yassine Oudjana
	<y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <8IZJIR.7AG9DG7U1XLJ@gmail.com>
In-Reply-To: <b567fb19-460c-ea1f-4c84-0724e73052fd@linaro.org>
References: <20220919170115.94873-1-y.oudjana@protonmail.com>
	<20220919170115.94873-2-y.oudjana@protonmail.com>
	<b567fb19-460c-ea1f-4c84-0724e73052fd@linaro.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_022539_177173_2C4CE335 
X-CRM114-Status: GOOD (  21.69  )
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


On Wed, Sep 21 2022 at 09:20:43 AM +0200, Krzysztof Kozlowski 
<krzysztof.kozlowski@linaro.org> wrote:
> On 19/09/2022 19:01, Yassine Oudjana wrote:
>>  From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>>  Documents for MT6779, MT6795 and MT6797 that currently exist share
>>  most properties, and each one has slightly differently worded
>>  descriptions for those properties. Combine all three documents into
>>  one common document for all MT67xx SoC pin controllers, picking a 
>> few
>>  parts from each and accounting for differences such as items in reg
>>  and reg-names properties. Also document the MT6765 pin controller
>>  which currently has a driver but no DT binding documentation. It 
>> should
>>  be possible to also include bindings for MT8183 and MT8188, but 
>> these
>>  have some additional properties that might complicate things a bit,
>>  so they are left alone for now.
>> 
> 
>>   properties:
>>     compatible:
>>  -    const: mediatek,mt6795-pinctrl
>>  +    oneOf:
>>  +      - enum:
>>  +          - mediatek,mt6765-pinctrl
>>  +          - mediatek,mt6795-pinctrl
>>  +          - mediatek,mt6797-pinctrl
>>  +      - items:
>>  +          - const: mediatek,mt6779-pinctrl
>>  +          - const: syscon
> 
> No, this is not like old bindings at all. It's not merging, it's a
> change sneaked inside huge diff. Also - probably totally untested on 
> DTS
> (or old bindings were broken).


Actually this change was made specifically so that it remains (probably 
becomes?) compatible with existing DTS and passes checks. mt6779.dtsi 
currently has the syscon compatible string but it wasn't listed along 
with mediatek,mt6779-pinctrl in the old document, but instead there was 
something in the description about putting the pinctrl node under a 
syscon node, which isn't the case in the existing DTS. This patch 
passed both dt_binding_check and dtbs_check. Anyway, I see how I failed 
to describe this change, so I'll go through the patch again and try to 
find any other small changes I might've made and forgotten about, and 
either put them in separate patches or describe them in the commit 
message, whichever one you think is better. Also, do I make those 
changes in the original documents then combine or combine first then 
make them in the new one?

Thanks,
Yassine

(Sorry for the spam, my client was misconfigured so it previously sent 
HTML instead of plain text.)

> 
> That's a no-go.
> 
> Best regards,
> Krzysztof



