Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF70CC7EE24
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ste+hA3hVZg/wcPWyWKj67qIkpodPoS4fVaLQiPlcds=; b=1eOIjJof+7mIuYkSRc3+Ll4i3M
	6zZR/grgNE12pnHau1+/MTZAYkD4GtNsryXZkZxnYRBjGcG2lviHOZJT52XIgvDfU642J38UwQ1uM
	ZyUctDhCVWJsU3wZ66OM22LN9E2WC+6dSpX1YRQMXnQm+qhdILlkDJC+JgSY8k7vicAWznj6ZfANQ
	XnyZJ9KVneQB9GDNTwwWTlKgaUM9vYUEQXv9n9RcFnwtH1S2yvEGkZFhQh0mq14Uer6Eeo56++XBe
	PpdIMC7vgkqg9wQCo48zjExR68raA+mboB1OxBAAlld4hvmaBpXSLZLAmAqSR+5TGB42ry6+gWRME
	5PvthxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzYBd-00CEA4-08;
	Thu, 18 May 2023 07:36:33 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzYBa-00CE9G-2u
	for linux-mediatek@lists.infradead.org;
	Thu, 18 May 2023 07:36:32 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96aadfb19d7so318179866b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 May 2023 00:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684395388; x=1686987388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ste+hA3hVZg/wcPWyWKj67qIkpodPoS4fVaLQiPlcds=;
        b=QzEJZhz79HlFdtViq9eqLPahBfKlyYWEPsxmRT26/MAU5o3QQIjH8Rq1P+lhoJtFTo
         K7aGW6ybsrTfEAlzUo7FNjomb8FGMjKQTQIpClTc4kN0zaXiQqqPOCI2trT/LieP5sdm
         mX/nJel5naiIN/6j4qOqyOgxkONRJ1RmkgvxAUIJ8CQBc48TKaxztvuWmoKHDxZ0cGY1
         UB10jhv4eOMwfPdwhfwR+6z6SRyI8qNHBzHQYJUvvlkhkegcjP6rlK2HLglrdc9QEZgr
         h5+66G87iwjuqGnsiH73SRiEFVg6Dtgp2m3+PY4hKiOvWfzdF5Tni6RKCBc2fBYrxeh8
         VGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684395388; x=1686987388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ste+hA3hVZg/wcPWyWKj67qIkpodPoS4fVaLQiPlcds=;
        b=Dl3tBs2S5Uzc9I7htNkcMWN4TKhQcj5zL8te73vQ5zZ+QMGTJ2lS2V+UmibdIiAmFx
         EHowZsxAWu57aluzuYXy2XqbB4+Q03cNtNQo7p4/GpMl8f6pm8EvBeEcvKkYKcyivhru
         Ybv2OBXIwVN5w44cOtzgykcPBwSkpmeWCwKjG6Fgx1xxkCy2xkvR7ffKT2QhD233bQ8k
         v91MTMylx3lnkLjaDVyTyta2wc7XuvhQVtJpqRvZyKIWowk0xNgn8Gq1NHOoJOPV+Ru8
         f43ETPTPDbdCQwq8Nx2YDtYdaiQN+/rE1gDqa3CypH41ls6p/oPuY83V5siuYruA8esK
         Id5A==
X-Gm-Message-State: AC+VfDwUrUvbzWWVAzpx7t3z5mkNOKtcWjreHU+V7Su5y4iSJm6LxNrJ
	KWcmKEkVvisupDekgGy9Bs5IAA==
X-Google-Smtp-Source: ACHHUZ7Vh4OMaRUBvmALYQnHYbI1fQ7eSxuoQNeQi0X2/Sih20ahC1IIfU/tohj31CS190ZY2Niurg==
X-Received: by 2002:a17:906:ef0d:b0:94e:e9c1:1932 with SMTP id f13-20020a170906ef0d00b0094ee9c11932mr42996168ejs.43.1684395388608;
        Thu, 18 May 2023 00:36:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a2b:c408:5834:f48e? ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id l7-20020a170906938700b00947ed087a2csm593598ejx.154.2023.05.18.00.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 00:36:28 -0700 (PDT)
Message-ID: <d1a04735-d80d-d1d8-01fe-d6772d50b43b@linaro.org>
Date: Thu, 18 May 2023 09:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: update
 properties
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-6-trevor.wu@mediatek.com>
 <9359c081-cd36-3e5b-a113-7600b4ba435e@linaro.org>
 <d207670232288181171473d47536173a7aa47c75.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d207670232288181171473d47536173a7aa47c75.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_003630_952415_839236BB 
X-CRM114-Status: GOOD (  20.21  )
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

On 18/05/2023 04:37, Trevor Wu (吳文良) wrote:
> On Wed, 2023-05-17 at 16:43 +0200, Krzysztof Kozlowski wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 17/05/2023 13:15, Trevor Wu wrote:
>>> Add compatible string "mediatek,mt8188-nau8825" to support new
>>> board
>>> with nau8825 codec.
>>
>> Subject: everything can be update of properties. Rephrase to focus on
>> actual change, e.g. on adding NAU8825.
>>
> OK. I will rename the topic in v2.
> 
>>>
>>> ADDA_BE is used to connect to mt6359. For the machine, it must be
>>> fixed to the same codec and configured on the machine driver.
>>> Remove
>>> ADDA_BE from items of link-name.
>>
>> I don't understand the justification for this. If this is not a
>> correct
>> link name for MT6359 setup, then it should be removed in its own
>> patch.
>> If this is removed because of adding NAU8825, then why does it affect
>> MT6359?
>>
> 
> In the patch series, [PATCH 1/5] divides ADDA_BE into UL_SRC_BE and
> DL_SRC_BE. I was going to replace the link name, but I found it
> shouldn't be configured for the machine, because mt6359 is the only
> codec for ADDA_BE and it's hardcoded in the machine driver. As a
> result, I decided to remove it.
> 
> I will separate it from the patch, and put the new patch after [PATCH
> 1/5].

Yes, please.

Best regards,
Krzysztof


