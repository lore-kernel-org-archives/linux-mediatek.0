Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B70C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFKVB/aUdNrC3YEUhXFhDtkjVZXHyn7NHTgEAKEturA=; b=nEokzAmEzCGn6L
	GtaO+QVIefLNIcwYS+fkiRGqVlbQ/1tHzuv/nEK44+hRFIiUNcVyc/2n0NpZwFvFczd+9TFJNLcW7
	kep3/66JNKYaWL8vJhCerfxGK2h4Lp2REYZ2JANYVCcLMYIIvomiH8hYrKuRCcMUpG/KfXUyKpJPm
	SyfoPWm+tQxb8s3fdYAj+E2/DJyummF9zgzLdJ6C80OIxSFJw/GkBZdiIEfk9iazN07j9JVkyU2Do
	jfTae4frbyh4OegP2xj9Xy6t7L57MNkMJhjhl7mtT4Qy+gvnyTy+J/ewR89253mK5TD90qi7Oe5R2
	bHC6lsT3LIsCWKdjheZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIAjm-004780-3z; Thu, 10 Feb 2022 14:47:58 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIAjj-00475k-Hm; Thu, 10 Feb 2022 14:47:57 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 t75-20020a4a3e4e000000b002e9c0821d78so6666848oot.4; 
 Thu, 10 Feb 2022 06:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=8fxH81jreNlAG66dkkm12iasx5L3uqki8uR5z92L6jE=;
 b=mcZBKDRu62zqf66u4GyRQtz0gGxIV+R/HYrcARlPgvtQ5NodxTnHK7EFCgnyHQ2LyU
 Tg9pwTmbvgIdVg94DJTE00SSAhbh+U2xkDEJYhEFdULxRFd7JDImOt5zQsQzmVcwprIn
 pvveP4r7Fz+oYuq23jveFGFEEfbsDXVEwVNPn7ovkF6hmf4srcFq0ffr4J3ZuMqba4Ck
 xrvFxXFMbGbQkFTniP9yznL6y0OZe5tgM3Dh5zTcU+FUYHW1d6qjR0xas5tYj+39415Z
 59E1nSOH9yJEt8j36tntVj8UdVEB1mg8Eh9nqFt+nJ8P+XwITfrih7CrEQ+0jzWWMIDz
 OnfQ==
X-Gm-Message-State: AOAM530f0LQOY+FVG9DhGXWBlVV3m4o881OIZAqCg4N2jAUx6FDCQY7y
 lLKNzi3xTe+36293nebEfg==
X-Google-Smtp-Source: ABdhPJyAkIAnn1SjTWT3DVfZeP9xM7w/tc1EWhAce6OrhewoxIv9CXgMpmVC3NcjSxhSQcTlfxldQA==
X-Received: by 2002:a05:6870:ea05:: with SMTP id
 g5mr904565oap.181.1644504474040; 
 Thu, 10 Feb 2022 06:47:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b8sm7983446otk.36.2022.02.10.06.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 06:47:53 -0800 (PST)
Received: (nullmailer pid 2624781 invoked by uid 1000);
 Thu, 10 Feb 2022 14:47:52 -0000
From: Rob Herring <robh@kernel.org>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org,
 Sean Wang <sean.wang@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20220210062122.23974-2-guodong.liu@mediatek.com>
References: <20220210062122.23974-1-guodong.liu@mediatek.com>
 <20220210062122.23974-2-guodong.liu@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: mt8186: add pinctrl file and
 binding document
Date: Thu, 10 Feb 2022 08:47:52 -0600
Message-Id: <1644504472.320340.2624780.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_064755_617637_252B538F 
X-CRM114-Status: GOOD (  13.83  )
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

On Thu, 10 Feb 2022 14:21:20 +0800, Guodong Liu wrote:
> 1. This patch adds pinctrl file for mt8186.
> 2. This patch adds mt8186 compatible node in binding document.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8186.yaml      |  313 +++++
>  include/dt-bindings/pinctrl/mt8186-pinfunc.h  | 1174 +++++++++++++++++
>  2 files changed, 1487 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8186-pinfunc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml: properties:reg-names: {'description': 'Gpio base register names.\n', 'items': [{'const': 'iocfg0'}, {'const': 'iocfg_bm'}, {'const': 'iocfg_bl'}, {'const': 'iocfg_br'}, {'const': 'iocfg_lm'}, {'const': 'iocfg_rb'}, {'const': 'iocfg_tl'}, {'const': 'eint'}], 'maxItems': 8} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml: ignoring, error in schema: properties: reg-names
Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.example.dt.yaml:0:0: /example-0/pinctrl@10005000: failed to match any schema with compatible: ['mediatek,mt8186-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1590838

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
