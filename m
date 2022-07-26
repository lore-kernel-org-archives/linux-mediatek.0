Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7079BC00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 20:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrDG32o/nF0+drBL5HQUQubPYkcsSpm90fWevm2EMus=; b=jF7xJ7ZgnBYkX0vepOvB/7pTcB
	ahNbb4qqK/+BLwQy2R7/Uen/FTinCb+A/wFA29/L/goVbXKNwQeQff3+RpDe2bdGPprd03CxOqcse
	wTUNCNhJwXRo4ug0IOAOw+Dqow3PdWwLH4BFL/0LpF8mWk5M5mRtmpldacGgu9p0wT2J89+VcxhU2
	4/bdLppzWGCsIhpuJyf7GS2LODsx+Wi6isTC3378kiCFdtbhxWsFfHuqa9XGlNE6Il0oFCMo7ifUB
	HdsXZWWXKYzShqkhcjAYX2f4WaYkDu4AaDX9mAIMgZyfFaxYtxLi57cF/T3He8C1YDZmjmSqoOdl5
	wokoz4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGQrx-0032ei-1X; Tue, 26 Jul 2022 20:09:29 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGQrb-0032NL-FM; Tue, 26 Jul 2022 20:09:08 +0000
Received: by mail-il1-f182.google.com with SMTP id i5so7814923ila.6;
        Tue, 26 Jul 2022 13:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=nrDG32o/nF0+drBL5HQUQubPYkcsSpm90fWevm2EMus=;
        b=DRNn/sAAsT+SwffEzC2bNUbPQcIubYEVbLQu8Ur5DqFPwH/uzEZFOK7xH8wrnnrwUP
         AYB5q2NZ+xdtVw7qBMqbDy0IQUu8m79dIuBw6XvL3YfnA8gg0Vkbxss4GOf5jPIb4+ue
         mE26FaEEXYfSGPrX8ThrhzZHF4HukD3/g1X+9oBpco/+MEy1Sa9ONeMYT5WXUFNWij44
         t0sGW8pzgMOKBRhqZb8i6D72/g3sRPlOEn8P98QtnbnkVq/7Ydc5Q+bgkLltOBYOFspt
         4byKv7QAK0SsqkmrxMrwbUY3BZZpNinpZv+irRfARS2pwi8RbdIWgrbW+QtffSezepk2
         L01A==
X-Gm-Message-State: AJIora/zkTLv0oji3lzTaXk7tnNHKY8/6TQAaLrNCpnzUs5+T5WPqobF
	ChOhs4ZPzFHuRa0dx4BlMA==
X-Google-Smtp-Source: AGRyM1uhqlxORuUmIgfm9uGaklPD+6R+WsuRI46aW6jH891vImtrJFDsBDRJwFUBPN+Qa2GUfxDIYA==
X-Received: by 2002:a05:6e02:180d:b0:2dd:6150:58b0 with SMTP id a13-20020a056e02180d00b002dd615058b0mr3659262ilv.265.1658866145360;
        Tue, 26 Jul 2022 13:09:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k4-20020a0566022d8400b0067be568081fsm7588026iow.43.2022.07.26.13.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 13:09:05 -0700 (PDT)
Received: (nullmailer pid 782233 invoked by uid 1000);
	Tue, 26 Jul 2022 20:09:02 -0000
From: Rob Herring <robh@kernel.org>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rui.zhang@intel.com, rex-bc.chen@mediatek.com, daniel.lezcano@linaro.org, amitk@kernel.org, mka@chromium.org, linux-kernel@vger.kernel.org, abailon@baylibre.com, robh+dt@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, linux-pm@vger.kernel.org, rafael@kernel.org, khilman@baylibre.com, fan.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, louis.yu@mediatek.com, james.lo@mediatek.com
In-Reply-To: <20220726135506.485108-3-bchihi@baylibre.com>
References: <20220726135506.485108-1-bchihi@baylibre.com> <20220726135506.485108-3-bchihi@baylibre.com>
Subject: Re: [PATCH v8 2/6] dt-bindings: thermal: Add binding document for LVTS thermal controllers
Date: Tue, 26 Jul 2022 14:09:02 -0600
Message-Id: <1658866142.328871.782232.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_130907_539010_E2C533D6 
X-CRM114-Status: GOOD (  12.41  )
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

On Tue, 26 Jul 2022 15:55:02 +0200, Balsam CHIHI wrote:
> This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  .../thermal/mediatek,mt8192-lvts.yaml         | 73 ++++++++++++++++++
>  .../thermal/mediatek,mt8195-lvts.yaml         | 75 +++++++++++++++++++
>  2 files changed, 148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.example.dts:32.36-37 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


