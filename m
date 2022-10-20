Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FC7C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcnPN6pOymsF6TuFZ7F3+kHPVPEANExbnJVMCV93EB8=; b=Np3VJuV0vLhNk3VrDyg2G8i8lG
	1lgKTiNK/EBJU5axUGlDj3TSdQIVAEFppbzQELvK+cY22L1gk4j78mpXcNV3cybDcybORVBRhrxun
	SvaFzkqCy+39+B2EHuAZXeES8ThYCeFbx1AB93NOrEf69EbXg8oK++ygB/SAUlw+1coav1Q1qglZ+
	7i/sprDEqFcjZ3auGqi1SmtqF15h8N2C+UalaszvVnHjHnLKr3Sw2fXeD4HAhzjDT2TAp/0wRP7xd
	YWbgULc2UMWzLJGFty7XGcL+WkIivrwEfStzonWxUrCNt1WIdNNB0MhtpbtRax221J5T97mRfJE1L
	80UgoPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYGp-000Fzn-UG; Thu, 20 Oct 2022 16:19:47 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYGe-000Ft9-5v
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 16:19:37 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id f14so13852426qvo.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 09:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JcnPN6pOymsF6TuFZ7F3+kHPVPEANExbnJVMCV93EB8=;
        b=wtMyoidNDlc6CXkOIF48tG23OkrzjobXGaBGAeQxYLoX+/YrniIr8r8CuA4naE0ggr
         egJI4JwS3HR/Z1zTs8DGA2jpvUXFJ3Pa3Gn0ScUdUBakgCjcAQohQ6iI3f5C2nnZLGzn
         vH6TgDpcxcnqfFceAI+pdV2U4VDRbWogolEQY+R6tOEM9Imx7fBeRZjLd94CMcvNnkwJ
         /Blt2ZZd5flcx11b+MFkYd/vCewUXmTqpA9NGS6/iJYKySlX27cyst93kh8GxViPaQBP
         V4+VD4aw6rnQw+q8IXonQnSKgEFTjkTm71OJ1n9DMGWaHZPlGoMeXVrVuQE9Y80TR+g8
         j4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcnPN6pOymsF6TuFZ7F3+kHPVPEANExbnJVMCV93EB8=;
        b=DAScgYWm+t3eB9nIHFMH4Bv1M4OgmugToZ83ygfY9uBbbAIIFn4JxaQdegN54zy9lv
         kZ2HS9Iv2LGiGq0HKmT22jryQtsFoGOrbHPZQUmCx/TSFr94hD0KVQVuFVZrQ6kMojqk
         5n2RXbNGRAVvztxKJTmfoBRQIdcnn9LvXrwiCb0EWHIQkrOHkiEsddCExBrgd2iss9px
         7x5pgHOrYLy0MKxo1OrG53Yz9+nmyCCDoV60U233lMfipRHJcPQY9cer3ABoKKlQuW6t
         Wp19wfnp0hbh+lvAuYXBsuQ220UkZoJrPfH6Klag0aiURrkOH5OG9swLIbWI4vRqeDva
         AP8w==
X-Gm-Message-State: ACrzQf0Yf4KA+HhMdqj9raaA+GnJ9JuJ2rHXyuOKFZVmAckDfRaFAzoy
	cN3ni7iZUJrSgSv7K/L/1KDJfA==
X-Google-Smtp-Source: AMsMyM6mw4at8h/UUnFkUKaYGcNXsz9P2DbQdh3eDc++FhkVB22bdeyzYFFEjleWs4HEZBCi4MI2bw==
X-Received: by 2002:a0c:e552:0:b0:4b1:86f0:89d5 with SMTP id n18-20020a0ce552000000b004b186f089d5mr11896504qvm.97.1666282774259;
        Thu, 20 Oct 2022 09:19:34 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id r17-20020ac87951000000b0039cb9ef50b5sm6277793qtt.26.2022.10.20.09.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 09:19:33 -0700 (PDT)
Message-ID: <972de6c1-c844-7581-efed-cb6c4d826c33@linaro.org>
Date: Thu, 20 Oct 2022 12:19:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add MT8365 SoC
 bindings
Content-Language: en-US
To: fchiby@baylibre.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221020130957.25197-1-fchiby@baylibre.com>
 <20221020130957.25197-2-fchiby@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221020130957.25197-2-fchiby@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_091936_259994_6840891B 
X-CRM114-Status: UNSURE (   8.47  )
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

On 20/10/2022 09:09, fchiby@baylibre.com wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add pwrap binding documentation for
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>

Ah, and one more issue - your SoB is missing in all patches.

Best regards,
Krzysztof


