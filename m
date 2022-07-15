Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D80AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03wcnwqW6SswNVSW3NYFh+nPKkFyDcywCPMc3nrTTzo=; b=D83l41koLqwfMzxnKxeovox7lz
	5dHP6O3LIEl/NP1AYA4JH9uePYRx37RqMMYusI8L04XLk07t5DjRAx/ZFkl+CircIijgOnlYoawEC
	QHJH6/a7lfmqtIgzqQSqH2/hKBRWJctLHLYW9cmIcnm4qjNhqt5fzWe8Jybz4cqj2sMlx4PPjGEJz
	W6tZebxjhXdjIfVer/cxMES59c6JfWAi2Nul6PlmX5IJ53Yt8cfwf6i6HoJr58CYsQ6T7xHGjExVk
	V8mJxjsU0pvRZgjea+NbhtOvGibJKgp/Y/nmSXQIJ9vJj1eLKenPg3UBexv1ROOo+o5Bu2q6MXeVX
	6xmmp20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCLbH-007Jwb-Od; Fri, 15 Jul 2022 13:43:23 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCLaw-007JeG-QM; Fri, 15 Jul 2022 13:43:04 +0000
Received: by mail-io1-f51.google.com with SMTP id 125so3882101iou.6;
        Fri, 15 Jul 2022 06:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=03wcnwqW6SswNVSW3NYFh+nPKkFyDcywCPMc3nrTTzo=;
        b=2Wx4O27vefsHpAYZdFIpXk0cPLRX9wqeOcIM+ZGdTn7DsldluvJroGvjlhySGCTZLX
         aLo2O2dO9RtAQNtlNB9rNa1izZeZOTdU4vgy1ImGxpptwSKBLj8S1BMPMU9SgScpWMo7
         iu1xTqzpY3qm+6hP9tQqI6eNJwRpi3xcR5TZCC4whe1bTu8rg3h+QLaS3noaWjKaYJ3O
         PeG+zUl0qcwAiC5QV3MoFcRRxAHiBNuX5JTw1+h6X8Z+BHTDajwM32sqDpK8V7nLH66q
         85KTAs+iw8xw2ZGp5xAFFYfroOgkOo2gBGQtwu0S3aYAgMNNdfff3Qg3NhLFZ2T1E31K
         SjSw==
X-Gm-Message-State: AJIora9g35AuDYU8QkVw2zPIzGdnNc1Qr1i4xhovrB0Q4mCsVxFwgu0g
	yqvqfjM3MQwdx1mpCrkOhA==
X-Google-Smtp-Source: AGRyM1uzHWN8yj4iBWno2bNl4tSBHdD45HjKJL19BAJUQTQyoHWpBthV9k3/tF7H+HVOqQ0U4hzPtA==
X-Received: by 2002:a02:ac0a:0:b0:33f:713a:9589 with SMTP id a10-20020a02ac0a000000b0033f713a9589mr7633647jao.289.1657892580691;
        Fri, 15 Jul 2022 06:43:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g7-20020a92dd87000000b002dc789a3dddsm1703976iln.5.2022.07.15.06.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 06:43:00 -0700 (PDT)
Received: (nullmailer pid 520291 invoked by uid 1000);
	Fri, 15 Jul 2022 13:42:55 -0000
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee.jones@linaro.org, heikki.krogerus@linux.intel.com, broonie@kernel.org, cy_huang@richtek.com, deller@gmx.de, linux@roeck-us.net, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, szunichen@gmail.com, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org, linux-fbdev@vger.kernel.org, jingoohan1@gmail.com, chunfeng.yun@mediatek.com, lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, jic23@kernel.org, pavel@ucw.cz, gregkh@linuxfoundation.org, robh+dt@kernel.org, lars@metafoo.de, alice_chen@richtek.com, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, sre@kernel.org, chiaen_wu@richtek.com, linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20220715112607.591-7-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com> <20220715112607.591-7-peterwu.pub@gmail.com>
Subject: Re: [PATCH v5 06/13] dt-bindings: mfd: Add MediaTek MT6370
Date: Fri, 15 Jul 2022 07:42:55 -0600
Message-Id: <1657892575.865405.520290.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_064302_913637_0B3869E4 
X-CRM114-Status: GOOD (  11.04  )
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

On Fri, 15 Jul 2022 19:26:00 +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add MediaTek MT6370 binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
>  include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
>  2 files changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: indicator:multi-led@0:led@0: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: indicator:multi-led@0:led@1: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: indicator:multi-led@0:led@2: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: indicator: multi-led@0:led@0: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: indicator: multi-led@0:led@1: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: indicator: multi-led@0:led@2: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


