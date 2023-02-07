Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E04C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/upuEtRcIb7t8jvkFIGw73o4E9xTmHLpfwjgu7vvog=; b=bBSIwSnPVpdORy
	rp2f5aGS22K7szku+WpEGU3MqQD/BbBGtzJLoCutTjiO9Tw+1+XDymssiKE4uxyBDjHWp4EJxLhuj
	ks9vctsGXB8/5AVmq5+3i8LbFCKjZWgm2DwwzbgCtnf38N8f/z6M0TYoMLqWZt3AKZ0i0/geC2BU2
	KueUNcCKS5bJFitTinJVFBuf2hP31YjqM+L4907H2lQf/qVo1pGS7r5QhapX79ioMeIK6clTikfXx
	EDvh49f5mathtazopzsRxqCietmFsv50jJMDDoVyLQo0bI47qmIZkVE0/YDldjXwHS9D8ACBDW5vZ
	+PqwaYR0XoDSqwDoa+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLPR-00BlaR-Aq; Tue, 07 Feb 2023 10:41:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLPF-00BlU7-I4
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 10:41:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso11077326wms.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 02:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F/upuEtRcIb7t8jvkFIGw73o4E9xTmHLpfwjgu7vvog=;
        b=xw6a313nqg5Vp68/k8JMPw+tYjF7bi9pacjL76AWkrjYhX+Rler2qrkyV0uEt8nzvn
         K/WGubh5JJ53381qBwcTKN7uXou4K3un/bPCLYKK8P+TO6iVo0K/rR9+SJuKnfuCmKqt
         vfkrj+yWRJfF+ZOOw6atQ6BotdDd4OKunjxwBn7C493WRS5ygMhiuVnXefqNZt7RAoDJ
         ktvypPe3pyI2w5ftH/dZRkcoOMbjqGbBCq0VDQ4T6Rg3pq7QXPYkKFMg8Wkn2MLA2Clv
         EdSrOLL9IqsdqlzK4juFevOmk974/ZlVwfET6wdR5vF9imwKGzSIMd7Iz0tb4S9kDj/4
         fpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/upuEtRcIb7t8jvkFIGw73o4E9xTmHLpfwjgu7vvog=;
        b=8ExKC5wuyqRvd296DLCMwFMG0X8pxGj2TwrUVf5n3hsB/FEizeLhZXS0WhvEqQ5Gr/
         sDrJcgJXXhfmJGuMIyfMMONcDOXiYSnfq5NbzIGJtz/3sEagT5w7y1vg5Wr5+bEaNrm+
         m1Ai1oF0rT5raSokatlZi89tKNIEsAP7AmmrUikBfzx10DG6w71pQmp6CBLnBht6T+D4
         wTOm52BSjUVlmuDSdpA0i1/2/0g8EftN4UYm59cE6zz06KTcp8fnxg4Gs1g8zOlmESjD
         7UrC70wOlI/nKFEk2ImHGvMWmy3tViHxJnnNBiZrpXsVsKS/eRm0EvHMJEuMa6lGzS/1
         At5w==
X-Gm-Message-State: AO0yUKXXAaaeozS3FvjnfWXzmxZ8VhO9uFJSjkS4ln19e0sl5H/qCiqT
	CcndY2k3ZalFgCXZxNot4KI7LA==
X-Google-Smtp-Source: AK7set++tMAbtKYfer3K/a6e0NKT20sj2Nwd4RyicjOcCLQfigzIPlZVwOvPItlJKobUBErghQxVbA==
X-Received: by 2002:a05:600c:4a9a:b0:3dc:46f6:e607 with SMTP id b26-20020a05600c4a9a00b003dc46f6e607mr2689936wmp.3.1675766453918;
        Tue, 07 Feb 2023 02:40:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c198600b003dc492e4430sm14092696wmq.28.2023.02.07.02.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:40:53 -0800 (PST)
Message-ID: <fe3673d9-b921-c445-0f5f-a6bc824e8582@linaro.org>
Date: Tue, 7 Feb 2023 11:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: mt76: add active-low property to led
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230207102501.11418-1-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207102501.11418-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_024057_655774_B16629BA 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07/02/2023 11:25, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> LEDs can be in low-active mode, so add dt property for it.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index f0c78f994491..212508672979 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -112,6 +112,11 @@ properties:
>      $ref: /schemas/leds/common.yaml#
>      additionalProperties: false
>      properties:
> +      led-active-low:
> +        description:
> +          LED is enabled with ground signal.

What does it mean? You set voltage of regulator to 0? Or you set GPIO as
0? If the latter, it's not the property of LED...

Best regards,
Krzysztof


