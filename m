Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD60C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4tm25fNnIaWemUx2VahelluE6ctKtlhrepqAnkCCss=; b=t293+hOx9zlXEmFUx2c+Vttpgf
	NgmGVq+TJy1/Fn2LNaQ4JqZ4fHhFAjhb8xvU01K8vuTFzmwZHr/TshHSYiS2c8d5mfEsQ03B7SDNg
	aI9P9nq13nLXr5AMcQfAYKTa0SY3+k4ClBhGm6wFimhn5wt8R7cu1H3ltpplQFVkJ1/cBj6aM+xfg
	snaLRINCCjAmyzpejVprFonG7Q6KnmZKft/pbVYIKWWryKG0HO37uvdT2IF8e88nILBFxhdZYigTu
	hQKhXLPBMMIkojso5iJ6obI/chEcFkMEOqzKGytT1TxqSEG6rfd4w2pjfLJgxxug7h0OxcqSYw/JK
	AVixF6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYH0-00Dhdb-8S; Fri, 10 Mar 2023 08:38:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYGi-00DhTy-EY
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:38:29 +0000
Received: by mail-ed1-x534.google.com with SMTP id i34so17373388eda.7
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t4tm25fNnIaWemUx2VahelluE6ctKtlhrepqAnkCCss=;
        b=nmxtg+WHsmkV971tCViPa6+CimQStML5lIgnFi5wEyq3kb6St6+KLSZ/wsAY0gRoeC
         dgr9I2aXQx/Xna6OWEu0t99p0Xi9yA88yqa9G08FetK/cx5sWLyAA8orpezlPTMBPjE/
         qQiF6fj2hRGEkC7mvsU8frgcv3ND1XCksO+7nqpcZ/KHmutRWnoT1u8NndkTcUnZ3xPU
         hhIrSbS+5ftmrK5B7BJNrMIUH8lyrJOzJSOZQrPq9qLp1EDEEQQkhd5myR4hUUcbsyeI
         dwXElMqmT83g6OAj6Y6KXvo3DgXaXRoW7KG7kJjjZggAKANTLBKot24E1Hc4jGinAOas
         +NxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t4tm25fNnIaWemUx2VahelluE6ctKtlhrepqAnkCCss=;
        b=dB7kxdsJ2jZZPxB/18MVwglgY7k14RzsT2trYpNK4tTZ7qL1qDgf/GYmnCXj85E1PH
         sPpHbbQrnRnJY3j5+xMdx6hJ8YBK1i4KAm1zC6OM1otrtImXmYkSKpcgZfXREBe2cJqX
         l72uLh6xcW/TAeeUcALuPHTt8lzqC2v9fLF+AFjQoDc8KhxmY4NMRt/4QyfO54vvC7Fi
         S8zoxIUrJ0TOUFTWx6jZ/5TB3flZOHFynDEcu36XBWjQ7sPj4Rw/bhtWT3OjXDViJKnj
         tgk4m21lT7Kqm7Tjdzf2TMJYp2JnL2fjvtJOvEsBknXllQlJ7lCky1ktBpp1VBCJnOfL
         o1Tg==
X-Gm-Message-State: AO0yUKUl2bV4DKo5kTkCVEXABmR2b2C9q1OUnrT9PGzerZlQEYWL05xv
	78S2QMmLV0RncTMPkb0Dm98x+A==
X-Google-Smtp-Source: AK7set/ljQXMn96k9aYajnipD3ShYXrnZo/eORj2bw7NOnFHEK9rIgYt7AS2Vqef+Ys9xbd2oOv3vA==
X-Received: by 2002:a17:906:fe07:b0:879:ab3:93d1 with SMTP id wy7-20020a170906fe0700b008790ab393d1mr35150385ejb.4.1678437507151;
        Fri, 10 Mar 2023 00:38:27 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id dt22-20020a170906b79600b008d47cd2edfbsm682617ejb.60.2023.03.10.00.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:38:26 -0800 (PST)
Message-ID: <72543074-02e9-23f3-7963-62e23eae1e1a@linaro.org>
Date: Fri, 10 Mar 2023 09:38:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/21] dt-bindings: display: mediatek: ovl: add binding
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
 <20230220-display-v1-9-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-9-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003828_537160_6AA1C03E 
X-CRM114-Status: UNSURE (   7.58  )
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
> Display Overlay for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8192 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


