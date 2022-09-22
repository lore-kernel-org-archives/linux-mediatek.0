Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FDBC6FA90
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Be+A/VflX8S5BSqS53W57zqfNrh5ghlqPax0x4FTS8=; b=E4Ki/LrtSdl4mkJm6XJ1oSv3LP
	6YUhySEvZRoXcCJQJkQB/mjqdnpEYGmy23nmIwkqSYMMnLdq2JkhIX+qtfEruh9QcZEChUPQNPv0q
	/aT5FO914Q+nlqsP+GKcel28x0nydtPkx5v5Pwa9GcWE804AlQ1M4k1O1eOdN3WYVQNUMFDkQpwAz
	fs/eLS98g5rwrsLq/Mxjh5vZBlwXh+T82AAGFaTbAQBeRLqWZor+JwSUOq8A0LPUXRCPmm9HL4wUr
	agGtrC/D92R+TuDSpzL3l3p5LkmmT8bNrqKn5Vv8ZxB+kYzOMfi/JUDWhPBVgPZ580WSxayax+aAF
	RoUkeQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGMx-00DjX7-9r; Thu, 22 Sep 2022 07:11:35 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGMl-00DjQi-MF
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 07:11:24 +0000
Received: by mail-lj1-x233.google.com with SMTP id a10so9932962ljq.0
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Sep 2022 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=9Be+A/VflX8S5BSqS53W57zqfNrh5ghlqPax0x4FTS8=;
        b=T3mVBaJwvES3FaV8YLG+gKGlW4ElLKPh5ChWHSrNIodjkllrZ8OQYmIrgIuU7FK4mY
         gtckyzupo4ix1OZra5CINB67aFDwsrI36Oc9bV+mP78teb+wc2F73GjoF1Iagtd8u5Ig
         X5GsWm4RA2xFuJ/c07wohmcaJ+7FV4LFKuQsfyrl4NIZqpGKOiFzxxJUiFzOZkuV4Obq
         zR7yFDmao8u+qZLIGzFxSCOGuzx2n1pNtsfAwk7rUlRlLqVkkE+c1sBYU6Q77Qe+1O1a
         MG/81Il1kTsJT2cEToM+YF/EBSmt86qCF5FTSoaLYoa5tOkA3jc+V4RyoFhCq+vZd0hT
         xJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9Be+A/VflX8S5BSqS53W57zqfNrh5ghlqPax0x4FTS8=;
        b=yeseUcR2+rRBpFqdRDZRwbbyjGVZ5Za9/+rFCgXNm77tw9KLItwa/qy4StdVrCLRWi
         9hnGQYYYjGwaUxTD3bZoiB5QkqjnE1QVuOCO5RcgTzI32J2yDsz8lubnsvxB9KBSXXGt
         xaD7V7n0aWiSVD9IGeAA09EHOvlk4wcDoJ9qANnNDRAgtH4pQOwTZdJ7uJgO1TeYfmrp
         7vXOG9nguKf/8RKMLclSuwXkdESyfzVcpzlJjfLsjNOGvvrj5BlaecpzA2X+2t+++8jR
         cjTUFd32jgAWaKQzVkIfLFvxtaFBtZknuyO7VV0qdo1oluBPPmeTxKDwxinM7StrOp+l
         YPpA==
X-Gm-Message-State: ACrzQf2LZh6qCwpvurICXdrdFppRR9hkoCESEzSjOqXe2I/mmGtkzElf
	9TgxIOptMp+ddws9XmZ/11kHTQ==
X-Google-Smtp-Source: AMsMyM7iojxShj6IEudo+H4VWui9taf1pE4pa+BEPva5UkHYdDaU9Dgt+hBCkSrdVpL9VnVmgusIXw==
X-Received: by 2002:a05:651c:2108:b0:26c:6102:5d3b with SMTP id a8-20020a05651c210800b0026c61025d3bmr667340ljq.168.1663830679817;
        Thu, 22 Sep 2022 00:11:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k4-20020a05651239c400b0049908e21e26sm785597lfu.253.2022.09.22.00.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:11:18 -0700 (PDT)
Message-ID: <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
Date: Thu, 22 Sep 2022 09:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI
 clocks
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
 <20220919-v1-1-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-1-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_001123_746121_BC326836 
X-CRM114-Status: UNSURE (   8.70  )
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

On 19/09/2022 18:55, Guillaume Ranquet wrote:
> From: Pablo Sun <pablo.sun@mediatek.com>
> 
> Expand dt-bindings slot for VDOSYS1 of MT8195.
> This clock is required by the DPI1 hardware
> and is a downstream of the HDMI pixel clock.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 

Looks like broken patch.

Best regards,
Krzysztof


