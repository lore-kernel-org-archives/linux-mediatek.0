Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC161C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q60cvDzUAK+1xfeayy1L5bVvq0mLnjZeOOvCKBuUzG0=; b=y6qf7yb5EiHyaKlm96ee54dEFb
	uL081MKmbChDq3ZQ3noOfl0En4d4wpehT+/SOpHcirHYed82zOj72H9VQb1Nya8nLckbBB/aH5MR2
	nyMthXCnGY4Se93p2GRSFU9X6wFhgYT7zA/wPWLfsjeV6+9E7uXImgDwpHWe1/65R+7wuKHdRNJHv
	G4CcM0eXk7Gye+ku3PUbWo82Zrh96h0Dads/It6NL3fdovWyfgjeVdJpMAi0lb9jqKt+SP/FOhfg4
	Rbm8HXoefIatyoKizsbRnZClgvMOHpDaSB2iTFMVncPWiJp5Dp6mEJyowCECLAJw9age4KQQ38IWM
	WgmhbnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1TJX-008zoQ-2o;
	Fri, 10 Nov 2023 15:20:55 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1TJU-008zmt-1A
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Nov 2023 15:20:53 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo3476916a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Nov 2023 07:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699629648; x=1700234448; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q60cvDzUAK+1xfeayy1L5bVvq0mLnjZeOOvCKBuUzG0=;
        b=IJv/KgYR7N6WErXZqAfnQsND1nasTPgs7WiO18Otc21JlHnqyuubkZMdh7sggVl206
         8CTbU2Rd6vfiqzRzxKcjl1sycXkOacGOulya86lRcOQ4FEOONhPnYFsQ48uawVmLvnfd
         Qx/XWa3Bpu2RwoYS6oHuQrHx7+Vcj+JWqz13WcjFn2CZDVVTb2OKAhlMoCdDMGmSoG3n
         IrASgvgdOYHKtuxjqr1SfNDVjY//cZ86Nbbvq36kB/5paTHYh7p1638eyhxVfvrKSeY8
         QN9vETzUngUMI+xChMv5uW7DCmOz5xlC6gLay1l+6DhGr+clG+agxAQN4MzBXjqV0VAV
         E3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699629648; x=1700234448;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q60cvDzUAK+1xfeayy1L5bVvq0mLnjZeOOvCKBuUzG0=;
        b=Ml4pk7mBUtoLXHCGdj4BMTcje1uMjW2fPC5LViaM7tXl/sRObsp1O4lHQdowO7BJ0k
         y0zLTkf+snXhAn6brYdDg6Fyyj3vmCoL5ygHI9BxNEqHs7/eprAYGxHj6fsA33o4XM+M
         FIHUfUgFz6k/QgjhZh4RrSliSNiypbqZH+X/5ZFWRUJ8VkhNiXRvG6ScGigFPhVMuTFE
         1B+at7VwUriD5pFFuHfzVYzVMG6UZ6ml1BU34gzsZLpiK0t2L3sJMUyYFSoxqXLb4C2J
         Qm/8TXh3tK06K7yv/lXJ4nUAqDpDOHL8YJcNIV9xKofyTmdlULeLYkBt7iaHuDoxDaCS
         icpw==
X-Gm-Message-State: AOJu0YyFeMVDP3ZhDepN2jc08VjTyUUHR2IwHcykwlLzLahh3FCW8lGn
	/X4hx598a2B2oDDLVm5dVe5i10kbYvb0wfQrhRg=
X-Google-Smtp-Source: AGHT+IG8736pkNhNNdVrvSwcfmtDnAXVoUjv2Cj4/lEv2B3oApCfgwELeonWsFiocMNu9PYcPv1TFg==
X-Received: by 2002:a50:d70d:0:b0:543:56c8:f84b with SMTP id t13-20020a50d70d000000b0054356c8f84bmr6961108edi.19.1699629648476;
        Fri, 10 Nov 2023 07:20:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id b98-20020a509f6b000000b00533dd4d2947sm1287058edf.74.2023.11.10.07.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 07:20:48 -0800 (PST)
Message-ID: <fc52c1df-e414-49a9-a3a7-7a4ce45c403e@linaro.org>
Date: Fri, 10 Nov 2023 16:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988
 watchdog and toprgu
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Golle <daniel@makrotopia.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org>
 <59629ec1-cc0c-4c5a-87cc-ea30d64ec191@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <59629ec1-cc0c-4c5a-87cc-ea30d64ec191@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_072052_407726_2F8DC0A5 
X-CRM114-Status: GOOD (  17.18  )
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

On 10/11/2023 09:09, Krzysztof Kozlowski wrote:
> On 10/11/2023 01:30, Daniel Golle wrote:
>> Add binding description for mediatek,mt7988-wdt.
>>
>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>> ---
> 
> ...
> 
>> diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
>> new file mode 100644
>> index 0000000000000..fa7c937505e08
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +/* TOPRGU resets */
>> +#define MT7988_TOPRGU_SGMII0_GRST		1
>> +#define MT7988_TOPRGU_SGMII1_GRST		2
>> +#define MT7988_TOPRGU_XFI0_GRST			12
>> +#define MT7988_TOPRGU_XFI1_GRST			13
>> +#define MT7988_TOPRGU_XFI_PEXTP0_GRST		14
>> +#define MT7988_TOPRGU_XFI_PEXTP1_GRST		15
>> +#define MT7988_TOPRGU_XFI_PLL_GRST		16
> 
> IDs should start from 0 or 1 and increment by 1. If these are not IDs,
> then you do not need them in the bindings.
> 
> Where is the driver change using these IDs?

You nicely skipped my email and keep pushing the idea of putting this
into separate patch.

No. Respond to received comments.

> 
>> +
>> +#define MT7988_TOPRGU_SW_RST_NUM		24
> 
> Why 24? I see 7. Why having it in the bindings in the first place.
> 
> It's quite likely I asked the same question about other bindings for
> Mediatek. I will be asking every time till this is fixed.

No response to this, either.

Best regards,
Krzysztof


