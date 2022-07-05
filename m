Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE2EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIzEHTMWqMh7JsF86YeS7gqjx9Ex2PSiuvOi5ol8xjk=; b=DkoNdF7hv6sYNKaJ15T+81NMQg
	nP48gtGmGQ1lkrjabK8jk82BoCb8A6Q6zQkTD4+sO1bGQWT2EvdE5ok+r/QSx+lgei5a1+jqs+Lyw
	IuO4bOOYlvHx8eSe01rYn8oDajK+gEkvmJWY86Izzyc2trlPacwhBhNHYPfVDy2+YcZaUdvXRO1ko
	gP/eKT10WwLO+k7tQZHUWvma1LUO5X7zO2ANezHcE/Ls0i7Y4gen9gklQS6RDMQZ9VDPtFtGDhCVF
	Hrp2DYy3hF06u+82dA3RcZfYl8N2xSmnmjepEsHfvRe27qeOpOuWYp0qIrJmPsk7LizVq98DC4v1U
	cRFVHtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8flQ-00H9Lf-6L; Tue, 05 Jul 2022 10:26:40 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8flG-00H9JN-1T
	for linux-mediatek@lists.infradead.org; Tue, 05 Jul 2022 10:26:31 +0000
Received: by mail-lf1-x135.google.com with SMTP id z25so2207598lfr.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Jul 2022 03:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BIzEHTMWqMh7JsF86YeS7gqjx9Ex2PSiuvOi5ol8xjk=;
        b=sMFMj7CXK1XsuWte1oAma6rsyq27aPmtCxtU6FeC8VfqtYAS5KTjYrQCrGr6B4vIPH
         5a5jTbE4nbUkUCn91mKUtP9nvSN2EZLQYrGm1MYrMsZPDvJPKKEZOUWBxb1HVp3fYWkK
         hamyrAqpY/mWxopUYXdW+26OQrntTFNvXd+iPeUoOxb8AMmAXVm4njnLRziD7Elkypht
         Nn6Y/XtWFz4pQVQ0ftTqkQtSwGXIpg22c2VdHR0ehl7kTVAAvuOLW2yl9cb2nW/ZrUY3
         4FzW6RE+prEbKcQSXk8fnzwVzWHzCetEVo0oBfUhbll8+UOHzU9CotOjIlrEAf6655Dx
         NEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BIzEHTMWqMh7JsF86YeS7gqjx9Ex2PSiuvOi5ol8xjk=;
        b=QP3Ubo6yA5dDkH3KduHp0qxpEG5p0CmDwbk5DJpRWvhMoFhWuhQL7hDPLGF8Hl6mOF
         c+tCO4nZEOGAzKu3Ijl0lateBpSxjqbmTsPKRE2KIMKDMF7HKSYYh9C4Fgv2MqHFpjMz
         m9sUwXLDehWOOrTHCJVIkuCqFCuZp+gV6/o8ezHzB2qSezRkHKU+OA9aygH2UgWck737
         wmaJbK0flzr2zpPQYyjZ8behovYWdZbrL0LH24DUE/CJthPwZfK2EUfo2lcxVkT9E51Y
         MWZq/8bWOoI/qXQ7Fwg1CJ3ByDADGyZUi9/txXptZv4m+AG4Pw0btVS3w9WEKmJTE8hw
         aA9g==
X-Gm-Message-State: AJIora+tDwU3KqbXz136NQg2ilvOn4DbH5UyTThK1GGgoDWnp4CwlZ+m
	pJNCxWRmGX/WNBJ1VoUyghxuUQ==
X-Google-Smtp-Source: AGRyM1t6IqLlcg8LuX6oAmvIUzLOIJmrgPsOzsC/K0XTtJFexn+sq4d9phu53nQL/NLa4MS0uwMHqQ==
X-Received: by 2002:a05:6512:22c4:b0:47f:93ff:9108 with SMTP id g4-20020a05651222c400b0047f93ff9108mr22317558lfu.74.1657016787233;
        Tue, 05 Jul 2022 03:26:27 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id u19-20020ac248b3000000b0047255d21190sm5615339lfg.191.2022.07.05.03.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:26:26 -0700 (PDT)
Message-ID: <0e6bd0c0-4c40-bc1d-c4fd-cd13d7036ae3@linaro.org>
Date: Tue, 5 Jul 2022 12:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: efuse: add support for
 mt8186
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lala Lin <lala.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220701103428.22099-1-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220701103428.22099-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_032630_107700_54C5F031 
X-CRM114-Status: UNSURE (   7.44  )
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

On 01/07/2022 12:34, Allen-KH Cheng wrote:
> Add compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

