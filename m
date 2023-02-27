Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94D3C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmsXqGpstaDNW1rYeO8j3Cmpj7EBNxqayPxfTCKvPnk=; b=fgVR3GLghJWSvVPzvPtxKEax/4
	lWBlApp923glmS8wps8x7NfqabisZ5kTugKJTjhM0c8Rt2UJSs4Id3eVr60aYl9O8jXKrLh+LeBtU
	8e1/Hu6reaFMy7JiKFjNlOnONNAi7J+TcRQwGC4SY0SVQ+4vJJajw7MNaxKtv8Y2zXeYLMqMHEOyS
	+SBjyNwsvOHJpyi4HQfMbO6WTOHH3tT0wOxC3LC7Be5N1UUCHNepKSWz7h3Hz309XlkeJY+TKyaRJ
	QE60x8gKHgqeJ8EsrqopkjhXFcYizr+3wXlASb5TxqrrDR0EGfVBeB0t+J9s1JO72posAI5uPKep4
	p0sPBfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYiC-008mAi-Cr; Mon, 27 Feb 2023 08:18:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYi7-008m89-Oo
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 08:18:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id k37so3692235wms.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 00:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmsXqGpstaDNW1rYeO8j3Cmpj7EBNxqayPxfTCKvPnk=;
        b=uCy8R3eUrhut5ajrvRwfcweUpiEmd6SZUU1Q4SaIKe2z0F8/YXupCUZyXtyeTDbjLL
         S+hxrOlTRUkX8LteNyL4osBBaAXwovNwQLKXQiGtZzGojjWKx/an0lnnT2RzNSyH+UdR
         qoLka3mBKnQJduBih32Di4477u2bjhCFMt0rEWDtpOgNsR6CJRQWz/eFwD/n259ehJa/
         9ch27VJh/VIrLigFtlQHnPn7ZPcrJG5O3LTknywrPq2qP7//L9wHHOqN6DsFc8+i2O9q
         QtWu36dlkSXnkj0RQH2Lvhs/GG7lNuXsxF6lsP+cYQ8/iUg+y5lntSodutq5nE+mtjIE
         FMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmsXqGpstaDNW1rYeO8j3Cmpj7EBNxqayPxfTCKvPnk=;
        b=0tkKr8zEN9Bw2qIwm2pKkIQAxaic4qXYODHUbg6Gb/1/5WeojdzqepSxXNL2feWFCT
         cqhOxw6a5Uejp4ih6g8vZf3HFovCksV9eEgDjetJNBGa+q8VvYgbFeiy/ZQlec3ZSLPx
         hFJORAA/rahwGucvwVx9sxvq+WF7PzZEq40ApAMVpNlue4ZHb3eVzxqwfUdYh1GIBfsH
         Ee9yUMCGd140hrQz4NTJv3XfqQFzZm/AE3w0LleRVU/p41GJip0KVb3uYukU3Lldqs0l
         /q3PaCsqhwPzqbvYn4x1SI2O2QhRFrtlFdQW+/ymVDvdpk8YhlfUTSRbPuUsh5oO/h/Q
         GVaQ==
X-Gm-Message-State: AO0yUKXlCbpyctPAHTMgYwo7mAjNC98ZcnSRHAMxs5oOiX9sjqB/qQRo
	Kzbj0mz1Y2JD+1XCE4SqAksk2w==
X-Google-Smtp-Source: AK7set9iwF1Of26EjPuUp+IirohBujP4YEwmcDqQ2+5/f3vTpYb09Hw40limy8H2jFYw55cq3FBGfQ==
X-Received: by 2002:a05:600c:1d09:b0:3ea:d611:f8 with SMTP id l9-20020a05600c1d0900b003ead61100f8mr10353121wms.38.1677485894351;
        Mon, 27 Feb 2023 00:18:14 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a4-20020adff7c4000000b002c4084d3472sm6322620wrq.58.2023.02.27.00.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:18:14 -0800 (PST)
Message-ID: <49ec87c5-5f02-ae07-464b-3b9d22c5a6d7@linaro.org>
Date: Mon, 27 Feb 2023 09:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/4] dt-bindings: arm: mediatek: Add MT6735 clock
 controller compatibles
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Daniel Golle
 <daniel@makrotopia.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>
References: <20230225094246.261697-1-y.oudjana@protonmail.com>
 <20230225094246.261697-4-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230225094246.261697-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_001815_846726_D097D7F3 
X-CRM114-Status: GOOD (  13.78  )
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

On 25/02/2023 10:42, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add compatible strings for MT6735 apmixedsys, topckgen, infracfg
> and pericfg.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/arm/mediatek/mediatek,infracfg.yaml          | 8 +++++---
>  .../bindings/arm/mediatek/mediatek,pericfg.yaml           | 1 +
>  .../devicetree/bindings/clock/mediatek,apmixedsys.yaml    | 4 +++-
>  .../devicetree/bindings/clock/mediatek,topckgen.yaml      | 4 +++-
>  4 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> index e997635e4fe4..715e24a4ddda 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml

All the previous patches should be squashed here. There is no reason to
split adding new binding for clock into two separate patches. It is
still one new binding for clock.



Best regards,
Krzysztof


