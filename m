Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0444C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 03:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLT1BoNdZOsa14xuLGA+JXdO1aXqfEnpbPJsybdwp2I=; b=iAijnrEytp8lTebCHyJOs39t0Z
	lBJB1bNuBUKBrvm5zG4czq2RqxB9D3D+YherhHfxmNsLQzwTNFaX/y72daHWfAlXxphgZ+Bvxv6YP
	PKtH1BCdI1VBwNmlDI8Ib0F/9O858PHFjDwAibYQz5a8TSMUIpIGHhl344qw0gH78JK3FqEi3BeW8
	n3ipOpTG3xRFsgAG3PqMTkQaYQNb7kvOWPwfML5h9/oQWaTR9TMQCEV0FXwBVKkOHjuP3oMkZftv6
	wBhLUBTyD8wRR75covmmBX46/Wr28blNcL2IvYLbftwMR78Fss5qqPYqHnVQ1i82FrnaLYjlf6lqU
	zH5mxBTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAilX-008yj6-1R;
	Wed, 06 Dec 2023 03:40:03 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAilR-008ycP-1B;
	Wed, 06 Dec 2023 03:39:58 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1fa26074783so3460075fac.1;
        Tue, 05 Dec 2023 19:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701833996; x=1702438796;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hLT1BoNdZOsa14xuLGA+JXdO1aXqfEnpbPJsybdwp2I=;
        b=xOdmBLhYqZOSNAC2slxfEKAww7B0Gc47HHDQwdpYAbaNy1zhkyeLtw1MzCRft6cvB6
         5E90uFYepsypcHhX2hre/YZ7x5OVspUSXgmzZ8GQVmHHbyLpT1gLsPkCycpZC8yCtgQW
         NtRcg2O4oScE5ww8Re+o+oVYb+ocyzUFaZQO0D+vzirhe3F0ajE+GW4H0aa1aVeP2V6r
         6VLqloBWNv0w0HlrhiR/HBgLl7+OYilnWYqO0XWsKKRjipZNeSjOfrG4toCUMXIzj4AS
         y4mrHCsA/j7jTNCHt9RJR7iuCKFdj1OOYw4PqombgV5LDnoA6OU8r1izDJeMijnvHJse
         hqRg==
X-Gm-Message-State: AOJu0YzXcQHJeIYJlcHGcUGW1k9EUcwEHLAc92W8Xkd6IcqLMIxNhr3J
	JEFzU0GxI3r1Ch5XX7k3iA==
X-Google-Smtp-Source: AGHT+IGTmq+FN6dwgEMD4lsPZ+v8n15aufTQBAy0f7TbjXAqsv/BoIE1ZkwoUbLlWPs6l+CoQNYQTg==
X-Received: by 2002:a05:6870:9690:b0:1fb:75a:de65 with SMTP id o16-20020a056870969000b001fb075ade65mr268467oaq.83.1701833996268;
        Tue, 05 Dec 2023 19:39:56 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id pk28-20020a0568704c1c00b001fafc32e808sm2929937oab.0.2023.12.05.19.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 19:39:55 -0800 (PST)
Received: (nullmailer pid 463141 invoked by uid 1000);
	Wed, 06 Dec 2023 03:39:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, 
	devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, John Crispin <john@phrozen.org>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Felix Fietkau <nbd@nbd.name>, "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, 
	linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Alexander Couzens <lynxis@fe80.eu>, Qingfang Deng <dqfext@gmail.com>
In-Reply-To: <e2214e904cde9a9d64ec1e87ac38560f7ac35a1f.1701826319.git.daniel@makrotopia.org>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <e2214e904cde9a9d64ec1e87ac38560f7ac35a1f.1701826319.git.daniel@makrotopia.org>
Message-Id: <170183397527.463082.3332126649962865060.robh@kernel.org>
Subject: Re: [RFC PATCH v2 6/8] dt-bindings: net: mediatek: remove wrongly
 added clocks and SerDes
Date: Tue, 05 Dec 2023 21:39:36 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_193957_416639_E693C5C2 
X-CRM114-Status: GOOD (  18.12  )
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


On Wed, 06 Dec 2023 01:44:51 +0000, Daniel Golle wrote:
> Several clocks as well as both sgmiisys phandles were added by mistake
> to the Ethernet bindings for MT7988.
> 
> This happened because the vendor driver which served as a reference
> uses a high number of syscon phandles to access various parts of the
> SoC which wasn't acceptable upstream. Hence several parts which have
> never previously been supported (such SerDes PHY and USXGMII PCS) have
> been moved to separate drivers which also result in a much more sane
> device tree.
> 
> Quickly align the bindings with the upcoming reality of the drivers
> actually adding full support for this SoC.
> 
> Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth binding")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 32 ++++---------------
>  1 file changed, 7 insertions(+), 25 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.example.dts:18:18: fatal error: dt-bindings/clock/mediatek,mt7988-clk.h: No such file or directory
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/e2214e904cde9a9d64ec1e87ac38560f7ac35a1f.1701826319.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


