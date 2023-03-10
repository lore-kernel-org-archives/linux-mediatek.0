Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72329C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mn1vLNX458kljHD+DHfjvMGt/le6hUqQgMBvdIhJEsY=; b=tkOLWrbjzkUiQZYd+9sIk/9HeA
	brVTaJX8VBeH5JpNcNuZ7VK7UyNT0oUMiC1IvmNTn4Lbe9vTOD94nJ6hwTnvwIVtW6o++1MyGXLTC
	HDSXwuWWuYgL0KHkFW5T2o7Z2z5HVwHc0VfYu6TW7qqBz6APWp51iWjYjN5jZ0sXpc2wh/mn9Gxri
	yWjlx+2Rx4975rGnETp129v5fMJqp5+BDCNBFh4b0KQQGS9eZEpEXB/8sfFFEWlA2pxJzqF56R6U6
	L/yKs8Q3asGWkrKe1JoZsm9la1Wgrv7JleSD1DazhJ1M/LwtnlL57oNS4b81OXRIvmQe/tq3LhtKg
	l+rlRxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYEZ-00DgWL-H5; Fri, 10 Mar 2023 08:36:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYEG-00DgKH-J9
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:35:57 +0000
Received: by mail-ed1-x52d.google.com with SMTP id j11so17400592edq.4
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mn1vLNX458kljHD+DHfjvMGt/le6hUqQgMBvdIhJEsY=;
        b=yRSFe7BvYv8hMAHXJ5/M6DA42nlT3ofi5LpTrmTGQbyGZXNYW/pN5FxD/7Ff+wkdOL
         uIUFfyL5W2t836jKHk11QHvarM59ZWADcKpc7Ektb8AMzpj9NlUf9Q9KRKsZbhey6l4m
         wwQgDjyXllRc+eA5ipo6kjojzkWoKilJIvdq5uU8erql+I4c6KI8O9b4UZ+g99ZYAZ0/
         URDnvz0c2J92xxkbheSnP3LIKX27MkRq8PjzN5tUMHTo5fpOdpVaMncSoYTfuyG0H/NL
         w0iKYcQWClqhTzPChCtCd9gL/HdanmcbfPdrFYSiXOMT3+po3Qff+FcTBnDFEA7tSSXS
         Dzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn1vLNX458kljHD+DHfjvMGt/le6hUqQgMBvdIhJEsY=;
        b=1LHeq5Opr1QTRW/POljponZVv4ihFIZUv8LPe9NU4pSjOruop4TottvgDrGh48MllW
         h2rTH2YhcGpoX/wFft/jL6sYTWLHPLRE+a7f66W486pE4t5izLX8GqveaC9viM5nVybC
         3DbZbZzrHXcbfqdMxqRNqf40diV6hlNVfrDRsma1N9Dgt4CC13Vs0/dzz4hNcFY1/aeI
         f0WoVQS3WBQZYOUD9mzo3vekZPCU+LAlWpKscG1DqqTvE0z6IhCHV69BpgDGx8HwtaXy
         +RTcUacGPTCZPyaB3Gky6D2Mork81Mn3XlrQg1UJtdQlcOHV5l/PP+iTJ6ALrraONBDH
         HK7Q==
X-Gm-Message-State: AO0yUKVjWJrr1WwdaQHyHVOJl5MmBK1CmSdww8STzogje6kydL5GMY0z
	NjuO9+MZMjbomJVTxabBFby0lA==
X-Google-Smtp-Source: AK7set+B8T3dy99CLujhhEDzNKkfET67hYpQvpYTs6C0Ur74VsFLFiujwxN190X58NvvhEJms9qBIA==
X-Received: by 2002:a17:906:dacd:b0:88d:ba89:1837 with SMTP id xi13-20020a170906dacd00b0088dba891837mr1006039ejb.8.1678437355374;
        Fri, 10 Mar 2023 00:35:55 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id z14-20020a170906240e00b008b1779ba3c1sm667385eja.115.2023.03.10.00.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:35:54 -0800 (PST)
Message-ID: <eef712f9-43c6-d6ba-3ad7-3aff7542bf27@linaro.org>
Date: Fri, 10 Mar 2023 09:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/21] dt-bindings: display: mediatek: dsi: add binding
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
 <20230220-display-v1-5-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-5-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003556_636399_F281C43E 
X-CRM114-Status: UNSURE (   9.42  )
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
> Display Serial Interface for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,dsi.yaml       | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


