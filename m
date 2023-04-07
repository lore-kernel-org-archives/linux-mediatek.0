Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCF0C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxVjcV3h63tndOVUPeb3nRlZ/9fXaEF82W2eqSGSLJI=; b=VTlAU51S7fjRoakZ1veo3rJYvt
	CON5iZ6Io0TYNA4c6gQPioE0N71DGlBjHPdOrRc+tzIFyBHwalPn80f7BBbiIh0TrsjTYl7S0ZVDJ
	/rKTRoB7YhMS8ku78iu4j+mEse+68qnFDQYLfVvAaI97f8X3aONktOwAydbidDbrxs02UNO4yy6GR
	7r2jCQ2qnB7NwW3omPG20RHcw3DAUQJ7S5VnqGqg5PiNYsp109zH5Bf2IaumfInjXvYvahDMs4zZ+
	gL0TzkP8wB4aK5euux8GItOgZ4TN2+dl6ema8QQWSht1EXi7oUf3tTKWypElbp5VXz+1omXwpIgsq
	0BVq6Wsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhew-009XEg-0a;
	Fri, 07 Apr 2023 08:41:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhet-009XCf-1x
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 08:41:24 +0000
Received: by mail-ej1-x62a.google.com with SMTP id jw24so6967694ejc.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680856877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxVjcV3h63tndOVUPeb3nRlZ/9fXaEF82W2eqSGSLJI=;
        b=R4vL4QJOQ1cGCQO9T+0MVXBYjYxyf3KITR1VUF58mYUadl7VF95KYHZJINZd5QZakD
         n2b4QtJK7tf5fCO0CLMqDPigIV+EeUaw5nWkiUGvlxWaNiWE1hM7D0YjT3IiCDzwkcX8
         B0etLIRNSDonqDBGouJ2pQ08lBrZ19FKu2duqQ5BHczRa29YbE9x4XBaUZ3ELfpef//0
         5Lu37rhrOoZmwtbaEL4UHQxzhhi4NTK9mYMBAIJLoZKaMYmE+6LXtQfPjVjdQz/ikk8e
         8ziZ6pfIlEOKjxd5uI5z8puNYCIuU/PepteNcmjWuxKNDqYTq1HuH+m35mH0ctedhStG
         am5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680856877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxVjcV3h63tndOVUPeb3nRlZ/9fXaEF82W2eqSGSLJI=;
        b=wOGHKKTY3uwRLbHQVOUHB0QCgiGBoIh7A1z33vOy2/c/NYUY2UaI9UxElyrLiJ/P9x
         pjdUhF/lpx9qtwa3prsK/7ooCP2oaUYoLlJjKzDP6R6VwP76nhvfX3uuwBqGBrKTukmK
         PW0yBC4oPefEZHvhs/9AaCcXaeebwxwUPpsKqmWzI+e83R1ev4OaNIiqA9smz1qoqCTr
         xNuAu2TNwtKPQaJjUDmzd5w95H6H9blOyyLEyDmodaRylyVue5T4SwkzGa+w6/1zYo8L
         ciZiBWSZEMRzOnXtljQFMu79wlcIOkpw+xIHGGLmGIttBKQb3OQu+CAaGsw6FtXKq0sU
         Ez5g==
X-Gm-Message-State: AAQBX9eR19g18HOLT6KIuxUPXMvRzEX2dSIKZqvRIe5xBqUuTFTnJb6J
	pekAX+1UfYB8+W+X35hPBYTi7w==
X-Google-Smtp-Source: AKy350bSWSwQScmsM/h8LpFJejXu9MfCeZuNuD/EyAwGkUUbUfkJUnsF4OXo/c1V7p+WZdaiDjNCQg==
X-Received: by 2002:a17:906:eec5:b0:906:4739:d73e with SMTP id wu5-20020a170906eec500b009064739d73emr9789990ejb.2.1680856876985;
        Fri, 07 Apr 2023 01:41:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:14a3:366:3172:3c37? ([2a02:810d:15c0:828:14a3:366:3172:3c37])
        by smtp.gmail.com with ESMTPSA id e13-20020a170906844d00b0090e0a4e1bacsm1814294ejy.159.2023.04.07.01.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 01:41:16 -0700 (PDT)
Message-ID: <796300c0-19e9-2c22-8385-1b33a92bf02f@linaro.org>
Date: Fri, 7 Apr 2023 10:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] memory: mtk-smi: mt8365: Add SMI Support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230407-smi-driver-v1-1-036d6d8e8993@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407-smi-driver-v1-1-036d6d8e8993@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_014123_645517_FC6EF328 
X-CRM114-Status: GOOD (  10.43  )
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

On 07/04/2023 10:39, Alexandre Mergnat wrote:
> Add MT8365 SMI common support.
> 
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> This serie add MT8365 SMI common driver support only because, to be
> bisectable and avoid issue, this driver change and the related change in
> the DTS should be applied in the right order (driver first).
> 
> Here the related DTS change: [1]

1. Where are the bindings? They always come with the driver.
2. Where is the changelog? What happened with requested changes? How a
review tag can appear on v1?


Best regards,
Krzysztof


