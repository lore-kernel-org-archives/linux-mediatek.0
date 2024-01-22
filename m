Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D0AC47DD9
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 17:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dg8I5JcHrRlXUy9GUlV4Auo+UENFvpBlf45H7DNqd2g=; b=HSIrngz9bhHkwnjz3UGGS7J5oa
	7ai3JvmVjRqVAT+ykVzhgekD+gEGgbz4VFEox0hBAF90XiSeCyXaMwdb61zc32y4b36647BWgdqIv
	m2yEeW6Ia3OcZJWya1Dck4dl7Tme86xgAr6opoKK+9Oi1UQq8DgWkIQZHM/BC4q1NyQerV4PAT5zw
	OBA2x1CBXku/m5GDnXsCbLg5mUjO2cJNVgdKJAkQPVpLaKunDRHwupwD2t0tp9TL7iCmrwQs23Fdf
	miWI5VJD/heOlod1FFu4ov2FyyVFCO9i/1ex7IMghvApOpDMnBbqd080d4+VAEhSaZV6+QtnmuODG
	riaCrL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyI5-00DJC4-1D;
	Mon, 22 Jan 2024 17:40:57 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyI1-00DJ8B-1a;
	Mon, 22 Jan 2024 17:40:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a298accc440so371659466b.1;
        Mon, 22 Jan 2024 09:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705945248; x=1706550048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dg8I5JcHrRlXUy9GUlV4Auo+UENFvpBlf45H7DNqd2g=;
        b=jDViy88OTkEPUDs3OlwdQvHQbOzAOn25hAImUhglCTIovgfiBpA5wdEFkGrCr2fikV
         5wwdSiQSrUxRJ7n8Hg631lCFTTjDRLRUU3iOSwc2ESbH0XRaWOFwqKtovCP8STU1SgCt
         TcWR6gu7mQsxsxaxHtelSUV+XORaxWP5gykePJ5IcwU8q+Id32d9j++RzB64Ullxbzmj
         wiCP4MWRtyGB8bvqJE0X64wk5RSkoZw9KJS+m/8NeANCgwSbrsyl8KITJ6xH3qlTI9NM
         ebeVrkLnUHOyhZwXRb3HkPgKsk6Fhxhhnfr5mEtd99PVSaaff5aUKhgERXhJ3BzZnwe+
         YpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705945248; x=1706550048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dg8I5JcHrRlXUy9GUlV4Auo+UENFvpBlf45H7DNqd2g=;
        b=TGvL43WTZAypNkwdIW5lgtH3zAeLMHfw2d0CXh1Vsxt7Gds01XHCgelGanuQRl7m19
         cJK40O3ne7sjOgv4IvS3WpChaLzJiaczHl9BuRcMgpYrxXSZ0POofM2cYn3xwobh6cZz
         pzFiB+JTGs5FIeUqM/Mi18K6hegEJwE+rUlpHFTwh7mNONtGkSQHv7MsEia6w0nYPnsI
         05OZjW2t7I3O4c7ZjWGa0k0JXhB/t9hpqQIewNLg6vGaK0YaCJ+5gm15OwIj1iKlf63y
         OyNW0CvF6pAq3IkQswHIWAmrv+uR/jyY+vaRkuO7WeyIeK5bsjb6v5BOTtol4LR2U65h
         NvXQ==
X-Gm-Message-State: AOJu0Yy2GLwi4JPCCpVSeJcynETpbGSTLZkXDgWB4kSf0JGc/AMV7sY/
	MP+v902SvxswsSNwefzAS9KvDq8Z+jmEgTHjRAeeksKU9xBF/JN+
X-Google-Smtp-Source: AGHT+IFx6SIU847X6czNf31z+hKTviMy+yuipEXqcOFLhPZbLoNL5KT2/P9O4hOGrFtB2Z4tFJvI/Q==
X-Received: by 2002:a17:907:1601:b0:a2f:c791:7739 with SMTP id cw1-20020a170907160100b00a2fc7917739mr2615956ejd.30.1705945247871;
        Mon, 22 Jan 2024 09:40:47 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id t19-20020a1709067c1300b00a2ca9d38654sm12642103ejo.85.2024.01.22.09.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 09:40:47 -0800 (PST)
Message-ID: <311fa703-7dbc-41d2-bfde-85dd7cb20657@gmail.com>
Date: Mon, 22 Jan 2024 18:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Ran Bi <ran.bi@mediatek.com>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240122124949.29577-1-zajec5@gmail.com>
 <1c4e14f7-ca34-4433-96cb-0ba6d6c6906d@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <1c4e14f7-ca34-4433-96cb-0ba6d6c6906d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_094053_532042_50F5B7FF 
X-CRM114-Status: GOOD (  11.87  )
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

On 22.01.2024 14:19, Matthias Brugger wrote:
> On 22/01/2024 13:49, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This helps validating DTS files. Introduced changes:
>> 1. Reworded title
>> 2. Dropper redundant properties descriptions
>> 3. Added required #include and adjusted "reg" in example
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   .../bindings/rtc/mediatek,mt2712-rtc.yaml     | 39 +++++++++++++++++++
>>   .../devicetree/bindings/rtc/rtc-mt2712.txt    | 14 -------
>>   2 files changed, 39 insertions(+), 14 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
> 
> In this schema can easily fit "mediatek,mt7622-rtc", so how about renaming it and add reference for that RTC as well?

I see your point but by looking at existing Linux drivers:
drivers/rtc/rtc-mt2712.c
drivers/rtc/rtc-mt7622.c
it seems like quite different hardware blocks.

Different registers, different programming, clk in MT7622.

Should they really share a YAML binding just because they use similar
properties?

-- 
Rafał Miłecki

