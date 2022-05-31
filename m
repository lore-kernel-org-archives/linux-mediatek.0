Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDB4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 22:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVBlfiqhKP+PY7H7z7iyyq2IuygbBCW++FCHd8q1UWg=; b=tVXcA5S5GhC6ZY
	Y4wpFUO18SZBDJTRxf+n8ux6PmAaKhZywo2yiQWz4E8KdvggJfYvHSwjy8FcpK7kA8QnS6QMkUEX3
	ob7qfGb0B/42F8kmywwW6ybMfZSjgNeGAPeFLGjTMy1lcwA4KO2aHUKYnmnWL0vBuW/ms1OQDEzoY
	0As6hlyLzj53pb0C5UatK+fCNZxlDDiDyCWi/IogxGQXtF8ew4pK0hhP01pv49tPa4iYRUbkEYioc
	mDdxXdJLaUp74rOciHEK5vSixQKx/+lLsb73bMYcmIST+ygRgp/9nNbCzJo9UMzV+//XjKNcaH9HC
	NyExIgzV+xzY1tgIieWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwAe0-00CtVo-6Q; Tue, 31 May 2022 22:47:20 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwAdf-00CtKw-10; Tue, 31 May 2022 22:47:01 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-f2cbceefb8so343932fac.11;
        Tue, 31 May 2022 15:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=AE9Fbrj6BPIXSH+6mmzzM5HJbPbBIVW+lbxzy622FhY=;
        b=sORfgnRMu2msFOulp7sVLNnNJgqB/2KHfmP67t/TCZ1+AzZQLjRbOio/ZLKRXBLFwX
         I8fbIXYY7KTau7y9F7gr2j2GVpUZ+S4xKkjmi9Bp8ZLpm0x2CL7Jlkl3D7+aA9wH+sUP
         ZZ1eebKkI1fncn8YqzyH9FApOASQZFUrMxIEfB3qDPqn+cSP7QlbTYIGkm5fVV46KgR2
         Y10m7ys9bq8nSgNGD8op7u7Yf3EgCzGRlkPfG65fNo8LWFhf9Huh+ZaZKwGSutFdjwGm
         qmzRD/eOtjnCGXQZqwYulXtG/fgOxA2H10fOrIoonJKE6tXCuSm2rBuiQg4zjWKDiClY
         DiNQ==
X-Gm-Message-State: AOAM532Jblhpa4a9lF3E9clhaZWzzS5CsTDfOu9ocOFdJztxGqzAJTvj
	X+AA6RDeQPKJ4bCc6al+1w==
X-Google-Smtp-Source: ABdhPJz9hzTJNp12uYZ4vHIk6ZhMev4DpgOt2zBvhqRIr7g1l5auyN0vlOttAqh+FCiKDf2dw2zOIw==
X-Received: by 2002:a05:6870:b254:b0:ec:6ca4:c89f with SMTP id b20-20020a056870b25400b000ec6ca4c89fmr15083367oam.272.1654037217725;
        Tue, 31 May 2022 15:46:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u3-20020a056830248300b0060603221247sm7000503ots.23.2022.05.31.15.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 15:46:57 -0700 (PDT)
Received: (nullmailer pid 2476555 invoked by uid 1000);
	Tue, 31 May 2022 22:46:54 -0000
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: heikki.krogerus@linux.intel.com, broonie@kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz, sre@kernel.org, dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, jic23@kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux@roeck-us.net, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, alice_chen@richtek.com, lee.jones@linaro.org, daniel.thompson@linaro.org, cy_huang@richtek.com, robh+dt@kernel.org, chiaen_wu@richtek.com, linux-fbdev@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, linux-pm@vger.kernel.org, lars@metafoo.de
In-Reply-To: <20220531111900.19422-5-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com> <20220531111900.19422-5-peterwu.pub@gmail.com>
Subject: Re: [RESEND 04/14] dt-bindings: leds: Add Mediatek MT6370 flashlight binding
Date: Tue, 31 May 2022 17:46:54 -0500
Message-Id: <1654037214.468113.2476554.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_154659_104604_06A51706 
X-CRM114-Status: GOOD (  11.03  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 31 May 2022 19:18:50 +0800, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 
> Add Mediatek MT6370 flashlight binding documentation
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> ---
>  .../leds/mediatek,mt6370-flashlight.yaml      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/mt6370.yaml
Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml: Documentation/devicetree/bindings/mfd/mt6370.yaml

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
