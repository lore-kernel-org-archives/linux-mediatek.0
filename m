Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC4CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 12:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJHfyvxxqwwLsQZQ1oQyZ6JSsOdeDEr6mo89nJwLdfo=; b=16SU1IWzKsFFzd
	7JMN5uQRO9yOzlDxd5IjmqzGtu/wWDltZJ4seQpueuFuQuVqHqQ9XiflDe/8bJ4fCffCKD/JIRf1G
	qR2pe36JX0vAOTJM5OvKOJyljQDuEEVjdefr1UkShHdbCABn4WBgpRox8yyvj7oWMuFPrA2TClNCW
	1n0hLiXssvpmADF9coG+qlAF/nwbHBxVTntFs/YXFvoLfc1Ksmwa1/MdwydSeHlHJXjBHIZnzbtDU
	tt7Ib6oGcskvf7C/5HEMHeu2SWe5g9Y5FwldpVZm39g2Jj/shQGiSUhljBYwoOteErxBIaIbqmQSO
	8X3V23sZK72YcRKNQxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYoq1-008b8J-Aw; Mon, 28 Mar 2022 12:51:13 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYopx-008b6V-Vz; Mon, 28 Mar 2022 12:51:11 +0000
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so15043721fac.11; 
 Mon, 28 Mar 2022 05:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=YKxyUK+Nou4xViHDx8TkfPYtGoA/VwvXE7HQXU1aq8I=;
 b=ZuhG9iulE+B99P6XR0lHhPojMTyJC49uYa2IhCdHeIpD/DyS8Bf7mhAhe8JOpNFSgS
 ry8Hcw9YSw7U002Nh668pJvBCin8l4NoJdDo4Axrz73X/sSdVx1tPL21V+4rwqjVcfqU
 d1FxGJY/Tx5jV/m4mcdHkVcn11yRwVMLpi34Utc1mlR2t5ln8uYH8+JF+xO0nQOHcqi2
 Czt5TFZzT8qMq+KD7HvJR1yy/Q5jd0tnuiWbiHWDSYO1d22JIP4I0l8KuG8usQloeyO/
 RbiyQe86eyAczXje1qnrPuc4Febbso+2wy3QPZYzYB8s3lJRftQ+R/oUXvErgHGr6FoU
 KM0Q==
X-Gm-Message-State: AOAM5339OT4vyQHLYOLekqPcL/6Yk0mgL7iGPBY+ks5HW9Y92WMuJga2
 ibcq7VewJfC+CMK4ZDjVkw==
X-Google-Smtp-Source: ABdhPJx44lE4vp2aYCeZ7I/lyjmousbKuU1sEX5HIWJFpKqkaVPGdwLqNEmBm4TX4iixQSE+3S145A==
X-Received: by 2002:a05:6871:694:b0:dd:a43e:fca4 with SMTP id
 l20-20020a056871069400b000dda43efca4mr15486919oao.77.1648471867780; 
 Mon, 28 Mar 2022 05:51:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y67-20020a4a4546000000b0032476e1cb40sm6811033ooa.25.2022.03.28.05.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 05:51:07 -0700 (PDT)
Received: (nullmailer pid 2153569 invoked by uid 1000);
 Mon, 28 Mar 2022 12:51:05 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: mripard@kernel.org, airlied@linux.ie, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, chunfeng.yun@mediatek.com,
 krzk+dt@kernel.org, linux-phy@lists.infradead.org, matthias.bgg@gmail.com,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, vkoul@kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org, kishon@ti.com,
 linux-fbdev@vger.kernel.org, daniel@ffwll.ch,
 angelogioacchino.delregno@collabora.com,
 Markus Schneider-Pargmann <msp@baylibre.com>, p.zabel@pengutronix.de,
 linux-mediatek@lists.infradead.org, deller@gmx.de,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com,
 ck.hu@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
In-Reply-To: <20220327223927.20848-3-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-3-granquet@baylibre.com>
Subject: Re: [PATCH v9 02/22] dt-bindings: mediatek,
 dp: Add Display Port binding
Date: Mon, 28 Mar 2022 07:51:05 -0500
Message-Id: <1648471865.772251.2153568.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_055110_061105_B175BB1D 
X-CRM114-Status: GOOD (  14.61  )
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

On Mon, 28 Mar 2022 00:39:07 +0200, Guillaume Ranquet wrote:
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
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dts:24:18: fatal error: dt-bindings/power/mt8195-power.h: No such file or directory
   24 |         #include <dt-bindings/power/mt8195-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1609955

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
