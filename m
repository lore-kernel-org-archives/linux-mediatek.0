Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E857EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52mNZ5NlQdO30lUKqzJP0EsYifT5Awt2SM2gJLbTQfs=; b=1ormYUrtoMmTvhGVbWZCUYF2bQ
	lRvVTOmQ32DDlQ942f3hoET3fE1tIjt0b7OKmUjQH4OX0aqvS1BE3jnalwuAdmiSK+krqOBySCF+R
	k2xZQvRd3gV5IPtf/z/3fzp4dL9VJzaP638ezNOl9TNI62iItGriL4P4QNEysbbBX7KMSWdrlIdjr
	zTIDEZ4isAalvWkdyu1FlfkF1cWJkMOA+ui2y9fjZC2K70fWA7mZyTYzhhkTGFnQIyRq33sMVdbRS
	5YkrTXlsqjwbINkek5HKjR0Xaz+xhfnIkGmNzzpa7tRQELQvTX2FR4jpudW8m/g4Vy4KlFkAw8QpN
	OdkIFQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdYE-0004IL-0m;
	Mon, 11 Sep 2023 09:49:50 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdYB-0004Gg-0V
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 09:49:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31c8321c48fso3403716f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425782; x=1695030582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52mNZ5NlQdO30lUKqzJP0EsYifT5Awt2SM2gJLbTQfs=;
        b=ONJX2pzxmGu71+CeBhRoyMRjk/EDYIzRnInDRyrZEk3tYZ26IDoD9GCAqSEixGqQup
         1/tUyUK8gi7fPtsJWVOi3GK/ZF46OJIX41xmbkrafjp4E1F5Lmo6w3QNS/IN4sB/ptMO
         HHS129XT1jsTvfcyPT8m6jHpNlzcpSguOmcPjc6JAtCRQ7RUhHcyTlhny2zQTTfiucbA
         nz/jMqVAA9OvzDxuKtE92C39dKQyCN2rLYTWWX4XNyfTIGx5wsH2OPoEPUp6e5dsJYkE
         wAN06RiY+MxDCr9Hh2amESjOjSpfhuHCDHjuqIUpkcYVFkh7cIcvEBE4wxOGdBdMEhCA
         Qpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425782; x=1695030582;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52mNZ5NlQdO30lUKqzJP0EsYifT5Awt2SM2gJLbTQfs=;
        b=c7V8EgT9QIq1aUaDopjn26WoMHDXUWXKKqabo5wbzSoKPd2MewdlyhYZVuNHS4QSlS
         S7yyIZPF++ZxiRXjCjVtB0vWR4ENcZX1lj6mZdvOZs/lLXECWKb2LhNgUx0ruVtYY4vM
         UM/8GbQN1BHyO2sWNQ+o95y4WGRx2+SiQbNmO0+t2qgcZUBxqzC4NlaOG/OfBsfKvYv1
         vRo870Da/qNqkUFZgPti79anEfC8ERopA1TWdq3Qm8reUknHJ1Oog2YHQiGvDwpeKdXr
         t6clAIJ3b9ATzsHZQ1TgG9KIjQnymb7qLV3/gN4Lmk7nD4cln0orgWkoHofwnfz0nC3V
         UuwQ==
X-Gm-Message-State: AOJu0YwlaIdzxrCfLBJSMtRSCaR+YGTjP5hVlGzNE9sOB1EPBxD8Bn5o
	eOCBCKKIAcoBq18jemETsJn68Q==
X-Google-Smtp-Source: AGHT+IGPQ0Wdf1DDEIFakB1U1w5I/QQ08GV9TuR4tNS2Sz0KeCGoCbjRcpYN6Mj1gI9j1EOMWwNYlw==
X-Received: by 2002:adf:cf02:0:b0:30e:56b3:60fe with SMTP id o2-20020adfcf02000000b0030e56b360femr6104736wrj.4.1694425782666;
        Mon, 11 Sep 2023 02:49:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4c82000000b0031aca6cc69csm9574308wrs.2.2023.09.11.02.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 02:49:42 -0700 (PDT)
Message-ID: <9959a8b3-6fc7-6de2-fc2e-d5e8ebfefc34@linaro.org>
Date: Mon, 11 Sep 2023 11:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: arm64: dts: mediatek: add description for
 mt8365-evk board
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230910062852.15415-1-macpaul.lin@mediatek.com>
 <f8864242-daa1-e72f-4759-aac3fa1bbcf2@linaro.org>
In-Reply-To: <f8864242-daa1-e72f-4759-aac3fa1bbcf2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024947_197379_8084A20E 
X-CRM114-Status: UNSURE (   8.93  )
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

On 10/09/2023 11:09, Krzysztof Kozlowski wrote:
> On 10/09/2023 08:28, Macpaul Lin wrote:
>> Fix the missing description for Mediatek mt8365-evk board.
>>
>> Fixes: 4f5fc078ac6f ("dt-bindings: arm64: dts: mediatek: Add mt8365-evk board")
> 
> There is no bug here. Drop.

So you decided to ignore this one?

Best regards,
Krzysztof


