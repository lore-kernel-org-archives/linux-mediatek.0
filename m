Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC5FC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 04:12:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DE460F57
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 04:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00DE460F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+KWHXfb9Im0szCZ1NgXiqQV7OyzM0NE2C8F6GbRhYg=; b=wjba9r297LY21h
	ceByheJv/rohJq4HjgbwWsCPk77EuKf3mOs2ZKKht4RTr9V5Tr+Zhc3obPuT4kBVcb2QqRiT8h2RO
	CRCbimV5bDm6xIX8YwpoF3HR2+Cp4EGhd7lQPqhqrVCKDxpc6l1RbvIB5LiWemM3ClzL5Jxw2bWJY
	LM78d/CHzmnE3VljiQ0IijGoy4+SJxnPeIy4SpGfOOj9I9Ju5H+EYHlyhYTxN1k7BKf9q4TI1rVA3
	ezoFlXWsC54TD7FxaiHeS6CAr2VdB+8jnl7ghwkmZPzlfB2Ub4/gw8RPYPTyvWlPsNs0YmXKx9Wlm
	t6YvFWSXrCfBOzf64Yyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8avi-00H2FA-Jn; Wed, 28 Jul 2021 04:12:26 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8avI-00H26P-T6
 for linux-mediatek@lists.infradead.org; Wed, 28 Jul 2021 04:12:02 +0000
Received: by mail-io1-xd36.google.com with SMTP id m13so1377999iol.7
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 21:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jkbI7zztV8NxbL6OAK1GEXMLTdKA0PoGPYCzxGouH9A=;
 b=dXYscuKA9USWzwsEiMBwy5bFn/At9FyANB2VnftNc1X/3U6Q7IE+ADanciy9xfye3r
 dagomBuKngzGJSGumLSkQdm8bYNno6ki1QW7KUxpxYe9jxJOcDIxvRU7EpP8S5E00c2/
 pXE/MXTifhLK7UKGySp+fdKyCMkGBXoCzF4BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jkbI7zztV8NxbL6OAK1GEXMLTdKA0PoGPYCzxGouH9A=;
 b=Rcbm7LxEGY1a0sBmyRN2FH0v0X7OubZyKcON9CJphUUmos+Df0FOBfCnSUTLKTgN1W
 MdOfOxPIcGnoHT2gmlouAYkAgCadOjoOnazh9lCDTQupw+Nl12ObJio9EFC3x7BWhFMk
 SMwgiBL7DLzSIBsRgencjaoQrHx8Uy05U1Zyyw8tmGiY25xLd5Uzj4ao8KBorwtFn0Kn
 O0PnK2M2ldzuxodvWpAaoEsI19FQmbg/g2CwHq1GRMMK7Er7Vigyi5HTfCXOXtwam+xB
 Rlcr90nldXuENbkHQ6UY4gF5VipTCSoLkEBHg9MYUK26sfqE6MdxirXVGIuiAcXrCBch
 YbLw==
X-Gm-Message-State: AOAM5334k+JWg2d08NrjnM6pik04oBJD6ErDTn5tzsklDD9Y6XXtlPnj
 j0IrnAXYKZzuPPVJuelqfR+otVZhOYefYV9SX187Ew==
X-Google-Smtp-Source: ABdhPJwZURagtlb/Es05dXEFrkQMdNvFOAO3Y0xE8fnLEijoUW7gGe8ePUB+PSUfm3tmzaT/PUEwnpmW7dLCcUiGvtg=
X-Received: by 2002:a02:6946:: with SMTP id e67mr24142969jac.4.1627445519987; 
 Tue, 27 Jul 2021 21:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210727110232.2503763-1-hsinyi@chromium.org>
 <20210727110232.2503763-3-hsinyi@chromium.org>
 <1627410395.874547.3210653.nullmailer@robh.at.kernel.org>
In-Reply-To: <1627410395.874547.3210653.nullmailer@robh.at.kernel.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 28 Jul 2021 12:11:34 +0800
Message-ID: <CAJMQK-jii-qqzG8Myn2svn+hBS+s+0YZLO1Gx=Co23gzd7FUgA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: mediatek: convert pinctrl to yaml
To: Rob Herring <robh@kernel.org>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 Andy Teng <andy.teng@mediatek.com>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_211201_003368_E78F3710 
X-CRM114-Status: GOOD (  20.01  )
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

On Wed, Jul 28, 2021 at 2:26 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 27 Jul 2021 19:02:32 +0800, Hsin-Yi Wang wrote:
> > Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 202 +++++++
> >  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 175 ++++++
> >  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 537 ++++++++++++++++++
> >  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 230 ++++++++
> >  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 -----
> >  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
> >  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ----------------
> >  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
> >  8 files changed, 1144 insertions(+), 861 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dts:21:18: fatal error: dt-bindings/pinctrl/mt8183-pinfunc.h: No such file or directory
>    21 |         #include <dt-bindings/pinctrl/mt8183-pinfunc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1418: dt_binding_check] Error 2
> \ndoc reference errors (make refcheckdocs):
> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
> MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
>
> See https://patchwork.ozlabs.org/patch/1510444
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
This patch is dependent on
https://patchwork.kernel.org/project/linux-mediatek/patch/20210727110232.2503763-2-hsinyi@chromium.org/
("arm: dts: mt8183: Move pinfunc to include/dt-bindings/pinctrl")

> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
