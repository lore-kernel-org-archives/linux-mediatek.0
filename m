Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14D7C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 20:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lU2wi32AdwjPUUZAk+7nh1wLYhNZGsMI5tJITTqsPsQ=; b=2h+EDqJjgYsv0DNuyLP65WGq8Q
	A+7CHBjNw/D6yeAYo0Pu+jZYHvOH/iPBZkiJLqeU1KCyPAIJG66Ota39Uid7HbH9Ve4s7vXV+Ozw9
	kMegwPBNVxobvHeF5mgWX3+wJ+5+q2A+mMhq5zlkZdQPLDUdT4DHmbkbq5seXw3ewKeY+uD8jMOI+
	SJCA6CIXYRJUOHmQjQgYa7Hxna0E8dbfu5wYuCVUUXIAFNDb3uywYKlyDFLljpyrYslJe6edtdcov
	R0dJdktAfQHNmBbg/N9KOU4MDTkR1uDEQgbPTz0h4/CG1KZHMemQ7E7GQ9xvhHuHpqdRMTg4aFb4C
	dJGase7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1XnU-009MBv-1m;
	Fri, 10 Nov 2023 20:08:08 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1XnR-009MB7-3D;
	Fri, 10 Nov 2023 20:08:07 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso1396585a34.0;
        Fri, 10 Nov 2023 12:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699646882; x=1700251682;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lU2wi32AdwjPUUZAk+7nh1wLYhNZGsMI5tJITTqsPsQ=;
        b=MYLm/CWRTvuvRGZ55Z4f6WwMdJiQd7bBnl8nn98dWOyYdNZMzVjzmr/c1O28ItopZh
         SqXmnirXknlD5nw+6A6oUohAuBjuS3TCNVckrS74fcFs7hrWlJ3r+HWtpNJSzr0kgS3R
         PW3pn92zi04UDB8LJqgZhew65TBJGVxbtcovCNl2Xx3uJCr9BxOK4OQ6IwaxyCfgfKRh
         q5kdW9BJjeP73DhxeCgMQAEKiqY9EZcNaKlO97qO2X1dK1vt4LP7Bg1jlIeEXUyyAnCd
         VQ2dUaA71XOuKjOQKdTfnhXLK3+PJxekctnjpb9ppSuOrDexbycCkkjgOrI80vO77CWO
         tJEw==
X-Gm-Message-State: AOJu0Yw7SG6kJXneLZhurcDH6stan/1muNqcLa8gno+Ugg6xKqpofkO1
	FtNeZlgWgY5C52dMcfYnzw==
X-Google-Smtp-Source: AGHT+IGNCyIdj4cJcLS9NAMvOL7IG4RlqmnJQW9n3xmk2NAGPGgd083RhDzB9xSov5b30UDhThnflw==
X-Received: by 2002:a05:6830:3108:b0:6cd:da93:90ce with SMTP id b8-20020a056830310800b006cdda9390cemr204580ots.19.1699646882360;
        Fri, 10 Nov 2023 12:08:02 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f138-20020a4a5890000000b00584017f57a9sm24691oob.30.2023.11.10.12.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:08:01 -0800 (PST)
Received: (nullmailer pid 343099 invoked by uid 1000);
	Fri, 10 Nov 2023 20:08:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Alexander Couzens <lynxis@fe80.eu>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, 
	Felix Fietkau <nbd@nbd.name>, Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, devicetree@vger.kernel.org, 
	Sean Wang <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-phy@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eric Dumazet <edumazet@google.com>
In-Reply-To: <924c2c6316e6d51a17423eded3a2c5c5bbf349d2.1699565880.git.daniel@makrotopia.org>
References: <cover.1699565880.git.daniel@makrotopia.org>
 <924c2c6316e6d51a17423eded3a2c5c5bbf349d2.1699565880.git.daniel@makrotopia.org>
Message-Id: <169964683653.341998.17310260461004337087.robh@kernel.org>
Subject: Re: [RFC PATCH 1/8] dt-bindings: phy: mediatek,xfi-pextp: add new
 bindings
Date: Fri, 10 Nov 2023 14:08:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_120806_057601_E78252A7 
X-CRM114-Status: GOOD (  15.03  )
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


On Thu, 09 Nov 2023 21:50:55 +0000, Daniel Golle wrote:
> Add bindings for the MediaTek PEXTP Ethernet SerDes PHY found in the
> MediaTek MT7988 SoC which can operate at various interfaces modes:
> 
>  * USXGMII
>  * 10GBase-R
>  * 5GBase-R
>  * 2500Base-X
>  * 1000Base-X
>  * Cisco SGMII (MAC side)
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/phy/mediatek,xfi-pextp.yaml      | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.example.dts:18:18: fatal error: dt-bindings/clock/mediatek,mt7988-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/mediatek,mt7988-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/924c2c6316e6d51a17423eded3a2c5c5bbf349d2.1699565880.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


