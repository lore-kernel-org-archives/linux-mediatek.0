Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC91C10F07
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 03:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27O2bZEy3+KAENa38gDF53q97pnYbs0pdHxflIPcivY=; b=Xo+wDQNxTHXzNUjirXtYEIrt30
	tWK3O6SyOciASd9LmQheqmFijnnQs2tCQ5NCTbxVAK8ObOxZD7dJM6uhZEin0Cj7hjiq+L48662Hl
	ewUM/aBAC3VfobybiC7IHja6OM6pJV1x/8l6C7BpHwJOkIobic5EKza8VN1F01GNmeYvLRQI9GiVs
	JLNfpTBVT1kd0vgXof2JgkBrjDwQ7DBwnUUuURFVoeZanffrySdUaX8WhhNIfCPCFJia6QGdXgve0
	mlbrlMqvfXWspZZ/5/hiJcUlZq/wwp0wf1o+wvlpoe8tuniDZ3x39UYW90cKuIDDRUikZdJJCHyWN
	knTO25sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAilU-008ygQ-24;
	Wed, 06 Dec 2023 03:40:00 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAilP-008yao-0i;
	Wed, 06 Dec 2023 03:39:56 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1fb38f3cb57so1817605fac.3;
        Tue, 05 Dec 2023 19:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701833994; x=1702438794;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=27O2bZEy3+KAENa38gDF53q97pnYbs0pdHxflIPcivY=;
        b=TTGHIg/YwdkruedjaC40azPZTFxa7bCY7Wk/g0EsiWctICdprHB8/tTv3XL7xty8ux
         0k+icsLsJe27oCk4sy0Og9PYPyTHFfhYJf5MK+O06ALFthgrsv3dSuHNmDdhuD3ILIL8
         +tpibKFXI0wThMs1djZfA07HNd+VxNeIytqfvDx7ZnptiaOeBocaTnLd0vhK6X6GGTqr
         /HmhiKnt1cIlrPI1OFD4ImQ5IHBE81hjgZQHp1N/FhFvNOHtFRG6uzrMlsMhEunv8oR4
         1GRVQyeY+dAgY8POrZKQVBycigQ9UY8MDaCKf7pgdTLqzLuj40iWdrJlRr8hY3BB5SQw
         LcOA==
X-Gm-Message-State: AOJu0YyJKzyeVMH6hh0+1g7rxE75nrLH2oreXd+BxuatYbmYgnX9keKG
	8DJQx4Vfk5l+Tgzze/B6EA==
X-Google-Smtp-Source: AGHT+IFZmK9knTyK6Z7myA7wKKOiYLq1oWKaL2xsWe/rjiSvG5jsqRqMq+F3g+GgI8/d743m1gQK6g==
X-Received: by 2002:a05:6870:8086:b0:1fb:75a:c425 with SMTP id q6-20020a056870808600b001fb075ac425mr215974oab.78.1701833993921;
        Tue, 05 Dec 2023 19:39:53 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ds52-20020a0568705b3400b001fae2d2630dsm3272321oab.18.2023.12.05.19.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 19:39:53 -0800 (PST)
Received: (nullmailer pid 463137 invoked by uid 1000);
	Wed, 06 Dec 2023 03:39:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Alexander Couzens <lynxis@fe80.eu>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	John Crispin <john@phrozen.org>, Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>, 
	linux-mediatek@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>
In-Reply-To: <14c3eb3022fac2af105950eb161990ecfb17c016.1701826319.git.daniel@makrotopia.org>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <14c3eb3022fac2af105950eb161990ecfb17c016.1701826319.git.daniel@makrotopia.org>
Message-Id: <170183397366.463026.10686567364320956476.robh@kernel.org>
Subject: Re: [RFC PATCH v2 4/8] dt-bindings: net: pcs: add bindings for
 MediaTek USXGMII PCS
Date: Tue, 05 Dec 2023 21:39:36 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_193955_256149_0E0CA48A 
X-CRM114-Status: GOOD (  15.68  )
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


On Wed, 06 Dec 2023 01:44:27 +0000, Daniel Golle wrote:
> MediaTek's USXGMII can be found in the MT7988 SoC. We need to access
> it in order to configure and monitor the Ethernet SerDes link in
> USXGMII, 10GBase-R and 5GBase-R mode. By including a wrapped
> legacy 1000Base-X/2500Base-X/Cisco SGMII LynxI PCS as well, those
> interface modes are also available.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/net/pcs/mediatek,usxgmii.yaml    | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.example.dts:18:18: fatal error: dt-bindings/clock/mediatek,mt7988-clk.h: No such file or directory
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/14c3eb3022fac2af105950eb161990ecfb17c016.1701826319.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


