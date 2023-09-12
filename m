Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD7FCA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTdB5rC+L5kos1kCslFKv4V1nc0NwlzHiB+VYtRjbQc=; b=Aqcy4deqGrmO8AyWb/ZKV5Iuwx
	Jtfolds/GhzcFNVx6v5TugBh+m14TXglO3nD0PwRRMvXnGDEo/Gzk+csAmLJqAfooLKKanTi9DiLg
	ViZhEQwKO8j3wyBHBo/wOecEjOPJgk0cCRd8JpBdXFZ6HUfKkhWcQWPY5HxuCllbSgjE2BZSk1LtR
	8k6/FsDnXR7lPthlBQYx49atJKSBuVaCkZ+ryV1IzSQ0/+VCsN6qxFuhqezepUpzJZXrqRxXzqPWR
	XVIiqQxiSgT+o/xinu6HQaopHSpuP/cpTHCymAogOagk3b3gOESlmW1escezb8aDYqS5LaIfmxL7O
	mX41Fo6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0se-002zCT-1E;
	Tue, 12 Sep 2023 10:44:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0sb-002zBJ-0s
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 10:44:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-403012f27e3so35027935e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 03:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694515461; x=1695120261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VTdB5rC+L5kos1kCslFKv4V1nc0NwlzHiB+VYtRjbQc=;
        b=gSQlF0NhcDZeZ8UPKVCGa5H3jDnzWYrInit8wqvqkFhVvep9RGw5ASNVxAZ4iGoQHw
         rViIs/oCrXow8TvqjiJszfVU9n49vYNAWbtLDe8NlwmKKDsmHaTvauHm4akXZr7mz9BX
         FfQ8EdyiCmSpnxI23i4DhnNN6D1b9KEcphj3FWw2SitKkiltwyhd46v5wkt/8GSLKbb8
         pLYewYaNCa2fFe3+jBTW4wPKQg9+Q0/uSMUvF0Oz3plTURaf0fArpWyHJGpkJxcYTA0r
         jSUuSnm13PmxF7PBgTJITzUmtT9U8UbMZL770Yh1pFQSh509saI5Q9zZDCD8eFVvYU9s
         GX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694515461; x=1695120261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTdB5rC+L5kos1kCslFKv4V1nc0NwlzHiB+VYtRjbQc=;
        b=QCpkkp4BFi2bAa2J//AstUVLxwm293TrOWiaMPYYEQSEbUkPz51ljtATwML2ksmnBe
         vKvNw65XCuBQ4DfKkot72emu2HAHDX1mMg0DoAKU8hfdO3nHzMWit3BxtJ5ued+Ccr4z
         CM7krHw8pucgosXGGspfjSSI79hNDYLSnrpBxFUXBEIFIKCdWqg3x7eqPReTA51HKCS4
         kxU70gCVpBWyZG9oqxquRODb2XXp11SjH77sa0wCDkGtt29cEMdci1zu1ljlvhZnI1vB
         A3kH3oISVV/q/T5HllNMI85h2K6UO2rHxa2RzKUqne8LcmzqYsbDRG2lalwQU01qgr5/
         ISGA==
X-Gm-Message-State: AOJu0YwbkY78tmfpTSkJEYo9ZxSwSEr3SOzbX9yYCKu9i4JNCPOoFYrH
	TPLnsoDrnlNIUv1Tv7HpzR2wtQ==
X-Google-Smtp-Source: AGHT+IFmUaPSQB1JDPwcp1glXmxNaOdHNMq/RaW2YxMYKhbLuySY6XL9AWTg+d2k7jPQno0pliAtWg==
X-Received: by 2002:a05:600c:d5:b0:401:bf56:8bb2 with SMTP id u21-20020a05600c00d500b00401bf568bb2mr9996207wmm.10.1694515460799;
        Tue, 12 Sep 2023 03:44:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id v11-20020a1cf70b000000b00401d8810c8bsm15728900wmh.15.2023.09.12.03.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 03:44:20 -0700 (PDT)
Message-ID: <56c84195-8cb3-df39-ffd2-f9eb8a445cf6@linaro.org>
Date: Tue, 12 Sep 2023 12:44:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 00/14] add support MDP3 on MT8195 platform
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <c0bd7428-1330-58c5-64d2-78af479dfcf4@collabora.com>
 <CAGXv+5FhsKVGwoJxLP=-gV+rSHbQ8DUX0YACy0mPxYw+MC85=g@mail.gmail.com>
 <d8bfbb5f-07a7-4beb-ac1c-049825caf934@collabora.com>
 <CAGXv+5EJ6W6XCJR3busZ0HVQjLytZvzMMjUhhpR5g6Jc8sJQ+A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGXv+5EJ6W6XCJR3busZ0HVQjLytZvzMMjUhhpR5g6Jc8sJQ+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_034425_332263_82DFAFBD 
X-CRM114-Status: GOOD (  25.21  )
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

On 12/09/2023 12:28, Chen-Yu Tsai wrote:
> On Tue, Sep 12, 2023 at 5:43 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 12/09/23 11:37, Chen-Yu Tsai ha scritto:
>>> On Tue, Sep 12, 2023 at 5:00 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 12/09/23 09:57, Moudy Ho ha scritto:
>>>>> Changes since v4:
>>>>> - Rebase on v6.6-rc1
>>>>> - Remove any unnecessary DTS settings.
>>>>> - Adjust the usage of MOD and clock in blending components.
>>>>>
>>>>> Changes since v3:
>>>>> - Depend on :
>>>>>     [1] https://patchwork.kernel.org/project/linux-media/list/?series=719841
>>>>> - Suggested by Krzysztof, integrating all newly added bindings for
>>>>>     the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
>>>>> - Revise MDP3 nodes with generic names.
>>>>>
>>>>> Changes since v2:
>>>>> - Depend on :
>>>>>     [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592
>>>>>     [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711618
>>>>> - Suggested by Rob to revise MDP3 bindings to pass dtbs check
>>>>> - Add parallel paths feature.
>>>>> - Add blended components settings.
>>>>>
>>>>> Changes since v1:
>>>>> - Depend on :
>>>>>     [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
>>>>>     [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
>>>>> - Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"
>>>>>
>>>>> Hello,
>>>>>
>>>>> This patch is used to add support for MDP3 on the MT8195 platform that
>>>>> contains more picture quality components, and can arrange more pipelines
>>>>> through two sets of MMSYS and MUTEX respectively.
>>>>>
>>>>> Moudy Ho (14):
>>>>>     arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
>>>>>     arm64: dts: mediatek: mt8195: add MDP3 nodes
>>>>
>>>> Please send the DTS patches separately, those go through a different maintainer.
>>>
>>> I thought most people prefer the _full_ view in a patchset?
>>>
>>
>> Yeah but those going through a different maintainer makes it more straightforward
>> to pick; besides, essentially, you can also get a full view with dt-bindings
>> patches instead of devicetrees, as the latter are "constructed from" bindings
>> anyway.
> 
> Sure, but testing, especially by people not in the recipients or CC list,
> is a bit painful when the full set of patches isn't bundled together.
> Having them bundled together shows what the submitter tested and makes
> it easier for others to reproduce.
> 
> AFAIK other ARM platforms have been sending patches all grouped together.
> It's MediaTek that has been different, as they normally have (for Chromebooks)
> a system integration engineer handling the device tree stuff, while component
> driver owners just handle the drivers, and by extension, the DT bindings.
> 
>> Moreover, it would be definitely nice to add a link to the devicetree series
>> in the cover letter of this series, so that people *do* get a full overview
>> by checking both series :-)
> 
> Most maintainers seem to know what to do: apply the subset destined for
> their tree. At least the subsystems that frequently deal with DT-based
> platforms anyway.

Most, but not all. Some maintainers take entire set - including DTS -
which is not what we want, because *DTS, as a hardware description, must
be independent of driver changes*. Most notably Greg and netdev folks
grab everything. Keeping it together with driver changes brings
confusion and feeling that there are dependency.

Please don't do this.

Best regards,
Krzysztof


