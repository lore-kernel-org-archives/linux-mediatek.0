Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FE0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 13:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 435DD60EBB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 13:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 435DD60EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZD2Php7XFmae2H0738UMDNudv1MVedXVibW8X5s3P0c=; b=vgaGleHvohYUb7
	eGfjAGRmkr/z/ESyRJuk7OnHHVLGc8Htph0BXBus46cXG0ajYx03uzpvVEHZVWgyPjWe+nL96T//7
	F+a3UKKxZre0b5Bzqzem0ucM4J1UKSh5TSj27I8En2bYmSnf4AfpcM2kSHLueMXNVGDWaFK5nKmFc
	YzICpHCFXGoUAvrW9tpG9Wv0lfYKI2zhEOUDOj81pFJr9G1SZqSKjMaByOAO2vjp3KEQlfy56Kue+
	WXoZ4oWXSJSJdi8mRpxKTrgY0NoOFdsR51ctREk8v9Zv4ywyjyR3RqN1ciWlfrMZCMLtl2x/d600J
	edX35sTbBlgvTqZXKy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZvUM-009Xsh-8O; Mon, 11 Oct 2021 13:37:10 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZvTf-009XaB-Lj; Mon, 11 Oct 2021 13:36:29 +0000
Received: by mail-oi1-f175.google.com with SMTP id n64so24722805oih.2;
 Mon, 11 Oct 2021 06:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=85xipXNv8mvBeKPmm2emtS9A+cn3fK5eUSpsvYA0F0s=;
 b=wf26cTNyYBMylTAaO/2uFFu3lJw184gP1Pk5NKDgIOUVcfRS+84TgLBrHWnPClXCfF
 6uKJpnLXNAIhkcW673VbjBgKcYHSmQh7RTdKY8cnIdlVIxXS65jGdTgb/65XfNydD49Z
 QPfHofbMdnrz+vSwAtRZdMw0T3BSwkqt5YNSv/trCfFgNVng0VuT7+lxqeybB0mSrHep
 F5eJ7bfkW8RCfb7iIQ6V56oiFsJCxhwwiWPCKVGhhSRAi5DFsYkv25r3+TZb60vkrA6a
 OwH5BwHnqu/TDWwgF7LkoA1iQ/xQYdZdU8UVpe0BrJXcwBUHHZeNkiK2eeFMgQNl7j8K
 ERug==
X-Gm-Message-State: AOAM532i2OpFG2XrHNy1ZNGguL+Q7FPqECv+yQcmL1nUZYAOccd9yjM8
 F3en8a4kuYX+Ll+mSpcdHEiXnv5Icw==
X-Google-Smtp-Source: ABdhPJyE7+/tzL7Uvj2g+kEPhUHNPa6mHB8C7Nw2hpoRd1TRl83LypTzSOtSMZPZ0Czq8QnqNVUDBg==
X-Received: by 2002:a05:6808:1984:: with SMTP id
 bj4mr4202420oib.30.1633959386217; 
 Mon, 11 Oct 2021 06:36:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v22sm1171004oot.43.2021.10.11.06.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:36:25 -0700 (PDT)
Received: (nullmailer pid 504946 invoked by uid 1000);
 Mon, 11 Oct 2021 13:36:18 -0000
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
In-Reply-To: <20211011094624.3416029-3-msp@baylibre.com>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-3-msp@baylibre.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Date: Mon, 11 Oct 2021 08:36:18 -0500
Message-Id: <1633959378.253312.504945.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_063627_792912_C4ADA7AC 
X-CRM114-Status: GOOD (  14.60  )
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

On Mon, 11 Oct 2021 11:46:19 +0200, Markus Schneider-Pargmann wrote:
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dts:20:18: fatal error: dt-bindings/power/mt8195-power.h: No such file or directory
   20 |         #include <dt-bindings/power/mt8195-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1539195

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
