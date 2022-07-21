Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A2AC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGG2EmCH3bS3wBtE1nLRsaoqlR5mpBzOgXAIcspF1i4=; b=y+716PKILbbFgJ6UjuvcsfTR5q
	IEm1RNb/85ebiTUPcyiKxmIy1lgo8eU2TGylUpkT4O/H7atbKUqcBO6rNXQCCAkjbqQWF00OASjzY
	KiAFhDjq+IrJUbKlJNvTehkiAn/q6iFrvDi8CpuBCFQWq7gk5j0wmDz5zMGqf3pZvE1y0RAIT/owJ
	vy5Vh62K5uYx2rtXJbYvkRWO25XetM5egT+D9x2hctHDVKp7PgVzqPJ+DRptMa9TFtyUoJmfqggTq
	l+ipgn6cD+3dGiWIAS+F33ZCqn5NkejYV6kyLqNFaxxFecOkbmygTEUFyXq/uP2b1+Adhgzz0aP3B
	oBDQNpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZCW-00A6G6-I7; Thu, 21 Jul 2022 16:39:00 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZCJ-00A61Y-7Z
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 16:38:48 +0000
Received: by mail-lj1-x230.google.com with SMTP id a13so2296902ljr.11
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 09:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YGG2EmCH3bS3wBtE1nLRsaoqlR5mpBzOgXAIcspF1i4=;
        b=VrqwtoLDp0th6beh70O/VpIJb44Tn48oNwIpyGGfXQ82zAA51Bxkl2wSrzc54xQE/D
         /eJ2dHRsI8MZGQ4pjQvVF1t8TKVtXGTYATm7677RjYbG48zJ3bxXTxpMV2cV9TW7w6Hh
         cP7/w/VN3A/+5KoeQlod+kp0COrm9v0d6WlE/5Qy00TnKDFxsWNmx6ODhZyxJ6dhRhAM
         Y5yy18e0BH/qdPfyxUgjkkcmyHyJTUF8q3LLiXQhN0w5N8cujj/SpkvrmEsQn7FUBMAi
         fbHef/necwPLVOccw2clWPTxl9GZAT0WTerLlXjHRvP87YULrMVYQXyW2YtROS9ppB9u
         0KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YGG2EmCH3bS3wBtE1nLRsaoqlR5mpBzOgXAIcspF1i4=;
        b=pLxrKAJBRHRVayJ6eRYNs/8toqFEV/5sypulYuLv3uunl3sFyKgpviu5TZ67vPgu0U
         3rlUq5keWxsr+ckg2EdDzMJAp5IGQHsAx4IG0ANX1OJKLROrvyZSDFlyDGTSOulbtN9Z
         0FMzX55X73eGZXMP/JzLlrCc9EmJmqyIIza79K3FhtnKO/DunZEJqOhk4kCzCT+U8jrK
         pC2flFF99S2cPzwzKR5PrEH595UEuV1ud71ImhVqHwJK0uzeDaoeyOJuvs6z9Uz3plK9
         6NcsftUc7cWAzCh1px3Qn5FXSBUIDWgGABZlYohYa5hQ8+XE9nNu1B0UPv0/j+Ja+W0u
         ZQww==
X-Gm-Message-State: AJIora/CzIThYgJBQ1cGZL8Ew7dmPI888wUgKu5wf0AA40v0ka/g/e8E
	pUhTb+1bIR1SItzPeO1vzZ7Oqw==
X-Google-Smtp-Source: AGRyM1sjYIxbnzkQfm9NykntHg4tQ/OMvY4AkQJhXhbKqdP/B68eLxAg+9nBCXyPn7z1aachpSTFmA==
X-Received: by 2002:a2e:8745:0:b0:25d:eba0:9e2e with SMTP id q5-20020a2e8745000000b0025deba09e2emr247240ljj.384.1658421523172;
        Thu, 21 Jul 2022 09:38:43 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id o6-20020a056512230600b00478fc420ea6sm400437lfu.244.2022.07.21.09.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 09:38:42 -0700 (PDT)
Message-ID: <3c781dd6-865f-e59b-17dd-c583e79ef152@linaro.org>
Date: Thu, 21 Jul 2022 18:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 0/7] MediaTek Helio X10 MT6795 - Clock drivers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220629110254.184213-1-angelogioacchino.delregno@collabora.com>
 <45ff2e82-caeb-9575-ce73-1bd43c37c0c5@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <45ff2e82-caeb-9575-ce73-1bd43c37c0c5@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_093847_312284_A4ECAB8D 
X-CRM114-Status: GOOD (  10.63  )
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

On 21/07/2022 10:53, AngeloGioacchino Del Regno wrote:
> Il 29/06/22 13:02, AngeloGioacchino Del Regno ha scritto:
>> In an effort to give some love to the apparently forgotten MT6795 SoC,
>> I am upstreaming more components that are necessary to support platforms
>> powered by this one apart from a simple boot to serial console.
>>
>> This (very big) series introduces system clock, multimedia clock drivers
>> (including resets) for this SoC.
>>
>> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
>>
>> This series depends on, and can be merged on top of:
>> [1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=640122
>> [2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849
>>
> 
> Gentle ping for this series...
> ...I've got a lot of commits to send that depend on this one...
> 
> P.S.: The dependencies in [1] and [2] are already upstream.
> 

You sent this message to Rob (not to others) and you did not mention
whom are you pinging. Rob provided all necessary tags for you.

If you want to ping someone, put proper names in "To" but best - mention
by name.

Best regards,
Krzysztof

