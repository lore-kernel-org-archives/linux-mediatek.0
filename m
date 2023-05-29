Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AE4C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo5a/JXM5eyW7F1q0/7SeqrmDEnGh/l3ApKPMD9Menw=; b=Vzel7wJWfH8g2FvS6PQH3QYJKh
	0j5n043J0m7RpKel+VyomNO4XEawG/0B1caLqfUSDdAmyiS9U126XUvSeKDiRJyzmrUCX0c26t9Xv
	6Ux+GpDCk5jZVqZz8+/RUvyV44KbzgydFg4iGSPphlbIAbNl+/ZoJ/RkVBvpBTOxs6Na4Psh2m23o
	97YIaMB22Gig8ZKLhrIii82c2hl4rksp9VdkO2OP9Sm/d/vldZ9Q58eT803JTeaG6fk6XRoQPyZL+
	YlCoA9P7pVKKihudn/1Sq9jJmof+PQv+OFUVDmQRUzydXMPb4R8Rne6F7A9S96yrLweDqmEOy5y0G
	n5n5LXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3f1E-00Axxy-2c;
	Mon, 29 May 2023 15:42:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3f1C-00Axwt-0X;
	Mon, 29 May 2023 15:42:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f60b3f32b4so21905405e9.1;
        Mon, 29 May 2023 08:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685374963; x=1687966963;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jo5a/JXM5eyW7F1q0/7SeqrmDEnGh/l3ApKPMD9Menw=;
        b=a9GXuJPJ1WwsWgUNonfxaq2F+J/b1NBIb60iy51Z522x3mLN3q1pu2zTaP5SkAbi85
         9bmzZF6Y1t0vtmLk4WNkYV8aOG1x3Vcbh6EhvdA7xqPY6gym6Sjho1uepWWseO25KyC0
         ujYqNu5v6CQ0PaW3wU4Fjw3Y7pAPJNITdWd8OQkFGOSOem3a0cgbm8KS2plJtuP1Elho
         ZUelxc7ueCj5vfCLuI6GOaVwzB3/bvpb/OGd68KTg/Wo6XHyFc71vJKTacYKZN0Vnsw5
         FuvJyMNfOl4ZVptsWiCJTdc1XFYGEArY/JSSYlna3ZXaNrDg8vsj2wyV/8Spl25H2HnO
         xFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685374963; x=1687966963;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo5a/JXM5eyW7F1q0/7SeqrmDEnGh/l3ApKPMD9Menw=;
        b=VMv4isqj7FkZPQJXJgZtgepc7FLbcvcERgi9hKVhpJoO+n0WGVVw0RZkaUp9Hw05y5
         vEk5UHy6QmPNdn3l27D6RIrArt8oNonsUi+pO2frvBxq7hr5coZkGlrIGDfv15qiB4b7
         iuM8c1MSq/fa9LyIXAgnbLXiLqpCehvw5ekzF69IrLQDaRhzw0IDXU8F+TuigY5Pu3mW
         Kyi5H9RQGnrJ2nuhoFvJnv2ox1bCLFF5fDpg6go7Xmspm/4ool4YhYN5NwxnWkCRbNJB
         bteuR23EYuQI2ip4HQLLNX1lT1c9b7ghRBNsqPHFKvL3f+mKWgiCx1vjjYBIrqXwTbA2
         DliA==
X-Gm-Message-State: AC+VfDyIZ/YKa4MShGw+3+9KOUHWBqG7I6oDKn71XXpTLSSXh2cFi8XN
	iObgeU5XvMKdHulyFwW8cxU=
X-Google-Smtp-Source: ACHHUZ44sfIsfx0Za8jPqM0u7GQcawEC5lcy0s9b1DixpfISlRFlYpxslgFy1XaCY3F/xqRBrpjuTg==
X-Received: by 2002:a7b:c7d0:0:b0:3f6:f152:1183 with SMTP id z16-20020a7bc7d0000000b003f6f1521183mr10002428wmk.37.1685374963211;
        Mon, 29 May 2023 08:42:43 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t7-20020a7bc3c7000000b003f6132f95e6sm18176715wmj.35.2023.05.29.08.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 08:42:42 -0700 (PDT)
Message-ID: <89e05581-be6e-409b-c4ba-c35297045af6@gmail.com>
Date: Mon, 29 May 2023 17:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] arm64: dts: mediatek: add missing cache properties
Content-Language: en-US, ca-ES, es-ES
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230421223157.115367-1-krzysztof.kozlowski@linaro.org>
 <5590f51a-16b6-93ae-d8a0-ab6b4e2e1016@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <5590f51a-16b6-93ae-d8a0-ab6b4e2e1016@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_084246_210280_64E1EF81 
X-CRM114-Status: GOOD (  10.73  )
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



On 16/05/2023 18:32, Krzysztof Kozlowski wrote:
> On 22/04/2023 00:31, Krzysztof Kozlowski wrote:
>> As all level 2 and level 3 caches are unified, add required
>> cache-unified properties to fix warnings like:
>>
>>    mt7622-rfb1.dtb: l2-cache: 'cache-unified' is a required property
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
> 
> Hi Matthias,
> 
> Could you grab this one?
> 

Applied now, thanks!

