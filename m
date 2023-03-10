Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF40BC6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jX9C5jsC1gif4BoDiLkwtHT3RghH5PN+LBKh8t0wrg=; b=WMmygahnl+IKAUQZ+OVsBobRsl
	/jLEGD7340pQaNJJLH4dUtPDh46QRexeAv8uw3Ubt6Q/EWmCjwp6WAgpKldCOo9oH6eizpeWN9+Rn
	+XUzIGfCSsQVQ4LGk8Vhn7Pb+0B1bVdTOeLInyrVsoRkviYZWpcg4PqvxZuzp4Sbg1UJBfPpkUCxe
	Ky1chfP+T1rEF9rLpOSZzve+wrGSR3r8ddO8c+LvPGHDQt80yC5cw0IkAoAXFUY6rXoVc0dW8PN90
	/w9IT4Fy8MTtmmagQmgLk81fX/R0Hy00y45r8OvrUrymSpBjzfGUroxa1xJePtvX1LvLZqbEsQYdi
	S/5bOZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYHO-00DhrM-VV; Fri, 10 Mar 2023 08:39:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYGn-00DhMe-Hf
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:38:34 +0000
Received: by mail-ed1-x52a.google.com with SMTP id a25so17579933edb.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jX9C5jsC1gif4BoDiLkwtHT3RghH5PN+LBKh8t0wrg=;
        b=H4fQ7akqxIUQoaNTb9Z4JkcxVGx/bU51xZWjMh9utqF6N1ScpXGX/Y7B4b2C4y3B8b
         1uJPBbYC2c2YUS2GiJLOioYm6G6CPJI1ITJLrSU9I29w+1L/GUpNh2SRzhsj7NG+uFRk
         GvuIo/nk+w2M+2qg8loXiWlOUIiWhi6B4fv2uzaDSSj1XlmSeQCg6QVszBPLWvlvwvjr
         P+N+MDsGYbMW4r0//DEhFvj48XikhdRigGPvnBjVnpglazhH8bmz2GSr5ZS6B36iN+6e
         wfxBsQWkUG1D2ttnZe5O5xtk89yHTtINLvAp5MbYt46wDZhcYuZvd8L88YFLjcKkiKJi
         gUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jX9C5jsC1gif4BoDiLkwtHT3RghH5PN+LBKh8t0wrg=;
        b=WbBhT2Jp+IlXCxjYzeVHD785MTe/kNRB9d5DGdBLOHzWOu7A+qZIv0dMFmYx/rVAhj
         NB/6dG7Hwen//dDBcMsVc+hY6m0dosA/uqaiGvYHd/kaEyYTkCXmxlaNZ6I8o6riqXie
         Mqgbh0/tclAHG1L1nc63gBcaenG3+GVAbZFgnedCRTh2VmGJMLct0f7QkOqFziDcgB8P
         t3Kc/l0HQU6gUOfkfQynlHyhMfCf7I718/MOicpdnVxGK82Ci6Auf1tIlK5kPA1RrN4h
         YwJnuHk4iLMLaCAqK9My1tzSaC7d801HZg9+mMQrcQ1C0XYwGtvWvMDct/N8g81FqIyZ
         UZ8Q==
X-Gm-Message-State: AO0yUKU3Xfz6onGMGGfqf/FctR499nzIAfmTKGr2G2kdYkW8KalWld7U
	vUXr+p0gNUJ9tFS0vf40Dfz7fQ==
X-Google-Smtp-Source: AK7set+gioboWv9qQuHDDci4UGzpTiLbVncpzdW857S5/NDplZRpEN/ZSe4nXeBw8pldZ2o3ycauOQ==
X-Received: by 2002:a17:907:5ce:b0:8ae:6b88:e52d with SMTP id wg14-20020a17090705ce00b008ae6b88e52dmr904091ejb.7.1678437512905;
        Fri, 10 Mar 2023 00:38:32 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id n18-20020a170906b31200b00914001c91fcsm673989ejz.86.2023.03.10.00.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:38:32 -0800 (PST)
Message-ID: <7b8d8c5d-493c-0785-832d-954af502fced@linaro.org>
Date: Fri, 10 Mar 2023 09:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 10/21] dt-bindings: display: mediatek: rdma: add binding
 for MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-10-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-10-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003833_643044_35459B7E 
X-CRM114-Status: UNSURE (   7.39  )
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

On 09/03/2023 15:22, Alexandre Mergnat wrote:
> Display Data Path Read DMA for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


