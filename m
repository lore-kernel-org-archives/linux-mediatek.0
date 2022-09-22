Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5B3C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDY3wyLD4djHNv21bBZZzvFe5rrOQU/pLSj/gQsk7Ps=; b=IoJKYY0YUXbRTugXjes+waCzi3
	eByywkdwBNoHWCQLJYHvmuGhO7paromAIbYwwj2cwqXAy4ZOlY/vdH1+gPunGaoWhoDn1AGnQxTEC
	IGUvqRyDtjgUp4ZRyrt86rEoRPmi8Pt7oKebuBSpquHQoVEIo8SGhnjhJ0/8Yp7fArbrzrMA4q+t7
	X0hvFj5ZaltZG+8WnGYgDvkZ2O7NST0qwLewHOH1698SpmrC/PYBFhbUguuONz2HCUWiie+HxKsOT
	QzE/xj94wM8GgBhO3WBBcA5XS27THhcDMJQ98oFXRqkTcbiS5V3nSNGnnOBGdgz788fleeBlNpkVk
	hsrfIVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGYL-00Do2J-D5; Thu, 22 Sep 2022 07:23:21 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGXv-00DnsE-Iy
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 07:22:58 +0000
Received: by mail-lf1-x135.google.com with SMTP id u18so13177382lfo.8
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Sep 2022 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JDY3wyLD4djHNv21bBZZzvFe5rrOQU/pLSj/gQsk7Ps=;
        b=XwHK0QxbkukB+0pfeLp3iJq83T4xdeHh69DQgP8mfmueJLRE765/q+ase9/sNnJs21
         gef4QcYwhvGMJ5I1rOMv4c8iBQEkec5oCScXqe7tEEAh1hYgL/KDHOgUqd+Y2D7/j3qh
         ZQ4uIoPTMlwg/4tS9A7ZZFfoIDVQ2RJjSyPcTigutEkwRe1QNvQ7h9X83DJcBahprX+J
         dZNgSRwzevigqAap02exRBv78XIlWrdN6evViK4G4y3mTDz+ei4bVP1lYTyUF1vdPNZA
         0xD8F3pll7zdcIu5IlxU0TFQmobM5M56Pr+dXMaCNQmKgBXoiyoGaTwzgD0iXpKJUQQ8
         OP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JDY3wyLD4djHNv21bBZZzvFe5rrOQU/pLSj/gQsk7Ps=;
        b=7WEFPQ6dDwrUwNeu8TXwXPjF2MOeS0cExF7FA0FwRXih8s/0ugS8ggLY6y5gumwY1r
         ImJ4pO0Y1dnhjJR1hpretb1ADB/BNdiVDm/8phFABAQPUl285zg3XZRjtHuR2pEvl4LA
         9u+rxnKWlLWRs1fVPjU4kxwJBRNthcrOOUllwl8+ZWu0f6LXx3bL3Pf/epfe6tjVpsq8
         zOG+ZJqoCnlIEkGr25ITsFSSDf1KllpeFsXoW0MtOemv5f/OQIsq57EH252YPi63CYYT
         S0DCCBcynobh1FBIN4DypWfJ2vKY7w4dP1kQwpQmknEdl0gyeBUwLK5VxWyviglPXaEh
         OyOA==
X-Gm-Message-State: ACrzQf3d6egmXvCVd6wQaFHZzxwR1Jdru8jbKcfQncu5Y4cqJsS7x/m9
	usFF0+0jJhRMXwbyKCQ9Cr0QOg==
X-Google-Smtp-Source: AMsMyM5+A2X0Idpf2Cy8iDaQZo+BvsjA2Xr5j4lwWyGuafVss0uDTPYm+TtzlvtHMoansllc4Ccy/w==
X-Received: by 2002:a05:6512:b9a:b0:499:b537:fe60 with SMTP id b26-20020a0565120b9a00b00499b537fe60mr785618lfv.319.1663831373857;
        Thu, 22 Sep 2022 00:22:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i20-20020a198c54000000b004946c3cf53fsm804450lfj.59.2022.09.22.00.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:22:53 -0700 (PDT)
Message-ID: <11592bcd-eec7-7cc0-86c6-8f440b6af447@linaro.org>
Date: Thu, 22 Sep 2022 09:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-16-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-16-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_002255_675626_5515408E 
X-CRM114-Status: GOOD (  11.05  )
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

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Add the DPI1 hdmi path support in mtk dpi driver
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..91212b7610e8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,7 +15,10 @@
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/types.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

Why do you need these headers in this patch?

Best regards,
Krzysztof


