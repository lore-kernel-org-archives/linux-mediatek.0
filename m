Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3535C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zA00Qz0JPk4MiJn8NwFtqQLVGcoqmJxWG2bf2W8xESw=; b=ZczLgCNK9ixerdeElset2SnTt9
	5Qr6THRQR3nrTJGl4JAJKozEDvzvGNsuNEVvtqfPHtQ4vCU8ZmMqXUTlM0z5+aglDNAKm4vTSlbqv
	fYb1VTXCIc35eN2u5yYv9Oeazj7IhRCID+MKKjOvHa2MsNETLMPlpPeYeBdKN1HBJVIcIHbr7cVlf
	CCe4PUyhbXchiHHVIeQfVHOFWqTCDb1lOE3dnY1jF20ohHgGmgPDL+iXI4eUbUTUJwVbZv8eVoV8q
	Wc8yI14tWuHT9bGCcwMoP3D6yQcPpmY8/yKLzddS5OHBzMzGEZnu+sLiAusiqDdYNfGu5F7I9/+Uv
	73Ls0nHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDb5-00C9a8-DH; Wed, 01 Feb 2023 13:56:23 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDar-00C9Xb-1K; Wed, 01 Feb 2023 13:56:14 +0000
Received: by mail-ej1-x632.google.com with SMTP id dr8so30051961ejc.12;
        Wed, 01 Feb 2023 05:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zA00Qz0JPk4MiJn8NwFtqQLVGcoqmJxWG2bf2W8xESw=;
        b=dOiccATA0bf1VpwwjW79XyJkwhl08xOgcaeX84t8kBmVgnjmooFAvxlLfIRddZvBa8
         Fbyat6rjG2fgB/34PNH4i6iiUJXhV7jiZ0+jC0Xpi0rPVTSAQABNxM0r4ohkUIpNsS/k
         PQSfjjRwkvb3nIh+KIcegIcQeqYZAgbum10TwIx6HDQ7waa+CXDknuEoLL7QD5HfiaZ6
         rOOaCeIb15puNHlMqkUdCigXVCHxO7EUSQBAByWXss6rHkTDCInDzDwyhQzAkV2lgC80
         yKdgYE5CC6LS4rhE68ZEfgmYVrCtlViiiZoCwQzO4qlAQ8Jd4eulL7Zo8AYItyfCeb5I
         1IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zA00Qz0JPk4MiJn8NwFtqQLVGcoqmJxWG2bf2W8xESw=;
        b=ExWX4ixkVNyj4xpS12tj3VllpX41MSEJIt/yFRhi58OrDl9AZmEOFx7Q11Gc82Vsbk
         LphNx2GI6LSbAz5ECYeYQpV65wdaaMQXe1sDYT1uezvgFEZmKsT38A5OEcE2ZuZlbaA9
         EMHpVz0/F7G+0/2jo9NHhn2hBZq4ex9FFpi2rvMXQKJQNalEAih/Il8ZX1SCNIeZhCKK
         1z4NWXj8QLvtB1ufC/hVXdgb1aDmjAZsTnin5aNFYe75y3I4Pkin0RGMrFu5GzRPAcqZ
         43jnM4jNvQ0hDNmbmoDr8+829SoW3OaJL52YbBZ75aIJNxN/y2EGynr8xBpbGwBUfzaU
         QUuQ==
X-Gm-Message-State: AO0yUKVf1s7bdTIF8oqTTn2QJqrLxsYTmzEVOO1Nmp8alBT0hg9x+4Rk
	r1lFphC1IeGXw6eMUr/x1Bw=
X-Google-Smtp-Source: AK7set9wtZYBiXOAl5E1LAVfq6s+bHA946NV7XKZ5kmjMt3I8p1RpJKvYpLlfWkDOLxurF2oK+63SA==
X-Received: by 2002:a17:906:6b98:b0:878:7833:816a with SMTP id l24-20020a1709066b9800b008787833816amr2336086ejr.43.1675259767429;
        Wed, 01 Feb 2023 05:56:07 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id pv5-20020a170907208500b00888fddc4eb2sm4598051ejb.164.2023.02.01.05.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 05:56:06 -0800 (PST)
Message-ID: <c3ba77ad-cc90-3246-2bcd-ee29029bfd7d@gmail.com>
Date: Wed, 1 Feb 2023 14:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 0/7] MediaTek watchdog: Convert mtk-wdt.txt to
 dt-schema
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: nfraprado@collabora.com, angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
References: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
 <CAGXv+5EkPWF77ATVRhxygVOyYmxXgdTNPmOefP7jGeOMeZw_MA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5EkPWF77ATVRhxygVOyYmxXgdTNPmOefP7jGeOMeZw_MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_055609_120491_487F5A2F 
X-CRM114-Status: GOOD (  18.20  )
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



On 29/12/2022 11:37, Chen-Yu Tsai wrote:
> On Tue, Nov 8, 2022 at 12:03 PM Allen-KH Cheng
> <allen-kh.cheng@mediatek.com> wrote:
>>
>> Based on git/groeck/linux-staging.git, watchdog-next.
>> We use [1] and [2] as references to send a new series.
>>
>> This series converts mtk-wdt.txt to dt-schema and contains
>> - Fix watchdog compatibles for MT7986, MT8186, MT8188 and MT8195,
>> - Fix the watchdog name of mt8516
>> - Add mt6795 and MT8173 watchdog compatible
>>
>> Changes since v4:
>>   - Drop label for watchdog node in mt8516
>>
>> Changes since v3:
>>   - Drop label for watchdog example in yaml
>>
>> Changes since v2:
>>   - Drop merged patch from series
>>   - Rebase to watchdog-next (for mt8188)
>>
>> Changes since v1:
>>   - Drop "items" for a single enum·
>>
>> Changes since [1]:
>>    - Update the commit message with some details
>>   - Drop "timeout-sec: true" and use unevaluatedProperties
>> [1] https://lore.kernel.org/all/20221005113517.70628-1-angelogioacchino.delregno@collabora.com/
>> [2] https://lore.kernel.org/all/20220422121017.23920-3-allen-kh.cheng@mediatek.com/
>>
>> Allen-KH Cheng (3):
>>    arm64: dts: mediatek: mt7986: Fix watchdog compatible
>>    arm64: dts: mediatek: mt8516: Fix the watchdog node name
>>    dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT8173
>>
>> AngeloGioacchino Del Regno (4):
>>    arm64: dts: mediatek: mt8186: Fix watchdog compatible
>>    arm64: dts: mediatek: mt8195: Fix watchdog compatible
> 
> Looks like the dt-bindings have been merged, but the dts fixes haven't.
> 
> Matthias, could you queue them up?
> 

I just added 1-4 to my tree.

Thanks for the reminder!

Matthias


> 
> Thanks
> ChenYu
> 
>>    dt-bindings: watchdog: mediatek: Convert mtk-wdt to json-schema
>>    dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6795
>>
>>   .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 80 +++++++++++++++++++
>>   .../devicetree/bindings/watchdog/mtk-wdt.txt  | 43 ----------
>>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  3 +-
>>   arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  3 +-
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  3 +-
>>   arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  2 +-
>>   6 files changed, 84 insertions(+), 50 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>>
>> --
>> 2.18.0
>>
>>

