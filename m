Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD9CC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvrEYs9DYAbC5MlxDXuq2vHAc+BawiypTJLqHR9+P4I=; b=II3i9itGFf0Pe1yAqJYyHtY/dV
	HVi+jYM5z/mBRtqMQizOYUhKwcODtxKBT9kqYzrAj7dSKWkIWOKJx/o0ZnQAQqsbrP2Hx8gogz2Bm
	Kdkki4zi9EAGCS0nrtuMxEk2ACwMf2ZaLdpytOSMrXvtwTHk40KtXFnDTS7zrG0/bWzSRUSlOTBbA
	VwKQ+rm3Qim2zgXrvhjO56JDIVdJCUQhERjhaKrablT7WLduGg6D3I93T22pWKRwrVXaeTzkSowGq
	9HQAIxm05fATPzdmcv1WoNqr08KoP6np6egE3RMmVJWTLufx6BbPQyUIrWviSV1bgw/5f1l23aHgf
	mE+ygQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94r8-0000000EpZy-3iOz;
	Mon, 20 May 2024 15:23:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94r6-0000000EpZ6-0ndc
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 15:23:18 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41f9ce16ed8so29779165e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716218593; x=1716823393; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BvrEYs9DYAbC5MlxDXuq2vHAc+BawiypTJLqHR9+P4I=;
        b=DUjuy+OKCY9qvISJVXqARr5WbHSP8TkUHCASzA/78D+bIRZPuPhMTzQDFB3TxP/MRS
         HmeL1nnZoE9GR0zIYtcsWeIhPuYmJh6YL3NhpFsQoVLXF037Xesj93UXSaaS9ae3oXkp
         e3XrLPfN1WKWc75GLD6ykDd8nMGIh63hfwMVzJ9/sNIRYBxoE/8cyfMJ2p6ixIUrRmsp
         jjdOLCzFauGfejI5Py5JY4EMTNIEyqWtFdVhw0wDQL2JkRH0wG8FOjVwZE9qQiSAqlZv
         Ue/B68UIGONYY2YYhwWIDpwEtXgpeTHipwXBEaOxs1KxOfs0faulqqI3IRgEcg2rcvpA
         sBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716218593; x=1716823393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BvrEYs9DYAbC5MlxDXuq2vHAc+BawiypTJLqHR9+P4I=;
        b=wl5BYa+I/y+OnC9eBpSvIsD8kbZPMUvTYDKqpyNrVrt7zx3MvoRyKoi3ynmrKNEMqa
         Wc2UxC4EzLhTD8Ak7WvJQNFGVr+eQUHEigPloijZi281wfwEAkQjKExo/7M3fmR7SYFD
         0THWXJoRflYzYLn3TI/rvVl+Pk1xJ3BZT3N+S5OMQmVkljuLfKis7o7VRWG6/N5SnoOn
         iW9euGQNEG19Y63Qzyr5jS/9u6AykoaGSbGA+w3mj6QupE5/XCOkc9WjziAsMDVFXlaq
         EHgQclHk3/6t/b5gyutAX+ef9nMhfOZgz6vRSl9O/0S7/NYXw7cxPY+CgqJtF7NctPSh
         g3lw==
X-Forwarded-Encrypted: i=1; AJvYcCV5+l5D7ouaj6W3SK6uRkNt5WsU1IeheQzoRheRhXRFzi2Ua2ftz/W/Imhb1nuDyg/sKt4GPOSuuHvXf2XJuHy/QxkZaarcdHQGbi/inOwNwHzn
X-Gm-Message-State: AOJu0YwwyhPbLSN15sTBRIuw+tsl9Bg+FLoowbbKJVfH8ApcqJuvXamp
	MUllvuo7gRvUDmojBrCjvtnzfNFIN+OFruSG6Cri28zIpCX/npGOae2jDGbG/2M=
X-Google-Smtp-Source: AGHT+IEfQLzDF+6DeA5WUKvuzwObOI9YQj9ggS89zR1Mmor4R3KYRZxxcVlburs7BeHxESEegxmkMA==
X-Received: by 2002:a05:600c:3ca3:b0:41c:23f3:65fa with SMTP id 5b1f17b1804b1-41feac55e3cmr276704235e9.28.1716218593164;
        Mon, 20 May 2024 08:23:13 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88111033sm461769625e9.34.2024.05.20.08.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 08:23:12 -0700 (PDT)
Message-ID: <51a47736-ffe8-49e2-b798-d409ca587501@baylibre.com>
Date: Mon, 20 May 2024 17:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt8365: use a specific SCPSYS
 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
 <20240518211159.142920-2-krzysztof.kozlowski@linaro.org>
 <f42ef151-6eee-418f-91e1-5ac08d161119@collabora.com>
 <2cc638ca-0add-4c8c-b844-606e22dbd253@linaro.org>
 <cf8c87fe-7a4f-423f-9c97-3759eeee4894@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <cf8c87fe-7a4f-423f-9c97-3759eeee4894@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_082316_387662_81BD7A94 
X-CRM114-Status: GOOD (  14.84  )
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

Hello Krzysztof,

On 20/05/2024 12:12, AngeloGioacchino Del Regno wrote:
> Il 20/05/24 12:03, Krzysztof Kozlowski ha scritto:
>> On 20/05/2024 11:55, AngeloGioacchino Del Regno wrote:
>>> Il 18/05/24 23:11, Krzysztof Kozlowski ha scritto:
>>>> SoCs should use dedicated compatibles for each of their syscon nodes to
>>>> precisely describe the block.  Using an incorrect compatible does not
>>>> allow to properly match/validate children of the syscon device.  Replace
>>>> SYSCFG compatible, which does not have children, with a new dedicated
>>>> one for SCPSYS block.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Technically, that's not a SCPSYS block, but called SYSCFG in MT8365, but the
>>> meaning and the functioning is the same, so it's fine for me.
>>
>> So there are two syscfg blocks? With exactly the same set of registers
>> or different?
>>
> 
> I'm not sure about that, I don't have the MT8365 datasheet...
> 
> Adding Alexandre to the loop - I think he can clarify as he should have the
> required documentation.

Unfortunately, The SCPSYS (@10006000) isn't documented, but according to the functionnal 
specification, it seems to have only one block.

I don't have the history why SYSCFG instead of SCPSYS.

I've tested your serie and have a regression at the kernel boot time:
[    7.738117] mtk-power-controller 10006000.syscon:power-controller: Failed to create device link 
(0x180) with 14000000.syscon

It's related to your patch 3/4.

-- 
Regards,
Alexandre

