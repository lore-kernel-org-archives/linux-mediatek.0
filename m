Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EDEC38A2D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 22:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHszIOTWUTJP89iQhIQJQcS5anPEr/u81IUhAbne1c0=; b=SXaEBcuRMAG8LW5CUVDTeJusx+
	9+FVTbkBBBrwM+cXERVY7Do+BQdOha0rEjNsZYHwPfXqOyMwrrLcR2QiAZj4BK8s0fgIZalIEWS18
	sx0SwuQMTicxg8Hiz1pR9p+3gT2DQqmnIbzyAgyLEI00HN9JfuBOMrtSnwmqn3EqCKbBSgsC0ueDJ
	n8CAGfX2cIjwuvtoRE9TjAZjZ+CcgUBXhrMok0t/LthePI/2qM8ldpJ0clHy+gp7ultMyT+f7X951
	NdLVeYbRmd2q22SSvurWi5Sery6wvsR3bNPyY0pG7CZuftrcR/hoN3zI+/z3b6sl4qhFXvXQjXqCf
	1EOYcqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0QX-00ABXU-K1; Fri, 21 Oct 2022 22:23:41 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0QV-00ABWq-V1; Fri, 21 Oct 2022 22:23:41 +0000
Received: by mail-ot1-f47.google.com with SMTP id cy15-20020a056830698f00b0065c530585afso2660034otb.2;
        Fri, 21 Oct 2022 15:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHszIOTWUTJP89iQhIQJQcS5anPEr/u81IUhAbne1c0=;
        b=E3shRwV+LK/fhAZBE4fV4+pRbl5A98yOZkMHT5dURcKBqpHqWNWxqwHkQbYB+4qfwy
         qGhhLr2+GM1qEwdLSIm7wK1KEqjXOv5Can012zVJgWWoXIII43OdcC5Q5fQBcJNsD6oC
         5yHX60/jZc0MqopAyCU7j61I+l7ECqVDyxTG3tFCWdqiohBpALZV5ClV5nEiSPby7tFP
         k+cqAvhEzH4miqLVCJ7dfsxqcC1eR+m3YaWn4a0sQsP2pf1674qz5SCL/YuEx6sEk+s1
         fFN9FCYGNRHYmON/i/8et9q/Rqf2BihQVXRSxT1qce+jDXpXnyRwZs18aZQVXwP0CIbv
         EzQQ==
X-Gm-Message-State: ACrzQf05W1eceFLgT5MWZj+nxSbC7+GSn3+eUKsngcf4dJyEXpRkMzw7
	CMAMuuZQd16ENP4ZS5SlHgu5TtHiQw==
X-Google-Smtp-Source: AMsMyM7gWaTAPjU/J6G3PGYBWNZixVoh21QdQ6tuN4esEuPLJDcHyZ9RDpCEZ9GvgreWkUsX+2JKFQ==
X-Received: by 2002:a05:6830:9ca:b0:661:2ba:9b69 with SMTP id y10-20020a05683009ca00b0066102ba9b69mr10851745ott.240.1666391018007;
        Fri, 21 Oct 2022 15:23:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n22-20020a9d64d6000000b006618eb616dbsm1627548otl.8.2022.10.21.15.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 15:23:37 -0700 (PDT)
Received: (nullmailer pid 567525 invoked by uid 1000);
	Fri, 21 Oct 2022 22:23:38 -0000
Date: Fri, 21 Oct 2022 17:23:38 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH 2/2] dt-bindings: pwm: mediatek: Add compatible string
 for MT7986
Message-ID: <20221021222338.GA565200-robh@kernel.org>
References: <Y1K53n7LnjoMoIfj@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1K53n7LnjoMoIfj@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_152340_019401_AE10FE09 
X-CRM114-Status: GOOD (  16.80  )
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
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 21, 2022 at 04:25:18PM +0100, Daniel Golle wrote:
> Add new compatible string for MT7986 PWM.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> index 554c96b6d0c3e0..6f4e60c9e18b81 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> @@ -8,6 +8,7 @@ Required properties:
>     - "mediatek,mt7623-pwm": found on mt7623 SoC.
>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.

This version of the PWM h/w is not compatible with any of the existing 
chips? If it is, it should have a fallback compatible.

>     - "mediatek,mt8183-pwm": found on mt8183 SoC.
>     - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
>     - "mediatek,mt8365-pwm": found on mt8365 SoC.
> -- 
> 2.38.1
> 
> 

