Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99E3C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:30:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79F160F37
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A79F160F37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JOQit/VpJAUYwJr6Xo3WgQiPM/6vcet+jJrywrrCn8=; b=Xs2QZ5+mFqGXI2
	pAXRobBES/WCiGTO3hEa2NzcQ4HyQoju9NOO0X5NL0tg6q7TP5WZgCy8MBvF9upJ21JPUdXGsoMJ4
	8AmpoGEFEDFQbro4sMGQxxmPlHeLEcy2idTf+qj9ni2Mu/w9pZgJ9m+s32kSbWqTdd6q/ZTziQ/4d
	nOwN+xDENl7jKAFwQcEsh4g0X4TlcGYq8Hwl9WtWLYJ6yQNxpA/HfkgZOmyG0wbPS3ypwt7KmEgJu
	KwotvkHRlcRxAIoEo+RI5hcMEgZG/ti1+faF2OXnNA+Y1NnzyET2f1leq/Inii4JOPTq2YUs+T37y
	k7dN6VrQdFf/pfQuz3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RqB-00Fsqn-DC; Tue, 27 Jul 2021 18:30:07 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Rmv-00FrRh-7P; Tue, 27 Jul 2021 18:26:47 +0000
Received: by mail-io1-f46.google.com with SMTP id y200so17184780iof.1;
 Tue, 27 Jul 2021 11:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Snb7zzXm5yWtNjnULb0kW5b9lE7iA5FbVYfHIKqzxsw=;
 b=aVc309tt3cUJdQcbAanz4OxqMjaK2+L7W2onuyYrV3zPLlbvVx+D+S2gx39QDIL6HD
 P/ibpJV0iaTc1jeOq87Wh6L+gMZ3zKLwWATybhuhZBcd0+x+0TEMGswoVAFHgRMXoafB
 3n0CKOJpr4MwBjzd5I6rzeimvJ/lWoUpK4wOJ9NJ0hrdyENUF+Pz2w3wq3HO84kAXMBI
 8tbY3M/ka5v5ZuYilc8RBLcwq2m5FOkZu2Rr1X6uyTCzL6mLMyZ60ek6hJvNopDt5phy
 2IuZrRMwYbuJXutRt3XlhBeTKdjNO+6ygtJIVMta5z82Zege8X+Ut+SwJrNGtiZmrByV
 EO/w==
X-Gm-Message-State: AOAM5338ThwUcEEETuZJUdSqNbydPeEdB2YZ0fRVU8wP806ievsURn0o
 VaNJ/THiuObE3HvqaBh41Q==
X-Google-Smtp-Source: ABdhPJydLoroS1MPOE0r8YMTbwZhoygvk6C14R/FG87IJjqNCquTF05RQiCyoCtwuz4P8BnWRM5/Qw==
X-Received: by 2002:a05:6602:59d:: with SMTP id
 v29mr20162821iox.132.1627410403994; 
 Tue, 27 Jul 2021 11:26:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id p21sm2713572iog.37.2021.07.27.11.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 11:26:43 -0700 (PDT)
Received: (nullmailer pid 3210654 invoked by uid 1000);
 Tue, 27 Jul 2021 18:26:35 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>
In-Reply-To: <20210727110232.2503763-3-hsinyi@chromium.org>
References: <20210727110232.2503763-1-hsinyi@chromium.org>
 <20210727110232.2503763-3-hsinyi@chromium.org>
Subject: Re: [PATCH 3/3] dt-bindings: mediatek: convert pinctrl to yaml
Date: Tue, 27 Jul 2021 12:26:35 -0600
Message-Id: <1627410395.874547.3210653.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_112645_327270_7C7BA52A 
X-CRM114-Status: GOOD (  14.46  )
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

On Tue, 27 Jul 2021 19:02:32 +0800, Hsin-Yi Wang wrote:
> Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 202 +++++++
>  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 175 ++++++
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 537 ++++++++++++++++++
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 230 ++++++++
>  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 -----
>  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ----------------
>  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
>  8 files changed, 1144 insertions(+), 861 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dts:21:18: fatal error: dt-bindings/pinctrl/mt8183-pinfunc.h: No such file or directory
   21 |         #include <dt-bindings/pinctrl/mt8183-pinfunc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt

See https://patchwork.ozlabs.org/patch/1510444

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
