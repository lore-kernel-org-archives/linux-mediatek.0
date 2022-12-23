Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081A4C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKAjt2iJj5kzIuD1ftaS1rKB66aNgi7BWJ7wJa8xL6o=; b=0JVQXOsqqXEx9yvjYk9dRW4c73
	m0TlnCAOag/ke35PzN/n/wPwcn8aeTGhjtNkhI+/qALRBTsNtt0GdOL/qKlIXbBcAXAX5jGxGKCQj
	4qEO7EwZdHsGx4AwEUGsMfCa6SFgMyaK5Xf0QUZeO1Ttbh7FMuhkfHDb9Xh3jxA7rwy360k97bBKI
	Ls64A9LcW0GulQX6zTIoMhpQvLGiQlbRns9N6r7Ry87E4ri3GebIKw22otDtyMJsaPF4BHiypQkCr
	vQj1+46tLaRUcGKq2Lu4Gbi6bQpWb7MCKR0IlbNhQLCjw9LV2NfTuTlQx2tBUGVkVPoHtq2EGNQ/l
	peAdYKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8drg-005RF3-GT; Fri, 23 Dec 2022 08:57:16 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8dnU-005OiL-SH
	for linux-mediatek@lists.infradead.org; Fri, 23 Dec 2022 08:52:59 +0000
Received: by mail-lf1-x129.google.com with SMTP id y25so6264276lfa.9
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Dec 2022 00:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKAjt2iJj5kzIuD1ftaS1rKB66aNgi7BWJ7wJa8xL6o=;
        b=q8gAbYsGWv03QrFQ+UDY/3L35Sn3/iO29JHWFi3224D1nLsT4hUG9IF/q6LqYPb+mJ
         h/uzrDV24+LiZvswjqUksjbuslDt5NMn43oHs9Qf0V6cHUHwD7YJVlKqDmRpjig/4L49
         dAT7JgiiNgohgl0rCZrtomAeNr68Vl66xq2UTHx79oeTSll4YVX/qfuzsjA2jiQwX3XD
         B9k4h8KO6gs+05NTD7bsWo1XyV9SDTKf2NpQMEYpDOzkDTHAARTk5WktkfQ/N4rB4ds5
         16N6fn8vrxPW7MEHNUXyKv5VFF9xrwrOej9s84n5/RP+6o0gSg7eNPrxPr3EkKXJMUHF
         BkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKAjt2iJj5kzIuD1ftaS1rKB66aNgi7BWJ7wJa8xL6o=;
        b=BDzH6sTGXqvibf9aW/eWpQKsShO+rkppwAyNn7utE/d5GXF/OvCIAQAPmAYGA3qoGU
         gR5Hu9bZegyHZp+dM2Vc8qwPXOCpfSxq85FTOi/c93hN3LoYAL/Q16LrolYZPBilA2b3
         9yMVf0Slr8MmRfFNFa+JSzjx+jqsBwuVJ16g1ntAGkJRs3favF13mheLs/VPiPiH5wh7
         iaIdL6PERnxfHSHLkEgQZSIZXRWAfAdqLBLbfzssXBWwaQx7aULOgJDIrENgKODuI21H
         WVXmOk0lsHg/PegHly4tgWQEgXVnxwpPJmA9Bm6bPMkLK+45l11VqWN6S7kfWJQ+f2nR
         P5eA==
X-Gm-Message-State: AFqh2krMTmbIF6rY6JY1d1SECXaCxOpbJG9q/jhv+brHo6xvfub8/Bsj
	zPjHGg2bCwBol6KkUHO+HCvmBQ==
X-Google-Smtp-Source: AMrXdXvBNZVygllcLaQKKB3jySv/Pl0JkRS0BFcl3+kOZGL7NEk0TxfKZBUG2rp2iydlJvHGAZ2eEw==
X-Received: by 2002:a19:5f58:0:b0:4bb:a49c:2f0c with SMTP id a24-20020a195f58000000b004bba49c2f0cmr2553409lfj.25.1671785575072;
        Fri, 23 Dec 2022 00:52:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k9-20020ac257c9000000b004947a12232bsm424901lfo.275.2022.12.23.00.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 00:52:54 -0800 (PST)
Message-ID: <869ae494-d74e-03a0-3622-b3a2b0b10470@linaro.org>
Date: Fri, 23 Dec 2022 09:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 08/25] dt-bindings: clock: mt8173: Add dummy clock ID
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org,
 johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com,
 chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com,
 nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org,
 daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com,
 pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
 ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
 <20221222114857.120060-9-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221222114857.120060-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_005257_656550_E89E9708 
X-CRM114-Status: UNSURE (   9.23  )
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

On 22/12/2022 12:48, AngeloGioacchino Del Regno wrote:
> Some old MediaTek clock drivers are starting the clock count (so, the
> clock ID) from one instead of zero and this is logically incorrect,
> as we should start from 0.
> During a cleanup an issue emerged due to that and the cleanest and
> shortest way to keep devicetree backwards compatibility while still
> performing the well deserved cleanup is to add a dummy clock where
> needed, with ID 0.

Unfortunately I do not understand at all why adding dummy (fake) ID
cleans anything here. Unifying IDs to start from 0 is not an argument on
DT bindings header IDs.

Best regards,
Krzysztof


