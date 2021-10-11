Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902FEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 13:37:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E8B604AC
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 13:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54E8B604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eBnpGKd/vaeSjhY1UPerrre6IUL0kzLNy+aZrgxki8=; b=hZvNBJGiI4vkx8
	CsrNU/qBiCmpvLiqnaw1QnFbTxOABv3dr8x/D3Xnz8c7boysD8irYWiMhcGNpMYM4jHl5VXGCm/LM
	+P1cEQgyhGXDtGZ/iJ7iH6W3NxahzI/bz9m7AvuR3Ka5x0ve0WGRHT8uu0ENDmIk5iMXR3d/Q+87z
	pXea9wpGCxANEOhzEgbk9yZ5D7Ce5YWL7/AzvWWLFvP1Ol+Ojn54wEbbOE9uWMk0OjngfUBualqJi
	g6axDH+CzQsl2j6OWsO1Z7C3E5lGeGq0gn+IFHlN0ZrQapXXEVEthZtuM94UCwPH3fN9WMyCLS5Xq
	od+3zLkwjpqs3Fk3EN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZvU5-009Xkq-1K; Mon, 11 Oct 2021 13:36:53 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZvTb-009XYY-GY; Mon, 11 Oct 2021 13:36:25 +0000
Received: by mail-oi1-f172.google.com with SMTP id u69so12229712oie.3;
 Mon, 11 Oct 2021 06:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ldY18yibfHG91zMBxbkh+bf7In/Vug5vRBddbeB/9N4=;
 b=NDOyon8HcmRHXrAMkGu5Y41ytkCv+X9n3VzNmDX5xYsCZJNLeTXdq2gnLVw//C5XGt
 ilinoMcOCkG4ef5orAVMXBHeU2zKpXWVWSM8d3d2FXzSw4sbJMYPmyqlEjfJbgRP5QcP
 h0gEDNA9GLa0tFefVVJVtmv/Ug+L2UCM5CUnrTs+nsqzO5ENfUY2IGxlMT96ZoNZhQXx
 SbtbAsW38LBpaC26N9/U67CA5++y5uRQZK6N3xKsMokDg/B7A24thcMT8yymVoAsB+nC
 SlBaGnGtImxNIuubeRhltAa0IBnxSIObnON7I09pVYUwgn7yeQtXIhxnO2+7xAjs5SBV
 m/8A==
X-Gm-Message-State: AOAM532Ndp4CuDMqSBthYl7te8rEXvzGRzxTGCV0TCKgGgkzXZieQOOD
 ccFL5RQlRi9iNWdXTrApIw==
X-Google-Smtp-Source: ABdhPJypokMi51gPcPyqsapesi1YWppZ4/PMLz4g89NLeFCSU2UGP0rJm3mD3Jks3tuGrdqzRkcIAA==
X-Received: by 2002:aca:c60e:: with SMTP id w14mr17766103oif.156.1633959382154; 
 Mon, 11 Oct 2021 06:36:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q2sm1522486ooe.12.2021.10.11.06.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:36:21 -0700 (PDT)
Received: (nullmailer pid 504944 invoked by uid 1000);
 Mon, 11 Oct 2021 13:36:18 -0000
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Vinod Koul <vkoul@kernel.org>
In-Reply-To: <20211011094624.3416029-2-msp@baylibre.com>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-2-msp@baylibre.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Date: Mon, 11 Oct 2021 08:36:18 -0500
Message-Id: <1633959378.242329.504943.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_063623_577869_71559C31 
X-CRM114-Status: GOOD (  16.96  )
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

On Mon, 11 Oct 2021 11:46:18 +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is a similar functional block to mediatek,dpi but is different
> in that it serves the DisplayPort controller on mediatek SoCs and uses
> different clocks. Therefore this patch creates a new binding file for
> this functional block.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v3 -> v4:
>     - Fixed clock names in the example as the clock patch series is merged into
>       next now
>     - Add missing ports decleration to the example
> 
>     Changes v1 -> v2:
>     - Move the devicetree binding from mediatek,dpi into its own binding file.
> 
>  .../display/mediatek/mediatek,dpintf.yaml     | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.example.dts:21:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
   21 |         #include <dt-bindings/clock/mt8195-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1539196

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
