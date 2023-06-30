Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2AEC001B0
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xQcHCEfZmuNEbtp3cdeH3UJbr+AqROplj2X1YQLpNg=; b=c+cq0Ke3foONfMelk9VTCwp+3n
	in6U4FxSdRygRHOXriVr9rGI7nZxZhTCeH71ATGWH5bzRfVGwgY4zQaPMtJod+HPA+S8zAkef8pHz
	jttRvKx4ujA179j5ClCD9bq4Wd09950SlMlm1+mHAdbxHSYOfONQYUjlP+Nnz2DyP1cp3omiXbR0L
	tfl9M2+OKSRROIrrgVHBUpmWBtUjJBaiEtJ3FKwnEPF6JCMMvK/XOs75TYfbTqNqc/lFNYgb0zxEC
	Y4G/DA6Q+rTgZGBjhavwdo7p9lxr4XaG7mefRHq9f97jyzhVXir1QE6AgZh4pIj5us/0+0s2LdzcM
	3RDl6beg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCEP-003aQM-1s;
	Fri, 30 Jun 2023 11:24:05 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCEN-003aOG-1P;
	Fri, 30 Jun 2023 11:24:04 +0000
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-785d738d3feso42621739f.0;
        Fri, 30 Jun 2023 04:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688124240; x=1690716240;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0xQcHCEfZmuNEbtp3cdeH3UJbr+AqROplj2X1YQLpNg=;
        b=cloYEL7yWv32iXRycgTT0rVIYL3BUpmMv0FM+0yu8mCFqR1HhTc4fd3uHi+4k+gLhu
         7dtfsqtTrjNVNhU2TgHJ+l2dgcOqe/QAt+jcj3q4RnZJJcwWi6t3rYyKTkyust+5y1mk
         44aRQK38YSkf6JfXudk1V0/gzCxgL4zMRUKMxeqj6YpezbfSoxPyw7WYtHXRCgIvdOVk
         PEX6Ad5qrZJPNO1g8ax9YMhVMZbqXEdnhk51OX7wiYpErsLeEIHwdsPf3dKvL5elJF2b
         clDGtwpGfCYRSvojdqJxUAhHLrEE4giaJXm0+sFYst45/kWZI+VycsMCpNTCb71DXAdW
         w22A==
X-Gm-Message-State: AC+VfDxsuniQfycuuVpV5WKSMRZXD/5azwKNRY61P6TpBBYpX+MgcTHG
	JVkUJoyHxDOn5BdV8C2pCA==
X-Google-Smtp-Source: ACHHUZ5xH1J9xSD1ATB7C+2MVvmjFL+cw3O4K/E8UXcBMl92pRkMHx8HlcLX/wo2pE27VaghmDzUrQ==
X-Received: by 2002:a6b:a1a:0:b0:783:3899:e1d7 with SMTP id z26-20020a6b0a1a000000b007833899e1d7mr1960946ioi.2.1688124240296;
        Fri, 30 Jun 2023 04:24:00 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y13-20020a5e920d000000b00786582eb9fbsm29977iop.15.2023.06.30.04.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:23:59 -0700 (PDT)
Received: (nullmailer pid 1082768 invoked by uid 1000);
	Fri, 30 Jun 2023 11:23:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, daoyuan huang <daoyuan.huang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Phi-bang Nguyen <pnguyen@baylibre.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>, Louis Kuo <louis.kuo@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Hsieh <andy.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Florian Sylvestre <fsylvestre@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230630100321.1951138-4-jstephan@baylibre.com>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-4-jstephan@baylibre.com>
Message-Id: <168812423413.1082731.16618986920467028772.robh@kernel.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: media: add mediatek ISP3.0 camsv
Date: Fri, 30 Jun 2023 05:23:54 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_042403_471742_9E9FC7D3 
X-CRM114-Status: GOOD (  15.45  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 30 Jun 2023 12:01:52 +0200, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/media/mediatek,mt8365-camsv.yaml | 113 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.example.dts:28:18: fatal error: dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
   28 |         #include <dt-bindings/power/mediatek,mt8365-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230630100321.1951138-4-jstephan@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


