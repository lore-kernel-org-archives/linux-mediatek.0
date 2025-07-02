Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046D5C83F0C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 22:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKgWS7/qdk7+Eg50DbHdDl8mGYC2JyCvr3ER8bCDhe0=; b=2S+GnW0ZdPr86tdd7Co7qTQ5gz
	z9QMjBnC4VrZ/feQn1cjPBwiqlYL700fSGFm310CiV6LzvK5oO/lnwnq0Lh26ZvPg/DUG0xNNyVC8
	DsP+ugAR/h4e2XLLioNuoHE+yVlbwT2sdTTqEOhijT3vNfcj2BMSg1/TkXSL9IAidMLnJYkpr4cGY
	ZoLWpXMtktyGELklD7cFg3QqBLJ12V+bGaUvkBqgEeJ2nmyxeRAFwCmQxVKMG0SsOtfwHnRSFeNrK
	Xz8ZJA1Cmhr61yiquCtv8dc6+mlhvFsAYjZIItaTwRxfsIcy0Qc/pfBMb9TLGAEX3frqTwk9loTQ7
	9M2SI0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bZ-00000009fEK-446t;
	Wed, 02 Jul 2025 22:07:01 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5Vu-00000009eSz-1Zb0
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Jul 2025 22:01:13 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-40af40aef06so4779339b6e.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Jul 2025 15:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751493669; x=1752098469; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DKgWS7/qdk7+Eg50DbHdDl8mGYC2JyCvr3ER8bCDhe0=;
        b=WooR+1HdRQWiduCdupF76Q0IXersiThNPnhc1Ta2dKGm4sonyTgJdanxa8ldVUI4sN
         bkeZvI5Nc0LY+elyrxrE3q/O2X47BZk4kVMA9+IZGRGl8WqGcjUjp7aVPmUZ2zftrMUg
         5wdcUKNRsOOuAtm5yRRb7BeqB8i8skzWxM5iSeDbbKnV1o/bmFHdiFVvs/4q+JsSuUPs
         D1uYeWAH1IHCyxHPwIbNA3ESONhbx7cNl93vGlfXgc+k+vtvxyhXAVu+LVrwGk7jyG02
         lWDYrmzgjMOgzytM+kMkEwhfndsLQ3dVr59b1U0x5GzM052OrOkXHe4Kyd7q1OYIMyZD
         /t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751493669; x=1752098469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKgWS7/qdk7+Eg50DbHdDl8mGYC2JyCvr3ER8bCDhe0=;
        b=LdqP+h6qe5RBtqAlpdEy76LtGzxpUrZv3XoaN7QX0mfR8ZYzDg97rImf2wS+lfsBGz
         WOoJs25UVfr4NOnZJ2U+mIH4kesb/sRWIYC9IlKRQLS0Vfww2WaYo1IVAoX5YfhG9Sip
         ZAkrgZUVQyc8LMG58SYphauMnZObwwXS0Phti1ERQTzuM8qtRp+S8nB/E7akzjBbMn4b
         l163TELNa+o7A/bDRlVlI8Whvo7hjF8WoWTjnMf54woAfpH8dDeGbiuk7/bCW8BUseHV
         lTQEIXnQhW8RzDOGE1pVyxApdzq+b9Kgu5dvLDWwFHiilGn+UUeVu60e/bXoXYdE+E97
         D7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwQr8nzkOrJlGo9k7VTSxdNurnTILK9IW5UjGSgiaD4eF6Eg56SkWZRfdN8FqOyvVzu+1NyJ/DgpjzGANCNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy0Dz0k7w6Cbd6PtbhmE5fEljC4k15DKW4r/kkTAlfpjC4tXva
	8MdhWzVzhaWKlzBeeeU9tRwrAl23WJ3jtj44Atf93U6uPtoolE74GJuClSl4WDfjg7I=
X-Gm-Gg: ASbGncsz/+pJks6GCwCsfl9Y9fm0PfdY0eW6iva5QpipuUDBGI5PkYnPrFMYQY4r1qN
	QFzXzZFAaQsPbqK+a/Fvc7MePHaFpqPkLpkaaSreYkQ3mHqgF0ahQpg+ep+KSxXCQaY5CU+UEFm
	s/6nb0G8EHKJcFu7YIfkfaQW8HdFXZC8ZmrlvzG2IeUokEz3tA5uA3RIuy7Yw7/jeIFYjmfXiYO
	kU6lKuHsOvyIQcug3uJ50ryQ582Q3I5Z71Z7fd6w76fSMxFdgpU4zkRGfi01oGYYDgEX1zphITr
	Zyg4mVJdVyBf8hHF7v8OHloc8bSYOpZ9NZtdYKjQHznnulnyYH33maH7ybwr86WcUIyiWoq65Zk
	3xdQhPyGDDw8srwP53CYp0iNw6oJCg4YMf1dch8E=
X-Google-Smtp-Source: AGHT+IHKZNhePlF0+T6dWuoOeOIoDbpvywH95ABuicUB05Dmc1aVoalsdNueqPirXs97Btv0KkGWcg==
X-Received: by 2002:a05:6808:e8a:b0:403:3673:65f0 with SMTP id 5614622812f47-40b88b25dc6mr3169424b6e.31.1751493668851;
        Wed, 02 Jul 2025 15:01:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32420c83sm2747613b6e.36.2025.07.02.15.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 15:01:08 -0700 (PDT)
Message-ID: <a30cbe3a-7d1b-4072-880e-99688657a093@baylibre.com>
Date: Wed, 2 Jul 2025 17:01:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add support for MT7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250702214830.255898-1-olek2@wp.pl>
 <20250702214830.255898-2-olek2@wp.pl>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250702214830.255898-2-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_150110_531688_45C0BF75 
X-CRM114-Status: GOOD (  16.83  )
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

On 7/2/25 4:48 PM, Aleksander Jan Bajkowski wrote:
> The temperature sensor in the MT7981 is same as in the MT7986.
> Add compatible string for mt7981.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

The new compatible with fallback should look like this:

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index b489c984c1bb..14363389f30a 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -32,6 +32,10 @@ properties:
           - enum:
               - mediatek,mt7623-auxadc
           - const: mediatek,mt2701-auxadc
+      - items:
+          - enum:
+              - mediatek,mt7981-auxadc
+          - const: mediatek,mt7986-auxadc
       - items:
           - enum:
               - mediatek,mt6893-auxadc
---

Then you can validate that the next patch matches the bindings with
`make CHECK_DTBS=1`. I would expect it to fail currently since the
binding is specifying a compatible without a fallback but the .dts
uses a fallback.

