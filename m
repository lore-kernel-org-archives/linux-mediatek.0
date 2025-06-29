Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C62C7EE30
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Jun 2025 17:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0J44e2xJxiOSnYAQHHbyr1iri4R8DxZunjcmJed2aE=; b=I6Zlfy5eT1GS7O1DBvGFOk8oHi
	Bot/MVUrA/oX0MS57W9JbbVhi6oZ9mCjodMRF6IDP/ETIKwMVVg1w5v9VqbuX3KOj4HetWpZwCSry
	dCW8QCroHGNE3BqEF/eGE+zBWwO9ogD6dY+L1QKwyRFRNZ1eOk5vL2R7ohRyazS+QFGviOc6W4uCz
	j6DshjqGVacUcUEbi9D3Fk+jkqHya4Ii1CrAXo1SJzs4Fgg+prws5AFoTGFtVGIvueHY/uoLy92o8
	pBnU0YT+tWkJEMMiyp8h0EI1us6wf01irywZ69PgvqwRB2AufSyHTyUaXiVaqnEje7kYMkIh8nHsS
	5MpBYeUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvzd-00000000WwI-1OKk;
	Sun, 29 Jun 2025 17:39:05 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvnS-00000000VmB-3ElY
	for linux-mediatek@lists.infradead.org;
	Sun, 29 Jun 2025 17:26:32 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-40b32b6af9eso1580973b6e.1
        for <linux-mediatek@lists.infradead.org>; Sun, 29 Jun 2025 10:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751217990; x=1751822790; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x0J44e2xJxiOSnYAQHHbyr1iri4R8DxZunjcmJed2aE=;
        b=BCSKlkyXMMAgBAfaRmA/eGU+JA2a3Wktocf36jQSPJbiQwW+tAJEAL3uK8MDPe37LB
         Z40sZQ7O1U23j5Odz3k/Jg/yHfPLyD7DUjw9MMFCwsgTJmvckAu/8hoS9pkvn93MQdwa
         C+5sc1baimNq7pXAHSuN6sU8jdt2jgPQgZLNOnBcjnlnbOhbo5WZ3R0Ba2hlM+QbPLW0
         60UF+4mmRFqzby/E8CxxXozUSWweN8g1eQBHUfHhfIq0QTU62ew3Hx77OfjhGJmq7tCv
         neSJYfEhrJuQttUdJvDhHmJL683m74ehTHLu/GzKL2wbhSvHJ8SBvnTmzKur6FcXtOjB
         GILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217990; x=1751822790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0J44e2xJxiOSnYAQHHbyr1iri4R8DxZunjcmJed2aE=;
        b=V++T2kDJt8CNTt47XdC2j9bo2VNT9m/d3bTwbcPRk5XG/hRBQGMS0P7U8ZQI3SsCHK
         aIB5SoZCNNSBXgRUV86YwvH/EIfyYr/+hjI37D7qA4+PiaBj9jBQpIvEVFsfBxIs2RtQ
         U/ojjvgXT9XNsoXffv+t02vYAtxbQo1dQux8ldg/VPsyfaJwuRF+0IuPOjNtk9fkOxrK
         lPt8Tl+5ZBIjpT3/zpM3cQgOT+1XmYYblJdniXtEhb4ZvIUIgKsrhsBy/oKW7GbXpGvG
         kOThIo/+DkAi/Mxd3uWpIWG/voyaaMJwGUeAUMRiOjkgIjJyfty2DRbstNitJSTbG2qT
         2cyw==
X-Forwarded-Encrypted: i=1; AJvYcCWJnC7jgh9iXZ8523fBJB1wMq9JGpjmnIjCXJVy0bu9U/IYK6xir+bcLDWNBHWd2DdyndODWJYlFS6Tg/d0HA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Pg7J0ghwhAvHWogLiWiWl9/G9xyuQcj3GO3pf0yW8CCOoyp3
	yb4Jy6u1NdLzZBD+vSflf/7ykoB8WPb+ftjZIVXwZVxX0fWTYE7mevnj21rt7uQwhEU=
X-Gm-Gg: ASbGnctCGAaj10mkQqOY6lpDhWeUUynX+hxGOn/7X99vlWGxf0lI2zkubTw/LDCoRrF
	fqJW48x95Xlh+CLHXhEwEZi/UHjfgIB7rt2dZ3YnPUecjp9K01IZiBUCl5b+9HBUTHPPsrNGD9e
	ic6ZDzq4er+C8EheXP0m01+f2ZluMAhPsjSZovyQY7xARPZ6C6ciBxpx5h9lxGQTn5HQNNUYQfN
	6OuNL2xhGlhxTXv+eO3qzrARVnm8R0/WHfTPH8dbwHHsNfG8V2YTRGKTTULrIOMKg26bXCyzgr7
	pM8NdHbQItZuvsqw6nuotnAILGV7v/mYgwyZCkjVO0ZsKZ6HBsLX6cXkXBaf6mFZ6y8NyCAjjif
	pArLJpL7lskUO8iMa4KoMxm6t5jFsjkOU4zu+CUPrPPQTAW/1Sg==
X-Google-Smtp-Source: AGHT+IGXPL0lhOwDFehBinrdpXCNAl48Ot/qIiS16yHakjjWRm/8p1TRnd0kC3+2s69JZhSqjEXZhg==
X-Received: by 2002:a05:6808:f02:b0:409:f8e:726f with SMTP id 5614622812f47-40b33e34ba4mr6866779b6e.25.1751217989649;
        Sun, 29 Jun 2025 10:26:29 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4876:5a0d:2fea:6208? ([2600:8803:e7e4:1d00:4876:5a0d:2fea:6208])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b487940bbsm940788b6e.3.2025.06.29.10.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 10:26:29 -0700 (PDT)
Message-ID: <97d34412-31ca-41a4-a3fe-30635a79d52c@baylibre.com>
Date: Sun, 29 Jun 2025 12:26:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: iio: adc: Add support for MT7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250628223837.848244-1-olek2@wp.pl>
 <20250628223837.848244-4-olek2@wp.pl>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250628223837.848244-4-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_102630_815096_4E4D6FE7 
X-CRM114-Status: GOOD (  13.66  )
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

On 6/28/25 5:38 PM, Aleksander Jan Bajkowski wrote:
> The temperature sensor in the MT7981 is same as in the MT7986.
> Add compatible string for mt7981.
> 

If they are exactly the same, then we would want to include fallback to
the existing identical compatible string rather than adding a new standalone
compatible.

> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> index b489c984c1bb..ceb914dde15b 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt2712-auxadc
>            - mediatek,mt6765-auxadc
>            - mediatek,mt7622-auxadc
> +          - mediatek,mt7981-auxadc
>            - mediatek,mt7986-auxadc
>            - mediatek,mt8173-auxadc
>        - items:


