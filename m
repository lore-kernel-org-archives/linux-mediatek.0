Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F9AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 22:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5kzrW3yKX9xZvlvFx2G/368RDGRiHfCJQU7T/SWlRM=; b=cRiJ+C6LCXcb0z
	hj/c3Zp+TBijvAYieX2RLt0CX711Opmav0vw7aOW5K+DXCMU8WDdmvRZynhfSpLubY/XQgTb41uMq
	mVJ5eVrim0CNdSPWe4S3basReSFJLYyfzXxcrrqaX0lUm4IC5xB1/itYHtE8o/MLPCQD71L0dH+6F
	YM5JG88e2BQTD1VZ+qGll+w3iPLvEwFI+Dh2NoHmaSEgjbXt+Te306i6FT5+gPIPj6ZfAj/6DpzPp
	Q1mri4dLyxwLQEIc7esS1xiTeeMUNEsKQIj8xVgTDsWJm8FGHScNmYs0enS6/LnRmLlQyUEqQ5yMm
	tWtUc5X2yMo6AqnvS2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myLfC-00CZA4-5i; Fri, 17 Dec 2021 22:25:18 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myLf8-00CZ7K-E5; Fri, 17 Dec 2021 22:25:17 +0000
Received: by mail-oi1-f177.google.com with SMTP id q25so5791297oiw.0;
 Fri, 17 Dec 2021 14:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=U9aFf023EtS7bYXuPYeb5jcWZtC9rXcMEmjg022T/GI=;
 b=27GRgjLBMgucBRpORX+f6fTxRLsMVi3X/HqXFWlRIN0PSoU7UteoWNmxuk5oSc4XQB
 KumxAfRCG9T149C1gY8grsytt/nm5KtIG5/XOuahCfPeYDEjuRQ+ikW1ZkN7kyrY5BsQ
 VRCjzjJ9yVePaz0TfQ42pqFSpPytT2dMyYgweJWS6VBDLp5hCXtPPS5X1RE++nB0LpOc
 89eqBvSUZAEVD0W9zsPHTo1C1l4HjcIc4B9u7BHmhj9nsp3rQQ6JouidPp5whq7IW2vV
 ww5/fmo/9f9G5c5ru2Pypjo+T9hprgbW3LFSlqxm5Fv4UjOpKHD4zm19IBiTniI9+SFj
 fPMw==
X-Gm-Message-State: AOAM530HWaXlL/EbRvJXVH0JM3ByovgyvUTLJfBL9hSbGsDrwjatV1cH
 LV26DSDRzlPhFKuIl/jpIg==
X-Google-Smtp-Source: ABdhPJwLzRcCLzNUvJFhPi5MNnKwuPTUbgZzGPSNDn7nPA1/EtvNX7X/MV8AtNV28hgMlRxOVmyVvA==
X-Received: by 2002:a05:6808:124d:: with SMTP id
 o13mr3929342oiv.91.1639779911700; 
 Fri, 17 Dec 2021 14:25:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e4sm1897343oiy.12.2021.12.17.14.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 14:25:10 -0800 (PST)
Received: (nullmailer pid 3686969 invoked by uid 1000);
 Fri, 17 Dec 2021 22:25:06 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jitao shi <jitao.shi@mediatek.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>
In-Reply-To: <20211217150854.2081-3-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
 <20211217150854.2081-3-granquet@baylibre.com>
Subject: Re: [PATCH v7 2/8] dt-bindings: mediatek, dp: Add Display Port binding
Date: Fri, 17 Dec 2021 16:25:06 -0600
Message-Id: <1639779906.584489.3686968.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_142514_499998_6300D6C3 
X-CRM114-Status: GOOD (  15.71  )
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

On Fri, 17 Dec 2021 16:08:48 +0100, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
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
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1570103

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
