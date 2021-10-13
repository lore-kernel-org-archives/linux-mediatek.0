Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DE6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 16:13:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C590610C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 16:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C590610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kT7rJDoSYdM1RmMdlao7BPu9xlYFUf2WYLuBRAnr8Zg=; b=cxoYP4PGN/FNN/
	YzVlOBuWDALbA/V07eZqci0zZd4XuNWhclubQ25CW6c+5dzEXO+kRv6AQYsycETzNYa4vwen7XaN2
	iJKW/CYRv9zveMMRxA30jjeV0ikRuaG/ZQNUVA406FXpBbRUowi3uHcDgHqR1VVhd/eRJObqAHsFG
	5woulFSrvopdWSe99v6Ybh6MY1Ueh4Md/U238qlDbXH4mPkGonEjYSDDgfeniNwcrN8sjNiMfAAMO
	aIP5CkJE1fpEgHKKOA2fVFnEJgtHSo3yhfPbCHYV6J3uuKE9jePTC5zwpgmDwfd/D8I6PswfWOw4h
	S4JTVujh+EOIezHm/g+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1magt0-00HZKb-AN; Wed, 13 Oct 2021 16:13:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1magnm-00HXLb-HJ; Wed, 13 Oct 2021 16:08:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id o20so10152905wro.3;
 Wed, 13 Oct 2021 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=eX7yjJefdYC9EkA2tTv7QWyCDc8KjHPONkGSpJrjJ+4=;
 b=Fh/+e/qKee/OC3Pdz/1y1XxQafvN08plEo51h2csXqSGGDsuhib/3q52O/b2mUKYD5
 JdebSWNKT6si8Sukw4Qx+8ih9WTKC0gwi3GfkFRbHI6EeyXqJE0FsTGeXUReayK4yE2e
 TkziOkGTOtRYd4TJa1tLgvOgk9Y6lOsINvu1SdTOMzmCgsASgncB3rl2yUw17BHiX3D3
 QcRk6HlEJzzMklDt9srpG79X3vXuIGVi1KDfVk/jcoG9zQjuehhUqeZunxOg2qlS6+Hk
 LfrVu7txywRk6tcN8W9WlMggmH0lj4y0usk1JWUu4Xxcdw+hwptpGNNoa3+H89F21m8B
 tACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=eX7yjJefdYC9EkA2tTv7QWyCDc8KjHPONkGSpJrjJ+4=;
 b=QaNW+kam3SwZ26OuW4b75yWGbawdOuHFqOa2/nFhki78gf9PVPkjvI/tQETF0KqHJw
 73tZFMK8xznxyotuyhkhco6JZVxRg3bxHC8UBqyl/74g0X/hwNs1wWKB3gDUBlusty58
 mGiy5g/B74wjh9jPB1sKbYz83lCZlC8LObsvDSKal9yzrod6HgZ9ifwl+YPrGG3AuI9S
 DBo0SD55WWlT8WNCOXegw2+0ThNftYGKPc0Wt5OpIJ5Jmfo18emaB2QReicVgHlFienO
 EIWgomv22eM927FposE5vlU/S37TXGNf1BqZzQlZW3GqTRLqrEfJztOCMm0CKaIfTAQs
 52AA==
X-Gm-Message-State: AOAM5326wu1vPj69O73pMTdEG2yDSRZEa3XYitkCZDN/IZj+9onU8coh
 5NZHiKkJdrkcJhhSoClEHsY=
X-Google-Smtp-Source: ABdhPJyc2za+pLb2K8Q2vROq1u9HYfBpwC559+1Sp0MAfUmCphOwF4O3hP79hd0gYRqn2x2KDgvh0Q==
X-Received: by 2002:adf:aadc:: with SMTP id i28mr44424wrc.320.1634141299580;
 Wed, 13 Oct 2021 09:08:19 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com.
 [2001:67c:2178:4000::1111])
 by smtp.gmail.com with ESMTPSA id 25sm5565503wmo.18.2021.10.13.09.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 09:08:18 -0700 (PDT)
Message-ID: <8348ed3e-c561-ad7e-fe9e-a31ed346d8d0@gmail.com>
Date: Wed, 13 Oct 2021 18:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>
Cc: Ryder.Lee@mediatek.com, devicetree@vger.kernel.org,
 enric.balletbo@collabora.com, fparent@baylibre.com,
 gregkh@linuxfoundation.org, herbert@gondor.apana.org.au,
 hsinyi@chromium.org, john@phrozen.org, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux@roeck-us.net, mpm@selenic.com, mturquette@baylibre.com,
 robh+dt@kernel.org, sboyd@kernel.org, sean.wang@kernel.org,
 seiya.wang@mediatek.com, wim@linux-watchdog.org
References: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
 <20210924114046.26070-1-sam.shih@mediatek.com>
 <bc29d5bc-9ce7-6147-a708-e6304249b600@gmail.com>
 <315d7823aa108c909a3d36464fe54763b76ab2f4.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [v3,7/9] dt-bindings: arm64: dts: mediatek: Add mt7986 series
In-Reply-To: <315d7823aa108c909a3d36464fe54763b76ab2f4.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_090822_650169_3D733DFA 
X-CRM114-Status: GOOD (  41.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sam,

On 12/10/2021 12:29, Sam Shih wrote:
> Hi
> 
> On Fri, 2021-10-08 at 15:53 +0200, Matthias Brugger wrote:
>> Hi Sam,
>>
>> I'd advise to split this series in parts for:
>> - basic device support via dts.
>> - pinctrl driver + dts
>> - clk driver + dts
> 
> Okay, I will split the patches that are still under review into the
> above patch series.
> 
> But I have a dumb question, currently, we have some patches that have
> been assigned version numbers.
> If I want to seprate original patch series, and resend 3 new patch
> series (basic / pinctrl / clock) according to your comment, if I want
> to keep the preview change log, tags in the patch set:
> 
> like:
> ---
> v3: changed 'MT7986' to 'MT7986 series' in the commit message
> v2: added an Acked-by tag
> ---
> 
> Which version number should I use for these new patch series ?
> 

I'd use v4 keeping the change-log and adding a link with hint to v3 in the cover 
letter.

> Does the version number in corver-letter and the version number in each
> patch need to be the same in the entire patch series ?
> 

Yes, otherwise the version number doesn't make to much sense.

> // (Original patch series/thread, version number is v3)
> [PATCH v3 0/3] Add basic SoC support for mediatek mt7986
>    [PATCH v3 1/3] dt-bindings: arm64: dts: mediatek: Add mt7986 series
>    // (the version number has been updated to v5 previously)
>    // (basic part only, not include pinctrl and clock nodes)
>    [PATCH v5 2/3] arm64: dts: mediatek: add mt7986a support
>    [PATCH v5 3/3] arm64: dts: mediatek: add mt7986b support

use v6 explaining where in the mailing list one can find v5.

> 
> // (New clock driver patch series)
> [PATCH 0/3] Add clock driver support for mediatek mt7986
>    [PATCH v3,1/3] dt-bindings: clock: mediatek: document clk bindings
> for mediatek mt7986 SoC
>    // (the version number has been updated to v3 previously)
>    [PATCH v3 2/3] clk: mediatek: add mt7986 clock IDs
>    [PATCH v2 3/3] clk: mediatek: add mt7986 clock support
> 

Same here, use v4.

> // (New pinctrl driver patch series)
> [PATCH 0/4] Add pinctrl driver support for mediatek mt7986
>    // (the version number has been updated to v6 previously)
>    [PATCH v6 1/4] dt-bindings: pinctrl: update bindings for MT7986 SoC
>    // (the version number has been updated to v2 previously)
>    [PATCH v2 2/4] pinctrl: mediatek: add support for MT7986 SoC
>    [PATCH 3/4] arm64: dts: mediatek: add mt7986a pinctrl support
>    [PATCH 3/4] arm64: dts: mediatek: add mt7986b pinctrl support
> 

use v7 here.

>>
>> I would also advise to not send new versions of patches as new
>> threads and don't
>> respond in the same thread. At least for me that breaks my workflow
>> as I use b4.
> 
> If I don't respond to the next patch set in the same thread, should I
> create an entire new patch series ?
> 

Respond to any review comments in the thread but once you are ready to send a 
new version of the patch, send the whole series with an incremented

> For example, if I want to update PATCH 2/3 in the bellows patch series,
> and my PATCH 1/3 has been accepted by reviewer previously
> 
> [PATCH v2 0/3] Add basic SoC support for mediatek mt7986
>    [PATCH v2 1/3] ...   (patch set v1, applied by matainer)

beware: applied != accepted
reviewer != maintainer

if the patch got applied to some maintainer repo, then in the next version drop 
that patch (it is already applied) but mention that in the cover letter.

>    [PATCH v2 2/3] ...   (patch set v2, need to be upgrade to v3)
>    [PATCH v2 3/3] ...   (patch set v1, waiting for review)
> 

This series would be v3, if 1/3 is applied, drop. 2/3 will have changes and 3/3 
will be the same as in v2.

> Is this correct to send patch mail to maintaiers for the above
> situation ?
> 
> [PATCH v3 0/2] Add basic SoC support for mediatek mt7986
>    [PATCH v3 1/2] ...   (patch set v3)
>    [PATCH v3 2/2] ...   (still patch set v1, waiting for review)
> 

yes, that's how is expected you send your patches.

Let me know if you have any further questions :)

Regards,
Matthias

> 
>>
>> Regards,
>> Matthias
>>
>>
>> On 24/09/2021 13:40, Sam Shih wrote:
>>> MT7986 series is Mediatek's new 4-core SoC, which is mainly for
>>> wifi-router application. The difference between mt7986a and mt7986b
>>> is that some pins do not exist on mt7986b.
>>>
>>> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>>
>>> ---
>>> v3: changed 'MT7986' to 'MT7986 series' in the commit message
>>> v2: added an Acked-by tag
>>> ---
>>>    Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> b/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> index 80a05f6fee85..a9a778269684 100644
>>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> @@ -76,6 +76,14 @@ properties:
>>>              - enum:
>>>                  - mediatek,mt7629-rfb
>>>              - const: mediatek,mt7629
>>> +      - items:
>>> +          - enum:
>>> +              - mediatek,mt7986a-rfb
>>> +          - const: mediatek,mt7986a
>>> +      - items:
>>> +          - enum:
>>> +              - mediatek,mt7986b-rfb
>>> +          - const: mediatek,mt7986b
>>>          - items:
>>>              - enum:
>>>                  - mediatek,mt8127-moose
>>>
> 
> Thanks,
> Sam
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
