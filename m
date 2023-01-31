Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529E0C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 17:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GALk2yOZBKbLsxNTrFUIpXFTaX4N6lDPW1UKlHm5KE=; b=F/Sy11jNwg02H+5Mjo7ZVqhqyE
	uUJwkqen4tENU6wZh5qdPDATIAfzhNtn0e03fRogFS+sp4O7toP8bDW/W35EdAJVbUlnsPeZb0C7p
	fepGyB1MyhCeIJHWBqegM6UZlnj8brgNvJ7zKCVc0I1BtDGoMyii0Om6gGiVWF/SPVyckKnZRCGVv
	trC+mJGqp4RWea9OeciFGU+sCb6YBYAmgATVqkJeDl3dprOjI9G1yvUQsqcPcKbYCxgvMO/8N3mdn
	vUHVpGfKG2SJJYC2bbCvECehEi/MGen3d9kc2Lm2zbedqRljsI5OTHyNqu4a5/q2iu7c8EuGKRsbb
	MfECFbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMu0n-008mph-Pp; Tue, 31 Jan 2023 17:01:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMu0g-008mnM-Ny
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 17:01:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso4971301wms.0
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 09:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GALk2yOZBKbLsxNTrFUIpXFTaX4N6lDPW1UKlHm5KE=;
        b=lwqm7TzjZO5Sfs1RFWBEMFVWW0RImKhn5FMLNqY6xLCU5ZJbh2Ajf0a1h36kTfKQvW
         L4YJovqVAgbzrUeXFedhWhORzjpBrKFvFpiY6NFQm4dFBfyTxkVoCGDt9R8fElvtqQPP
         lTebqPZFct7DrsKT0ll2poNNAyLwzsDxZKFxlymI3hjWo/SKqrOhHheBxMU7XMKGVeW6
         2NYnL5e81jVdTSrSs3yMWVPPQV6XvgWqjxxRq6+pp43eNS9HkwLGmyPwEktMRjDoiCpP
         uDwT8g/RDF6WV9QEnHR9YVzV3xkMjtkJc/eBiN2neWXtjVIqgQBaqh9Ox18900tbhc34
         Vznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GALk2yOZBKbLsxNTrFUIpXFTaX4N6lDPW1UKlHm5KE=;
        b=MCZGlwdf0YgBLdgHZgtgA8coiRXNRHK1Hmt/LiMLIkOy71aseAtVvHdS15T5No44ob
         rGli/y9dzIlU259U3ERarzf9sIfUbe37t6LVKiyWi/OFsSWXg6WtJ9/U8g1zJe9aPh5J
         +ODSHfLJecGiq1CWzZ9Sdkd0aUxbC+1mkfvQzL4RUgsatgwwjP71uxkOr7+whVHSvjld
         zFq/1ZzSsFb6NWSfCayVdssx4RdoKuM4kTs/hQRyBWDoNw8C6V2OV4e5NdjsGZGUxohP
         zGI4h3CIU53s1nlSH5QumSC1Nbko9fX4hlLtNgHVYVCvWx9EQ0RofWFDIJYS4cLAgKKc
         r4dw==
X-Gm-Message-State: AFqh2kp+IdSQ1RoTIdR5d6ybzZsUPpjQKUpHjqAiAMfRsyreTfYFuzPZ
	LgcF5lC58CC/cSfa3aeaL9u8lA==
X-Google-Smtp-Source: AMrXdXtLemWqndR75w4l1MF5cQPb/cZFGAuLxWq3kqfaP3oIS7sIEJiokNLJlE2yqgs02Oz1Ya5i6A==
X-Received: by 2002:a05:600c:1c1b:b0:3d9:ebf9:7004 with SMTP id j27-20020a05600c1c1b00b003d9ebf97004mr52008187wms.29.1675184485343;
        Tue, 31 Jan 2023 09:01:25 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id c7-20020adfe707000000b002bfb0c5527esm15291583wrm.109.2023.01.31.09.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 09:01:24 -0800 (PST)
Message-ID: <17b57e3a-48ec-5e70-d659-fcbbfb3e22ca@linaro.org>
Date: Tue, 31 Jan 2023 18:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers dt-binding definition
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Balsam CHIHI <bchihi@baylibre.com>
Cc: angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-3-bchihi@baylibre.com>
 <20230126161048.94089-1-bchihi@baylibre.com>
 <5ec49108-6ad8-daf7-54ec-104f0923a31d@linaro.org>
 <CAGuA+opQboxH8qoNv4GG+raX=ZZAyRVLC9VLjVCzbT_cUQWWTA@mail.gmail.com>
 <35a4d692-e4f3-e5c7-2d33-2d5e15694c33@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <35a4d692-e4f3-e5c7-2d33-2d5e15694c33@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_090130_815975_CA362578 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

On 31/01/2023 17:53, Krzysztof Kozlowski wrote:
> On 30/01/2023 11:40, Balsam CHIHI wrote:
>>>> diff --git a/include/dt-bindings/thermal/mediatek-lvts.h b/include/dt-bindings/thermal/mediatek-lvts.h
>>>> new file mode 100644
>>>> index 000000000000..902d5b1e4f43
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/thermal/mediatek-lvts.h
>>>
>>> Same filename as bindings.
>>
>> fixed.
>> rename :
>> include/dt-bindings/thermal/mediatek-lvts.h =>
>> include/dt-bindings/thermal/mediatek-lvts-thermal.h
> 
> Missing coma, so mediatek,lvts-thermal.h

Yeah, actually Balsam resent a new version but numbered v3 taking into 
account your comments.

The versioning is becoming a bit messy now but if you are ok with the 
changes I'll pick the patch as is so we can go forward for this series.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


