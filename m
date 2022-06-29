Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D22CC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 11:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y26EqFL9g5dJmCSYo/uiI7QjtNL6pCpbp9EtOx0DV2k=; b=fWBkxkOgcFr+7lBnaw/PAHMG27
	ATgM/+N41qUMb2qOD03NblgPpWXBxJj/UjvodjONwW3SmnZ2P7J+ig94jvunQQE+QOPtnWjRVQPpC
	F6uIcN/ZRmrBfd+hwzWD9QzQ/h2RG24Z2Qa5rPwCrZEo3Y6Dt1DzaG7L9MjVsOmynVYzZ6Qp+z8m9
	xpXWkhGGfVqpRPQFefBY82+dFU8/j/wiGjpeVVhOjyQApJ8U5BdCcHKVAjgIeFtx4ms8PgpxQmX5K
	K1FlS81Cx+tHZ6sp45ezRkxSmvH+XevZb6IYkIvYkxLd6+4vTecLjqvHBS8LuFWpzZ3OMyJsVWpHl
	acK+WGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W9k-00BZ5K-BS; Wed, 29 Jun 2022 11:46:52 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W9f-00BZ18-7y
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 11:46:48 +0000
Received: by mail-ej1-x62c.google.com with SMTP id fw3so4378080ejc.10
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jun 2022 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=y26EqFL9g5dJmCSYo/uiI7QjtNL6pCpbp9EtOx0DV2k=;
        b=Xs0iqTshoHumfeIOWL/pDmURrLeeZH6zhilSdxZPMQdL1VsBFaBZ2wS2NtClKado9J
         IJajaGH+wiNLsgGnkXvQwQ0Q1DQ46NgL+wJj3hRda9LnjJ8WFE9/UKVAL6Z+F/RkLwKT
         95cJIPkbww0uqMXiEs67n2yHsbvHTG0Gw6KqqZ3mLdCPjoBT4sijYCR7gLfQxGBkc2Co
         oYpTxnKiBv/RueGhSE4FGYytFwr8hUKxGIxmvBnReaURlfYKdO8ZxR8l/rA7P4KbIP4j
         UPB/E1T1cZP2VCttYrc1aDfknofasecBmLnRkD9k8RmFHHt5qjMz/g/a4mps+oMmzoTF
         sAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=y26EqFL9g5dJmCSYo/uiI7QjtNL6pCpbp9EtOx0DV2k=;
        b=Dd5TALJG3KPxD7KPfpmJZ+0vjA0vBzg4uFomPAlljuRp4K+LnAX/JMjAhmjEGOMdwI
         aCtMl3WT/56ZOWWDocQGqEznWDcFIa3BF3wvVxFsajy+CXFRGqTCMEPWr5DMv2bY66o+
         cZ4X0oUqWV/sLjeCkcTi/9Aw6tq7k9i4xGHWdf+w7Y9HPmnf3hleTTrpaohptCCwmnL8
         Y2UrpwzBniHF+Rx9Xvskb5Zi3sNNHVGV3j8CXBziMeewuvAw6hS5DbCNkO2RUXiH1W/D
         vuKE0J9bW0bviQfksqt3rvGFNvcS0PTzuspWXKq7rSXt6O7yNxpUc3aN9Sf1hlRSiqjW
         divw==
X-Gm-Message-State: AJIora9Gl+xg/Fe18qfVmnUuZ0lbXtsK27+ck70DUt+mudmgWd7IFyL8
	iHSt7b4mTide4p3GEsi8gOyfLA==
X-Google-Smtp-Source: AGRyM1uh2G3mI6ImWNz8iu33UFfTR01pMKRnSNrsb6NJV3DDngQMz4Q29Cs61ZqPiJ7yXvPUhJQicQ==
X-Received: by 2002:a17:906:6545:b0:722:7c99:1ad7 with SMTP id u5-20020a170906654500b007227c991ad7mr2906545ejn.325.1656503205568;
        Wed, 29 Jun 2022 04:46:45 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id cq12-20020a056402220c00b004356b8ad003sm11028134edb.60.2022.06.29.04.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 04:46:45 -0700 (PDT)
Message-ID: <bd98faab-a94b-17ad-fbaf-aafe5b882bdd@linaro.org>
Date: Wed, 29 Jun 2022 13:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: reset: mt8195: Add resets for PCIE
 controllers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org,
 chun-jie.chen@mediatek.com, miles.chen@mediatek.com,
 rex-bc.chen@mediatek.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220629105205.173471-1-angelogioacchino.delregno@collabora.com>
 <20220629105205.173471-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629105205.173471-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_044647_362708_C4E4778B 
X-CRM114-Status: UNSURE (   8.08  )
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

On 29/06/2022 12:52, AngeloGioacchino Del Regno wrote:
> Add the reset index for PCIe P0 and P1 (PCIe0, PCIe1) on MT8195.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/reset/mt8195-resets.h | 2 ++
>  1 file changed, 2 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

