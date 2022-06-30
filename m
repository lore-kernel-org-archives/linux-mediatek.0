Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF88C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 21:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0oI2Gbpm910/K3zuIgYxSbljlnn6O3+k19Oo002PO8=; b=FiGA4+nw2VFeGUJdf03/FVPCJV
	t0CCQIzLNWKLK1kdNpz/IRtrTOMWzV/jOdBG9EfBxx1XPPTWYTNCY815sPqBxElb0vYJBj/BcmkOe
	H4NAlRFQUt0ZsSmGrLfFqJfCsXF/2ekmRxivads8+6+6LdJT2D52bdebkSqdbPHkAEoqjQm0SVN9X
	KMdKiIubrNXooPI+rTTaNBgbVaqZ/sBXkolfd2h2gKUAEBnuzVqJC16E+QHJgYXO7zCMt3sl71fOw
	xNLqwAogmK1xliYJ5qBKgWzCBAzxI1a7LmAo/mm0pESvbNAXKLvELDlJjueeicXl/KZXkuHbq+JjV
	hw6UyuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7289-001hqn-2a; Thu, 30 Jun 2022 21:55:21 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o727y-001hoO-JR; Thu, 30 Jun 2022 21:55:11 +0000
Received: by mail-io1-f53.google.com with SMTP id u20so500789iob.8;
        Thu, 30 Jun 2022 14:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O0oI2Gbpm910/K3zuIgYxSbljlnn6O3+k19Oo002PO8=;
        b=PAe5vEnTbc2aloM00uqh59n0jx1o3OnjHRWSIki/WmT1kl/6emx9x1sfsQlYy4F24h
         F3oJRlKj92dfckoeGnxaLFhm1Mfnptdpc3+kKKmDRb+SduspafBOLJTIQ8XTLsqjyHPB
         aqX2PqdxqPhKOoinJi+mU5wGCV21ylXZuwI0sHeR2iz5/LuPNxqGLedodVClTeK9LavS
         1Y1PaVGEuV/52Crx1OlG1DhNqyRv2zRO1JhlXh5ECTR4PZVcjcie7HrGwmg59Fq1wUxK
         bRPTtoKmi5h8b76ZrtKdGy3cKfnwBOdevFXIRbQ+b5KYdrrIOJ5bKf1prSr+zvyH4Ni0
         0Lmg==
X-Gm-Message-State: AJIora96l18fRLEjA4v/aNgPWtiFHkbC5pi+wXuov7bjShUVApizzaCo
	nENZTaf6XDB41uNFODoMLTZYfc8uFA==
X-Google-Smtp-Source: AGRyM1vtcfkSVY6M7PNTiDY7FVEXYZMNw3bvjSTqjH2j0Qe5vPkkxFrAuZnZMfEK51OROsKsre8rDw==
X-Received: by 2002:a05:6638:3387:b0:33c:9f9e:5a17 with SMTP id h7-20020a056638338700b0033c9f9e5a17mr6777342jav.12.1656626104166;
        Thu, 30 Jun 2022 14:55:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m2-20020a02cdc2000000b00339e6168237sm8637761jap.34.2022.06.30.14.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 14:55:03 -0700 (PDT)
Received: (nullmailer pid 3384041 invoked by uid 1000);
	Thu, 30 Jun 2022 21:55:00 -0000
Date: Thu, 30 Jun 2022 15:55:00 -0600
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: chiaen_wu@richtek.com, devicetree@vger.kernel.org, matthias.bgg@gmail.com, jic23@kernel.org, daniel.thompson@linaro.org, krzysztof.kozlowski+dt@linaro.org, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, jingoohan1@gmail.com, linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, alice_chen@richtek.com, pavel@ucw.cz, lee.jones@linaro.org, lgirdwood@gmail.com, robh+dt@kernel.org, chunfeng.yun@mediatek.com, linux@roeck-us.net, linux-fbdev@vger.kernel.org, broonie@kernel.org, szunichen@gmail.com, sre@kernel.org, heikki.krogerus@linux.intel.com, cy_huang@richtek.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, gregkh@linuxfoundation.org, lars@metafoo.de, deller@gmx.de
Subject: Re: [PATCH v3 05/14] dt-bindings: backlight: Add Mediatek MT6370
 backlight
Message-ID: <20220630215500.GA3383976-robh@kernel.org>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-6-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623115631.22209-6-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_145510_665173_C89600A2 
X-CRM114-Status: GOOD (  10.00  )
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

On Thu, 23 Jun 2022 19:56:22 +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add mt6370 backlight binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> 
> v3
> - Rename "mediatek,bled-pwm-hys-input-threshold-steps" to
>   "mediatek,bled-pwm-hys-input-th-steps"
> - Refine "bled-pwm-hys-input-th-steps", "bled-ovp-microvolt",
>   "bled-ocp-microamp" enum values
> ---
>  .../leds/backlight/mediatek,mt6370-backlight.yaml  | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

