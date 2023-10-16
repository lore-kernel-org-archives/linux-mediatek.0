Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADF0CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAb17pgGDskHnlY2AqE/p0VY3rCVGX3pMGwKXCOl8EM=; b=NF/+VP5lFXCw6gdRu1fJ5MsIkC
	+TV+bmrTND81d+4XzWORXFaOjAkLwln71F21pymMz9LiU8TVEY5MkFYcW40It/QKrOF0gb7//nsg2
	g5ai7xzKFVnybPXjUQsWTZqAr4NjUHtNIbixo+TAIbqwujU66hGnXfAnFukW9db9sWiPXkqOjvFek
	n8xuX2ZyxM2DhSyPGYQ3gDTWvBxEjavqrB7AjXp2XtM4pZiOSsW/mwVcUsQvYhR9I2PiusQ4dBJLj
	d4Uy23srb/7k/Nbp1LRGD6wX3DH+mKq45A42cXDzV/tsihgVfti4xeGWJ/uERd9VvXe0by73v0cPf
	0pQvdvOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQLU-00A7Qo-0y;
	Mon, 16 Oct 2023 16:21:32 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQLS-00A7Pz-0Y
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 16:21:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso3746449a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Oct 2023 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697473287; x=1698078087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CAb17pgGDskHnlY2AqE/p0VY3rCVGX3pMGwKXCOl8EM=;
        b=f47cBa80r+5eYuvL8eyaFgFTbheiy9OrusbDXcDJcX/DizavV/EtsV8iSzVFIuYfU1
         LT8rl+fNsmLS5aEovKpHKs+3zHHNy+c0STO8twaQpS7Ixhw6Y14V9eEP1J3fH6eGUkeD
         x3arJvm667VYVCYkJFPmsjXa0EgzFGJ4YobIeY0PrtSbgpTkpvatVoSK4IDZr3PgTjPt
         DUPiiUwV8O4kAw/+1MBFNBbPrKcRtI6wqHTJx316zVqw8VZpsadEEIsTb2lFtMdoQPVn
         TcsMna0AA9Pd71bHSLoXrp/Q0zz53IntWJGQXiKOtJEuddGhhom3ldzN5hmrwxBxMhJa
         ejdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697473287; x=1698078087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAb17pgGDskHnlY2AqE/p0VY3rCVGX3pMGwKXCOl8EM=;
        b=Zs3aKVYNKUmpPzU87yHIKlvTz/Gb95Td1QulFyKYBI1cTlQYMzD9itjuKHskikLsro
         IDLTJzeH9OPzVjFtP6stZcIB5Xdrn03XjD2uEWmlN+wBsjnODih6ACw6QVAmb/bkrJGJ
         vR4wtbE6meQYO9Tsdp3K+oht+FShM7pD+LFMevlqwBKj3ku1avL8xWx7y4jNa3T2He1D
         lzSYj9IAbYhsBZmzAtOLuMK6JJsHmWj208l7Pob9HWWfN27u7kA18Q7Q7riboPguOOHr
         DMMnG8cTeKrOwgFlND/Ko2o4I4PmayyW9PsmoBKh2ZoLvq6OWfYMzWQF/rKLpF37Kj7x
         VQaw==
X-Gm-Message-State: AOJu0Yx2djlVQ4XCK7iCDdVzwTKBjB30odjo7zVBkTKMXoj9mmD9EORi
	50+rp4uWA94WCrfp4i9zWpnd/g==
X-Google-Smtp-Source: AGHT+IHPIUPjeF01O0GQgMCM2cew1xETlz6uhpvJFH0yFiqhszt94wZ14RmTaFjPFS+FHUOWvaT1Hg==
X-Received: by 2002:a05:6402:2314:b0:53e:1741:d76b with SMTP id l20-20020a056402231400b0053e1741d76bmr9725656eda.39.1697473287208;
        Mon, 16 Oct 2023 09:21:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id g7-20020a056402114700b0053da777f7d1sm107223edw.10.2023.10.16.09.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 09:21:26 -0700 (PDT)
Message-ID: <ebfa6770-059c-4a9b-980a-3447ea9cf404@linaro.org>
Date: Mon, 16 Oct 2023 18:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/16] dt-bindings: display: mediatek: split: add
 compatible for MT8195
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-16-moudy.ho@mediatek.com>
 <e58ecc95-5133-4542-8178-338583bca2ab@linaro.org>
 <b1f42bab-7670-c099-8c7a-882f7268b358@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <b1f42bab-7670-c099-8c7a-882f7268b358@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_092130_216762_5D9E8F59 
X-CRM114-Status: GOOD (  13.74  )
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

On 16/10/2023 10:01, AngeloGioacchino Del Regno wrote:
> Il 13/10/23 08:52, Krzysztof Kozlowski ha scritto:
>> On 12/10/2023 10:40, Moudy Ho wrote:
>>> Add compatible string and GCE property for MT8195 SPLIT, of
>>> which is operated by MDP3.
>>>
>>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>>
>>
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: mediatek,mt8195-mdp3-split
>>> +
>>> +    then:
>>> +      required:
>>> +        - mediatek,gce-client-reg
>>
>> else:
>>    mediatek,gce-client-reg: false
>>
>>
> 
> Technically, all of the display components do support GCE, using it is
> a matter of preference, so disallowing gce-client-reg on anything that
> is not mt8195-mdp3-split is *technically* wrong, as much as not having
> that from the beginning was also technically wrong... :-)
> 
> P.S.: The driver for the display split component doesn't use GCE yet,
> only mdp3 for now, but again, it's the driver - while the HW is actually
> capable of using that

Hm, fine with me then.

Best regards,
Krzysztof


