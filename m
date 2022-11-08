Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EF7C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RfhvWt1Tv41V7xOdh182isXRfcqnMCvMMU4ZxjHa4I=; b=uj9HVerx443AxNgxWKPO4icxYs
	O36fdx/ghzVahfRnArapFtsOhp34+tmADUhHcZiwuK/kvo+6m7GUakMQrA0FLyk0QT2fjVM81cQr/
	Gd2dlQAZrrd8HK7J9GbGKUdHRg9m/ozfxN6dAGh59TEkYIiTlEBtQ4XpxaY8aqHILPLPMgLycruHA
	KG7EZ5K/GJq23yT0O5UCbQluTel4v38SUgky5qmY55rM10VPQwLDXdHMYOxDjKs+YkzLiswprEP6N
	G/08VvHySSK6hI8Id//6j8Ows9BloOaQgPJzyCQKDKdArRexKvb/ZCLCEQPtx/JkMunNWRzw/NGzb
	YBIjcLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPwX-0061qh-Ka; Tue, 08 Nov 2022 14:51:13 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPwR-0061N3-UL
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 14:51:11 +0000
Received: by mail-ej1-x62b.google.com with SMTP id k2so39288429ejr.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 06:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5RfhvWt1Tv41V7xOdh182isXRfcqnMCvMMU4ZxjHa4I=;
        b=vgPgq/fKoy91SWpS9t2e6oRNux2GYZ11uz4nq69Ecusn/WQxEr9PnRkXeciq96q9Kf
         Y/uc1JXxwDcE7DZk4ERIHWnMD3xCOKQOkmZ9szh6zLYAHlS8jB3/9Vzu0GTEcRvD273p
         QcJzqGu94FAUp4fND/CyiussZorc4AISQgkF6NZxvG/MLLVHHNxJkea27kaoeMZFf8NM
         MrPmIrciQQHldO1W0L/ICYsoJczxk/E5K1ku/kfcnyWtcEYwFARIfMuiqAHSi0RwOReo
         3xg6N55uGAcHesseexA8+25xPiouSe/QNOgAQpSqMWJsa4JVGZPnnvoO6B0S9mYDKIX0
         HTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RfhvWt1Tv41V7xOdh182isXRfcqnMCvMMU4ZxjHa4I=;
        b=jyvmog/uI18kOttTMesxLIP5VYhVCxrbIx/hGI6Bf92C/tiBmuRMQGWst1EGjSpvWm
         /mb6r2Q6A+aUZ6YBTN4VkrrCGoZUbJFB0cZJ+8gb6MzSLhexf+Ogdc7J2YubKGFj/tT7
         s1IJZee85y+K1U+DAPt5R2wlLB+nscybjqWtqzgtUk23m+UU6SWDQLju98RJKpaPOsv4
         rBhKgeTQrPKEKcso3HNpHbo6LVVfGcCTCTfXpnXn1yXa5h9HPCncGW0hZxpitljm5DRG
         M4aEeiV7tK6oG3/0qUzEkKm89HY3VxKC/tF7ZJLUaW6CIYuy3sEK5VXFJtnPAmztPUXf
         bueA==
X-Gm-Message-State: ACrzQf32Z85jy2ArNSDgG5zXxgKpffR05thuXjAoiWpVBZN5oz1N8LNp
	RPvKLc0oCPytbjGwpjh4s2q54ReIoV3rCU0jA7wIDg==
X-Google-Smtp-Source: AMsMyM43GACP12dQZV6v3KIC5Qxaj6QVCASShwmiPx6+SaG+30Y/RBMbREK4KJlCmGU7p1c/8UJC8IQmuja8j8BZsDc=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr21471098ejc.690.1667919065615; Tue, 08
 Nov 2022 06:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20221025070255.14407-1-linux@fw-web.de> <e7192d9b-df86-a860-d5cb-8b4b9184e5bc@linaro.org>
 <trinity-889b4468-8a50-4eae-80a1-6bd9ffbeaaf2-1667577856206@3c-app-gmx-bs24>
In-Reply-To: <trinity-889b4468-8a50-4eae-80a1-6bd9ffbeaaf2-1667577856206@3c-app-gmx-bs24>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 15:50:44 +0100
Message-ID: <CACRpkdZFkeX7J9R2C0rhF+WZJXe65y6FfeBEMBGGkSTh4AWmsQ@mail.gmail.com>
Subject: Re: Re: [PATCH v2] dt-bindings: pinctrl: update uart/mmc bindings for
 MT7986 SoC
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Frank Wunderlich <linux@fw-web.de>, 
	linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_065107_981647_9CE300FE 
X-CRM114-Status: GOOD (  14.35  )
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

On Fri, Nov 4, 2022 at 5:04 PM Frank Wunderlich <frank-w@public-files.de> wrote:

> > Gesendet: Dienstag, 25. Oktober 2022 um 20:35 Uhr
> > Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> > Betreff: Re: [PATCH v2] dt-bindings: pinctrl: update uart/mmc bindings for MT7986 SoC
> >
> > On 25/10/2022 03:02, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > >
> > > Add new splitted uart pins and emmc_51
> > >
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> after talking with MTK for the emmc pinctrl settings (custom pull-up) they suggested me to change
> binding to fix other emmc-values and allow multiple (2) uart-items
>
> so on top of this patch
>
>              then:
>                properties:
>                  groups:
> -                  enum: [emmc, emmc_rst, emmc_51]
> +                  enum: [emmc_45, emmc_51]
>            - if:
>                properties:
>                  function:
> @@ -231,10 +231,12 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [uart1_0, uart1_rx_tx, uart1_cts_rts, uart1_1,
> -                         uart1_2_rx_tx, uart1_2_cts_rts, uart1_3_rx_tx,
> -                         uart1_3_cts_rts, uart2_0_rx_tx, uart2_0_cts_rts,
> -                         uart2_1, uart0, uart1, uart2]
> +                  items:
> +                    enum: [uart1_0, uart1_rx_tx, uart1_cts_rts, uart1_1,
> +                           uart1_2_rx_tx, uart1_2_cts_rts, uart1_3_rx_tx,
> +                           uart1_3_cts_rts, uart2_0_rx_tx, uart2_0_cts_rts,
> +                           uart2_1, uart0, uart1, uart2]
> +                  maxItems: 2
>
> i would squash these changes and send as v3 or should i send an extra-patch?

Squash and send av v3 if you haven't already! Easiest for me.

Yours,
Linus Walleij

