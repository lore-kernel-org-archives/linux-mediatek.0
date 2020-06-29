Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F02AC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 21:53:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4254A206A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 21:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kOr98ofR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4254A206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7PSgKP+3ka6ypIzmdYXU7NysRDNHGL7c8EtdRV0G2h4=; b=kOr98ofR8SYQaD7MHeB4K3MJ2
	j8gsM27ZFxoQUGsWFnH0NjIGKXIWKBJHXfMPFHigT2TNBpeRgE87LEG2aTN6B8B2CnJX3M1k4IyiQ
	s/zgYnc5jQdkSlxMZQqoI4640YR5UhBVEBgX/7EWm2LD0uKTFK4+Hg0n5bQ75Q2/zS4nC3RnKP4y5
	9mwOGZ3dfJRlzcJ9jS9b9W33DjkPyRZ0LhmlT3GxSMiJ3N5XvjIzjZkQnoJ6YdmMnv8J3vPfvtIdS
	sWYNy14iEKURZcUHxN00jFQPKdAWnUjUuvKJC/moagsvWbIA23MX5p8GyjsNUvYeC3oV4ZqpZls58
	4tjcdJZjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq1ib-00048I-Uh; Mon, 29 Jun 2020 21:53:37 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq1iZ-00047g-A5; Mon, 29 Jun 2020 21:53:36 +0000
Received: by mail-io1-f65.google.com with SMTP id o5so18796984iow.8;
 Mon, 29 Jun 2020 14:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TqO9zSccC03uQUBHdnGu8Ma3JV07Cz0JDvsVx9Gx0ZY=;
 b=bjSrGe4demsblMYgtcPRTl3HiJJFV91tJx/DrPVGjfZ1KzuLxurE51QsIVQFMeu3jp
 sjXcjMvyi720ryTW7cKva1s3R8oresgrjvufo/Jk2Mv02mIGfVbc9IpSL7bysiyRsyDv
 mjJWlvv1BrKGKHJc93WcJYyZCKbCMEcyu2qZ6s5E2Wm/gYW5H669lrUB7DeB/fXr1Pne
 9IjzCy4bfUaO+gFSUKxBA9YYWTyP5PDFvj4mqF7EOP5B0MqV2Aiy3EJSPFez6sx45WWg
 jY2b5n2RA+mYmhkjPga6rGlY2si7Oo416QKBn4ZV6AjRdeY0cqSRWd15Vzrs+Pf75Mgz
 MKHg==
X-Gm-Message-State: AOAM5303ztKA6KCnTkNDSMQdvROMJRuSo5+DPzE2av/bQPlXwd83JsCo
 DB+SUB8T6UDosgJ92MCk0g==
X-Google-Smtp-Source: ABdhPJyIbG7PIhmtfb8YhLKR5Xh3nGklRFT+QTShHlA/Rx0Efb1UteRJRihqMm1UaKN8nH02gpJ1Xw==
X-Received: by 2002:a05:6638:2601:: with SMTP id
 m1mr9213481jat.43.1593467614612; 
 Mon, 29 Jun 2020 14:53:34 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
 by smtp.gmail.com with ESMTPSA id t12sm604000ilo.80.2020.06.29.14.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 14:53:34 -0700 (PDT)
Received: (nullmailer pid 2994774 invoked by uid 1000);
 Mon, 29 Jun 2020 21:53:31 -0000
Date: Mon, 29 Jun 2020 15:53:31 -0600
From: Rob Herring <robh@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200629215331.GA2991039@bogus>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592480018-3340-2-git-send-email-hanks.chen@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 18 Jun 2020 19:33:32 +0800, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
> 
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> 
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  210 ++++++++++++++++++++
>  1 file changed, 210 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dts:21:18: fatal error: dt-bindings/pinctrl/mt6779-pinfunc.h: No such file or directory
         #include <dt-bindings/pinctrl/mt6779-pinfunc.h>
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1312018

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.



Here, you need patch 2 to come first or merge it into this patch as it 
is part of the binding.

Rob


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
