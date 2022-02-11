Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC34C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 11:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCG8oUzZwiKD6CNYIB/a51heUoi9GxZ8TvJq+c+riJI=; b=ZzC8hLVSKnPblM
	pX9naX315zacfa29q6Zcmt/KBe3bnexsxIA/DiysXc+XnFkkgxK9GInFVlBHQCANJwLe7rPc5G6ik
	WxeigU/krfsnGeKTwI7APoP6+eAfAagD+omEYHqwMgXzXCBXKx6QX2mWonLNtK7pUJKMHnOfgRTXh
	euGxlQL13/RJqCsgXyPEKrGc92HvdnzZ4aIePZgW0S5QraMBZiwLBpGq1dlhVq/GFRBP039WWwXJX
	3bk+YB3PKR2MEc03kPA+QbAY4VD5Tlj5Yt16lp2vf8V8lKBcVJvOz3MCp+w6JnuWMOumlSu27g2o/
	q9fbDlYgBQNSKaRxWP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIULa-006vgj-Rk; Fri, 11 Feb 2022 11:44:18 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIULX-006vfi-Rp
 for linux-mediatek@lists.infradead.org; Fri, 11 Feb 2022 11:44:17 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A4DE140053
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Feb 2022 11:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644579854;
 bh=svIxGzskW3ZGgG1rdvRW93P99PRrS06bKOYgS12kPfQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=TH+487q08fjSy/hzhIXv7Qeq4gVnUvyh7Z2M4wr/qksUqtB5n8AxoZRNeJmW//+fu
 Ty+R7Aq2FwIJtKbAwzE+m0ovDmlc9bK4qhQ12YIv3Q2UkWb76UTc7GmprYXPA2PJaq
 XRt8jyIsZZuv6HpKWW0M/lyJfQhFWRqJrS4eQRhHgr9YRkjhOM9imHcjvi1ytQvSFv
 2WFIAdjXFr6gV039N2blCEpIX/v9bBJVbOPKYUJ5d7NV0/6tFwubZks7vhX2I0IWqI
 BU2rHEkSK+emfgtc14yaAXdnedmAIwZ249pUTpVmZIwIUVXLw9szEtulYe/rJuGzkH
 YOQkwRt5m4MHQ==
Received: by mail-ed1-f71.google.com with SMTP id
 cr7-20020a056402222700b0040f59dae606so5176309edb.11
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Feb 2022 03:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=svIxGzskW3ZGgG1rdvRW93P99PRrS06bKOYgS12kPfQ=;
 b=KkILo1gBC8lM7U9/KRXs09iybozWKX3ZsPi/Fq3M7Y998KgemUn3NStmO+H3CcdeON
 3VNjriZJv11h6xmTcwSvNnsrUNH6Bu7ZQiJAxEc3ufKroOAmtqI7mJa04h0zp0Cmq+b3
 3M0QmteguHZymeVeeUmT+CuEd895xtkSsQJdBwAykjhzawNB3Tn3dgu2wm8sYH8AH33V
 ua4NNyEJZswfTUA5ro0nc0ZTcMQURCazqhwUzD94CR13qAmMauh1MlA2kPpgiOhRgcJy
 PMZ+UtcI/xzw05urqRsHS74zG249hJBO/ooTAeCytQVQOQrRzYN2GraJzsVnvNLt7tbF
 2prA==
X-Gm-Message-State: AOAM530VWBbrTfHaqTn5jHHRuB8j9CtJ8QqQt/1AkbEqjkImCaYS28Us
 upWiYfouMXVLOuxyhbvJLq8DKQT/M0GOUcYSKku1Y2OGOW/rOj1EcMA0FsrVLYUx7+BKuD0Qm7S
 dpfwOqFYmVhQ6kg29batUSmVeoyRUsRZv1VLbtxd8Rl7CyWiPBQ==
X-Received: by 2002:a50:fb85:: with SMTP id e5mr1446474edq.91.1644579854182;
 Fri, 11 Feb 2022 03:44:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2baTwCVDr7oz4C4PJ7yM5Z/qqexNJLfplboKRoblI0EytwPPoJwEaY3FsG58g8YJ8k6iUDQ==
X-Received: by 2002:a50:fb85:: with SMTP id e5mr1446458edq.91.1644579853994;
 Fri, 11 Feb 2022 03:44:13 -0800 (PST)
Received: from [192.168.0.99] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id z13sm172232ejl.78.2022.02.11.03.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 03:44:13 -0800 (PST)
Message-ID: <c375e5bd-53b9-e657-7c0a-7e2f9179688b@canonical.com>
Date: Fri, 11 Feb 2022 12:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] dt-bindings: spi: Add compatible for Mediatek IPM IP
 with single mode
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220209111938.16137-1-leilk.liu@mediatek.com>
 <20220209111938.16137-2-leilk.liu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220209111938.16137-2-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_034416_156631_FF4EFC65 
X-CRM114-Status: GOOD (  14.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09/02/2022 12:19, Leilk Liu wrote:
> This commit adds dt-binding documentation for
> Mediatek SPI IPM IP with single mode.

Please do not use "This commit":
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L89

Wrap around 75-chars, just like our guidelines are saying.

> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index bfa44acb1bdd..0a2fc0404cb3 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -41,6 +41,7 @@ properties:
>                - mediatek,mt8135-spi
>                - mediatek,mt8173-spi
>                - mediatek,mt8183-spi
> +              - mediatek,ipm-spi-single
>  
>    reg:
>      maxItems: 1


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
