Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D1C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jY19RBdXGErSuK96SQ9CO/VfqzR61PSiwucTWNRVDbE=; b=E7gpnakbH3ae/K9xtHahyK7tKP
	G91bO/ocrpUfpzK8FYlYbL6b5D/ogRlt7zIw3c6qh1g4n18HhJJgbN+piwtbbtZAeX96A4av2m0Fn
	SQJoTuGS5wCKpzJeKEVqp9QFx0q1z5uPuL9izrVaFd6TeoWDRacxx3Bt7yU/V/4PFCdjbS0PuFS6S
	RzgU232H/uu6a302K9Apn0UDLGsu1GiNv/XSIwvZtSWnY5poNhMlnaG8QPAtnJuSGccE2Q+lhvZKY
	hgOcwyjbos13g8VplcjXBXkj4XdMXcnhJdL9pnWk6jOrR2Ck6IBbiQY3+W5CxIiVa8FnH+PUc3uzY
	cBsBPHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYKQ-00DjWH-Kt; Fri, 10 Mar 2023 08:42:18 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYK4-00DjKw-Hg
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:41:58 +0000
Received: by mail-ed1-x532.google.com with SMTP id j11so17459701edq.4
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jY19RBdXGErSuK96SQ9CO/VfqzR61PSiwucTWNRVDbE=;
        b=ZdR6O1tBpHF+lilFpQQlvhYUaj1uscCMv151wALtJiKxx7nhMroGk7Zx2dHnMxKrHy
         UBAiF40+9XQLG7M5KcFaMhqxRjOdmpJvsgHFOXkNg+MgU8aGx8qWtNy9Qn3/8E4o4TF6
         mbeqrU7JwF0dVu2x6LVeN2wbGOkHfYwdvH2eS8RZwUyYbxkoTh0aziit6x9MCaerboWJ
         K5iMFTV4m96ZEdgcv/OagZ5f9ZKR9pUjcSiLywCJcIQthGgrnbxDQ2IwcUBv4D3qfNRx
         0iCsNZifm1/3Ej2552eb7fjQv/mbyIUpOsDK/UxUnoNQlJlEd30jLxn8KKAEiUCvCzCs
         5BoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jY19RBdXGErSuK96SQ9CO/VfqzR61PSiwucTWNRVDbE=;
        b=YC2IBXQxpvLYMm18wP/qduu31uyioTPMG8Ux0U4KzmCdezScr6os7l4LAf3JcyHuN5
         5n81NbYRs/9zgMMilvqq0dJzx75ZJ7MxavJiijTlRpn2O9F+fzuhAJt+c/FZgJSLLaUF
         S7yMFtZZgMbL0RaqFTecUTxV/gfwudg36HmW0myawY4R/eKc2xNdN2cqhAOj1DrOeHf8
         Yiry2mQ5vZOJeEu1HIE27/3KhjrluNKFs96wdfQiZKf16eFMpIJT+Rg+fYby4t+P13PE
         A/08pGroeDUOfW6ZK/mQzBvbLdY3EAY0TfHvirnVhrhi27XArnrJgk1akbsnQ9UKkvVV
         BQWA==
X-Gm-Message-State: AO0yUKXZKujCRBbvIim2H1pY5mSheojCeVTCf3Bq0uA5De6oO4dfphMo
	MHFEocOmkynVzJzsIu3x15vqYQ==
X-Google-Smtp-Source: AK7set/wf4w9jzDPoANKQB4e+0Ofo51LjennRsoVP/tsxVTpy93y5J3W+5W5VhClHpcVl0kpfmkn7A==
X-Received: by 2002:a17:906:9c8b:b0:8b1:76dd:f5ef with SMTP id fj11-20020a1709069c8b00b008b176ddf5efmr25974741ejc.5.1678437713153;
        Fri, 10 Mar 2023 00:41:53 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id m9-20020a170906720900b008b133f9b33dsm665646ejk.169.2023.03.10.00.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:41:52 -0800 (PST)
Message-ID: <02174928-2071-512a-3cc6-d24bcc75cc32@linaro.org>
Date: Fri, 10 Mar 2023 09:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/21] dt-bindings: display: mediatek: aal: add binding
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
 <20230220-display-v1-1-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-1-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_004156_653012_FFB19C45 
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
> Display Adaptive Ambient Light for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


