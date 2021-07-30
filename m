Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F0DC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 22:28:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E4C60F48
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 22:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30E4C60F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIwK/hXMcHTkCCNbzx+Nvj72v3W8fyOLmqNkANuLchs=; b=dnQEQ/YKX6CwBz
	Lwcu1UHZINB+6LvZNA/QaAKsjz1rGQ8Ve2YuEGnEZ2tKAcedXyButkDuOn+InbVKifHL7rwRx2mWn
	dmblN+I55unzuHQHhIOd7Hu0pUUmL8znMUiPXnzzKbMGOcDoDhwxr7oeTiQQ3Vw0pwD/VPxAjjROH
	dYqCJtHbCU17u1brBuKuNCIGtMFB7PogBMla5Tt2jwPhHaSlRdZI8tYj884Q2b1GdWfONzEBaLBpv
	6P4l40MOm9b4GKzOYmss3ax4qtCaDYp5AHiwI1WKfsZbeFCFglLcEU7XDB1opl8ZbjBtWRmYCH6zd
	l/vifSo6ql6hKpFUSR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9azU-00AQBN-PC; Fri, 30 Jul 2021 22:28:28 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9azH-00AQ8h-A0; Fri, 30 Jul 2021 22:28:16 +0000
Received: by mail-io1-f41.google.com with SMTP id r6so4922266ioj.8;
 Fri, 30 Jul 2021 15:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=1SioxWYOB4GKQF75otjmPAgYQGJ4juMB4TymylBvulE=;
 b=YsbmRPIVf7Ex0YTMM/0yEacStJc4Beqr8x8/69457QnF4asFWMuGQRVkzwduExEMCP
 qrq9yJ1cT8GAn65kgHdvQfwC5hnDiVA+w83qeDpstnatNYZmzvd3XaS3FmMphjmSBgW1
 +8n+gi0RaV3k5OQCNn80Zg9dFlpiNvXt8+ZkgdZOe6B5Ecd4DoUDezl3piomMzSL1XuK
 M5q6AAwjLJz+yiBUU2+/b3EmPbmGgUnPNEx77XZn+7xUPMEn9B/YuLhW8HfnqwGxo8ed
 zKeI4ezqWdUwZxcAWnEKV0402N3RteQJ3QJhjOAa+Laob1ggaYVY4nyoGlR0iDLUghxi
 5X9g==
X-Gm-Message-State: AOAM533eIp3Bu3lrCOHnEIX0XqHgxZAs2IqZJd8KLQ9DxDwqJZxK7u6L
 vk/3Hr9lJHtFw/cGmeoxVw==
X-Google-Smtp-Source: ABdhPJw92Pxgc45lpYhnZL98mHP5QmwqnkzlX6tQ6SiGz6QcI3EsfiGGEi2BDOlTWCaMN4QVg4tTIA==
X-Received: by 2002:a02:90cb:: with SMTP id c11mr3909371jag.53.1627684092766; 
 Fri, 30 Jul 2021 15:28:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q1sm1887882ioi.42.2021.07.30.15.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 15:28:12 -0700 (PDT)
Received: (nullmailer pid 3442792 invoked by uid 1000);
 Fri, 30 Jul 2021 22:28:10 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Enric Balletbo Serra <eballetbo@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210730120937.1435204-3-hsinyi@chromium.org>
References: <20210730120937.1435204-1-hsinyi@chromium.org>
 <20210730120937.1435204-3-hsinyi@chromium.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: convert pinctrl to yaml
Date: Fri, 30 Jul 2021 16:28:10 -0600
Message-Id: <1627684090.548356.3442791.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_152815_388146_91F09A60 
X-CRM114-Status: GOOD (  14.82  )
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

On Fri, 30 Jul 2021 20:09:37 +0800, Hsin-Yi Wang wrote:
> Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2:
> - fix comments in v1.
> - fix mt7622 where groups is not required for conf node.
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 206 ++++++++
>  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 173 +++++++
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 416 +++++++++++++++
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 228 ++++++++
>  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 ------
>  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ------------------
>  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
>  8 files changed, 1023 insertions(+), 861 deletions(-)
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
make: *** [Makefile:1419: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt

See https://patchwork.ozlabs.org/patch/1511632

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
