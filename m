Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD79AC61D99
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 08:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpRyQaYW4/vL4ShXm+d0nPFyBue7kCdABCWcnGkyFTo=; b=E5rfp+qW1zjQfPc4a1Hv8tE5K2
	snNnOZrGYEPyneHUTgO9M+1G7pa/Mfxb81FNNdPGEd2k1L1Kkwp5UQIU6U29BWcjrDoFd3pqEflfk
	rdc3NIVTffWhnoLjEQK/uvKcuDUwSvLT3MAwmAFDsB1vFQy2J91oQl5hFWInkdlsqqI8vqEhWPfKB
	Wx4eyE/N1raX91tINPQ3fIozVAzlTX7nvMw2pqJCUPwhXqQ+XPBn7QB3gU43ffw5sLvWmLy/Ya3vt
	hpY644KouiKu8wP3sUasyllGfiRkHN+m9E/1zgrRXbd5OvifF8hiUsqK4f3mo5d6tBBIcmlb3snAx
	yNFhzR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iB5-000zKQ-2Q;
	Wed, 22 Nov 2023 08:01:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iB2-000zHb-25
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Nov 2023 08:01:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32deb2809daso4278342f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 00:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700640097; x=1701244897; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpRyQaYW4/vL4ShXm+d0nPFyBue7kCdABCWcnGkyFTo=;
        b=cOzRW4U4fchS+DF1aqWkAuB3RuncL3aNHdpBB65vUsxta3L4dJeE6hKpCuTnYMwMJw
         bQFIwU8UyhpPWFgtqBLr4c8ljzuiwD2G93rPcvN1R6hr0INzRQh9NRCAPJOnGB58maeL
         cvbHONk14oL2eZFY09m1TnTxfqZmMpVyO5Yc4TP+EChEUzQITUrSi62IYCreBDiTQ/Gz
         LEZrshE0Wtl94YH42xubQ280g1Zc8gPwk5xQycl/mUaxw7WgVc7KaKCzCwc3iG2AdmlW
         LnbPPFviT9hsJ5dRthsD2hdhPClrc2xF0wGheSPnLSatPS0uZt8H3XzpTq3xlSVF4Xv6
         WK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700640097; x=1701244897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpRyQaYW4/vL4ShXm+d0nPFyBue7kCdABCWcnGkyFTo=;
        b=HwKj+4+kpthN5Lv41bmq8HO40yHju5u0FI9vbxPGV46LbbgJDy9pEKEKIO4UdIAMmh
         Z99/zZQc+7SDZlOjjBn9+iKqgHKLNY5tTP+BU0FkyFQRwMGkv+shYGlMpZtK4QhLzRUQ
         A4ziOfuPhrfyTVA6i83/rUd/KiWOaR2/0/xTLwYIReDieLpuZ9kfOm9wGYN1HCiVratf
         5+bCMmpR9aTWozOlHheXVjy/mVZS2NWVIf9JEgqVbp5gV3RvtgzzfewpmUUDJjELkXqN
         TlObLMpsTs8MMhC54lrZMZmV/4jl1uOXkT+mtC1vnlQYWB3EJmuEEvoFuCpklTa0/rqs
         mtlA==
X-Gm-Message-State: AOJu0Yxc7yhePZXc8I2oEmVhKwAQgHY2GCTtx6cISBkjXSrrb1WQkA75
	SGosCcnbpEBTqlDVAOBTYAUPgA==
X-Google-Smtp-Source: AGHT+IHBBXBgRDaK4VuhpKuYj7C0ExJ0pHqrpwD5pPYmWDdTv56w/nwhnJbUDu1/dAKqdyvyZV4g1Q==
X-Received: by 2002:a05:6000:b87:b0:32d:89b5:7fd9 with SMTP id dl7-20020a0560000b8700b0032d89b57fd9mr977755wrb.56.1700640096302;
        Wed, 22 Nov 2023 00:01:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d4004000000b003316b3d69b3sm15605462wrp.46.2023.11.22.00.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 00:01:35 -0800 (PST)
Message-ID: <26b5fd29-fcd0-4c68-8bfe-a73a660fb2c9@linaro.org>
Date: Wed, 22 Nov 2023 09:01:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com>
 <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <6c80a285-27fc-4d61-9eef-af4744a9decc@amd.com>
 <cc57dcf1-3c32-426e-920c-6f0741027797@linaro.org>
 <CAMuHMdVGyXizPw9Rggj8fQeNdbx3udRcsHFhz_sqYZzjN1CnZQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdVGyXizPw9Rggj8fQeNdbx3udRcsHFhz_sqYZzjN1CnZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_000140_688112_F8633C70 
X-CRM114-Status: GOOD (  16.27  )
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

On 21/11/2023 17:04, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, Nov 21, 2023 at 1:36 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 21/11/2023 12:55, Michal Simek wrote:
>>>>> device-tree specification v0.4. Chapter 2.2.1/Table 2.1 is describing much more
>>>>> valid characters for node names.
>>>>> It means above description is not accurate or DT spec should be updated.
>>>>
>>>> Spec allows way to much. dtc doesn't.
>>>> One thing is the spec, second
>>>> thing is coding style.
>>>
>>>  From my point of view spec is primary source of truth. If spec is saying name
>>> can use upper case then I can use it. If upper case is not
>>> recommended/deprecated because of whatever reason spec should be updated to
>>> reflect it.
>>> I know that DTC is reporting other issues but isn't it the right way to reflect
>>> it back to the spec?
>>
>> Then why aren't you putting Linux Coding Style into C spec? I do not see
>> any relation between specification of the language and the coding style
>> chosen for given project.
>>
>> Zephyr can go with upper-case. Why it should be disallowed by the spec?
> 
> I thought there was only One DT to bind them all?
> IMHO it would be better to align DT usage of Zephyr and Linux (and
> anything else).

I actually don't know what Zephyr decides, but used it as example that
it might want different coding style. Just like C standard allows to
have all variables (including local ones) upper-case, we do not have
such coding style. And no one proposes to update C spec to match Linux
coding style. :)

Best regards,
Krzysztof


