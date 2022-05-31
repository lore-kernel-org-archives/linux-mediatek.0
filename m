Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7377C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 22:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7luR2SOtLiQypcNOO2/7fl4DlVbLFM1RHf112ZSTjk=; b=mZ/0JPcmxy0Jpc
	ecAdT0Cj7S7nWN8c1Gnu5u2ia20CC40iqu6eBV1hau0Cu6/p9UpPwD6IEptMHRL5SIsYMELdrmFPy
	n3PhtooJIt559mGgsgdeao92E2ejlCH5zoMgV9ihYa0kHbD5yPEI+gFfyKBFMom0U4+07Pvrvtlsv
	sDAkUR230sig3yU2n2ZZH7+3CVrGfS/YkDnVfxs6yrZoqoMA+1kWi1rCXyz5Y0q7JlvY6DwH6eac7
	Fkx8VTuwm2oITklPG0UJDQB9ksBaW4PppleLKa3k1hO9vGVzbo4j5FuKc9+G1TWVt9ZgNIGmhMT9y
	Ol6Efbb4piJyxF/LNzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwAdg-00CtLf-BK; Tue, 31 May 2022 22:47:00 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwAdd-00CtKG-BO; Tue, 31 May 2022 22:46:59 +0000
Received: by mail-oi1-f179.google.com with SMTP id r206so339912oib.8;
        Tue, 31 May 2022 15:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=2Z7nZCZCrp6yDZohpwqv7FuEhmrYv7mpBJYl13nUGZE=;
        b=Oqm5BECE0NjYcIQjfqxikMJS60VfLvkTp3mNjmzrOe3lvm052zrh3MJrAUfQY1K8H4
         WYkLuGC1vVDst27FDg4JISYcCx7dX8U98yHFhm9FQimesznsfyDFzOqAHXkcXGSpIY1e
         TWpCSDpO80NiuONiQXlTgioeu2xlYGZOtLxjqXgIX9z4UF73bJsRF4O0uUz10GGxwQbc
         IYhUkI9jUbjbAfDehT+X5sm5tR0shUtn0DU95yexrxg/ntQuPkrt66tyLvzhUQpIcqIr
         bwLnO+l4jyQNor5d6e4hWVGqK75h1te2NtI3h8s1PUPaqJ//WcPVxxFuG1i1AEIayoQi
         5y4Q==
X-Gm-Message-State: AOAM530C2jY0Oi7TdIGxMQjS4dDHiU0dCvUDuzqUCY+s6Kx9nQWNn4k0
	TcSTgR2q2H5VRF35Y/M6TA==
X-Google-Smtp-Source: ABdhPJyCt/w64P3Qhbl9BTehgfuVFmuXiRTTi5iJf9VTUqZA4lc6Tq78gjAB18eUT2wVhb7SnkTfDA==
X-Received: by 2002:a05:6808:1454:b0:328:82a9:cb08 with SMTP id x20-20020a056808145400b0032882a9cb08mr13482779oiv.106.1654037216107;
        Tue, 31 May 2022 15:46:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m19-20020a056820051300b0035eb4e5a6b0sm128663ooj.6.2022.05.31.15.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 15:46:55 -0700 (PDT)
Received: (nullmailer pid 2476551 invoked by uid 1000);
	Tue, 31 May 2022 22:46:54 -0000
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, linux-fbdev@vger.kernel.org, linux-mediatek@lists.infradead.org, sre@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-leds@vger.kernel.org, gregkh@linuxfoundation.org, lgirdwood@gmail.com, chiaen_wu@richtek.com, dri-devel@lists.freedesktop.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, heikki.krogerus@linux.intel.com, alice_chen@richtek.com, broonie@kernel.org, linux-usb@vger.kernel.org, pavel@ucw.cz, robh+dt@kernel.org, linux@roeck-us.net, matthias.bgg@gmail.com, deller@gmx.de, linux-arm-kernel@lists.infradead.org, chunfeng.yun@mediatek.com, jingoohan1@gmail.com, daniel.thompson@linaro.org, jic23@kernel.org, cy_huang@richtek.com, lars@metafoo.de
In-Reply-To: <20220531111900.19422-4-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com> <20220531111900.19422-4-peterwu.pub@gmail.com>
Subject: Re: [RESEND 03/14] dt-bindings: leds: mt6370: Add Mediatek mt6370 indicator
Date: Tue, 31 May 2022 17:46:54 -0500
Message-Id: <1654037214.458913.2476550.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_154657_432662_CCFB4CEE 
X-CRM114-Status: GOOD (  10.99  )
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

On Tue, 31 May 2022 19:18:49 +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek mt6370 indicator documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../leds/mediatek,mt6370-indicator.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml: Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml

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
