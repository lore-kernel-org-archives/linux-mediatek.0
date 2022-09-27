Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53DEC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 14:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh+C9NAf7fyhTRzPTh+MKYKYRuDErBnhgOgiBqVy3dc=; b=d9rgjje+Rk5PLFojBuen7vNwMn
	HlcPRbP3T9dMf3wRSuCs4Auo3H8rijZYhzxSgGEgOstidpxFbUxGqLj+L0mQytIX1lQCGnblsGQlG
	7i/Uv/+M9MZJK0woUgIcByKH3IK7s0tGpXF38zYokdNvf+o3A3iV9D+s9wGbTAv5o7txYWyBSSfhd
	zS0NL+CK1KaN3zujahwkVtkFOPDzCoHYFmEm0BrUQwfHh5YZv/ADyIasO8mUCQx3ZHfcQkx+vdTJA
	k+kjuw8bG0jNd0MIqCS0R/BVdYLUCZxjlEsm9JIJnTw9COnKDa1yoH6CSdpWZvmOPfb1RFsOabPmE
	YFKJy+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odBB6-00B8WI-OU; Tue, 27 Sep 2022 14:03:16 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odBB3-00B8VN-Vc
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 14:03:15 +0000
Received: by mail-pf1-x42a.google.com with SMTP id i6so5587100pfb.2
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 07:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=wh+C9NAf7fyhTRzPTh+MKYKYRuDErBnhgOgiBqVy3dc=;
        b=WFviH4EqUR6kYjQp6x+cQUhPYii3lQYYZmfJlDXU5vgrdYVW5TvMAnjzuqH4hlWZ9R
         6MSorDUp5CAGAwGkDsbgqIo6h8J+x/B5EcVeW4mUYMkolFq2i49kRDnlyUoV6JoZXkVN
         RwQJb9tLucy2NO4OeirzxMQrjG5gHDPDQMq5hVuxIgNpfPFiAcU3PdOmGpIpuYGtmgjQ
         A3hH67P+p4d6WmHJ296e8RxVT/0YRNYQv8A1oEo5ebznQjhhtJytGmT6N2OjWeJjbpGH
         E6Mf8h1B/KVp2sRO5vAlBoS1nbXwNRZ2JmuFfccGMGCFtAxJQKi+q9xgLbpu6ZXd9Koc
         KBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=wh+C9NAf7fyhTRzPTh+MKYKYRuDErBnhgOgiBqVy3dc=;
        b=49UmOecCG4lUqrDiDM/gBLgOYpXpVjcGl42/rMQGxR4WkEjDQHVTwUTeB4R700K+zL
         1pFacKbtqb2FXHj06GusAyAEiO+pQZWn6rjNfxBr7sSlRfN3ZxlgoErKBw3wji79NHi4
         67HfZurJQxBAQgyORpv9PaXtK5rJ883j5EGBF2B457zXhRBXYU2qp+/wCT0ja2tGwjeT
         NDFmP9XNCswMdUjfjwr8M0stmq32Z0fw6JqHSLMWMg35JEoetMX+d2O0qCMe31myvvII
         gzv8sL9KfJOPGBx8z2FZACAByfvhWsz8QG34TwmtmFCQyRmyM83BahVo4zbwmDd94T6b
         Gifg==
X-Gm-Message-State: ACrzQf22cARxZxahgqJgZKgRTsFQFC3IoYJUYHf2Vxqb/EmPFaXYNS58
	J2i7BbIJ7wS2BiRAFEFfgDxyOb8FxlcO6OHZQzxYYw==
X-Google-Smtp-Source: AMsMyM4AhyvViwVb+Xhe6VVlAW1UxwPvhNZlvy0VcZjmOqqSxzYURnmqx7ipZkYuEjhS4Di3Y/aYKi6FFyNoEfJMpIA=
X-Received: by 2002:a63:698a:0:b0:41c:8dfb:29cb with SMTP id
 e132-20020a63698a000000b0041c8dfb29cbmr24458682pgc.170.1664287393191; Tue, 27
 Sep 2022 07:03:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 07:03:12 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-6-4844816c9808@baylibre.com>
 <5a857097-30c2-3b37-6134-57cb942113ca@linaro.org>
In-Reply-To: <5a857097-30c2-3b37-6134-57cb942113ca@linaro.org>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 07:03:12 -0700
Message-ID: <CABnWg9vDhEES=hfUzs7tkHfuzN7TCm1CKz3WysgWTHvPPiY41w@mail.gmail.com>
Subject: Re: [PATCH v1 06/17] dt-bindings: mediatek: set the hdmi to be
 compatible with syscon
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_070314_039069_126BC55E 
X-CRM114-Status: UNSURE (   9.16  )
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

On Thu, 22 Sep 2022 09:19, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 19/09/2022 18:56, Guillaume Ranquet wrote:
>> In order to share register with a dedicated ddc driver, set the hdmi
>> compatible to syscon.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> index abb231a0694b..86297b7eb7f7 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> @@ -16,12 +16,14 @@ description: |
>>
>>  properties:
>>    compatible:
>> -    enum:
>> -      - mediatek,mt2701-hdmi
>> -      - mediatek,mt7623-hdmi
>> -      - mediatek,mt8167-hdmi
>> -      - mediatek,mt8173-hdmi
>> -      - mediatek,mt8195-hdmi
>> +    items:
>> +      - enum:
>> +          - mediatek,mt2701-hdmi
>> +          - mediatek,mt7623-hdmi
>> +          - mediatek,mt8167-hdmi
>> +          - mediatek,mt8173-hdmi
>> +      - const: syscon
>
>So you just broke all DTS and I do not see patches fixing them...
>
>Best regards,
>Krzysztof
>

I'll drop this patch for V2, as suggested by Angelo I'll do things differently
in the driver to drop this requirement.

Thx,
Guillaume.

