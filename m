Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1781C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsW3cnQpkFobawAQ7KjeQDh+HS+MtSdRuN5mmJGO6qY=; b=m3mQANfWGQNPR4HLazPxbbMbAH
	ETuZfRAH4hSLZiGXIMIu+tMulqWXVmLUJbLm1MgsK91Kd7yrKcToS6Q+t2X5X25w9fYEzgZmm5HdC
	TZBxLF3pdb3dNTBUkgDHaAc49MuHJC9qMqOKiXrfg6rEZZ3fA6wp62bGpbSn3paCOBfIYhH2/mzMb
	uz7oIh+ZZILdj3YyattcPnKx0lHRB8+k/JlLD/Qwnxv7zaN2wok8MQDsXeyfi+enuuqh12M0EsNvx
	wR7ACcNCaR+5TRKMwGOnFk0zhJsfOKF513ANCTSNtxGTl/oT0ZxZLxE1WeoRJatqiUDBoWmzmr1C+
	QNvrzR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYj2-008maJ-KM; Mon, 27 Feb 2023 08:19:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYih-008mP4-Fj
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 08:18:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bv17so5236184wrb.5
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsW3cnQpkFobawAQ7KjeQDh+HS+MtSdRuN5mmJGO6qY=;
        b=AvK6jRRFSOt+n1ffk6vJiwQQbHRxm6AsUV4wS/6KkGBvs66zYKTlWus5yEfviTpYj6
         kJZmRRJHnVEhrYd6U5vOfL2OeeA6L8yxahgkOTypIndNySrIRwma+cFKU4gdmqzHhtba
         AQcZ53uLv8cR3wDcLmBxCw5q0AtqAd0sCWemgcLoCq4qw8Cw0mUwx5Gy9pampSN+hYwC
         KIErNwb/4X4n3mqxYKRlJBiKDTV9UAJu4J8qi0WnWHk1FBcdWeNCBk+UP1Wepv8rjP0A
         EYJlb3YLIayqD4oRkMCTU9DAcFg1tIWEZ9aLHKyexcBQNMxSW3WJEy8yrn+8KO2GG5Ig
         mpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsW3cnQpkFobawAQ7KjeQDh+HS+MtSdRuN5mmJGO6qY=;
        b=hIL0PkZYdBYK0gDM6Voy4J1coDcVZgETvSPWhYrparx2pIGaePMuvqNlZtK2MbRFmo
         6EtvRPgPlj7+ygz8CrzEzVOjTou4FKhHWgr0rtHwkmRL0E/H2QB3a4PH7aW1xeIBTHtW
         IsoKPm7vmuQr9SDviS2LVzj6+Houh1/SwYdEbhe+YhL3CdTAtub7y5iWHubojRLtxRY8
         7mN+/oeXEGNhrinVyJEk4l36nmuODtBhxmTbX9YtILHq4ba2hhOxqgfkAwfRwzK1B6ee
         ZdhmVmrWLyD0Ik1dVxqRJzSbYDEhuW81i7Jgbo22N2/G6eqgX92skQeCsGEkv7m2Knkc
         q21g==
X-Gm-Message-State: AO0yUKX/6DoSrsZ0mu76OJJZmlzaNorxcTvpZwx9mEMsc9mlCTcjdBDL
	943y0IL91BkWngp+i1hCQjZMiw==
X-Google-Smtp-Source: AK7set8ztKjRC0ujf94Tndq6Vka4BGloWzDiY0mYTjekowUIvGqF2ZicFqfLVVh6E3awOAZNvHwYrQ==
X-Received: by 2002:a5d:6d0b:0:b0:2c5:68a9:843f with SMTP id e11-20020a5d6d0b000000b002c568a9843fmr6963601wrq.4.1677485927974;
        Mon, 27 Feb 2023 00:18:47 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i12-20020adfefcc000000b002c54f4d0f71sm6314277wrp.38.2023.02.27.00.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:18:47 -0800 (PST)
Message-ID: <52d479ff-14c6-b65d-952b-e7753fee2dea@linaro.org>
Date: Mon, 27 Feb 2023 09:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add MediaTek MT6735 clock
 bindings
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
 <20230225094246.261697-2-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230225094246.261697-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_001851_568109_8160A59E 
X-CRM114-Status: GOOD (  10.09  )
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
> Add clock definitions for the main clock controllers of MT6735 (apmixedsys,
> topckgen, infracfg and pericfg).
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  MAINTAINERS                                   | 10 +++
>  .../clock/mediatek,mt6735-apmixedsys.h        | 16 ++++
>  .../clock/mediatek,mt6735-infracfg.h          | 25 ++++++
>  .../clock/mediatek,mt6735-pericfg.h           | 37 +++++++++
>  .../clock/mediatek,mt6735-topckgen.h          | 79 +++++++++++++++++++
>  5 files changed, 167 insertions(+)

You should squash it with other part of binding. What is the reason
behind splitting one binding into three patches?

Best regards,
Krzysztof


