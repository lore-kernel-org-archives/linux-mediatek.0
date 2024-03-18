Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E91C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0wJSLY+Uv+yhR8IopuqKPTo2o4yVaHIVNr68XVgUWs=; b=u/+cy+L//ma4z7A5mqygmKT6kK
	FAbnGa1KcCdqeOqF8Kt2XWypHMKp+zuknyIQzvdkRGjZwz9GLt8TSbt21kuE7v1cxPNwvdUkUIIST
	tvl8nzi+wy9Rf8sI0Ub07yAhOGL/nvNaXPAbRe9zdbQn6hIqg61ngTDU2PE7DOkF6YTyP3+NzrPio
	T/1vzzYVzu8cCv6CsWDdrbCQdClQmku87K5/nZdwg23erBLgy/G69oLQ4+EOyYDGQsJK+FF69Y98f
	QiAw5kqjkyPiG+sOfYCoKQdP3HCpg4eRgpAzkV6KcpYe9QLWiqU6zPy/y94m1C0zOS0SuHnIyiGZJ
	ZICAxVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmF4r-000000094Cy-40Zf;
	Mon, 18 Mar 2024 15:39:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmF4n-000000094As-1S6d;
	Mon, 18 Mar 2024 15:39:02 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5cedfc32250so3285621a12.0;
        Mon, 18 Mar 2024 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710776339; x=1711381139; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0wJSLY+Uv+yhR8IopuqKPTo2o4yVaHIVNr68XVgUWs=;
        b=GTpNph57KjgrLgHeKT5iyu2FLaM4hNfSP3+12S//eY9+g8QP32CgnxDnzYIuqGOSzb
         opZMhXHQa0puaYilph3xbhOE2VCGrekcSxx0qfPVW1JsujWoSgAle3MbDDFRq0hp/aHY
         vzOU8BvZiCuDhtvR7JsTW3ALhQXobpEYtKaQW1eN+viQ4aVyL9wmpQ5PUb6tmnk4cg9L
         RuxrbTjf2ahY7iJcxLqvQcyKwPhMi/4O3wd9TK8kyWiOCkjVjq4oWRXUVsfXy65Ht3hR
         Sp0+ry4ig2Z2dweEdiCLQ53cPjZKZ+5KyMDoTIIIMwyCYBaSJTOKUUmhsg0a9v3/0ZCc
         TQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710776339; x=1711381139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0wJSLY+Uv+yhR8IopuqKPTo2o4yVaHIVNr68XVgUWs=;
        b=JQaRmEcfE0tKbZZrSGRjEPxw/Ebw9X/iRgZkI3INjmLib0CedVxW0IqA1H4jOLZmhk
         UJP5UXvrCB4udNXGUm7E+33NFDb6vioYa2artPUTYcg3qfbNcd/5Wm7biJ//JP5LhqyO
         wzmACHpe8jdmGBjcxzta3o5dXgJWZlJi85JtazXpcGIhtsG4WIGzQH47sBuIqGVSDYf5
         O0m5n572IcxUqssmL2duCZQlLpHUepJ+LNPg6rFiXnXcS+vj2hi1pPSA7syPch7bX8dY
         4Yw0xJ6GTEilIxgdgul3qQ5HpL31QEJcz0oL7AtGIqXu6mLBaNQZqGuhH9dAQ+3VhciF
         IVwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU/txQpLw/ECq9rbSOO9ZdAof5ju7+rT+kaogv4j0OJ6pn32bT1wj0hVCHm0xhF7UxmtHJ5v3gug9gFG/4aM+TfcKLWvfNuRHtRD+pdIJhyJrJCLxdYpMoabWiucqPtXjnB2Mfy4c9OZy7QJzxdfB759vh8z6ZTAM=
X-Gm-Message-State: AOJu0YwaPYm/fPM5zF6NSqQCF8tzqLmRZSObKBUGDN/QGRphKSHThJVJ
	h1MbvHyTTPaxyRAticAob7ob9bgS/8osFGP6zPDU0aFWdJQ4lNWq
X-Google-Smtp-Source: AGHT+IFwwuU1jLlDgfi84MjIw2c0Tg2DpHNv23NVq4KsqnYYpEH/YjvrfH11kVR4gY7v9ExA1ahxjA==
X-Received: by 2002:a17:90a:1fc4:b0:29b:c17c:5fa6 with SMTP id z4-20020a17090a1fc400b0029bc17c5fa6mr7890253pjz.33.1710776339539;
        Mon, 18 Mar 2024 08:38:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id q98-20020a17090a17eb00b0029e077a9fe6sm5870067pja.27.2024.03.18.08.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 08:38:58 -0700 (PDT)
Message-ID: <23f4c9b1-5c6b-4f3c-9290-41d195650368@gmail.com>
Date: Mon, 18 Mar 2024 08:38:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7622: set PHY address of
 MT7531 switch to 0x1f
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
 <20240314-for-mediatek-mt7531-phy-address-v1-1-52f58db01acd@arinc9.com>
 <94e3d09a-e6a4-4808-bc29-3f494b65e170@gmail.com>
 <62d128f1-11ac-4669-90ff-e9cdd0ec5bd9@arinc9.com>
 <71dd200a-0306-4baa-abab-6e6906aeef2a@gmail.com>
 <7d1ad037-d8ac-4b9a-b6d2-ab683e52a898@arinc9.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <7d1ad037-d8ac-4b9a-b6d2-ab683e52a898@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_083901_410073_0FA4551D 
X-CRM114-Status: GOOD (  15.14  )
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

On 3/18/24 08:26, Arınç ÜNAL wrote:
> On 18.03.2024 16:02, Florian Fainelli wrote:
>>>> Can we call it a pseudo PHY to use a similar terminology as what is 
>>>> done through drivers/net/dsa/{bcm_sf2,b53}*?
>>>>
>>>> This is not a real PHY as in it has no actual transceiver/digital 
>>>> signal processing logic, this is a piece of logic that snoops for 
>>>> MDIO transactions at that specific address and lets you access the 
>>>> switch's internal register as if it was a MDIO device.
>>>
>>> I can get behind calling the switch a psuedo-PHY in the context of MDIO.
>>> However, as described on "22.2.4.5.5 PHYAD (PHY Address)" of "22.2.4.5
>>> Management frame structure" of the active standard IEEE Std 802.3™‐2022,
>>> the field is called "PHY Address". The patch log doesn't give an 
>>> identifier
>>> as to what a switch is in the context of MDIO. Only that it listens on a
>>> certain PHY address which the term complies with IEEE Std 802.3™‐2022.
>>>
>>> So I don't see an improvement to be made on the patch log. Feel free to
>>> elaborate further.
>>
>> I would just s/PHY/MDIO bus address/ since that is simply more 
>> generic, but if it is not written as-is in the spec, then I won't 
>> fight it much more than I already did.
> 
> I'm not sure what you're referring to by spec. Are you asking how specific
> the name of the PHYAD field is described on the standard?

Spec = IEEE Std 802.3-2022 standard, aka the document you are quoting.
-- 
Florian


