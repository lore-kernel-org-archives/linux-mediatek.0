Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09CEC6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8P0RjPPjJ6gDx/O+UOt7XYuZJFBYo2c+dJvtzrcfc8=; b=qFJFFCJ2Cj0gvDtXdOPfE2Zw6x
	yhgLX2wLZBLaFrt14h3wFDRNywXYETuU319R/KLAJkRW7dlO0jsSLbB/+eZV8VEZb3yDxyfbA34MZ
	7sOzmKhJ8UmSGjEx926a25ER3KlTqiF6AE8yUmHySHVtTs6h5fUEWcPv9kcOob2nsE0MvzuMnS7Md
	D0nQKRIHDOmJoEvO5hkzugryXWtgEpsV0mNeL0jGsI4+m9RqJUbYiOsU/bdWS+bsJkvkGHrCFaDVh
	EFxhwSSRP5SrKJoaF3d9Uh4vvcCRmx/VjC/xUPHVi8Rhk6/FCQ8G12LLecYNmaLYD5Hdp7UVZw5DB
	c7FctCQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYGy-00Dhcy-PF; Fri, 10 Mar 2023 08:38:44 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYGb-00DhQk-GY
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:38:22 +0000
Received: by mail-ed1-x52f.google.com with SMTP id cy23so17286875edb.12
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8P0RjPPjJ6gDx/O+UOt7XYuZJFBYo2c+dJvtzrcfc8=;
        b=Qm6w9iISowR+oMVJYM/hQSnZ4JRKkanoVQFKUhlTESl8dqbNr4Qghw4HziigDxrHb+
         3uCO8RrB0vZVGj3UAekguMmehIXsYMTd1fjEMpnGTvZWSntMe9MxdJc9TCxeN1qRnss1
         9x/nQEu0IpMw3T+pD7CKP1FZIqqKK3F54sneBXx1k+LoI2TVcVgBMOdtduWQIqOMNt5E
         F8xY8xlmYVP+l3SrXc3O9D7anX14xNKTDiBvRrCnIK91MDso/N8+UvT+qJ1iwRDjSu9E
         h+xcHj5cMsZYP8lylmurMTu8vfkN8t8MS0IluatHJWeHR8WkV+ikebzhhc6GDU/bIGIg
         StaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8P0RjPPjJ6gDx/O+UOt7XYuZJFBYo2c+dJvtzrcfc8=;
        b=4pHCPwtZCMrYlrbC52DMq/qx36yz7UNV7TDoqMaB/EemCiLzT9uNdnL6kRc18xbkyx
         7WcUIqamMaYEeg2Xm7shlTcz4GETQxqwP8IYei6XMNwqx5DHuFFbc4CsVTCB7xobtSJ3
         uWluqFJSHeUc+ppp4kwyBOYwKOy8GlQCq6pC7xvRZpbG53OQKjzbWpHodnLYRg3Lq86M
         CN0u8qJI9+a31RZ9nqISNGJ5aHo6cz0CW1c5oJuJbGkmBFFqTKX/7wvESbmIj0RVIeSS
         iMiYmf+s9Dgvx9sO0yN4HF1fw2K/yPI2XZ1zeVMxmuyvgHnvDKLdg1XouwvCNmWPeuBK
         jscQ==
X-Gm-Message-State: AO0yUKVME7rFUX8jEzuLKdMJ6gnvWYPUDWDFyjqwvH5xUNr8DAGPLm46
	aZbGA7rw4c2JGabrJg1D5uL33Q==
X-Google-Smtp-Source: AK7set9lDeUYOs5nAUvtFokDH1WpVjNALEB4b0oSQYXxs4FuVsLXJyZ8SKM7u+8wBouXS4esT6UkBQ==
X-Received: by 2002:a17:906:2a55:b0:878:66bc:2280 with SMTP id k21-20020a1709062a5500b0087866bc2280mr24741630eje.12.1678437500095;
        Fri, 10 Mar 2023 00:38:20 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id y5-20020a17090668c500b008ee64893786sm681605ejr.99.2023.03.10.00.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:38:19 -0800 (PST)
Message-ID: <89e8b1a4-8063-da12-1b91-a9d7bf82fcde@linaro.org>
Date: Fri, 10 Mar 2023 09:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/21] dt-bindings: display: mediatek: gamma: add binding
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
 <20230220-display-v1-8-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-8-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003821_618059_B9D1A42D 
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
> Display GAMMA for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


